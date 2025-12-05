-- Procedure #1
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