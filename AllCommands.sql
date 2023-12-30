CREATE TABLE Employee (
	EmployeeId INT PRIMARY KEY,
	Name VARCHAR(50),
    Surname VARCHAR(50),
	Password VARCHAR(50),
	Email VARCHAR(50),
	Salary INT,
	WorkEntranceDate DATE,
	BirthDate DATE,
	PhoneNumber VARCHAR(15),
	ManagerId INT
);

GO 

create table Education(
	EmployeeId INT ,
	BeginYear DATE,
	EndYear DATE,
	Average INT

);

GO

create table Adress(
	Id INT ,
	Country VARCHAR(50),
	City VARCHAR(50),
	Street VARCHAR(250),
	HouseNumber VARCHAR(50),
	ZipCode VARCHAR(50)
);
GO
CREATE TABLE WorkedOn (
    EmployeeId INT,
    ReceiptId INT,
    PRIMARY KEY (EmployeeId, ReceiptId),
);

GO



GO
CREATE TABLE Customer (
	CustomerId INT PRIMARY KEY,
	Name VARCHAR(50),
	Surname VARCHAR(50),
	PhoneNumber VARCHAR(15)
);

GO
CREATE TABLE Receipt (
	ReceiptId  INT PRIMARY KEY,
	CustomerId INT,
	Date DATE
);
GO
CREATE TABLE OrderList (
	ReceiptId  INT,
	ItemId INT,
	PRIMARY KEY (ReceiptId, ItemId),

);

GO
CREATE TABLE Item (
	ItemId  INT PRIMARY KEY ,
	ProductId INT,
	DateBought DATE,
	DateSold DATE, 
	IsSold BIT
);
GO
CREATE TABLE Product (
	ProductId  INT PRIMARY KEY ,
	Name VARCHAR(50),
	Price INT,
	SellingPrice INT, 
	ArrivalPrice INT
);
GO

CREATE TABLE PrintOrder (
	PrintOrderId  INT,
	DocumentId INT,
	PRIMARY KEY (PrintOrderId, DocumentId),

);
GO
CREATE TABLE Category (
	ProductId  INT,
	Category VARCHAR(50),
	PRIMARY KEY (ProductId, Category),

);
GO
CREATE TABLE Document (
	DocumentId  INT PRIMARY KEY,
	FileContent VARCHAR(50)
	

);
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
------------
GO

ALTER TABLE OrderList
ADD FOREIGN KEY (ItemId) REFERENCES PrintOrder(PrintOrderId);


GO 

ALTER TABLE PrintOrder
ADD FOREIGN KEY (DocumentId) REFERENCES Document(DocumentId);