-- All films with PG-13 rating with rental rate of 2.99 or lower
SELECT film_id, title, rating, rental_rate
FROM film
WHERE rating = 'PG-13' AND rental_rate <= 2.99;

-- All films that have Deleted Scenes (Fixed: handles SET columns properly)
SELECT film_id, title, rating, special_features
FROM film
WHERE FIND_IN_SET('Deleted Scenes', special_features) > 0;

-- ALL films that have Deleted Scenes and starts with 'c'
SELECT film_id, title, rating, special_features
FROM film
WHERE FIND_IN_SET('Deleted Scenes', special_features) > 0 
  AND title LIKE 'c%';

-- All Active Customers
SELECT * 
FROM customer
WHERE active = 1;

-- How many active Customers are there
SELECT COUNT(*) AS active_customers 
FROM customer 
WHERE active = 1;

-- Customers who rented a Movie on 2005-07-26
SELECT CONCAT(c.first_name, ' ', c.last_name) AS CustomerName, r.rental_date
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
WHERE DATE(r.rental_date) = '2005-07-26';

-- Distinct names of Customers who rented on 2005-07-26
SELECT DISTINCT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS CustomerName
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
WHERE DATE(r.rental_date) = '2005-07-26';

-- Distinct last names
SELECT DISTINCT last_name
FROM customer;

-- How many Rentals we do on each day
SELECT DATE(rental_date) AS Datee, COUNT(*) AS RentalsPerDay
FROM rental
GROUP BY DATE(rental_date);

-- Busiest day so far
SELECT DATE(rental_date) AS Datee, COUNT(*) AS RentalsPerDay
FROM rental
GROUP BY DATE(rental_date)
ORDER BY RentalsPerDay DESC
LIMIT 1;

-- Listing all Sci-Fi Movies in our catalogue
SELECT fc.film_id, fc.category_id, c.name, f.title, f.release_year 
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
WHERE c.name = 'Sci-Fi';

-- Customers and how many movies they rented from us till now
SELECT r.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS FullName, COUNT(r.rental_id) AS rentedMovies 
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id 
GROUP BY r.customer_id, FullName
ORDER BY rentedMovies DESC;

-- Which movies should we discontinue from (Less than 5 lifetime rentals)
SELECT f.film_id, f.title, COUNT(r.rental_id) AS NumOfRentals
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
HAVING NumOfRentals < 5
ORDER BY NumOfRentals ASC;

-- Which movies haven't returned yet
SELECT f.film_id, r.customer_id, f.title, r.rental_date, r.return_date 
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON f.film_id = i.film_id
WHERE r.return_date IS NULL 
ORDER BY f.title;

-- How much money and rentals we make for Store 1 by day (Fixed: correct JOIN relationship)
SELECT 
    DATE(p.payment_date) AS date,
    i.store_id,
    COUNT(DISTINCT r.rental_id) AS total_rentals,
    SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.store_id = 1
GROUP BY DATE(p.payment_date), i.store_id
ORDER BY total_revenue DESC;

-- What are the top three earning days so far
SELECT DATE(payment_date) AS date, SUM(amount) AS earning 
FROM payment
GROUP BY DATE(payment_date)
ORDER BY earning DESC
LIMIT 3;









