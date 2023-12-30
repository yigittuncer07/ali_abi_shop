-- 1
INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
VALUES (1, 'Ahmet', 'Yılmaz', 'pass123', 'ahmet.yilmaz@email.com', 50000, '2022-01-01', '1990-05-15', '+123456789', NULL);

-- 2
INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
VALUES (2, 'Ayşe', 'Kaya', 'pass456', 'ayse.kaya@email.com', 60000, '2022-02-15', '1985-08-20', '+987654321', NULL);

-- 3
INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
VALUES (3, 'Mehmet', 'Arslan', 'pass789', 'mehmet.arslan@email.com', 55000, '2022-03-20', '1992-11-10', '+111222333', 1);

-- 4
INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
VALUES (4, 'Emine', 'Demir', 'passabc', 'emine.demir@email.com', 70000, '2022-04-25', '1988-04-05', '+444555666', 1);

-- 5
INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
VALUES (5, 'Can', 'Öztürk', 'passxyz', 'can.ozturk@email.com', 65000, '2022-05-30', '1995-09-18', '+999888777', 2);

-- 6
INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
VALUES (6, 'Elif', 'Yıldız', 'pass456', 'elif.yildiz@email.com', 60000, '2022-06-05', '1998-02-22', '+777888999', 2);

-- 7
INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
VALUES (7, 'Oğuz', 'Aksoy', 'pass789', 'oguz.aksoy@email.com', 75000, '2022-07-10', '1987-07-12', '+111333444', 3);

-- 8
INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
VALUES (8, 'Zeynep', 'Erdem', 'passabc', 'zeynep.erdem@email.com', 80000, '2022-08-15', '1993-04-30', '+555444333', 3);

-- 9
INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
VALUES (9, 'Kaan', 'Güneş', 'passxyz', 'kaan.gunes@email.com', 70000, '2022-09-20', '1991-12-08', '+222333444', 4);

-- 10
INSERT INTO Employee (EmployeeId, Name, Surname, Password, Email, Salary, WorkEntranceDate, BirthDate, PhoneNumber, ManagerId)
VALUES (10, 'Deniz', 'Aydın', 'pass123', 'deniz.aydin@email.com', 60000, '2022-10-25', '1989-06-25', '+888999000', 4);

GO

INSERT INTO Customer (CustomerId, Name, Surname, PhoneNumber)
VALUES
  (50, 'Ali', 'Yılmaz', '+905555555501'),
  (51, 'Ayşe', 'Kaya', '+905555555502'),
  (52, 'Mehmet', 'Arslan', '+905555555503'),
  (53, 'Fatma', 'Demir', '+905555555504'),
  (54, 'Mustafa', 'Çelik', '+905555555505'),
  (55, 'Zeynep', 'Yıldız', '+905555555506'),
  (56, 'Emre', 'Erdoğan', '+905555555507'),
  (57, 'Ceren', 'Şahin', '+905555555508'),
  (58, 'Ahmet', 'Aydın', '+905555555509'),
  (59, 'Elif', 'Öztürk', '+905555555510');


-- Eğitim bilgilerini doldur
INSERT INTO Education (EmployeeId, BeginYear, EndYear, Average)
VALUES
  (1, '2010-09-01', '2014-06-30', 80),
  (2, '2008-09-01', '2012-06-30', 85),
  (3, '2009-09-01', '2013-06-30', 75),
  (4, '2011-09-01', '2015-06-30', 90),
  (5, '2012-09-01', '2016-06-30', 88),
  (5, '2013-09-01', '2017-06-30', 92),
  (7, '2007-09-01', '2011-06-30', 78),
  (7, '2006-09-01', '2010-06-30', 87),
  (9, '2008-09-01', '2012-06-30', 89),
  (9, '2009-09-01', '2013-06-30', 82);


-- Receipt tablosuna kayıtlar ekle (ReceiptId'ler 100'den başlasın)
INSERT INTO Receipt (ReceiptId, CustomerId, Date)
VALUES
  (100, 50, '2023-01-05'),
  (101, 51, '2023-01-10'),
  (102, 52, '2023-01-15'),
  (103, 53, '2023-01-20'),
  (104, 54, '2023-01-25'),
  (105, 55, '2023-01-30'),
  (106, 56, '2023-02-05'),
  (107, 57, '2023-02-10'),
  (108, 58, '2023-02-15'),
  (109, 59, '2023-02-20');


-- Adres bilgilerini doldur (Türkiye)
INSERT INTO Adress (Id, Country, City, Street, HouseNumber, ZipCode)
VALUES
  (1, 'Turkey', 'Istanbul', 'Atatürk Caddesi', '123', '34000'),
  (2, 'Turkey', 'Ankara', 'Kızılay Meydanı', '456', '06000'),
  (3, 'Turkey', 'Izmir', 'Konak Meydanı', '789', '35000'),
  (4, 'Turkey', 'Antalya', 'Konyaaltı Caddesi', '101', '07070'),
  (5, 'Turkey', 'Bursa', 'Uludağ Sokak', '202', '16000'),
  (6, 'Turkey', 'Adana', 'Çukurova Bulvarı', '303', '01010'),
  (7, 'Turkey', 'Trabzon', 'Atatürk Alanı', '404', '61000'),
  (8, 'Turkey', 'Konya', 'Mevlana Caddesi', '505', '42000'),
  (9, 'Turkey', 'Eskişehir', 'Kent Park', '606', '26000'),
  (10, 'Turkey', 'Samsun', 'İstiklal Caddesi', '707', '55000');


  -- WorkedOn tablosuna kayıtlar ekle
INSERT INTO WorkedOn (EmployeeId, ReceiptId)
VALUES
  (1, 100),
  (1, 101),
  (1, 102),
  (4, 103),
  (5, 104),
  (6, 104),
  (7, 106),
  (8, 107),
  (9, 108),
  (10, 109);

  -- OrderList tablosuna kayıtlar ekle (ItemId'ler 150'den başlasın)
INSERT INTO OrderList (ReceiptId, ItemId)
VALUES
  (100, 150),
  (100, 151),
  (100, 152),
  (100, 154),
  (100, 155),
  (101, 156),
  (102, 157),
  (103, 160),
  (104, 161),
  (105, 162),
  (106, 163),
  (107, 164),
  (108, 165),
  (109, 167);


-- Item tablosuna kayıtlar ekle (ProductId'ler 200'den başlasın)
INSERT INTO Item (ItemId, ProductId, DateBought, DateSold, IsSold)
VALUES
  (150, 200, '2023-01-05', '2023-02-15', 1),
  (151, 200, '2023-01-05', '2023-02-15', 1),
  (152, 200, '2023-01-05', '2023-02-15', 1),
  (154, 203, '2023-01-05', '2023-02-15', 1),
  (155, 204, '2023-01-05', '2023-02-15', 1),
  (156, 205, '2023-01-10', '2023-02-20', 1),
  (157, 205, '2023-01-15', '2023-02-25', 1),
  (160, 207, '2023-01-20', '2023-03-01', 1),
  (161, 208, '2023-01-25', '2023-02-15', 1),
  (162, 209, '2023-01-30', '2023-03-05', 1),
  (163, 209, '2023-02-05', '2023-03-10', 1),
  (164, 209, '2023-02-10', '2023-03-15', 1),
  (165, 212, '2023-02-15', '2023-03-20', 1),
  (167, 213, '2023-02-20', '2023-02-15', 1),
  (168, 209, '2023-01-25', NULL, 0),
  (169, 209, '2023-01-25', NULL, 0),
  (170, 208, '2023-01-25', NULL, 0),
  (171, 207, '2023-01-25', NULL, 0),
  (172, 204, '2023-01-25', NULL, 0);



-- Product tablosuna kayıtlar ekle
INSERT INTO Product (ProductId, Name, Price, SellingPrice, ArrivalPrice)
VALUES
  (200, 'Kalem', 5, 8, 3),
  (203, 'Defter', 10, 15, 7),
  (204, 'Silgi', 2, 3, 1),
  (205, 'Kurşun Kalem', 3, 5, 2),
  (207, 'Mürekkep', 15, 25, 10),
  (208, 'Cetvel', 8, 12, 5),
  (209, 'Bant', 4, 7, 3),
  (212, 'Kalem Kutusu', 12, 18, 9),
  (213, 'Kurdele', 6, 10, 4);


-- PrintOrder tablosuna kayıtlar ekle (PrintOrderId'ler 250'den, DocumentId'ler 300'den başlasın)
INSERT INTO PrintOrder (PrintOrderId, DocumentId)
VALUES
  (250, 300),
  (251, 301),
  (252, 302),
  (253, 303),
  (254, 304),
  (255, 305),
  (256, 306),
  (257, 307),
  (258, 308),
  (259, 309);


INSERT INTO Category (ProductId, Category)
VALUES
  (200, 'Okul'),
  (203, 'Okul'),
  (204, 'Okul'),
  (205, 'Okul'),
  (207, 'Okul'),
  (208, 'Okul'),
  (209, 'Okul'),
  (212, 'Okul'),
  (213, 'Okul');