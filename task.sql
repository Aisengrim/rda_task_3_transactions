-- Use our database
USE ShopDB; 

INSERT INTO Orders (CustomerOD, Date);
VALUES (1, '2026-03-17');

-- Start the transaction 
START TRANSACTION; 

SELECT id
INTO @order_id
FROM Orders
ORDER BY id DESC
LIMIT 1;

SET @order_id = LAST_INSERT_ID();

INSERT INTO OrderItems(OrderID, ProductID, Count)
VALUE (@order_id, 1, 1);

UPDATE Products
SET WarehouseAmount = WarehouseAmount - 1
WHERE ID = 1;

COMMIT; 