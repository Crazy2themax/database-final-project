
--trg_prevent_menuitem_deletion → blocks deletion if item exists in OrderItems

DELIMITER $$

CREATE TRIGGER trg_prevent_menuitem_deletion
BEFORE DELETE ON menu_item
FOR EACH ROW
BEGIN
    DECLARE item_count INT;

    -- Check if the menu item has appeared in any order
    SELECT COUNT(*) INTO item_count
    FROM order_item
    WHERE menu_item_id = OLD.menu_item_id;

    IF item_count > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot delete menu item: it exists in one or more orders.';
    END IF;
END $$

DELIMITER ;




---trg_prevent_menuitem_deletion → blocks deletion if item exists in OrderItems
DELIMITER $$

CREATE TRIGGER trg_log_order_status_change
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    -- Only log when the status actually changed
    IF NEW.status <> OLD.status THEN
        INSERT INTO order_status_log (
            order_id,
            changed_by,
            old_status,
            new_status,
            comment
        )
        VALUES (
            NEW.order_id,
            'System',  -- change this later to employee username if needed
            OLD.status,
            NEW.status,
            CONCAT('Status changed on ', NOW())
        );
    END IF;
END $$

DELIMITER ;
