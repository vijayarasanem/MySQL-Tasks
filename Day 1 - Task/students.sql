-- 2. Create a new database named schoolDB
CREATE DATABASE sclDB;

-- Use the database
USE sclDB;

-- 3. Create a simple table students
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    grade VARCHAR(10)
);

-- 4. Insert at least 5 records into students
INSERT INTO students (id, name, age, grade)
VALUES
(1, 'Ajith', 18, 'A'),
(2, 'Rahul', 19, 'B'),
(3, 'Priya', 17, 'A'),
(4, 'Sneha', 18, 'C'),
(5, 'Karan', 19, 'B');

-- 5. View the data
SELECT * FROM students;

-- 6. Drop the schoolDB database
DROP DATABASE sclDB;