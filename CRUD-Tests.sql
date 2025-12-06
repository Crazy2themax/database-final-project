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
• Call total price procedure (Test Procedure #1)
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

select * from order_item

/** Delivery Management
• Create (Insert): Assign a delivery driver to an order
• Call assign driver procedure (Test Procedure #2)
• Read (Select): List deliveries per driver per day
• Update: Update delivery steps (assigned → picked up → delivered)
• Delete: Remove driver assignments if necessary
**/

Update orders
set status = 'Out for Delivery'
where order_id = 4;

Select * from orders;

Insert into delivery (order_id, assigned_at, picked_up_at, delivered_at, status, notes)
values
(4, now(), now(), null, 'Picked Up', null);

Select * from delivery;

call sp_assign_driver(3, 1);

Select driver_id,
    Date(assigned_at) AS delivery_date
From delivery;

delete from driver
where driver_id = 1;

/** Sales / Reporting
• Read (Select): Generate reports such as:
• Sales per day (Test Procedure #3)
• Sales per category
**/

-- Per Day
call sp_generate_sales_report;

-- Per category
Select 
    Date(o.order_datetime) as Sales_Date,
    c.name as Category,
    SUM(m.price) as Total,
    COUNT(DISTINCT o.order_id) as Total_Orders,
    COUNT(oi.order_item_id) as Total_Items
From orders as o
join order_item as oi
    on o.order_id = oi.order_id
join menu_item as m
    on oi.menu_item_id = m.menu_item_id
join category as c
    on m.category_id = c.category_id
group by date(o.order_datetime), c.name
order by Sales_Date, Category;

/**Triggers
To prove that trigger deletion is working I first tested the trigger on a menu item 
that I knew was connect to an order to prove it won't work and will give an error message
.I then created a temporary data entry that wasn't connected to any order to prove it 
would work properly.The reason this works is because the trigger runs before deletion and
checks how many times the menu_item KD appeared in the order_item  table. Because the item is 
connected to an order, the trigger detects that the count is greater then zero and sends an error message.
**/


--Trigger test Case: trg_prevent_menuitem_deletion

--trigger test case 1  
select * From menu_item;
--trigger test case: cannot delete item from menu (receive error stating cannot be deleted)
DELETE FROM menu_item WHERE menu_item_id = 1;

--trigger test cases 2
--Creating temporary data entry 
INSERT INTO menu_item (menu_item_id, name, description, price, category_id, available, last_modified)
VALUES (10, 'Test Burger', 'Temporary test item', 9.99, 1, 1, NOW());

--Proving that a menu_item can be deleted if not tied to an order
DELETE FROM menu_item WHERE menu_item_id = 10;


--Trigger test Case: trg_log_order_status_change

/*
To show that the order status change trigger works I updated the status of an
 order to "Cancelled" .I made sure to include a before and after to make sure
  that it was working properly. The reason why this works is because the 
trigger runs after the update and compares the old status to the new one.
 Since Both the values are different, the trigger automatically writes a new 
 log into the order_status_log. 
*/

--Check table before 
select * from order_status_log;
--This triggers the trigger to set the status of the order_id 1 to Cancelled
UPDATE orders SET status = 'Cancelled' WHERE order_id = 1;
--Check table after
select * from order_status_log;
