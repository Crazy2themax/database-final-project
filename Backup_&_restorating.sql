
--dropping the database 
drop database restaurant_new;

--proving the databse has been dropped
use restaurant;
SELECT * FROM customer;

create database restaurant;

--proving the databse has been dropped
use restaurant;
SELECT * FROM customer;


USE restaurant_new;
SELECT COUNT(*) FROM customer;