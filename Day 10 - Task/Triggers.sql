USE companyydb;

DELIMITER //

CREATE PROCEDURE InsertEmployee(
    IN p_id INT,
    IN p_name VARCHAR(50),
    IN p_dept_id INT,
    IN p_salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO employees(emp_id, emp_name, dept_id, salary)
    VALUES(p_id, p_name, p_dept_id, p_salary);
END //

DELIMITER ;

CALL InsertEmployee(6, 'Anu', 1, 65000);

DELIMITER //

CREATE PROCEDURE UpdateSalary(
    IN p_emp_id INT,
    IN p_salary DECIMAL(10,2)
)
BEGIN
    UPDATE employees
    SET salary = p_salary
    WHERE emp_id = p_emp_id;
END //

DELIMITER ;

CALL UpdateSalary(6, 70000);

DELIMITER //

CREATE TRIGGER update_stock
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - 1
    WHERE name = NEW.product_name;
END //

DELIMITER ;

CREATE TABLE user (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    role VARCHAR(20)
);

INSERT INTO user VALUES
(1, 'admin1', 'admin'),
(2, 'user1', 'user'),
(3, 'user2', 'user');

DELIMITER //

CREATE TRIGGER prevent_last_admin
BEFORE DELETE ON user
FOR EACH ROW
BEGIN
    IF OLD.role = 'admin' AND
       (SELECT COUNT(*) FROM user WHERE role = 'admin') = 1 THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Cannot delete the last admin user';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT * FROM employees;
END //

DELIMITER ;

CALL GetEmployees();

DROP PROCEDURE InsertEmployee;

DROP TRIGGER update_stock;