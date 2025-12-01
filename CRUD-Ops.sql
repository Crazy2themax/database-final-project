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
value ('Drinks', 'Beverages');value ('Drinks', 'Beverages');

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
