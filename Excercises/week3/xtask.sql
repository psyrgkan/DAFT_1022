SELECT p.user, SUM(p.price) 
FROM purchases p
GROUP BY user;

SELECT p.item, SUM(p.price) 
FROM purchases p
GROUP BY p.item;


SELECT SUM(t1.value = 0)/COUNT(*)*100 as percent_inactive
FROM (
SELECT u.name, COUNT(p.item) as value
FROM users u
LEFT JOIN purchases p
ON u.name = p.user
GROUP BY u.name
) t1;

SELECT t.range, COUNT(*) 
FROM ( 
SELECT CASE 
WHEN date between month1 and month2 then 'january' 
when date between month2 and month3 then 'february' 
… else 'december' 
end as range from purchases) t 
group by t.range;

SELECT emp.employee_name as employee, man.employee_name as manager
FROM employees emp
LEFT JOIN employees man
ON emp.manager_id = man.employee_id;

SELECT emp.employee_id, emp.employee_name as employee, td.date_of_attendance, COUNT(*) as how_many
FROM employees emp
LEFT JOIN training_details td
ON emp.employee_id = td.attendant_id
GROUP BY td.date_of_attendance, emp.employee_name, emp.employee_id;

SELECT t1.employee, t1.date_of_attendance, td.session_name FROM (
SELECT emp.employee_id, emp.employee_name as employee, td.date_of_attendance, COUNT(*) as how_many
FROM employees emp
LEFT JOIN training_details td
ON emp.employee_id = td.attendant_id
GROUP BY td.date_of_attendance, emp.employee_name, emp.employee_id
) t1
left JOIN training_details td
ON (t1.employee_id = td.attendant_id and t1.date_of_attendance = td.date_of_attendance)
WHERE t1.how_many > 1;

