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
