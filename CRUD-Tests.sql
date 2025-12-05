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
• Read (Select): Retrieve order details (date/time, total price, status)
• Update: Change order status (Pending → Preparing → Out for Delivery → Delivered → Cancelled)
• Delete: Delete an order (only if permitted by business rules)
**/



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