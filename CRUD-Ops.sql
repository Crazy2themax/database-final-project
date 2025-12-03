-- Inserting Categories
Insert into category (Name, Description)
value ('Dinner', 'Dinner items');

Insert into category (Name, Description)
value ('Lunch', 'Lunch items');

Insert into category (Name, Description)
value ('Breakfast', 'Breakfast items');

Insert into category (Name, Description)
value ('Sides', 'Sides');

Insert into category (Name, Description)
value ('Drinks', 'Beverages');

-- Inserting Menu Items
Insert into menu_item (name, description, price, category_id, available, last_modified)
values ('Omelet', 'Egg omelet with choice of toppings', '9.99', 3, 1, now());

Insert into menu_item (name, description, price, category_id, available, last_modified)
values ('Pizza', '10 inch pizza with choice of toppings', '14.99', 1, 1, now());

Insert into menu_item (name, description, price, category_id, available, last_modified)
values ('Ruben', 'Roast beef sandwich with mustard', '7.99', 2, 1, now());

Insert into menu_item (name, description, price, category_id, available, last_modified)
values ('Poutine', 'Fries, topped with gravy and cheese curds', '9.99', 4, 1, now());

Insert into menu_item (name, description, price, category_id, available, last_modified)
values ('Soda', 'Your choice of basic, diet or zero', '2.99', 5, 1, now());

-- Inserting Customers
Insert into customer (first_name, last_name, phone, email, created_at)
values ('Emily', 'Carter', '555-214-7832', 'emily.carter@example.com', now());

Insert into customer (first_name, last_name, phone, email, created_at)
values ('Darien', 'Nguyen', '555-642-1198', 'darien.nguyen@example.com', now());

Insert into customer (first_name, last_name, phone, email, created_at)
values ('Sophia', 'Martinez', '555-873-4506', 'sophia.martinez@example.com', now());

-- Inserting Customer Addresses
Insert into customer_address (customer_id, street, city, province_state, postal_code, country, is_default)
values (1, '742 Evergreen Terrace', 'Springfield', 'Illinois', '62704', 'USA', 1);

Insert into customer_address (customer_id, street, city, province_state, postal_code, country, is_default)
values (2, '123 Maplewood Drive', 'Vancouver', 'British Columbia', 'V6Z1K7', 'Canada', 1);

Insert into customer_address (customer_id, street, city, province_state, postal_code, country, is_default)
values (3, '742 Evergreen Terrace', 'Sherbrooke', 'Quebec', 'J1G4B5', 'Canada', 1);

-- Inserting Employees
Insert into employee (username, full_name, role, hired_date, active)
values ('bthompson', 'Benjamin Thompson', 'Cook', '2023-03-18', 1);

Insert into employee (username, full_name, role, hired_date, active)
values ('lroberts', 'Lillie Roberts', 'Cashier', '2024-07-02', 1);

Insert into employee (username, full_name, role, hired_date, active)
values ('mfernandez', 'Miguel Fernandez', 'Driver', '2022-09-05', 1);

Insert into employee (username, full_name, role, hired_date, active)
values ('swhite', 'Sara White', 'Manager', '2021-12-11', 1);

Insert into employee (username, full_name, role, hired_date, active)
values ('kjones', 'Kevin Jones', 'Other', '2025-01-04', 1);

-- Insert Driver
Insert into Driver (employee_id, vehicle_info, phone)
values (3, '2020 Honda Civic (Silver)', '555-873-4410');

-- Insert Orders
Insert into orders (customer_id, address_id, order_datetime, status, total_price, cancelled_reason, delivered_at, last_modified)
values (1, 1, '2025-12-01 09:10:00', 'Delivered', '35.95', null, '2025-12-01 09:45:00', '2025-12-01 09:45:00');

Insert into orders (customer_id, address_id, order_datetime, status, total_price, cancelled_reason, delivered_at, last_modified)
values (2, 2, '2025-12-01 11:05:00', 'Out for Delivery', '39.94', null, null, '2025-12-01 11:30:00');

Insert into orders (customer_id, address_id, order_datetime, status, total_price, cancelled_reason, delivered_at, last_modified)
values (3, 3, '2025-12-01 12:20:00', 'Cancelled', '22.98', 'Customer Cancellation', null, '2025-12-01 12:30:00');

-- Insert Order Items
Insert into order_item (order_id, menu_item_id, quantity, unit_price)
values (1, 1, 2, 9.99);
Insert into order_item (order_id, menu_item_id, quantity, unit_price)
values (1, 5, 2, 2.99);
Insert into order_item (order_id, menu_item_id, quantity, unit_price)
values (1, 4, 1, 9.99);

Insert into order_item (order_id, menu_item_id, quantity, unit_price)
values (2, 2, 1, 14.99);
Insert into order_item (order_id, menu_item_id, quantity, unit_price)
values (2, 3, 2, 7.99);
Insert into order_item (order_id, menu_item_id, quantity, unit_price)
values (2, 5, 3, 2.99);

INSERT INTO order_item (order_id, menu_item_id, quantity, unit_price)
VALUES 
(3, 2, 1, 14.99),
(3, 5, 2, 2.99),
(3, 4, 1, 9.99);

Insert into order_status_log (order_id, changed_by,  old_status, new_status, changed_at, comment)
values
(1, 'lroberts', null, 'Received', '2025-12-01 09:10:00', 'Order received'), 
(1, 'bthompson', 'Received', 'Prepared', '2025-12-01 09:20:00', 'Order ready'), 
(1, 'mfernandez', 'Prepared', 'Picked Up', '2025-12-01 09:30:00', 'Driver pick up'), 
(2, 'lroberts', null, 'Received', '2025-12-01 11:05:00', 'Order received'), 
(2, 'bthompson', 'Received', 'Prepared', '2025-12-01 11:15:00', 'Order ready'), 
(2, 'mfernandez', 'Prepared', 'Picked Up', '2025-12-01 11:20:00', 'Driver pick up'), 
(3, 'lroberts', null, 'Received', '2025-12-01 12:20:00', 'Order received'), 
(3, 'lroberts', 'Received', 'Cancelled', '2025-12-01 12:25:00', 'Customer cancellation');

Insert into delivery (order_id, driver_id, assigned_at, picked_up_at, delivered_at, status, notes)
values
(1, 1, '2025-12-01 09:20:00', '2025-12-01 09:30:00', '2025-12-01 09:45:00', 'Delivered', 'Left at front door'), 
(2, 1, '2025-12-01 11:15:00', '2025-12-01 11:20:00', Null, 'Picked Up', null);

