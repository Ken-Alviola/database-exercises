#Use the employees database
Use employees;

#List all the tables in the database
Show tables;
#current_dept_emp
#departments
#dept_emp
#dept_emp_latest_date
#dept_manager
#employees
#employees_with_departments
#salaries
#titles

#Explore the employees table. What different data types are present on this table? int, date, varchar, enum 
Describe employees;

#Which table(s) do you think contain a numeric type column?
# dept_emp, dept_manager, employees, employees_with_departments, salaries, titles

#Which table(s) do you think contain a string type column?
# All of them

#Which table(s) do you think contain a date type column?
# dept_emp, dept_manager, employees, salaries, titles

#What is the relationship between the employees and the departments tables?
#They share no common columns

#Show the SQL that created the dept_manager table.
Show Create table dept_manager;

CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) 