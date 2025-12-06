-- Create users for manager, cook, & cashier. 
Create user 'cook_user'@'localhost' identified by 'pass123';
Create user 'manager_user'@'localhost' identified by 'pass456';
Create user 'cashier_user'@'localhost' identified by 'pass789';

-- Grant permissions to each user. 
Grant select, insert
on restaurant.orders
to 'cashier_user'@'localhost';

Grant select, insert
on restaurant.order_item
to 'cashier_user'@'localhost';

Grant select
on restaurant.orders
to 'cook_user'@'localhost';

Grant update (status)
on restaurant.orders
to 'cook_user'@'localhost';

Grant all privileges
on restaurant.*
to 'manager_user'@'localhost';

-- Flush
flush privileges;

/** Cook command tests, taken from command line prompts, with results. 
Ensure you are logged in through the cook_user authorization**/

USE restaurant;
-- Database Changed
SELECT * FROM orders LIMIT 1;
-- 1 row in set (0.00 sec)
UPDATE orders
SET status = 'Preparing'
WHERE order_id = 1;
-- Query OK, 1 row affected (0.01 sec)
UPDATE orders
SET total_price = 0
WHERE order_id = 1;
-- ERROR 1143 (42000): UPDATE command denied to user 'cook_user'@'localhost' for column 'total_price' in table 'orders'

/** Cashier command tests, taken from command line prompts, with results. 
Ensure you are logged in through the cashier_user authorization**/
USE restaurant;
-- Database Changed
SELECT * FROM orders LIMIT 1;
-- 1 row in set (0.00 sec)
INSERT INTO orders (customer_id, status, total_price)
VALUES (1, 'Pending', 12.50);
-- Query OK, 1 row affected (0.00 sec)
UPDATE orders SET status = 'Cancelled' WHERE order_id = 1;
-- ERROR 1142 (42000): UPDATE command denied to user 'cashier_user'@'localhost' for table 'orders'

/** Manager command tests, taken from command line prompts, with results. 
Ensure you are logged in through the manager_user authorization**/

USE restaurant;
-- Database changed
SELECT * FROM orders LIMIT 1;
-- 1 row in set (0.00 sec)
INSERT INTO category (name, description)
VALUES ('Test Category', 'For testing purposes');
-- Query OK, 1 row affected (0.01 sec)
UPDATE orders
SET total_price = 99.99
WHERE order_id = 1;
-- Query OK, 1 row affected (0.01 sec)
DELETE FROM category
WHERE name = 'Test Category';
-- Query OK, 1 row affected (0.01 sec)
ALTER TABLE orders ADD COLUMN test_column VARCHAR(50);
-- Query OK, 0 rows affected (0.03 sec)






