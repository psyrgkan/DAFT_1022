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

-- Create a trigger that checks if the hire date of an employee is higher than the current date. 
-- If true, set this date to be the current date. Format the output appropriately (YY-MM-DD)

DELIMITER $$
create trigger date_trig
before insert on t_employees
for each row
BEGIN
	IF NEW.hire_date > DATE_FORMAT(SYSDATE(), "%Y-%m-%d")
    THEN
		SET NEW.hire_date = DATE_FORMAT(SYSDATE(), "%Y-%m-%d");
	END IF;

END $$
DELIMITER ;

INSERT into t_employees values (10007, str_to_date("20-06-1999", "%d-%m-%Y"), "Kumar", "Rupesh", "M",
                         str_to_date("20-06-2023", "%d-%m-%Y")); 

-- Create ‘i_hire_date’ and Drop the ‘i_hire_date’ index.
CREATE INDEX i_hire_date ON t_employees(hire_date);
-- DROP INDEX index_name ON table_name;
DROP INDEX i_hire_date ON t_employees; 

-- Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum. 
-- Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.

SELECT
	*
FROM
	t_salaries
WHERE
	salary > 89000;
-- 0.012 sec

CREATE INDEX i_salary ON t_salaries(salary);
-- 0.684 sec

SELECT
	*
FROM
	t_salaries
WHERE
	salary > 89000;
-- 0.010 sec

-- Use Case statement and obtain a result set containing the employee number, first name, and last name of all employees with a 
-- number higher than 109990. Create a fourth column in the query, indicating whether this employee is also a manager, 
-- according to the data provided in the dept_manager table, or a regular employee.

SELECT
    e.emp_no,
	e.first_name,
	e.last_name,
	CASE
    	WHEN dm.emp_no IS NOT NULL THEN 'Manager'
    	ELSE 'Employee'
	END AS is_manager
FROM
	t_employees e
	LEFT JOIN t_dept_manager dm 
		ON dm.emp_no = e.emp_no
WHERE
	e.emp_no > 109990;


-- 10 Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
-- Add two columns at the end - one showing the difference between the maximum and minimum salary of that employee, 
-- and another one saying whether this salary raise was higher than $30,000 or NOT.


SELECT
    dm.emp_no,
	e.first_name,
	e.last_name,
	MAX(s.salary) - MIN(s.salary) AS salary_difference,
	CASE
    	WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'
    	ELSE 'Salary was NOT raised by more then $30,000'
	END AS salary_raise
FROM
	t_dept_manager dm
	JOIN t_employees e 
		ON e.emp_no = dm.emp_no
	JOIN t_salaries s 
		ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;



-- 11. Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, 
-- called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” 
-- if they aren’t. Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.

SELECT
    e.emp_no,
	e.first_name,
	e.last_name,
	CASE
    	WHEN MAX(de.to_date)  >= SYSDATE() THEN 'Is still employed'
    	ELSE 'Not an employee anymore'
	END AS current_employee
FROM
	t_employees e
	JOIN t_dept_emp de 
		ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;










