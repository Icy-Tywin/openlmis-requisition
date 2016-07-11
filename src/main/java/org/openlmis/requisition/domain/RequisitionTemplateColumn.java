package org.openlmis.requisition.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class RequisitionTemplateColumn {

  @Getter
  @Setter
  private String name;

  @Getter
  @Setter
  private String label;

  @Getter
  @Setter
  private int displayOrder;

  @Getter
  private Boolean isDisplayed;

  @Getter
  @Setter
  private Boolean isDisplayRequired;

  @Getter
  @Setter
  private Boolean canChangeOrder;

  @Getter
  @Setter
  private String source; //todo change String to SourceType {User Input, Reference Data, Calculated}

  public void setIsDisplayed(boolean isDisplayed) {
    if (this.name.equals("productCode")) {
      this.displayOrder = 1;
    }
    this.isDisplayed = isDisplayed;
  }
}