/*=========================================================
  SALES OPTIMIZATION
=========================================================*/

USE ecommerce_analysis;

-- 1. Total sales
SELECT 
    SUM(total_amount) AS total_sales
FROM orders;

-- 2. Total number of orders
SELECT 
    COUNT(*) AS total_orders
FROM orders;

-- 3. Average order value
SELECT
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders;

-- 4. Monthly sales trend
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- 5. Running monthly sales total
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_sales,
    SUM(SUM(total_amount)) OVER (
        ORDER BY DATE_FORMAT(order_date, '%Y-%m')
    ) AS running_total
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- 6. Month-over-month sales change
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(total_amount) AS sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    month,
    sales,
    sales - LAG(sales) OVER (ORDER BY month) AS sales_change
FROM monthly_sales;

-- 7. Revenue by customer location
SELECT
    c.location,
    ROUND(SUM(o.total_amount),2) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.location
ORDER BY revenue DESC;

-- 8. Revenue percentage by city
WITH city_sales AS (
    SELECT
        c.location,
        SUM(o.total_amount) AS revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.location
)
SELECT
    location,
    revenue,
    ROUND(revenue * 100.0 / SUM(revenue) OVER(), 2) AS revenue_percent
FROM city_sales
ORDER BY revenue DESC;

-- 9. Highest value single order
SELECT
    o.order_id,
    o.order_date,
    c.name,
    c.location,
    o.total_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.total_amount DESC
LIMIT 1;