/*=========================================================
  ADVANCED SQL ANALYSIS
=========================================================*/

USE ecommerce_analysis;

-- 1. Rank customers by total spending
SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent,
    RANK() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS customer_rank
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- 2. Compare RANK, DENSE_RANK and ROW_NUMBER
SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent,

    RANK() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS rank_no,

    DENSE_RANK() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS dense_rank_no,

    ROW_NUMBER() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS row_no

FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

-- 3. Products bought together / Market Basket Analysis
SELECT
    p1.name AS product_1,
    p2.name AS product_2,
    COUNT(*) AS times_bought_together
FROM orderdetails od1
JOIN orderdetails od2
    ON od1.order_id = od2.order_id
    AND od1.product_id < od2.product_id
JOIN products p1
    ON od1.product_id = p1.product_id
JOIN products p2
    ON od2.product_id = p2.product_id
GROUP BY p1.name, p2.name
ORDER BY times_bought_together DESC
LIMIT 10;

-- 4. ABC analysis by product revenue
WITH product_revenue AS (
    SELECT
        p.product_id,
        p.name,
        SUM(od.quantity * od.price_per_unit) AS revenue
    FROM products p
    JOIN orderdetails od
        ON p.product_id = od.product_id
    GROUP BY p.product_id, p.name
),
abc AS (
    SELECT
        product_id,
        name,
        revenue,
        ROUND(revenue * 100.0 / SUM(revenue) OVER(), 2) AS revenue_percent,
        ROUND(
            SUM(revenue) OVER (ORDER BY revenue DESC) * 100.0 / SUM(revenue) OVER(),
            2
        ) AS cumulative_percent
    FROM product_revenue
)
SELECT
    product_id,
    name,
    revenue,
    revenue_percent,
    cumulative_percent,
    CASE
        WHEN cumulative_percent <= 80 THEN 'A'
        WHEN cumulative_percent <= 95 THEN 'B'
        ELSE 'C'
    END AS abc_category
FROM abc
ORDER BY revenue DESC;

-- 5. Top 20 percent customers revenue contribution
WITH customer_sales AS (
    SELECT
        c.customer_id,
        c.name,
        SUM(o.total_amount) AS total_spent
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.name
),
ranked_customers AS (
    SELECT
        *,
        NTILE(5) OVER (ORDER BY total_spent DESC) AS customer_group
    FROM customer_sales
)
SELECT
    CASE
        WHEN customer_group = 1 THEN 'Top 20%'
        ELSE 'Other 80%'
    END AS customer_group,
    SUM(total_spent) AS revenue,
    ROUND(SUM(total_spent) * 100.0 / SUM(SUM(total_spent)) OVER(), 2) AS revenue_percent
FROM ranked_customers
GROUP BY
    CASE
        WHEN customer_group = 1 THEN 'Top 20%'
        ELSE 'Other 80%'
    END;

-- 6. Monthly category sales
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    p.category,
    SUM(od.quantity * od.price_per_unit) AS revenue
FROM orders o
JOIN orderdetails od
    ON o.order_id = od.order_id
JOIN products p
    ON od.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m'), p.category
ORDER BY month, revenue DESC;

-- 7. Best category each month
WITH monthly_category_sales AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        p.category,
        SUM(od.quantity * od.price_per_unit) AS revenue,
        RANK() OVER (
            PARTITION BY DATE_FORMAT(o.order_date, '%Y-%m')
            ORDER BY SUM(od.quantity * od.price_per_unit) DESC
        ) AS category_rank
    FROM orders o
    JOIN orderdetails od
        ON o.order_id = od.order_id
    JOIN products p
        ON od.product_id = p.product_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m'), p.category
)
SELECT
    month,
    category,
    revenue
FROM monthly_category_sales
WHERE category_rank = 1
ORDER BY month;

-- 8. Final executive summary KPIs
SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT ROUND(SUM(total_amount),2) FROM orders) AS total_sales,
    (SELECT ROUND(AVG(total_amount),2) FROM orders) AS average_order_value,
    (SELECT COUNT(*) FROM products) AS total_products;