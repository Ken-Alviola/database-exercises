#1. Using the example from the lesson, re-create the employees_with_departments table.
create temporary table EWD_copy (select *
from employees.employees_with_departments);

select *
from EWD_copy;#verify

#a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
Alter table EWD_copy add full_name varchar(30);

#b. Update the table so that full name column contains the correct data
update EWD_copy
set full_name = concat(first_name,' ',last_name);

#c. Remove the first_name and last_name columns from the table.
alter table EWD_copy drop column first_name;
alter table EWD_copy drop column last_name;

#d. What is another way you could have ended up with this same table?
Drop table EWD_copy;

create temporary table EWD_copy (select emp_no, dept_no, dept_name, concat(first_name,' ',last_name) as full_name
from employees.employees_with_departments);

select *
from EWD_copy;

#2. Create a temporary table based on the payment table from the sakila database.Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
create temporary table sakpay_copy (Select * from sakila.payment);

select *
from sakpay_copy;

alter table sakpay_copy add amount_in_cents INT;

update sakpay_copy
set amount_in_cents = amount * 100;

#3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?

#will finish after lunch

