-- 1. Find employees with salary greater than the average salary
ALTER TABLE employees
ADD salary DECIMAL(10,2);

UPDATE employees SET salary = 50000 WHERE emp_id = 1;
UPDATE employees SET salary = 60000 WHERE emp_id = 2;
UPDATE employees SET salary = 45000 WHERE emp_id = 3;

INSERT INTO departments (dept_id, dept_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

INSERT INTO employees (emp_id, emp_name, dept_id, salary)
VALUES
(1, 'Ajith', 1, 50000),
(2, 'Rahul', 1, 60000),
(3, 'Priya', 2, 45000),
(4, 'Sneha', 2, 70000),
(5, 'Karan', 3, 55000);

SELECT * FROM departments;

SELECT * FROM employees;

SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 2. Select products with price higher than the cheapest order

DESC orders;

ALTER TABLE orders
ADD price DECIMAL(10,2);

UPDATE orders SET price = 55000 WHERE order_id = 101;
UPDATE orders SET price = 500 WHERE order_id = 102;
UPDATE orders SET price = 1200 WHERE order_id = 103;
UPDATE orders SET price = 15000 WHERE order_id = 104;
UPDATE orders SET price = 8000 WHERE order_id = 105;

SELECT *
FROM products
WHERE unit_price > (
    SELECT MIN(price)
    FROM orders
);

-- 3. Fetch customers with orders

SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);

-- 4. Show order counts using a subquery in SELECT

SELECT
    customer_name,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.customer_id
    ) AS order_count
FROM customers c;

-- 5. Correlated subquery to find highest salary per department

SELECT *
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);

-- 6. Check if a product exists

SELECT EXISTS (
    SELECT *
    FROM products
    WHERE name = 'Laptop'
) AS product_exists;