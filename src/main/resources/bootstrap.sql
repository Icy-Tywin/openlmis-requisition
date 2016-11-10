INSERT INTO requisition.order_file_templates (id, filePrefix, headerInFile) VALUES ('457ed5b0-80d7-4cb6-af54-e3f6138c8128', 'O', true);

INSERT INTO requisition.order_file_columns (id, openLmisField, dataFieldLabel, columnLabel, include, "position", format, nested, keyPath, related, relatedKeyPath, orderFileTemplateId) VALUES ('33b2d2e9-3167-46b0-95d4-1295be9afc21', true, 'fulfillment.header.order.number', 'Order number', true, 1, null, 'order', 'orderCode', null, null, '457ed5b0-80d7-4cb6-af54-e3f6138c8128');
INSERT INTO requisition.order_file_columns (id, openLmisField, dataFieldLabel, columnLabel, include, "position", format, nested, keyPath, related, relatedKeyPath, orderFileTemplateId) VALUES ('6b8d331b-a0dd-4a1f-aafb-40e6a72ab9f6', true, 'fulfillment.header.facility.code', 'Facility code', true, 2, null, 'order', 'requisition/facilityId', 'Facility', 'code', '457ed5b0-80d7-4cb6-af54-e3f6138c8128');
INSERT INTO requisition.order_file_columns (id, openLmisField, dataFieldLabel, columnLabel, include, "position", format, nested, keyPath, related, relatedKeyPath, orderFileTemplateId) VALUES ('752cda76-0db5-4b6e-bb79-0f531ab78e2e', true, 'fulfillment.header.product.code', 'Product code', true, 3, null, 'lineItem', 'orderableProductId', 'OrderableProduct', 'productCode', '457ed5b0-80d7-4cb6-af54-e3f6138c8128');
INSERT INTO requisition.order_file_columns (id, openLmisField, dataFieldLabel, columnLabel, include, "position", format, nested, keyPath, related, relatedKeyPath, orderFileTemplateId) VALUES ('9e825396-269d-4873-baa4-89054e2722f5', true, 'fulfillment.header.product.name', 'Product name', true, 4, null, 'lineItem', 'orderableProductId', 'OrderableProduct', 'name', '457ed5b0-80d7-4cb6-af54-e3f6138c8128');
INSERT INTO requisition.order_file_columns (id, openLmisField, dataFieldLabel, columnLabel, include, "position", format, nested, keyPath, related, relatedKeyPath, orderFileTemplateId) VALUES ('cd57f329-f549-4717-882e-ecbf98122c39', true, 'fulfillment.header.approved.quantity', 'Approved quantity', true, 5, null, 'lineItem', 'approvedQuantity', null, null, '457ed5b0-80d7-4cb6-af54-e3f6138c8128');
INSERT INTO requisition.order_file_columns (id, openLmisField, dataFieldLabel, columnLabel, include, "position", format, nested, keyPath, related, relatedKeyPath, orderFileTemplateId) VALUES ('d0e1aec7-1556-4dc1-8e21-d80a2d76b678', true, 'fulfillment.header.period', 'Period', true, 6, 'MM/yy', 'order', 'requisition/processingPeriodId', 'ProcessingPeriod', 'startDate', '457ed5b0-80d7-4cb6-af54-e3f6138c8128');
INSERT INTO requisition.order_file_columns (id, openLmisField, dataFieldLabel, columnLabel, include, "position", format, nested, keyPath, related, relatedKeyPath, orderFileTemplateId) VALUES ('dab6eec0-4cb4-4d4c-94b7-820308da73ff', true, 'fulfillment.header.order.date', 'Order date', true, 7, 'dd/MM/yy', 'order', 'createdDate', null, null, '457ed5b0-80d7-4cb6-af54-e3f6138c8128');

INSERT INTO requisition.order_number_configurations (id, orderNumberPrefix, includeOrderNumberPrefix, includeProgramCode, includeRequisitionTypeSuffix) VALUES ('70543032-b131-4219-b44d-7781d29db330', 'ORDER-', true, false, true);

INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('4a2e9fd3-1127-4b68-9912-84a5c00f6999', 'requestedQuantity', 'Requested Quantity', 'J', false, false, true, false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('5ba8b72d-277a-4da8-b10a-23f0cda23cb4', 'totalReceivedQuantity', 'Total Received Quantity', 'B', false, false, true, false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('33b2d2e9-3167-46b0-95d4-1295be9afc22', 'beginningBalance', 'Beginning Balance', 'A', false, false, true, false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('752cda76-0db5-4b6e-bb79-0f531ab78e2c', 'stockOnHand', 'Stock On Hand', 'E', false, false, true, false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('9e825396-269d-4873-baa4-89054e2722f4', 'totalConsumedQuantity', 'Total Consumed Quantity', 'C', false, false, true, false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('cd57f329-f549-4717-882e-ecbf98122c38', 'totalLossesAndAdjustments', 'Total Losses And Adjustments', 'D', false, false, true, false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('6b8d331b-a0dd-4a1f-aafb-40e6a72ab9f5', 'requestedQuantityExplanation', 'Requested Quantity Explanation', 'W', false, false, true, false, 'TEXT');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('2ed8c74a-f424-4742-bd14-cfbe67b6e7be', 'remarks', 'Remarks', 'L', false, false, true, false, 'TEXT');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('bde01507-3837-47b7-ae08-cec92c0c3cd2', 'productCode', 'Product Code', 'O', false, false, true, false, 'TEXT');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('e53e80de-fc63-4ecb-b6b2-ef376b34c926', 'productName', 'Product', 'N', false, false, true, false, 'TEXT');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('a62a5fed-c0b6-4d49-8a96-c631da0d0113', 'approvedQuantity', 'Approved Quantity', 'K', false, false, true, false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('750b9359-c097-4612-8328-d21671f88920', 'totalStockoutDays', 'Total Stockout Days', 'X', false, false, true, false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('ef524868-9d0a-11e6-80f5-76304dec7eb7', 'total', 'Total', 'Y', false, false, true, false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES ('61e6d059-10ef-40c4-a6e3-fa7b9ad741ec', 'dispensingUnit', 'Unit/Unit of Issue', 'U', false, false, true, false, 'TEXT');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('dc9dde56-593d-4929-81be-d1faec7025a8', 'packsToShip', 'Packs To Ship', 'V', false, false, true, false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('ef524868-9d0a-11e6-80f5-76304dec7eb7', 'total', 'Total', 'Y', false, false, true,false, 'NUMERIC');
INSERT INTO requisition.available_requisition_columns (id, name, label, indicator, mandatory, isDisplayRequired, canChangeOrder, canBeChangedByUser, columnType) VALUES('df524868-9d0a-18e6-80f5-76304ded7ab9', 'pricePerPack', 'Price Per Pack', 'T', false, false, true, false, 'NUMERIC');

INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('4a2e9fd3-1127-4b68-9912-84a5c00f6999', 'USER_INPUT'); -- requestedQuantity
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('5ba8b72d-277a-4da8-b10a-23f0cda23cb4', 'USER_INPUT'); -- totalReceivedQuantity
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('33b2d2e9-3167-46b0-95d4-1295be9afc22', 'USER_INPUT'); -- beginningBalance
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('752cda76-0db5-4b6e-bb79-0f531ab78e2c', 'USER_INPUT'); -- stockOnHand
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('752cda76-0db5-4b6e-bb79-0f531ab78e2c', 'CALCULATED'); -- stockOnHand
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('9e825396-269d-4873-baa4-89054e2722f4', 'USER_INPUT'); -- totalConsumedQuantity
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('9e825396-269d-4873-baa4-89054e2722f4', 'CALCULATED'); -- totalConsumedQuantity
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('cd57f329-f549-4717-882e-ecbf98122c38', 'USER_INPUT'); -- totalLossesAndAdjustments
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('6b8d331b-a0dd-4a1f-aafb-40e6a72ab9f5', 'USER_INPUT'); -- requestedQuantityExplanation
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('2ed8c74a-f424-4742-bd14-cfbe67b6e7be', 'USER_INPUT'); -- remarks
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('bde01507-3837-47b7-ae08-cec92c0c3cd2', 'REFERENCE_DATA'); -- productCode
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('e53e80de-fc63-4ecb-b6b2-ef376b34c926', 'REFERENCE_DATA'); -- productName
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('a62a5fed-c0b6-4d49-8a96-c631da0d0113', 'USER_INPUT'); -- approvedQuantity
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('750b9359-c097-4612-8328-d21671f88920', 'USER_INPUT'); -- totalStockoutDays
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('ef524868-9d0a-11e6-80f5-76304dec7eb7', 'CALCULATED'); -- total
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('61e6d059-10ef-40c4-a6e3-fa7b9ad741ec', 'REFERENCE_DATA'); -- dispensingUnit
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('dc9dde56-593d-4929-81be-d1faec7025a8', 'CALCULATED'); -- packsToShip
INSERT INTO requisition.available_requisition_column_sources (columnId, value) VALUES ('df524868-9d0a-18e6-80f5-76304ded7ab9', 'REFERENCE_DATA'); -- pricePerPack
