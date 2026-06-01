# E-Commerce SQL Analysis

## Project Overview

This project analyzes customer behavior, product performance, sales trends, and inventory insights using SQL.

The analysis was performed on an E-Commerce dataset consisting of Customers, Products, Orders, and OrderDetails tables.

---

## Business Objectives

### Customer Insights
- Identify top customers
- Segment customers based on spending
- Analyze repeat customers
- Detect inactive customers

### Product Analysis
- Identify top-selling products
- Analyze product revenue contribution
- Perform category analysis

### Sales Optimization
- Analyze monthly sales trends
- Calculate running revenue
- Measure month-over-month growth

### Inventory Management
- Fast-moving products
- Slow-moving products
- ABC analysis

---

## Database Schema

Customers
→ Orders
→ OrderDetails
→ Products

---

## SQL Concepts Used

- Joins
- Aggregate Functions
- CASE Statements
- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- NTILE()
- LAG()

---

## Key Results

| KPI | Value |
|------|------:|
| Total Revenue | ₹19,783,000 |
| Total Orders | 200 |
| Total Customers | 100 |
| Average Order Value | ₹98,915 |
| Repeat Customers | 58 |
| Customers Without Orders | 16 |

---

## Project Structure

```text
E-Commerce Analysis
│
├── Dataset
├── SQL
├── Results
│   ├── Screenshots
│   └── findings.md
└── README.md
```
## Project Screenshots

### Task 7 - Top 10 Customers
![Top Customers](Results/Screenshots/task_07_top_customers.png)

### Task 9 - Top Products by Revenue
![Top Products](Results/Screenshots/task_09_top_products_revenue.png)

### Task 10 - Revenue by Category
![Revenue by Category](Results/Screenshots/task_10_revenue_by_category.png)

### Task 12 - Monthly Sales Trend
![Monthly Sales Trend](Results/Screenshots/task_12_monthly_sales_trend.png)

### Task 13 - Revenue by City
![Revenue by City](Results/Screenshots/task_13_revenue_by_city.png)

### Task 17 - Customer Segmentation
![Customer Segmentation](Results/Screenshots/task_17_customer_segmentation.png)
---

## Tools Used

- MySQL Workbench
- SQL
- Excel
- Git
- GitHub