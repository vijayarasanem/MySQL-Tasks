-- 1. Create a table orders
CREATE TABLE orders (
    id INT PRIMARY KEY,
    product_name VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

-- 2. Insert 5 orders
INSERT INTO orders (id, product_name, quantity, price) VALUES
(1, 'Apple', 5, 150),
(2, 'Banana', 2, 80),
(3, 'Avocado', 3, 250),
(4, 'Orange', 1, 120),
(5, 'Mango', 4, 600);

-- 3. Select all orders where quantity > 2
SELECT * FROM orders
WHERE quantity > 2;

-- 4. Select orders where price is between 100 and 500
SELECT * FROM orders
WHERE price BETWEEN 100 AND 500;

-- 5. Fetch orders with product_name starting with 'A'
SELECT * FROM orders
WHERE product_name LIKE 'A%';

-- 6. Fetch orders sorted by quantity in descending order
SELECT * FROM orders
ORDER BY quantity DESC;