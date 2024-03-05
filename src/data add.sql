-- TaxRate Tablosu için Veri Ekleme
INSERT INTO TaxRate (taxRate_ID, district, taxRate2) 
VALUES 
(1, N'New York', 0.14),
(2, N'California', 0.08),
(3, N'Turkey', 0.20),
(4, N'France', 0.18),
(5, N'German', 0.12),
(6, N'Japan', 0.20);

-- Bills Tablosu için Veri Ekleme
INSERT INTO Bills (taxRate_ID, billDate, totalPaymentAmount, ID_Number) 
VALUES 
(1, GETDATE(), 500.25, '12345678901'),
(2, GETDATE(), 5500.75, '98765432109'),
(3, '2023-07-15', 1200.50, '45678901234'),
(4, '2024-01-17', 700.50, '09876543210'),
(5, '2024-01-17', 2750.00, '11223344556'),
(6, GETDATE(), 890.75, '65432109876');









-- Shipping Tablosu için Veri Ekleme
INSERT INTO Shipping (address, shippingMethod, shipperCompany, shipDate) 
VALUES 
('123 Main Street, Queensbury, N. York', 'Air Freight', 'DHL', GETDATE()),
('456 Ankara Caddesi, Etimesgut, Ankara', 'Land Shipping', 'YURTÝÇÝ', GETDATE()),
('789 Bursa Bulvarý, Yýldýrým, Bursa', 'Land Shipping', 'Aras', '2023-07-04'),
('789 Main Street, Istanbul, TR', 'Sea Freight', 'Maersk', GETDATE()),
('101 Berliner Strasse, Berlin', 'Air Freight', 'DHL', '2024-02-01'),
('202 Tokyo Street, Tokyo', 'Land Shipping', 'Yamato', GETDATE());

-- Suppliers Tablosu için Veri Ekleme
INSERT INTO Suppliers (companyName, cAdress, country, city, cEmail, phone) 
VALUES 
('Kardeþler Elektronik', 'Doðubank Pasajý No:121 Sirkeci', 'TR', 'Ýstanbul', 'info@kardesler.com', '+90 212 574 8754'),
('Maltepe Tekstil', 'Maltepe Çarþý No:188 Maltepe', 'TR', 'Ýstanbul', 'Maltepe.Tekstil123@gmail.com', '+90 216 865 3809'),
('Barnsider Garden Shop', '2011 Route-9 Lake George', 'USA', 'N.York', 'Barnsider.edd@hotmail.com', '+1 918 432 8090'),
('Teknoloji Maðazasý', 'Ýstiklal Caddesi No:45 Beyoðlu', 'TR', 'Ýstanbul', 'info@teknolojimagazasi.com', '+90 212 987 6543'),
('Moda Tekstil', 'Izmir Caddesi No:77 Kadýköy', 'TR', 'Ýstanbul', 'modatekstil@gmail.com', '+90 216 543 2109'),
('Tokyo Gardens', 'Sakura Street, Shibuya', 'JP', 'Tokyo', 'tokyogardens@gmail.com', '+81 3 9876 5432');

-- Coupons Tablosu için Veri Ekleme
INSERT INTO Coupons (couponCode, expDate, startDate, couponAmount, discount_percent) 
VALUES 
(101, '2024-02-28', '2024-01-01', 10.50, NULL),
(102, '2024-03-31', '2024-01-15', NULL, 15),
(103, '2024-06-30', '2024-04-01', 5.00, NULL),
(104, '2024-04-30', '2024-02-15', NULL, 20),
(105, '2024-05-31', '2024-03-01', 7.50, NULL),
(106, '2024-08-31', '2024-06-01', NULL, 12);


-- Customers Tablosu için Veri Ekleme
INSERT INTO Customers (addreses, wishlist, firstName, lastName, phoneNumber, email, NumberOfID, dateOfBirth, gender, couponCode) 
VALUES 
('123 Main Street, Queensbury, N. York USA', 'Product1, Product2', 'Andrew', 'Foley', '+1 518 920 0945', 'drew.foley92@gmail.com', '48368765208', '1990-05-15', 'm', 101),
('456 Ankara Caddesi, Etimesgut, Ankara TR', 'Product3, Product4', 'Behzat', 'Çizer', '+90 545 916 6851', 'BehzatSSK@egm.com', '38765432109', '1985-08-22', 'f', NULL),
('789 Bursa Bulvarý, Yýldýrým, Bursa TR', 'Product5, Product6', 'Elif', 'Durmuþ', '+90 555 668 6851', 'elif.durmus16@gmail.com', '54761287098', '1978-12-10', 'm', 103),
('987 Main Street, Istanbul, TR', 'Product7, Product8', 'Zeynep', 'Yýlmaz', '+90 533 123 4567', 'zeynep.yilmaz@gmail.com', '76543210987', '1995-03-25', 'f', 105),
('303 Friedrichstrasse, Berlin', 'Product9, Product10', 'Hans', 'Müller', '+49 30 8765 4321', 'hans.mueller@email.de', '98765432101', '1980-11-10', 'm', 104),
('505 Shinjuku Street, Tokyo', 'Product11, Product12', 'Aya', 'Yamamoto', '+81 3 1234 5678', 'aya.yamamoto@gmail.com', '67890123456', '1988-07-18', 'f', 106);

-- Categories Tablosu için Veri Ekleme
INSERT INTO Categories (categoryName, description, cPicture) 
VALUES 
('Electronics', 'Electronic devices and accessories', NULL),
('Clothing', 'Clothing items for all ages', NULL),
('Home and Garden', 'Products for home and garden', NULL),
('Appliances', 'Household electronic devices', NULL),
('Footwear', 'Shoes and slippers for all occasions', NULL)

-- Returns Tablosu için Veri Ekleme
INSERT INTO Returns (customer_ID, returnDate, returnStatus, qtyReturned, returnCondition) 
VALUES 
(1, GETDATE(), 'Returned', 2, 'Damaged'),
(2, '2023-08-01', 'Pending', 1, NULL),
(3, GETDATE(), 'Returned', 3, 'Defective'),
(4, '2024-01-18', 'Pending', 2, NULL),
(5, '2024-02-01', 'Returned', 1, 'Defective'),
(6, '2024-01-19', 'Pending', 3, NULL);

-- Products Tablosu için Veri Ekleme
INSERT INTO Products (category_ID, supplier_ID, productName, price, picture, color, stockQty, description) 
VALUES 
(1, 1, 'Laptop', 1200.00, NULL, 'Silver', 50, 'High-performance laptop for professionals'),
(2, 2, 'T-Shirt', 19.99, NULL, 'Blue', 100, 'Cotton T-Shirt for daily wear'),
(3, 3, 'Garden Hose', 29.99, NULL, 'Green', 75, 'Durable garden hose for outdoor use'),
(1, 3, 'Smartphone', 899.99, NULL, 'Black', 30, 'Latest model smartphone with advanced features'),
(2, 2, 'Running Shoes', 49.95, NULL, 'Red', 80, 'Comfortable shoes for running and sports'),
(3, 1, 'Science Fiction Book', 15.99, NULL, NULL, 120, 'Exciting science fiction novel with thrilling plot');

-- oRDERS VERÝ EKLEME
INSERT INTO Orders (customer_ID, orderDate, adress, shipping_ID, product_ID, orderStatus, completeDate, lineTotal) 
VALUES 
(1, GETDATE(), '123 Main Street, Queensbury, N. York USA', 1, 1, 'Shipped', GETDATE() + 5, 1200.00),
(2, GETDATE() , '456 Ankara Caddesi, Etimesgut, Ankara TR', 2, 2, 'Processing', NULL, 39.98),
(3, '2023-07-04', '789 Bursa Bulvarý, Yýldýrým, Bursa TR', 3, 3, 'Delivered', '2023-07-11', 89.97),
(4, '2024-01-17', '987 Main Street, Istanbul, TR', 4, 4, 'Processing', NULL, 899.99),
(5, GETDATE(), '303 Friedrichstrasse, Berlin', 5, 5, 'Shipped', GETDATE() + 3, 49.95),
(6, '2024-02-01', '505 Shinjuku Street, Tokyo', 6, 6, 'Processing', NULL, 15.99);

-- Payments Tablosu için Veri Ekleme
INSERT INTO payments (order_ID, couponsUsed, paymentStatus, paymentDate, paymentType) 
VALUES 
(1, NULL, 'Paid', GETDATE(), 'Credit Card'),
(2, NULL, 'Pending', '2023-03-20', 'Cash'),
(3, 103, 'Paid', '2023-02-10', 'PayPal'),
(4, 104, 'Pending', GETDATE(), 'Bank Transfer'),
(5, NULL, 'Paid', GETDATE(), 'Credit Card'),
(6, 106, 'Pending', '2024-02-05', 'PayPal');

