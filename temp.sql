CREATE TABLE Employee (
    EmployeeId INT PRIMARY KEY,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    Password VARCHAR(50),
    Email VARCHAR(50) UNIQUE,
    Salary INT,
    WorkEntranceDate DATE,
    BirthDate DATE,
    PhoneNumber VARCHAR(15) UNIQUE,
    ManagerId INT,
    FOREIGN KEY (ManagerId) REFERENCES Employee(EmployeeId)
);


CREATE TABLE Education(
    EmployeeId INT,
    Major VARCHAR(50),
    UniversityName VARCHAR(50),
    BeginYear DATE,
    EndYear DATE,
    Average INT,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
    PRIMARY KEY (EmployeeId,Major,UniversityName)

);

CREATE TABLE Customer (
    CustomerId INT PRIMARY KEY,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    PhoneNumber VARCHAR(15) CHECK (phoneNumber LIKE '+90%')
);

CREATE TABLE EmployeeAdress(
    EmployeeId INT,
    Country VARCHAR(50),
    City VARCHAR(50),
    Street VARCHAR(250),
    HouseNumber VARCHAR(50),
    ZipCode VARCHAR(50),
    PRIMARY KEY(EmployeeId,Country,City,Street,HouseNumber,ZipCode),
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)
);

CREATE TABLE CustomerAdress(
    CustomerId INT,
    Country VARCHAR(50),
    City VARCHAR(50),
    Street VARCHAR(250),
    HouseNumber VARCHAR(50),
    ZipCode VARCHAR(50),
    PRIMARY KEY(CustomerId,Country,City,Street,HouseNumber,ZipCode),
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);

CREATE TABLE Receipt (
    ReceiptId  INT PRIMARY KEY,
    CustomerId INT,
    EmployeeId INT,
    Date DATE,
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)

);


CREATE TABLE Product (
    ProductId  INT PRIMARY KEY ,
    Name VARCHAR(50),
    Definition VARCHAR(250),
    Price INT,
);

CREATE TABLE Item (
    ItemId  INT PRIMARY KEY ,
    ProductId INT,
    ReceiptId INT,
    DateBought DATE,
    DateSold DATE, 
    SellingPrice INT,
    ArrivalPrice INT,
    IsSold BIT,
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId),
    FOREIGN KEY (ReceiptId) REFERENCES Receipt(ReceiptId)

);

CREATE TABLE Category (
    ProductId  INT,
    Category VARCHAR(50),
    PRIMARY KEY (ProductId, Category),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);

CREATE TABLE PrintOrder (
    PrintOrderId  INT PRIMARY KEY,
    ReceiptId INT,
    FOREIGN KEY (ReceiptId) REFERENCES Receipt(ReceiptId)
);



CREATE TABLE Document (
    DocumentId  INT  IDENTITY(1,1) PRIMARY KEY,
    FileContent VARCHAR(250),
    Quantity INT DEFAULT 1,
    PrintOrderId INT,
    FOREIGN KEY (PrintOrderId) REFERENCES PrintOrder(PrintOrderId)
);
