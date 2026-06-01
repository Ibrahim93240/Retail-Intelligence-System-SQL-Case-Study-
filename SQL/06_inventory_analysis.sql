/*=========================================================
  INVENTORY ANALYSIS
=========================================================*/

USE ecommerce_analysis;

-- 1. Category-wise quantity sold
SELECT
    p.category,
    SUM(od.quantity) AS total_quantity_sold
FROM products p
JOIN orderdetails od
    ON p.product_id = od.product_id
GROUP BY p.category
ORDER BY total_quantity_sold DESC;

-- 2. Average basket size
SELECT
    ROUND(AVG(order_quantity), 2) AS average_items_per_order
FROM (
    SELECT
        order_id,
        SUM(quantity) AS order_quantity
    FROM orderdetails
    GROUP BY order_id
) x;

-- 3. Highest quantity order
SELECT
    od.order_id,
    SUM(od.quantity) AS total_items
FROM orderdetails od
GROUP BY od.order_id
ORDER BY total_items DESC
LIMIT 1;

-- 4. Complete details of highest quantity order
WITH highest_order AS (
    SELECT
        order_id,
        SUM(quantity) AS total_items
    FROM orderdetails
    GROUP BY order_id
    ORDER BY total_items DESC
    LIMIT 1
)
SELECT
    o.order_id,
    o.order_date,
    c.name AS customer_name,
    c.location,
    p.name AS product_name,
    od.quantity,
    od.price_per_unit
FROM highest_order h
JOIN orders o
    ON h.order_id = o.order_id
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN orderdetails od
    ON o.order_id = od.order_id
JOIN products p
    ON od.product_id = p.product_id;