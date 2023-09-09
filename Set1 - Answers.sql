-- senior most employee based on job title
SELECT 
    *
FROM
    employee;
SELECT DISTINCT
    levels
FROM
    employee;
SELECT 
    first_name, last_name, levels
FROM
    employee
ORDER BY levels DESC;

-- countries with most invoices
SELECT 
    billing_country, COUNT(billing_country) AS 'Countries'
FROM
    invoice
GROUP BY billing_country
ORDER BY COUNT(billing_country) DESC;

-- top 3 values of total invoice
SELECT 
    *
FROM
    invoice; 
SELECT 
    total
FROM
    invoice
ORDER BY total DESC
LIMIT 3;

-- city with highest sum of invoice totals
use music_store;
SELECT 
    *
FROM
    invoice;
SELECT 
    billing_city, SUM(total)
FROM
    invoice
GROUP BY billing_city
ORDER BY SUM(total) DESC
LIMIT 1;

-- best customer
SELECT 
    *
FROM
    customer;
SELECT 
    a.first_name AS 'First Name',
    a.last_name AS 'Last Name',
    SUM(b.total) AS 'Money Spent'
FROM
    customer a
        JOIN
    invoice b ON a.customer_id = b.customer_id
GROUP BY a.first_name , a.last_name
ORDER BY SUM(total) DESC
LIMIT 1;

