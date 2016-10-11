package org.openlmis.requisition.domain;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

import org.hibernate.annotations.Type;
import org.openlmis.fulfillment.utils.LocalDateTimePersistenceConverter;
import org.openlmis.requisition.exception.InvalidRequisitionStatusException;
import org.openlmis.requisition.exception.RequisitionException;
import org.openlmis.requisition.exception.RequisitionInitializationException;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.openlmis.requisition.exception.RequisitionTemplateColumnException;
import org.openlmis.requisition.web.RequisitionController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Entity
@Table(name = "requisitions")
@NoArgsConstructor
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
public class Requisition extends BaseEntity {

  private static final String UUID = "pg-uuid";

  private static final Logger LOGGER = LoggerFactory.getLogger(RequisitionController.class);

  @JsonSerialize(using = LocalDateTimeSerializer.class)
  @JsonDeserialize(using = LocalDateTimeDeserializer.class)
  @Convert(converter = LocalDateTimePersistenceConverter.class)
  @Getter
  @Setter
  private LocalDateTime createdDate;

  // TODO: determine why it has to be set explicitly
  @OneToMany(
      mappedBy = "requisition",
      cascade = {CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.REMOVE},
      fetch = FetchType.EAGER,
      orphanRemoval = true)
  @Getter
  @Setter
  private List<RequisitionLineItem> requisitionLineItems;

  @OneToMany(mappedBy = "requisition", cascade = CascadeType.REMOVE)
  @Getter
  private List<Comment> comments;

  @Getter
  @Setter
  @Type(type = UUID)
  private UUID facilityId;

  @Getter
  @Setter
  @Type(type = UUID)
  private UUID programId;

  @Getter
  @Setter
  @Type(type = UUID)
  private UUID processingPeriodId;

  @Getter
  @Setter
  @Type(type = UUID)
  private UUID supplyingFacilityId;

  @Column(nullable = false)
  @Enumerated(EnumType.STRING)
  @Getter
  @Setter
  private RequisitionStatus status;

  @Column
  @Getter
  @Setter
  private Boolean emergency;

  @Getter
  @Setter
  @Type(type = UUID)
  private UUID supervisoryNodeId;

  @PrePersist
  private void prePersist() {
    this.createdDate = LocalDateTime.now();
  }

  /**
   * Createa a new instance of Requisition with given program and facility IDs and emergency flag.
   *
   * @param programId UUID of program
   * @param facilityId UUID of facility
   * @param emergency flag
   * @return a new instance of Requisition
   * @throws RequisitionInitializationException if any of arguments is {@code null}
   */
  public static Requisition newRequisition(UUID programId, UUID facilityId, Boolean emergency)
      throws RequisitionInitializationException {
    if (facilityId == null || programId == null || emergency == null) {
      throw new RequisitionInitializationException(
          "Requisition cannot be initiated with null id"
      );
    }

    Requisition requisition = new Requisition();
    requisition.setEmergency(emergency);
    requisition.setFacilityId(facilityId);
    requisition.setProgramId(programId);

    return requisition;
  }

  /**
   * Copy values of attributes into new or updated Requisition.
   *
   * @param requisition Requisition with new values.
   * @param requisitionTemplate Requisition template
   */
  public void updateFrom(Requisition requisition, RequisitionTemplate requisitionTemplate) {
    this.comments = requisition.getComments();
    this.facilityId = requisition.getFacilityId();
    this.programId = requisition.getProgramId();
    this.processingPeriodId = requisition.getProcessingPeriodId();
    this.emergency = requisition.getEmergency();
    this.supervisoryNodeId = requisition.getSupervisoryNodeId();

    try {
      if (requisitionTemplate.isColumnCalculated("stockOnHand")) {
        calculateStockOnHand();
      }

      if (requisitionTemplate.isColumnCalculated("totalConsumedQuantity")) {
        calculateTotalConsumedQuantity();
      }
    } catch (RequisitionTemplateColumnException ex) {
      LOGGER.debug("stockOnHand or totalConsumedQuantity column not present in template,"
          + " skipping calculation");
    }
  }

  /**
   * Submits given requisition.
   *
   * @param template Requisition template
   */
  public void submit(RequisitionTemplate template)
      throws RequisitionException, RequisitionTemplateColumnException {
    if (!RequisitionStatus.INITIATED.equals(status)) {
      throw new InvalidRequisitionStatusException("Cannot submit requisition: " + getId()
          + ", requisition must have status 'INITIATED' to be submitted.");
    }

    if (areFieldsNotFilled(template, "totalConsumedQuantity")) {
      throw new InvalidRequisitionStatusException("Cannot submit requisition: " + getId()
          + ", requisition fields must have values.");
    }

    status = RequisitionStatus.SUBMITTED;
  }

  /**
   * Authorize given Requisition.
   */
  public void authorize() throws RequisitionException {
    if (!RequisitionStatus.SUBMITTED.equals(status)) {
      throw new InvalidRequisitionStatusException("Cannot authorize requisition: " + getId()
          + ", requisition must have status 'SUBMITTED' to be authorized.");
    }

    status = RequisitionStatus.AUTHORIZED;
  }

  private void calculateStockOnHand() {
    if (requisitionLineItems != null) {
      requisitionLineItems.forEach(RequisitionLineItem::calculateStockOnHand);
    }
  }

  private void calculateTotalConsumedQuantity() {
    if (requisitionLineItems != null) {
      requisitionLineItems.forEach(RequisitionLineItem::calculateTotalConsumedQuality);
    }
  }

  private boolean areFieldsNotFilled(RequisitionTemplate template, String field)
      throws RequisitionTemplateColumnException {
    if ("totalConsumedQuantity".equals(field)) {
      boolean calculated = template.isColumnCalculated(field);

      if (calculated && requisitionLineItems != null) {
        for (RequisitionLineItem line : requisitionLineItems) {
          if (null == line.getBeginningBalance()
              || null == line.getTotalReceivedQuantity()
              || null == line.getTotalLossesAndAdjustments()
              || null == line.getStockOnHand()) {
            return true;
          }
        }
      }
    }

    return false;
  }
}
