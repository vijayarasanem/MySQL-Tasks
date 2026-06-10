-- 1. Create customers and orders tables with a foreign key

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

DROP TABLE orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 2. Insert 5 customers and 5 orders

INSERT INTO customers VALUES
(1, 'Ajith'),
(2, 'Rahul'),
(3, 'Priya'),
(4, 'Sneha'),
(5, 'Karan');

INSERT INTO orders VALUES
(101, 'Laptop', 1),
(102, 'Mouse', 2),
(103, 'Keyboard', 1),
(104, 'Monitor', 3),
(105, 'Printer', 5);

-- 3. INNER JOIN

SELECT c.customer_name, o.order_id, o.product_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- 4. LEFT JOIN

SELECT c.customer_name, o.order_id, o.product_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- 5. 2NF Example

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    student_name VARCHAR(50),
    course_name VARCHAR(50),
    PRIMARY KEY (student_id, course_id)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

-- 6. 3NF Example

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

DROP TABLE employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);