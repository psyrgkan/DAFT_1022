USE employees;

-- Select the information from the “dept_no” column of the “departments” table. Select all data from the “departments” table.
SELECT dept_no
FROM departments;

-- Select all people from the “employees” table whose first name is “Elvis”. 
SELECT * 
FROM employees
WHERE first_name = 'Elvis';

-- Retrieve a list with all female employees whose first name is Kellie. 
SELECT * 
FROM employees
WHERE first_name = 'Kellie'
	AND gender = 'F';
    
-- Retrieve a list with all employees whose first name is either Kellie or Aruna.
SELECT * 
FROM employees
WHERE first_name = 'Kellie'
	OR first_name = 'Aruna';
    
-- Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
SELECT * 
FROM employees
WHERE first_name IN ('Denis', 'Elvis'); 
    
-- Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
SELECT * 
FROM employees
WHERE first_name NOT IN ('John', 'Mark', 'Jacob'); 

-- Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
SELECT * 
FROM employees
WHERE first_name LIKE '%Jack%'; 

-- Once you have done that, extract another list containing the names of employees that do not contain “Jack”.
SELECT * 
FROM employees
WHERE first_name NOT LIKE '%Jack%'; 

-- Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT * 
FROM salaries
WHERE salary BETWEEN 66000 AND 70000; 

-- Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT * 
FROM employees
WHERE emp_no NOT BETWEEN 10004 AND 10012; 

-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT dept_name 
FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

-- Select the names of all departments whose department number value is not null.
SELECT dept_name 
FROM departments
WHERE dept_no IS NOT NULL;

-- Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT *
FROM employees
WHERE gender = 'F' 
	AND hire_date >= '20000101';

-- Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT * 
FROM salaries
WHERE salary > 150000; 


-- Obtain a list with all different “hire dates” from the “employees” table.
SELECT DISTINCT hire_date
FROM employees;

-- Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output rows displayed back to the default of 1000.
-- Limit already set to 1000    