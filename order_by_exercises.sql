#1
use employees;

#2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select *
from employees
where first_name in ('Irena','Vidya','Maya')
order by first_name; #Irena Reutenauer is the first row. Vidya Simmen in the last row

#3 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select *
from employees
where first_name in ('Irena','Vidya','Maya')
order by first_name, last_name; #Irena Acton is 1st, Vidya Zweizig last

#4 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
select *
from employees
where first_name in ('Irena','Vidya','Maya')
order by last_name, first_name;#Irena Acton is 1st again, and Maya Zyda last

#5 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
select *
from employees
where last_name like 'E%E'
order by `emp_no`;#899 employees, 1st:10021 Ramzi Erde, last:499648 Tadahiro Erde

#6 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.
select *
from employees
where last_name like 'E%E'
order by hire_date DESC;#899 employees Newest: Teiji Eldridge, Oldest: Sergi Erde

#7 Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.
select *
from employees
where `hire_date` between '1990-01-01' and '1999-12-31'
and birth_date like '%-12-25'
order by birth_date, hire_date DESC;#362 employees, oldest employee hired last: Khun Bernini, youngest employee hired first: Douadi Pettis