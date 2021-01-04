#1. USE your employees database.
Use employees;

#2. DESCRIBE each table and inspect the keys and see which columns have indexes and keys.
describe departments; #dept_no is PK, dept_name has Unique keys
describe dept_emp;#emp_no is PK, dept_no is also PK
describe dept_manager;#emp_no is PK, dept_no is also PK
describe employees;#emp_no is PK
describe employees_with_departments;#no keys
describe salaries;#emp_no is PK, from_date is PK
describe titles;#emp_no, title, from_date are all PKs