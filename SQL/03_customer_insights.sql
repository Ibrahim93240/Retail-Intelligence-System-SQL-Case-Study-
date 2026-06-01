/*=========================================================
  CUSTOMER INSIGHTS
=========================================================*/

USE ecommerce_analysis;

-- 1. Top 10 customers by total spending
SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 10;

-- 2. Top customers by number of orders
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_orders DESC;

-- 3. Customer segmentation
SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent,
    CASE
        WHEN SUM(o.total_amount) >= 500000 THEN 'High Value'
        WHEN SUM(o.total_amount) >= 200000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

-- 4. Count customers by segment
SELECT
    customer_segment,
    COUNT(*) AS total_customers
FROM (
    SELECT
        c.customer_id,
        CASE
            WHEN SUM(o.total_amount) >= 500000 THEN 'High Value'
            WHEN SUM(o.total_amount) >= 200000 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
) x
GROUP BY customer_segment;

-- 5. Customers who never ordered
SELECT
    c.customer_id,
    c.name,
    c.location
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 6. Top customer in each city
WITH customer_sales AS (
    SELECT
        c.location,
        c.customer_id,
        c.name,
        SUM(o.total_amount) AS total_spent,
        ROW_NUMBER() OVER (
            PARTITION BY c.location
            ORDER BY SUM(o.total_amount) DESC
        ) AS rn
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.location, c.customer_id, c.name
)
SELECT
    location,
    customer_id,
    name,
    total_spent
FROM customer_sales
WHERE rn = 1
ORDER BY total_spent DESC;