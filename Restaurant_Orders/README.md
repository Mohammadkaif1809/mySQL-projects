# Restaurant Orders SQL Analysis

## Overview

This project analyzes restaurant menu and order data using MySQL.

The analysis focuses on menu item sales, order patterns, sales during different time periods, and category-wise performance.

## Dataset

The project contains the following data:

- `menu_items.csv` - Contains menu item details such as item name, category, and price.
- `order_details.csv` - Contains order details such as order ID, order date, order time, and item ID.

## SQL Files

- `create_restaurant_db.sql` - Creates the restaurant database and tables.
- `restaurant_sales_analysis.sql` - Contains SQL queries used for analysis.

## Analysis Performed

- Most sold menu items
- Least sold menu items
- Items sold during different time intervals
- Most and least sold items in each time interval
- Category-wise sold items
- Most sold category
- Least sold category
- Top 5 highest-spending orders
- Most expensive menu item
- Least expensive menu item
- Dishes available in each category
- Average dish price by category
- Total number of orders
- Orders placed on a specific date
- Orders with the highest number of items
- Orders containing 12 or more items

## Time Intervals

The sales were analyzed across three time periods:

- 11:00:00 to 15:00:00
- 15:00:01 to 19:00:00
- 19:00:01 to 23:00:00

## SQL Concepts Used

- SELECT
- WHERE
- JOIN
- LEFT JOIN
- GROUP BY
- ORDER BY
- COUNT()
- COUNT(DISTINCT)
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP_CONCAT()
- HAVING
- Subqueries
- LIMIT

## Tools Used

- MySQL
- MySQL Workbench
- GitHub

## How to Run

1. Open MySQL Workbench.
2. Run `create_restaurant_db.sql` to create the database and tables.
3. Open `restaurant_sales_analysis.sql`.
4. Run the queries to perform the analysis.

## Project Structure

```text
Restaurant_Orders/
│
├── data/
│   ├── menu_items.csv
│   ├── order_details.csv
│
│
├── sql/
│   ├── create_restaurant_db.sql
│   └── restaurant_sales_analysis.sql
│
└── README.md
