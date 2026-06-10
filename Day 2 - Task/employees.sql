-- 1. Create a database companyDB
CREATE DATABASE companyyDB;

-- Use the database
USE companyyDB;

-- 2. Create employees table with constraints
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    salary DECIMAL(10,2) DEFAULT 30000
);

-- 3. Add UNIQUE constraint on email
ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);

-- 4. Insert 5 employee records
INSERT INTO employees (id, name, email, salary) VALUES
(1, 'Ajith', 'ajith@gmail.com', 50000),
(2, 'Rahul', 'rahul@gmail.com', 45000),
(3, 'Priya', 'priya@gmail.com', 55000),
(4, 'Sneha', 'sneha@gmail.com', 40000),
(5, 'Karan', 'karan@gmail.com', 35000);

-- 5. Try inserting a duplicate email
INSERT INTO employees (id, name, email, salary)
VALUES (6, 'Anu', 'ajith@gmail.com', 60000);

-- 6. Drop the table
DROP TABLE employees;

-- Recreate table with CHECK constraint
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000 CHECK (salary > 0)
);