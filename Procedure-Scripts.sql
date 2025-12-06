-- Procedure #1
drop procedure sp_calculate_order_total;
-- 

Delimiter //

create procedure sp_calculate_order_total
(in order_num int,
out total decimal(10, 2))
begin
select sum(m.price)
into total
from menu_item m
join order_item oi
on m.menu_item_id = oi.menu_item_id
join orders as o
on oi.order_id = o.order_id
where o.order_id = order_num;
end//

delimiter ;

-- Procedure #2
drop procedure sp_assign_driver;
-- 

Delimiter //

create procedure sp_assign_driver
(in in_delivery_id int, 
in in_driver_id int)
begin
update delivery
set driver_id = in_driver_id
where delivery_id = in_delivery_id;
end//

delimiter ;

-- Procedure #3
drop procedure sp_generate_sales_report;
-- 

Delimiter //

create procedure sp_generate_sales_report()
begin
select date(o.order_datetime) as Sales_Date,
sum(m.price) as Total,
count(distinct o.order_id) as Total_Orders,
count(oi.order_item_id) as Total_Items
from orders o
join order_item oi
on o.order_id = oi.order_id
join menu_item m
on oi.menu_item_id = m.menu_item_id
group by date(o.order_datetime)
order by sales_date;
end //

delimiter ;