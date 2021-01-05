#1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
select *
from employees
join dept_emp using (emp_no)
where `hire_date` in (
	select hire_date
	from `employees`
	where emp_no = 101010)
and to_date > curdate()
;

#2. Find all the titles ever held by all current employees with the first name Aamod.
select concat(first_name,' ',last_name) as full_name, title, titles.from_date, titles.to_date
from employees
join titles using (emp_no)
join dept_emp using (emp_no)
where first_name in (
	select `first_name`
	from employees
	where first_name = 'Aamod')
and dept_emp.to_date > curdate()
;

#3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select count(*) as former_employees
from employees
join dept_emp using (emp_no)
where to_date in (select `to_date`
	from `dept_emp`
	where to_date < curdate())
;

#4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT first_name, last_name, gender, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager)
and gender = 'F'
;

#5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select first_name, last_name, salary
from employees
join salaries using (emp_no)
where salary > (
	select avg(salary)
	from salaries)
and salaries.to_date > curdate()
order by salary Desc
;
# verification
select avg(salary)
	from salaries;# 63810.74
	
#6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
select count(*)
from salaries
where salary in (
	select salary
	from salaries
	where salary > (select max(salary) - stddev(salary)
					from salaries
					where to_date > curdate()
					)
)
and to_date > curdate(); #SUPER UGLY but there are 83 current salaries within 1 STDDEV of current highest salary

select count(salary)
from salaries
where to_date > curdate(); #240124 current salaries total so 0.035% of total salaries


		
#BONUS

#1. Find all the department names that currently have female managers.

#2. Find the first and last name of the employee with the highest salary.

#3. Find the department name that the employee with the highest salary works in.