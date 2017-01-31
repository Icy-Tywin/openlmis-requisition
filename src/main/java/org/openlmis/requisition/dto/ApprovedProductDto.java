package org.openlmis.requisition.dto;

import lombok.Data;

import java.util.UUID;

@Data
public class ApprovedProductDto {
  private UUID id;
  private ProgramOrderableDto programOrderable;
  private Double maxMonthsOfStock;
  private Double minMonthsOfStock;
  private Double emergencyOrderPoint;
}
