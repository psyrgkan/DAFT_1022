-- Create a procedure that will provide the average salary of all employees.

DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN
	SELECT
	AVG(salary) as "Average Salary"
    FROM
    t_salaries;
END$$
DELIMITER ;

CALL avg_salary();

-- Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.

DELIMITER $$
CREATE PROCEDURE emp_info(IN first_name VARCHAR(50), IN last_name VARCHAR(50))
BEGIN
SELECT emp_no
FROM t_employees e
WHERE
e.first_name = first_name AND e.last_name = last_name;
END $$
DELIMITER ;

CALL emp_info('Patricio' , 'Bridgland');

-- Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, and returns the salary 
-- from the newest contract of that employee.

DELIMITER $$
CREATE FUNCTION emp_info_sal(first_name VARCHAR(50), last_name VARCHAR(50)) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
    DECLARE last_sal DECIMAL(10,2);

	SELECT salary INTO last_sal
	FROM t_salaries s
	JOIN t_employees e
	ON e.emp_no = s.emp_no
	WHERE
	e.first_name = first_name AND e.last_name = last_name
	ORDER BY from_date DESC
    LIMIT 1;
    
    RETURN last_sal;
END $$
DELIMITER ;

SELECT emp_info_sal('Cristinel', 'Bouloucos');
