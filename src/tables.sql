
Create Table TaxRate (
taxRate_ID SMALLINT PRIMARY KEY,
district nvarchar(85) NOT NULL,
taxRate2 decimal(3,2) NOT NULL
)
CREATE TABLE Bills (
billNumber int IDENTITY (1,1) NOT NULL PRIMARY KEY,
taxRate_ID SMALLINT,
billDate smalldatetime DEFAULT GETDATE() NOT NULL,
totalPaymentAmount decimal(10,2) NOT NULL,
ID_Number varchar(11) NOT NULL, 

CONSTRAINT fk_tax_rate_ID FOREIGN KEY (taxRate_ID) REFERENCES TaxRate (taxRate_ID)
)

CREATE TABLE Shipping (
shipping_ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
address nvarchar(255) NOT NULL,
shippingMethod varchar(25) NOT NULL,
shipperCompany Varchar(50) NOT NULL,
shipDate smalldatetime NOT NULL
)

CREATE TABLE Suppliers (
supplier_ID smallint IDENTITY (1,1) NOT NULL PRIMARY KEY,
companyName nvarchar(100) NOT NULL,
cAdress nvarchar(255) NOT NULL,
country nvarchar(56) NOT NULL,
city nvarchar(178) NOT NULL,
cEmail varchar(100) NOT NULL,
phone varchar(20) NOT NULL
)

CREATE TABLE Coupons (
couponCode smallint NOT NULL PRIMARY KEY,
expDate smallDatetime NOT NULL,
startDate smallDatetime NOT NULL,
couponAmount decimal(5,2),
discount_percent tinyint
)


CREATE TABLE Customers (
Customer_ID int IDENTITY (1,1) NOT NULL PRIMARY KEY,
addreses nvarchar(255),
wishlist text,
firstName varchar(50) NOT NULL,
lastName varchar(50) NOT NULL,
phoneNumber varchar(20) UNIQUE,
email varchar(100) NOT NULL UNIQUE,
NumberOfID varchar(11) UNIQUE,
dateOfBirth date,
gender char(1),
couponCode smallint FOREIGN KEY REFERENCES Coupons (couponCode),
CONSTRAINT ck_gender CHECK (gender in ('m','f'))
)

CREATE TABLE Categories (
category_ID smallint IDENTITY(1,1) NOT NULL PRIMARY KEY,
categoryName varchar(30) NOT NULL,
description text,
cPicture varbinary(max)
)

CREATE TABLE Returns (
return_ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
customer_ID int FOREIGN KEY REFERENCES customers (customer_ID),
returnDate smalldatetime DEFAULT GETDATE() NOT NULL,
returnStatus varchar(50) NOT NULL,
qtyReturned tinyint NOT NULL,
returnCondition varchar(100)
)

CREATE TABLE Products (
product_ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
category_ID smallint FOREIGN KEY REFERENCES categories (category_ID),
supplier_ID smallint FOREIGN KEY REFERENCES suppliers (supplier_ID),
productName varchar(50) NOT NULL,
price decimal(10,2) NOT NULL,
picture varbinary(max),
color varchar(20),
stockQty smallint NOT NULL,
description varchar(255)
)

CREATE TABLE Orders (
order_ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
customer_ID int FOREIGN KEY REFERENCES customers (customer_ID),
orderDate smalldatetime DEFAULT GETDATE() NOT NULL,
adress nvarchar(255) NOT NULL,
shipping_ID int FOREIGN KEY REFERENCES shipping (shipping_ID),
product_ID int FOREIGN KEY REFERENCES products (product_ID),
orderStatus varchar(50) NOT NULL,
completeDate smalldatetime,
lineTotal decimal(10,2) NOT NULL
)

CREATE TABLE payments (
payment_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
order_ID int FOREIGN KEY REFERENCES orders(order_ID),
couponsUsed smallint FOREIGN KEY REFERENCES coupons(couponCode),
paymentStatus varchar(50) NOT NULL,
paymentDate datetime2 DEFAULT GETDATE() NOT NULL,
paymentType varchar(50) NOT NULL
)
