# Lab | SQL - Lab 3.01

#In this lab, you will be using the Sakila database of movie rentals. 

USE sakila;

-- Instructions

-- Activity 1

-- 1. Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

--  2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM customer WHERE first_name = 'TAMMY' AND last_name = 'Sanders';
SELECT * FROM staff; #staff_id, first_name, last_name, address_id, email, store_id (2), active, username (first_name), passsword(null), last_update

# Manual
INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active, username)
VALUES ('3', 'Tammy', 'Sanders', '79','TAMMY.SANDERS@sakilacustomer.org','2','1','Tammy');

SELECT * FROM staff;


-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.

-- You can use current date for the rental_date column in the rental table. (CURDATE/NOW)
-- Hint: Check the columns in the table rental and see what information you would need to add there.
-- You can query those pieces of information.
-- For eg., you would notice that you need customer_id information as well.
-- To get that you can use the following query: SELECT customer_id FROM sakila.customer WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';

-- Use similar method to get inventory_id, film_id, and staff_id.

SELECT * from customer LIMIT 5;


# Rental date --> current_date / curdate

#Getting film_id
SELECT film_id
FROM film
WHERE title = 'Academy Dinosaur';  # Film_id = 1

# Getting inventory_id 
SELECT inventory_id
FROM inventory 
WHERE film_id = 9; #inventory_id = multiple results (1-8) --> shouldn't be a serial foreign key (and unique)?

# Getting customer_id
SELECT customer_id
FROM customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER'; # customer_id = 130

# Getting staff_id 
SELECT staff_id
FROM staff
WHERE first_name = 'Mike'
and last_name = 'Hillyer'; # staff_id = 1


-- Insert a new rental for "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
VALUES (CURRENT_DATE, 9, 130, 1);

# Checking new insert 
SELECT * FROM rental WHERE customer_id = 130;




#also possible to fill new rows with information from other tables (?)

-- INSERT INTO table2 (col1, col2...)
-- SELECT col1, col2...
-- FROM table1
-- WHERE condition



-- Activity 2 -----------------------------------------------------------------------------

-- 1. Use dbdiagram.io or draw.io to propose a new structure for the Sakila database. (At least 3 changes to improve the database, the structure)

 Delete film_text_table --> title and description already exist in film table.

 Include category 'name' into film_category and delete category table.

 Merge actor and film_actor tables


-- 2. Define primary keys and foreign keys for the new database. (hand, ok)