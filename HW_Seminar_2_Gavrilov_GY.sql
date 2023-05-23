-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.

DROP DATABASE IF EXISTS homework_database;
CREATE DATABASE homework_database;
USE homework_database;
	
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO sales (product, quantity, price)
VALUES
('product1', 99, 0.50),
('product2', 150, 20.00),
('product3', 20, 11.75),
('product4', 259, 9.99),
('product5', 301, 100.00),
('product6', 350, 12.50);

-- 2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : меньше 100 - "Маленький заказ"; от 100 до 300 - "Средний заказ"; больше 300 - "Большой заказ".

SELECT 
    CASE 
        WHEN quantity < 100 THEN 'Маленький заказ' 
        WHEN quantity BETWEEN 100 AND 300 THEN 'Средний заказ' 
        ELSE 'Большой заказ' 
    END AS quantity_segment,
    COUNT(*) AS quantity_count
FROM 
    sales
GROUP BY 
    quantity_segment;
    
-- 3. Создайте таблицу “orders”, заполните ее значениями (см. презентацию). Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status: OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled».

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    order_status VARCHAR(10)
);

INSERT INTO orders (customer, product, quantity, price, order_date, order_status)
VALUES
('customer1', 'product1', 49, 0.50, '2023-05-01', "OPEN"),
('customer1', 'product2', 20, 20.00, '2023-05-02', "CLOSED"),
('customer2', 'product1', 50, 0.50, '2023-05-03', "OPEN"),
('customer2', 'product5', 50, 100.00, '2023-05-04', "CANCELLED"),
('customer3', 'product6', 300, 12.50, '2023-05-05', "OPEN"),
('customer3', 'product3', 19, 11.75, '2023-05-06', "CLOSED");

SELECT * FROM orders;

SELECT * ,
    CASE
		WHEN order_status = "OPEN" THEN "Order is in open state"
		WHEN order_status = "CLOSED" THEN "Order is closed"
		WHEN order_status = "CANCELLED" THEN "Order is cancelled"
	END AS full_order_status
FROM orders;

-- 4. Чем NULL отличается от 0?
-- "0" - это числовое значение, константа. "NULL" - указывает на объявленную, но не инициализированную переменную.