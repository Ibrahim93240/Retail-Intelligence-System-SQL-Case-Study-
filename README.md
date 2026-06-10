## 📊 Project Overview

This project is a SQL-based Retail Intelligence Case Study designed to analyze e-commerce data and extract meaningful business insights.
It focuses on understanding customer behavior, product performance, sales trends, and inventory optimization to support data-driven business decisions.

## 🧠 Business Problem

-E-commerce businesses often struggle with:

  - Identifying high-value customers
  - Understanding product demand patterns
  - Tracking revenue performance
  - Optimizing inventory and sales strategy

# This project solves these challenges using structured SQL analysis.

## 🎯 Business Objectives
- 👥 Customer Insights
  - Identify top customers
  - Segment customers based on spending behavior
  - Analyze repeat customers
  - Detect inactive customers

- 📦 Product Analysis
  - Identify top-selling products
  - Analyze revenue contribution by product
  - Perform category-wise analysis

- 📈 Sales Optimization
  - Analyze monthly sales trends
  - Calculate revenue growth patterns
  - Identify peak and low-performing months

- 📊 Inventory Management
  - Identify fast-moving products
  - Identify slow-moving products
  - Perform ABC analysis

- 🗄️ Database Schema
  - Customers → Orders → OrderDetails → Products

# This relational structure enables end-to-end analysis from customer behavior to product performance.

## 🛠️ Tools & Technologies
  - MySQL Workbench
  - SQL
  - Excel (for validation and checking results)
  - Git & GitHub

- 🧠 SQL Concepts Used
  - Joins (INNER, LEFT)
  - Aggregate Functions (SUM, COUNT, AVG)
  - CASE Statements
    - Common Table Expressions (CTEs)
    - Window Functions:
    - RANK()
    - DENSE_RANK()
    - ROW_NUMBER()
    - NTILE()
    - LAG()

- 📊 Key Business Insights
- 💰 Total Revenue: ₹19,783,000
- 📦 Total Orders: 200
- 👥 Total Customers: 100
- 📊 Average Order Value: ₹98,915
- 🔁 Repeat Customers: 58
- ⚠️ Customers Without Orders: 16
- 🔍 Detailed Insights
- 👥 Customer Insights
- Top customer: Romil Bora (₹889,000)
- Repeat customers: 58
- High-value customers: 9
- Medium-value customers: 31
- Low-value customers: 44
- Customers with no orders: 16

## 👉 Insight: A small group of customers contributes a large portion of revenue.

- 📦 Product Insights
  - Highest quantity sold: Digital SLR Camera (151 units)
  - Highest revenue product: Laptop 15" Pro (₹7,560,000)

- Top category: Electronics (₹12,758,000)

## 👉 Insight: Electronics dominate revenue generation.

- 📈 Sales Insights
  - Best month: September 2023 (₹2,927,000)
  - Lowest month: February 2024 (₹396,000)
  - Average Order Value: ₹98,915

## 👉 Insight: Sales show strong seasonal variation.

- 🌍 Location Insights
  - Highest revenue city: Chennai (₹3,890,000)
  - Lowest revenue city: Mumbai (₹1,164,000)

## 👉 Insight: Revenue distribution varies significantly by region.

- 📊 Advanced Analytics
  - Top 2 products contribute 68.74% of total revenue
  - ABC analysis shows Pareto distribution (80/20 rule)
  - Product pair analysis identifies cross-selling opportunities
  - Customer segmentation reveals clear value tiers

## 💡 Business Impact

- This project helps businesses to:

  - Improve customer targeting strategies
  - Optimize inventory planning
  - Identify high-revenue products and regions
  - Increase marketing efficiency
  - Support data-driven decision making

## 📁 Project Structure
E-Commerce SQL Analysis
│
├── Dataset/
├── SQL/
│   ├── customer_analysis.sql
│   ├── product_analysis.sql
│   ├── sales_analysis.sql
│
├── Results/
│   ├── Screenshots/
│   └── findings.md
│
└── README.md

## 🚀 Future Improvements
- Add predictive sales forecasting
- Automate reporting using dashboards
- Integrate Python for advanced analytics
- Build customer lifetime value model

## 📌 Final Note
This project demonstrates how SQL can be used not just for querying data, but for solving real-world business problems through structured analytical thinking.
