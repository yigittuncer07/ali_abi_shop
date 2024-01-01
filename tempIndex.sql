ALTER TABLE Employee
ADD Age AS (DATEDIFF(YEAR, BirthDate, GETDATE()));

CREATE INDEX ReceiptEmployeeId
ON Receipt(EmployeeId);

CREATE INDEX ReceiptCustomerId
ON Receipt(CustomerId);

CREATE INDEX ItemReceiptId
ON Item(ReceiptId);