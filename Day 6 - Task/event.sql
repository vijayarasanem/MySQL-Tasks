-- 1. Create a table events
CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name VARCHAR(100),
    event_date DATE
);

-- 2. Insert events with different dates
INSERT INTO events (id, event_name, event_date) VALUES
(1, 'Sports Day', '2025-07-10'),
(2, 'Annual Day', '2025-08-15'),
(3, 'Science Fair', '2025-09-20'),
(4, 'Cultural Fest', '2025-10-05'),
(5, 'Graduation Day', '2025-11-25');

-- 3. Display current date & time
SELECT NOW();

-- 4. Format event_date
SELECT event_name,
       DATE_FORMAT(event_date, '%d-%m-%Y') AS formatted_date
FROM events;

-- 5. Extract YEAR and MONTH from event_date
SELECT event_name,
       YEAR(event_date) AS event_year,
       MONTH(event_date) AS event_month
FROM events;

-- 6. Combine event_name and event_date
SELECT CONCAT(event_name, ' - ', event_date) AS event_details
FROM events;