/*=========================================================
  DATA VALIDATION QUERIES
=========================================================*/

-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total Products
SELECT COUNT(*) AS total_products
FROM products;

-- Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total Order Details
SELECT COUNT(*) AS total_orderdetails
FROM orderdetails;

-- Preview Customers
SELECT *
FROM customers
LIMIT 5;

-- Preview Products
SELECT *
FROM products
LIMIT 5;

-- Preview Orders
SELECT *
FROM orders
LIMIT 5;

-- Preview Order Details
SELECT *
FROM orderdetails
LIMIT 5;