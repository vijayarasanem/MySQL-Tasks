-- 1. Create a table sales

CREATE TABLE sales (
    id INT PRIMARY KEY,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);

-- Insert sample data

INSERT INTO sales VALUES
(1, 'Laptop', 55000),
(2, 'Mouse', 500),
(3, 'Keyboard', 1200),
(4, 'Monitor', 15000),
(5, 'Printer', 8000);

-- 2. Use ROW_NUMBER() to rank sales by amount

SELECT *,
       ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num
FROM sales;

-- 3. Use RANK() to assign ranks with ties

SELECT *,
       RANK() OVER (ORDER BY amount DESC) AS rank_num
FROM sales;

-- 4. Use DENSE_RANK() to avoid gaps in ranking

SELECT *,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rank_num
FROM sales;

-- 5. Use SUM() OVER() to calculate running totals

SELECT *,
       SUM(amount) OVER (ORDER BY amount) AS running_total
FROM sales;

-- 6. Create a CTE to fetch sales above average

WITH avg_sales AS (
    SELECT AVG(amount) AS avg_amount
    FROM sales
)
SELECT *
FROM sales
WHERE amount > (SELECT avg_amount FROM avg_sales);