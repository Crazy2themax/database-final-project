/** Menu Items
• Create (Insert): Add new menu items into the database
• Read (Select): List all menu items with price, category, and availability
• Update: Modify item details (e.g., update price, category, or availability)
• Delete: Remove discontinued dishes
**/

Insert into category (Name, Description)
value
('Dessert', 'Dessert items');

Insert into menu_item (name, description, price, category_id, available, last_modified)
values
('Pudding Chomeur', 'Delicious white cake soaked in a brown sugar, maple syrup', '5.99', 6, 1, now());

Select * from restaurant.menu_item;

Update menu_item
set price = '8.99'
where menu_item_id = 6;

Delete from menu_item
where menu_item_id = 6;

/** Orders
• Create (Insert): Place a new order containing multiple menu items
• Call total price procedure
• Read (Select): Retrieve order details (date/time, total price, status)
• Update: Change order status (Pending → Preparing → Out for Delivery → Delivered → Cancelled)
• Delete: Delete an order (only if permitted by business rules)
**/

Insert into orders (customer_id, address_id, order_datetime, status, total_price, cancelled_reason, delivered_at, last_modified)
values
(1, 1, now(), 'Delivered', '35.95', null, null, now());

Insert into order_item (order_id, menu_item_id, quantity, unit_price)
values
(4, 2, 1, 14.99),
(4, 4, 1, 9.99),
(4, 5, 1, 2.99);

-- Declare a session variable to capture the OUT parameter
CALL sp_calculate_order_total(4, @order_total);

-- Retrieve the result
SELECT @order_total AS total_price;

Update orders
set total_price = '27.97'
where order_id = 4;

Select * from orders;

Update orders
set status = 'Pending'
where order_id = 4;

delete from orders
where order_id = 4;

select * from order_item;

/** Delivery Management
• Create (Insert): Assign a delivery driver to an order
• Read (Select): List deliveries per driver per day
• Update: Update delivery steps (assigned → picked up → delivered)
• Delete: Remove driver assignments if necessary
**/





/** Sales / Reporting
• Read (Select): Generate reports such as:
• Sales per day
• Sales per category
**/