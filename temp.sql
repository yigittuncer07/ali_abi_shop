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
    ManagerId INT,
    FOREIGN KEY (ManagerId) REFERENCES Employee(EmployeeId)
);


-- Education tablosu
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
    PhoneNumber VARCHAR(15)
);

-- Adress tablosu
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

-- Adress tablosu
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

-- Receipt tablosu
CREATE TABLE Receipt (
    ReceiptId  INT PRIMARY KEY,
    CustomerId INT,
    EmployeeId INT,
    Date DATE,
    FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)

);


-- Product tablosu
CREATE TABLE Product (
    ProductId  INT PRIMARY KEY ,
    Name VARCHAR(50),
    Definition VARCHAR(250),
    Price INT,
);

-- Item tablosu
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

-- Category tablosu
CREATE TABLE Category (
    ProductId  INT,
    Category VARCHAR(50),
    PRIMARY KEY (ProductId, Category),
    FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);

-- PrintOrder tablosu
CREATE TABLE PrintOrder (
    PrintOrderId  INT PRIMARY KEY,
    ReceiptId INT,
    FOREIGN KEY (ReceiptId) REFERENCES Receipt(ReceiptId)
);



-- Document tablosu
CREATE TABLE Document (
    DocumentId  INT PRIMARY KEY,
    FileContent VARCHAR(250),
    Quantity INT,
    PrintOrderId INT,
    FOREIGN KEY (PrintOrderId) REFERENCES PrintOrder(PrintOrderId)
);
