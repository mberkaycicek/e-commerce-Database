-- Names and last names of male customers--
SELECT FirstName, LastName FROM Customers WHERE gender='m'

-- Names and last names of male customers ordered by last name in descending order--
SELECT  FirstName, LastName FROM Customers WHERE gender='m' ORDER BY LastName DESC

-- Addresses of orders shipped with the "Land Shipping" method after a specific date, ordered by shipping ID in ascending order--
SELECT address FROM Shipping WHERE shippingMethod='Land Shipping' AND shipDate>= '01-01-2024'
ORDER BY shipping_ID ASC

-- Unique order status values in the ORDERS table, ordered alphabetically--
SELECT DISTINCT OrderStatus FROM ORDERS 
ORDER BY OrderStatus

-- Unique LineTotal values for orders with a status of "Delivered" in the ORDERS table--
SELECT DISTINCT LineTotal
FROM ORDERS WHERE
orderStatus='Delivered' 

-- Order_ID, orderDate, and address of orders on '2024-01-17' for the bottom 50 percent--
SELECT TOP 50 PERCENT Order_ID, orderDate, adress FROM Orders WHERE orderDate='2024-01-17' ORDER BY Order_ID ASC

-- Name and price of products with stock quantity between 75 and 150, ordered by price--
SELECT productName, price FROM Products 
WHERE stockQty>75 AND stockQty<150 ORDER BY price ASC

-- Address, shipper company, and ship date of shipments with "Land Shipping" or "Sea Freight" methods--
SELECT address, shipperCompany, shipDate FROM Shipping
WHERE (shippingMethod='Land Shipping' OR shippingMethod='Sea Freight') ORDER BY shipping_ID ASC

-- Address, shipper company, and ship date of shipments between '2023-01-01' and '2024-01-01'--
SELECT address, shipperCompany, shipDate FROM Shipping
WHERE shipDate BETWEEN '2023-01-01' AND '2024-01-01'

-- Names and last names of male customers--
SELECT FirstName, LastName FROM Customers WHERE gender='m'

-- Names and last names of male customers ordered by last name in descending order--
SELECT  FirstName, LastName FROM Customers WHERE gender='m' ORDER BY LastName DESC

-- Addresses of orders shipped with the "Land Shipping" method after a specific date, ordered by shipping ID in ascending order--
SELECT address FROM Shipping WHERE shippingMethod='Land Shipping' AND shipDate>= '01-01-2024'
ORDER BY shipping_ID ASC

-- Unique order status values in the ORDERS table, ordered alphabetically--
SELECT DISTINCT OrderStatus FROM ORDERS 
ORDER BY OrderStatus

-- Unique LineTotal values for orders with a status of "Delivered" in the ORDERS table--
SELECT DISTINCT LineTotal
FROM ORDERS WHERE
orderStatus='Delivered' 

-- Order_ID, orderDate, and address of orders on '2024-01-17' for the bottom 50 percent--
SELECT TOP 50 PERCENT Order_ID, orderDate, adress FROM Orders WHERE orderDate='2024-01-17' ORDER BY Order_ID ASC

-- Name and price of products with stock quantity between 75 and 150, ordered by price--
SELECT productName, price FROM Products 
WHERE stockQty>75 AND stockQty<150 ORDER BY price ASC

-- Address, shipper company, and ship date of shipments with "Land Shipping" or "Sea Freight" methods--
SELECT address, shipperCompany, shipDate FROM Shipping
WHERE (shippingMethod='Land Shipping' OR shippingMethod='Sea Freight') ORDER BY shipping_ID ASC

-- Address, shipper company, and ship date of shipments between '2023-01-01' and '2024-01-01'--
SELECT address, shipperCompany, shipDate FROM Shipping
WHERE shipDate BETWEEN '2023-01-01' AND '2024-01-01'

-- Name, last name, and date of birth of male customers with a name containing the letter "a," ordered by date of birth--
SELECT FirstName, LastName, dateOfBirth FROM Customers
WHERE firstName LIKE '%a%' AND gender='m'
ORDER BY dateOfBirth ASC

-- Get payment details for pending "Paypal" or "Cash" payments, ordered by order ID in descending order-
SELECT paymentType,order_ID, paymentDate FROM payments
WHERE paymentType IN ('Paypal', 'Cash') AND paymentStatus='Pending'
ORDER BY order_ID DESC

-- Get return details for products with quantities 1 or 3 and a 'defective' condition--
SELECT returnCondition, returnStatus, returnDate, return_ID FROM Returns 
WHERE qtyReturned IN (1,3) AND returnCondition='defective'

-- Average price of products--
SELECT AVG(price) AS avgPrice
FROM Products 

-- Maximum stock quantity of products--
SELECT MAX(stockQty) AS stockQty_Max
FROM Products 

-- Total payment amount of bills--
SELECT SUM(TotalPaymentAmount) AS Total_Payment_Amount
FROM Bills

-- Number of products with a stock quantity less than or equal to 50--
SELECT COUNT(*) AS Low_Stock
FROM Products WHERE stockQty<=50

-- District, tax rate, and total payment amount for tax rates with total payment amounts exceeding 1000--
SELECT
    TR.district,
    TR.taxRate2,
    SUM(B.totalPaymentAmount) AS totalPayment
FROM
    TaxRate TR
JOIN
    Bills B ON TR.taxRate_ID = B.taxRate_ID
GROUP BY
    TR.district, TR.taxRate2
HAVING
    SUM(B.totalPaymentAmount) > 1000;

    SELECT gender, COUNT(*) AS couponCodeamount
    FROM Customers 
    GROUP BY gender

-- Number of customers by gender--
SELECT SUM(Price) AS total_price
FROM Products
WHERE price BETWEEN 10 AND 250
GROUP BY supplier_ID

-- Total price of products with prices between 10 and 250, grouped by supplier ID--
SELECT TOP 3 productName, MAX(stockQty) AS Max_stock_Qty 
FROM Products
GROUP BY productName
ORDER BY MAX(StockQty) ASC

--Top three products with the highest stock quantity, grouped by product name, and maximum stock quantity--
SELECT TOP 3 supplier_ID,
MAX(price) AS max_price,
MIN(StockQty) AS min_stockQty
FROM Products 
GROUP BY supplier_ID HAVING MIN(price)>=18
ORDER BY MIN(stockQty) ASC

-- Retrieve bill details with total payment amount and district information--
SELECT BillNumber, totalPaymentAmount, district 
FROM Bills
INNER JOIN TaxRate
ON Bills.taxRate_ID=TaxRate.taxRate_ID

-- Retrieve customer details with coupon amount and discount percent information--
SELECT Customer_ID, couponAmount, discount_percent
FROM Coupons
INNER JOIN Customers
ON Coupons.couponCode=Customers.couponCode

-- Get average product prices per supplier--
SELECT Suppliers.supplier_ID, Products.product_ID, AVG(Products.price) AS avg_price
FROM Suppliers
INNER JOIN Products ON Suppliers.supplier_ID = Products.supplier_ID
GROUP BY Suppliers.supplier_ID, Products.product_ID;

-- Retrieve customer ID, payment ID, and line total for orders, ordered by line total in ascending order
SELECT customer_ID, payment_ID,lineTotal
FROM Orders
INNER JOIN payments
ON Orders.order_ID=payments.order_ID
ORDER BY lineTotal ASC

-- Get customer names with the maximum quantity returned for each customer--
SELECT Customers.firstName, Customers.lastName, MAX(Returns.qtyReturned) AS max_qtyReturned
FROM Customers
INNER JOIN RETURNS
ON customers.customer_ID=Returns.customer_ID
GROUP BY Customers.firstName, Customers.lastName;

-- Get customer names with the maximum quantity returned, ensuring it matches the overall maximum quantity returned--
SELECT Customers.firstName, Customers.lastName, MAX(Returns.qtyReturned) AS max_qtyReturned
FROM Customers
INNER JOIN Returns 
ON Customers.customer_ID = Returns.customer_ID
GROUP BY Customers.customer_ID, Customers.firstName, Customers.lastName
HAVING MAX(Returns.qtyReturned) = (SELECT MAX(qtyReturned) FROM Returns);

-- Customers names and their total spending--
SELECT c.firstName, c.lastName, SUM(o.lineTotal) AS totalSpent
FROM Customers c
INNER JOIN Orders o ON c.customer_ID = o.customer_ID
GROUP BY c.firstName, c.lastName;

-- List of customers who made returns--
SELECT c.firstName, c.lastName
FROM Customers c
WHERE EXISTS (
SELECT 1
FROM Returns r
WHERE r.customer_ID = c.customer_ID);

   -- List of products in two different categories--
SELECT productName, 'Electronics' AS category FROM Products WHERE category_ID = 1
UNION
SELECT productName, 'Clothing' AS category FROM Products WHERE category_ID = 2;


-- Customer names and details of their purchases--
SELECT c.firstName, c.lastName, o.orderDate, p.productName, o.lineTotal
FROM Customers c
INNER JOIN Orders o ON c.customer_ID = o.customer_ID
INNER JOIN Products p ON o.product_ID = p.product_ID;

-- Customer names, details of their purchases, and customers who haven't made purchases yet--
SELECT c.firstName, c.lastName, o.orderDate, p.productName, o.lineTotal
FROM Customers c
LEFT JOIN Orders o ON c.customer_ID = o.customer_ID
LEFT JOIN Products p ON o.product_ID = p.product_ID;

-- Customers who made purchases and details of their transactions, including those without customers--
SELECT c.firstName, c.lastName, o.orderDate, p.productName, o.lineTotal
FROM Customers c
RIGHT JOIN Orders o ON c.customer_ID = o.customer_ID
RIGHT JOIN Products p ON o.product_ID = p.product_ID;


-- All customers and details of their transactions, including those without customers--
SELECT c.firstName, c.lastName, o.orderDate, p.productName, o.lineTotal
FROM Customers c
FULL JOIN Orders o ON c.customer_ID = o.customer_ID
FULL JOIN Products p ON o.product_ID = p.product_ID;

-- Total spending for each customer--
SELECT c.firstName, c.lastName, SUM(o.lineTotal) AS totalSpent
FROM Customers c
LEFT JOIN Orders o ON c.customer_ID = o.customer_ID
GROUP BY c.firstName, c.lastName

-- Customers' names, details of their purchases, and payment information--
SELECT c.firstName, c.lastName, o.orderDate, p.productName, pm.paymentStatus, pm.paymentDate, pm.paymentType
FROM Customers c
INNER JOIN Orders o ON c.customer_ID = o.customer_ID
INNER JOIN Payments pm ON o.order_ID = pm.order_ID
INNER JOIN Products p ON o.product_ID = p.product_ID;

