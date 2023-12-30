GO

ALTER TABLE Employee
ADD FOREIGN KEY (ManagerId) REFERENCES Employee(EmployeeId);

GO

ALTER TABLE Education
ADD FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId);

GO
ALTER TABLE Adress
ADD FOREIGN KEY (Id) REFERENCES Employee(EmployeeId);
GO

ALTER TABLE Adress
ADD FOREIGN KEY (Id) REFERENCES Customer(CustomerId);

GO

ALTER TABLE WorkedOn
ADD FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId);

GO


ALTER TABLE Receipt
ADD FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId);

GO


ALTER TABLE WorkedOn
ADD FOREIGN KEY (ReceiptId) REFERENCES Receipt(ReceiptId);


GO

ALTER TABLE OrderList
ADD FOREIGN KEY (ReceiptId) REFERENCES Receipt(ReceiptId);

GO 

ALTER TABLE OrderList
ADD FOREIGN KEY (ItemId) REFERENCES Item(ItemId);

GO

ALTER TABLE Item
ADD FOREIGN KEY (ProductId) REFERENCES Product(ProductId);

GO

ALTER TABLE Category
ADD FOREIGN KEY (ProductId) REFERENCES Product(ProductId);

GO

GO 

ALTER TABLE PrintOrder
ADD FOREIGN KEY (DocumentId) REFERENCES Document(DocumentId);

GO

ALTER TABLE OrderList
ADD FOREIGN KEY (ItemId) REFERENCES PrintOrder(PrintOrderId);


