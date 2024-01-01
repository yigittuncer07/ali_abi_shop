ALTER TABLE Employee
ADD Age AS (DATEDIFF(YEAR, BirthDate, GETDATE()));

CREATE INDEX ReceiptEmployeeId
ON Receipt(EmployeeId);

CREATE INDEX ReceiptCustomerId
ON Receipt(CustomerId);

CREATE INDEX ItemReceiptId
ON Item(ReceiptId);



CREATE VIEW StockDetails AS
SELECT i.ItemId, p.Name, p.Definition, i.DateBought, i.ArrivalPrice, p.Price as CurrentPrice,c.Category
FROM
    Item i
INNER JOIN Product p ON i.ProductId = p.ProductId
INNER JOIN Category c ON p.ProductId = c.ProductId

WHERE i.IsSold = 0;


CREATE VIEW PerformanceDetails AS
SELECT
    e.EmployeeId,
    e.Name + ' ' + e.Surname AS FullName,
    e.Salary,
    e.Age,
    COUNT(r.ReceiptId) AS NumberOfReceipts,
	 CASE
        WHEN COUNT(r.ReceiptId) < 2 THEN 'Unsuccessful'
        ELSE 'Successful'
    END AS Result
FROM
    Employee e
FULL JOIN
    Receipt r ON e.EmployeeId = r.EmployeeId
GROUP BY
    e.EmployeeId, e.Name, e.Surname, e.Salary, e.Age;



CREATE VIEW SoldDetails AS
SELECT i.ItemId, p.Name, r.CustomerId, r.EmployeeId ,c.Category, (i.SellingPrice-i.ArrivalPrice) as Income
FROM 
    Item i
INNER JOIN Receipt r ON r.ReceiptId = i.ReceiptId
INNER JOIN Product p ON i.ProductId = p.ProductId
INNER JOIN Category c ON p.ProductId = c.ProductId

WHERE i.IsSold = 1;



CREATE VIEW CategoryDetails AS
SELECT
    c.Category,
    COUNT(p.ProductId) AS NumberOfProducts
FROM
    Category c
LEFT JOIN
    Product p ON c.ProductId = p.ProductId
GROUP BY
    c.Category;


CREATE TRIGGER trg_UpdateItemDateBought
ON Item
AFTER INSERT AS
BEGIN
    UPDATE i
    SET i.DateBought = GETDATE()
    FROM Item i
    INNER JOIN INSERTED ins ON i.ItemId = ins.ItemId;
END;

--1
CREATE PROCEDURE GetEmployeeInfo
    @EmployeeId INT
AS
BEGIN
    SELECT * FROM Employee WHERE EmployeeId = @EmployeeId;
END;

--2
CREATE PROCEDURE SearchProductsByPriceRange
    @MinPrice INT,
    @MaxPrice INT
AS
BEGIN
    SELECT * FROM Product WHERE Price BETWEEN @MinPrice AND @MaxPrice;
END;

--3
CREATE PROCEDURE GetCustomerReceipts
    @CustomerId INT
AS
BEGIN
    SELECT * FROM Receipt WHERE CustomerId = @CustomerId;
END;

--4
CREATE PROCEDURE GetItemsByPurchaseDate
    @PurchaseDate DATE
AS
BEGIN
    SELECT * FROM Item WHERE DateBought = @PurchaseDate;
END;


--5
CREATE PROCEDURE SellItem
    @ItemId INT,
    @ReceiptId INT,
    @SellingPrice INT
AS
BEGIN
    UPDATE Item SET IsSold = 1, DateSold = GETDATE(), SellingPrice = @SellingPrice, ReceiptId = @ReceiptId WHERE ItemId = @ItemId;
END;

--6
CREATE PROCEDURE AddProduct
    @ProductId INT,
    @Name VARCHAR(50),
    @Definition VARCHAR(250),
    @Price INT
AS
BEGIN
    INSERT INTO Product (ProductId, Name, Definition, Price) VALUES (@ProductId, @Name, @Definition, @Price);
END;

--7
CREATE PROCEDURE AddEmployee
    @EmployeeId INT,
    @Name VARCHAR(50),
    @Surname VARCHAR(50),
    @Password VARCHAR(50),
    @Email VARCHAR(50),
    @Salary INT,
    @WorkEntranceDate DATE,
    @BirthDate DATE,
    @PhoneNumber VARCHAR(15),
    @ManagerId INT
AS
BEGIN
    INSERT INTO Employee (EmployeeId , Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
    VALUES (@EmployeeId, @Name, @Surname, @Password, @Email, @Salary, @WorkEntranceDate, @BirthDate, @PhoneNumber, @ManagerId);
END;

--8
CREATE PROCEDURE AddCustomer
    @CustomerId INT,
    @Name VARCHAR(50),
    @Surname VARCHAR(50),
    @PhoneNumber VARCHAR(15)
AS
BEGIN
    INSERT INTO Customer (CustomerId, Name, Surname, PhoneNumber)
    VALUES (@CustomerId, @Name, @Surname, @PhoneNumber);
END;


--9
CREATE PROCEDURE AddDocument
    @PrintOrderId INT,
    @FileContent VARCHAR(250),
    @Quantity INT
AS
BEGIN
    INSERT INTO Document (FileContent, Quantity, PrintOrderId)
    VALUES(@FileContent, @Quantity, @PrintOrderId);
END;


--10
CREATE PROCEDURE AddReceipt
    @ReceiptId INT,
    @EmployeeId INT,
    @CustomerId INT,
    @Date DATE
AS
BEGIN
    INSERT INTO Receipt (ReceiptId, CustomerId, EmployeeId, Date)
    VALUES (@ReceiptId, @CustomerId, @EmployeeId, @Date);
END;
