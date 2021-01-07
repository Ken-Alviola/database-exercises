#1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
select emp_no, dept_no, hire_date, to_date, if (to_date > curdate(), true,false) as is_current_employee
from employees 
join dept_emp using (`emp_no`);

#2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
select first_name, 
       last_name,
       case 
       		when substr(last_name,1,1) in ('A','B','C','D','E','F','G','H') then 'A-H'
       		when substr(last_name,1,1) in ('I','J','K','L','M','N','O','P','Q') then 'I-Q'
       		when substr(last_name,1,1) in ('R','S','T','W','X','Y','Z') then 'R-Z'
       		End as alpha_group
from employees;
       

#3. How many employees (current or previous) were born in each decade?
select max(birth_date), min(birth_date)
from employees;#1952-1965

select case
			when birth_date between '1950-01-01' and '1959-12-31' then '50s'
			when birth_date between '1960-01-01' and '1969-12-31' then '60s'
			end as decade_born,
	  count(*) 
from employees
group by decade_born; #182886 born in the 50s, 117138 born in 60s


#BONUS


#1. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

/*
+-------------------+-----------------+
| dept_group        | avg_salary      |
+-------------------+-----------------+
| Customer Service  |                 |
| Finance & HR      |                 |
| Sales & Marketing |                 |
| Prod & QM         |                 |
| R&D               |                 |
+-------------------+-----------------+
*/

SELECT CASE
		WHEN dept_name IN ('research', 'development') THEN 'R&D'
        WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing' 
        WHEN dept_name in ('Production', 'Quality Management') THEN 'Prod & QM'
		ELSE dept_name
		END AS dept_group,
round(AVG(salary), 2) AS avg_salary

FROM salaries AS s
JOIN dept_emp AS de ON s.emp_no = de.emp_no
			AND de.to_date > curdate()
JOIN departments AS d USING(dept_no)
where s.to_date > curdate()
GROUP BY dept_group
order by avg_salary DESC;