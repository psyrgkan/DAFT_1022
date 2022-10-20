create database prblm_solving;
use prblm_solving;
create table if not exists employees (
emp_id int,
name_em varchar(10),
surname varchar(10),
department varchar(10),
salary float(12,2));

insert into employees (emp_id, name_em, surname, department, salary)
values (1, "Takis", "Sofoulis", "Love", 29338.30),
(2, "Sotos", "Konou", "Love", 30985.23 ),
(3, "Lolos", "Pipou", "Luck", 23052.12),
(4, "Popis", "Ntinou", "Luck", 57350.13);

-- Write a query to get unique department ID from employee table
select distinct(department) from employees;

-- Write a query to get the 2 columns Full name and Taxes  (20% from Salary)
select concat(name_em, " ", surname) as fullname, (0.2*salary) as taxes from employees;

-- Write a query to get the maximum and minimum salary from employees table
SELECT salary
FROM employees e1
WHERE salary = (SELECT MAX(salary) FROM employees e2) OR
      salary = (SELECT MIN(salary) FROM employees e2);
      
-- alternative
select max(salary), min(salary) from employees;
      
-- Write a query to get the average salary per department
select department, avg(salary) from employees
group by department;
