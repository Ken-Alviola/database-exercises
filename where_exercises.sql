#1 Create a file named where_exercises.sql. Make sure to use the employees database.
use employees;

#2 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
select *
from employees
where first_name in ('Irena','Vidya','Maya'); #709 records

#3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
select *
from employees
where first_name = 'Vidya' or first_name = 'Irena' or first_name = 'Maya';#709 records, matches q2

#4 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
select *
from employees
where first_name in ('Irena','Vidya','Maya')
and gender = 'M'; #441 records

#5 Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
select *
from employees
where last_name like 'E%'; #7330 records

#6 Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
select *
from employees
where last_name like '%E' or last_name like 'E%'; #30723 records starts or ends with 'E'

select *
from employees
where last_name like '%E' 
and not last_name like 'E%'; #23393 records ends with 'E' but doesn't start with 'E'

#7 Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
select *
from employees
where last_name like '%E' and last_name like'E%'; #899 records starts and ends with 'E'

select *
from employees
where last_name like '%E';#24292 records end with 'E'

#8 Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
select *
from employees
where `hire_date` between '1990-01-01' and '1999-12-31'; #135214 records with hire date in 90's

#9 Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
select *
from employees
where birth_date like '%-12-25'; #842 employees born on XMAS

#10 Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
select *
from employees
where `hire_date` between '1990-01-01' and '1999-12-31'
and birth_date like '%-12-25'; #362 employees born on XMAS and hired in the 90s

#11 Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
select *
from `employees`
where last_name like '%q%';#1873 records with q in last name

#12 Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
select *
from `employees`
where last_name like '%q%'
and not last_name like '%qu%';#547 employees wtih q in name but not qu