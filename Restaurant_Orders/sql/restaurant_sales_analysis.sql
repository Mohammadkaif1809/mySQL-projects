SELECT * FROM menu_items;
SELECT * FROM order_details;

-- Now the restaurant owner wants to know the data like 

-- 1. Most,least sold item in the New Menu 
-- 2. Items sold items in the time intervals 11:00:00 to 15:00:00, 15:00:01 to 19:00:00 and 19:00:01 to 23:00:00
-- 3. most,least sold item in above time intervals
-- 4. category wise sold items
-- 5. Most,Least Sold category 
-- 6. TOTAL orders in one day


-- 1
-- Most sold items 

SELECT mi.item_name,
       mi.category,
       COUNT(od.order_details_id) AS 'soldCount'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
GROUP BY mi.item_name, mi.category
ORDER BY soldCount DESC;


-- Least sold items

SELECT mi.item_name,
       COUNT(od.order_details_id) AS 'soldCount'
FROM menu_items mi
LEFT JOIN order_details od 
    ON mi.menu_item_id = od.item_id
GROUP BY mi.item_name
ORDER BY soldCount ASC;


-- 2
-- Sold items in the time interval 11:00:00 to 15:00:00

SELECT mi.item_name,
       COUNT(*) AS 'soldCount'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE od.order_time BETWEEN '11:00:00' AND '15:00:00'
GROUP BY mi.item_name 
ORDER BY soldCount DESC;


-- Sold items in the time interval 15:00:01 to 19:00:00

SELECT mi.item_name,
       COUNT(*) AS 'soldCount'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE od.order_time BETWEEN '15:00:01' AND '19:00:00'
GROUP BY mi.item_name 
ORDER BY soldCount DESC;


-- Sold items in the time interval 19:00:01 to 23:00:00

SELECT mi.item_name,
       COUNT(*) AS 'soldCount'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE od.order_time BETWEEN '19:00:01' AND '23:00:00'
GROUP BY mi.item_name 
ORDER BY soldCount DESC;


-- 3
-- MOST sold items in the time interval 11:00:00 to 15:00:00

SELECT mi.item_name,
       COUNT(*) AS 'soldCount'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE od.order_time BETWEEN '11:00:00' AND '15:00:00'
GROUP BY mi.item_name 
ORDER BY soldCount DESC
LIMIT 1;


-- LEAST sold items in the time interval 11:00:00 to 15:00:00

SELECT mi.item_name,
       COUNT(*) AS 'soldCount'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE od.order_time BETWEEN '11:00:00' AND '15:00:00'
GROUP BY mi.item_name 
ORDER BY soldCount ASC
LIMIT 1;


-- MOST sold items in the time interval 15:00:01 to 19:00:00

SELECT mi.item_name,
       COUNT(*) AS 'soldCount'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE od.order_time BETWEEN '15:00:01' AND '19:00:00'
GROUP BY mi.item_name 
ORDER BY soldCount DESC
LIMIT 1;


-- LEAST sold items in the time interval 15:00:01 to 19:00:00

SELECT mi.item_name,
       COUNT(*) AS 'soldCount'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE od.order_time BETWEEN '15:00:01' AND '19:00:00'
GROUP BY mi.item_name 
ORDER BY soldCount ASC
LIMIT 1;


-- MOST sold items in the time interval 19:00:01 to 23:00:00

SELECT mi.item_name,
       COUNT(*) AS 'soldCount'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE od.order_time BETWEEN '19:00:01' AND '23:00:00'
GROUP BY mi.item_name 
ORDER BY soldCount DESC
LIMIT 1;


-- LEAST sold items in the time interval 19:00:01 to 23:00:00

SELECT mi.item_name,
       COUNT(*) AS 'soldCount'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE od.order_time BETWEEN '19:00:01' AND '23:00:00'
GROUP BY mi.item_name 
ORDER BY soldCount ASC
LIMIT 1;


-- 4
-- CATEGORY WISE sold items

SELECT mi.category,
       COUNT(*) AS 'sold'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
GROUP BY mi.category;


-- 5
-- Most,Least Sold category

-- MOST

SELECT mi.category,
       COUNT(*) AS 'sold'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
GROUP BY mi.category 
ORDER BY sold DESC
LIMIT 1;


-- LEAST 

SELECT mi.category,
       COUNT(*) AS 'sold'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
GROUP BY mi.category 
ORDER BY sold ASC
LIMIT 1;


-- What were the top 5 orders that spend most money

SELECT order_id,
       SUM(price) AS 'total_price'
FROM menu_items mi
JOIN order_details od 
    ON mi.menu_item_id = od.item_id
GROUP BY order_id
ORDER BY total_price DESC
LIMIT 5;


-- View details of expensive item in menu

SELECT * 
FROM menu_items mi
LEFT JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE price = (
    SELECT MAX(price) 
    FROM menu_items
);


-- View details of highest spent order for a particular id

SELECT category,
       COUNT(item_id) AS 'numOfItems'
FROM menu_items mi
LEFT JOIN order_details od 
    ON mi.menu_item_id = od.item_id
WHERE order_id = '5365'
GROUP BY category;


-- Exploring menu tables

-- How many Asian dishes are there in menu

SELECT item_name AS 'Asian Dishes'
FROM menu_items
WHERE category = 'Asian';


-- How many Mexican dishes are there in menu

SELECT item_name AS 'Mexican Dishes'
FROM menu_items
WHERE category = 'Mexican';


-- How many Italian dishes are there in menu

SELECT item_name AS 'Italian Dishes'
FROM menu_items
WHERE category = 'Italian';


-- Least expensive item

SELECT item_name,
       price 
FROM menu_items
WHERE price = (
    SELECT MIN(price) 
    FROM menu_items
);


-- Most expensive item

SELECT item_name,
       price
FROM menu_items
WHERE price = (
    SELECT MAX(price) 
    FROM menu_items
);


-- How many dishes in each category

SELECT category,
       GROUP_CONCAT(item_name SEPARATOR ',') AS items
FROM menu_items
GROUP BY category;


-- Average dish price in each category

SELECT category,
       AVG(price) AS 'AvgDishPrice'
FROM menu_items
GROUP BY category;


-- Exploring orders table

-- Total orders

SELECT COUNT(DISTINCT order_id) AS 'TotalOrders'
FROM order_details;


-- How many total people/IDs

SELECT COUNT(DISTINCT order_id) AS "OrdersToday"
FROM order_details;


-- Orders on 2023-01-01

SELECT COUNT(DISTINCT order_id) AS "OrdersToday"
FROM order_details
WHERE order_date = '2023-01-01';


-- How many people ordered on 2023-01-01

SELECT COUNT(DISTINCT order_id) AS "OrdersToday"
FROM order_details
WHERE order_date = '2023-01-01';


-- How many orders have been placed by a single person/ID

SELECT order_id AS 'personId',
       COUNT(order_id) AS 'orders'
FROM order_details
GROUP BY order_id;


-- Order with most number of items

SELECT order_id AS 'personId',
       COUNT(item_id) AS 'orders'
FROM order_details
GROUP BY order_id
ORDER BY orders DESC;


-- How many orders have more than 12 orders

SELECT COUNT(*)
FROM (
    SELECT order_id,
           COUNT(item_id) AS 'orders'
    FROM order_details
    GROUP BY order_id
    HAVING orders >= 12
) AS TotalOrders;




