# Sakila SQL Data Analytics

A collection of SQL queries performing data analysis on the **Sakila Sample Database** using MySQL. This project covers key business metrics including daily rental volume, store-level revenue, customer activity, and inventory performance.

## 📌 Project Overview

The goal of this analysis is to answer key business questions regarding rental trends, inventory optimization, and sales performance:

* **Sales & Revenue:** Identifying top-earning days and tracking daily revenue for specific store locations.
* **Inventory Management:** Flagging unreturned rentals and identifying low-performing films (fewer than 5 lifetime rentals) for potential discontinuation.
* **Customer Insights:** Analyzing active customer counts and identifying top-performing customers by total rentals.

## 🛠️ Key SQL Techniques Used

* **Aggregations & Grouping:** `SUM()`, `COUNT()`, `COUNT(DISTINCT)`, `GROUP BY`, `HAVING`
* **Table Joins:** `INNER JOIN`, `LEFT JOIN` (to capture zero-rental items correctly)
* **Filtering & String Functions:** `LIKE`, `FIND_IN_SET()`, `CONCAT()`
* **Date Manipulation:** `DATE()`, sorting by chronological and peak volume periods

## 🚀 How to Run

1. Download and import the official MySQL Sakila database script:
   ```sql
   SOURCE path/to/sakila-schema.sql;
   SOURCE path/to/sakila-data.sql;
