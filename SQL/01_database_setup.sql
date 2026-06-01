/*=========================================================
  E-COMMERCE SQL ANALYSIS PROJECT
  DATABASE SETUP
=========================================================*/

CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;

/*=========================================================
  CUSTOMERS TABLE
=========================================================*/

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

/*=========================================================
  PRODUCTS TABLE
=========================================================*/

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(150),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

/*=========================================================
  ORDERS TABLE
=========================================================*/

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    total_amount DECIMAL(10,2)
);

/*=========================================================
  ORDERDETAILS TABLE
=========================================================*/

CREATE TABLE orderdetails (
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10,2)
);