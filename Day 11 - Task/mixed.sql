USE companyydb;

SELECT emp_id, emp_name, department, salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

select * from employees;
select * from customers;
select * from orders;
select * from products;

SELECT emp_id, emp_name, dept_id, salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);

SELECT customer_id, customer_name
FROM customers
WHERE customer_id IN
(
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 2
);

SELECT *
FROM products
WHERE unit_price =
(
    SELECT MAX(unit_price)
    FROM products
);

SELECT DISTINCT customer_id,
(
    SELECT SUM(price)
    FROM orders o2
    WHERE o2.customer_id = o1.customer_id
) AS total_order_value
FROM orders o1;

SELECT *
FROM products p
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.product_name = p.name
);