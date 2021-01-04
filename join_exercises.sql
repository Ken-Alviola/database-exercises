#1. Use the join_example_db. Select all the records from both the users and roles tables.
use join_example_db;

#2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
select *
from roles 
join users on roles.id = users.role_id; #4 rows

select *
from roles 
left join users on roles.id = users.role_id; #5 rows, includes null values from roles table

select *
from roles 
right join users on roles.id = users.role_id;#6 rows, includes null values from users table

#3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

select roles.name, count(roles.name) as number_of_users
from roles 
left join users on roles.id = users.role_id
group by name;

#1. Use the employees database.
use employees;

#2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

/*
  Department Name    | Department Manager
 --------------------+--------------------
  Customer Service   | Yuchang Weedman
  Development        | Leon DasSarma
  Finance            | Isamu Legleitner
  Human Resources    | Karsten Sigstam
  Marketing          | Vishwani Minakawa
  Production         | Oscar Ghazalie
  Quality Management | Dung Pesch
  Research           | Hilary Kambil
  Sales              | Hauke Zhang
 */
 
 Select dept_name Department_Name , concat(employees.first_name,' ',employees.`last_name`) Department_Manager
 from departments
 join dept_manager using(`dept_no`)
 join employees using (emp_no)
 where dept_manager.to_date > curdate()
 order by dept_name;
 
#3. Find the name of all departments currently managed by women.

/*
Department Name | Manager Name
----------------+-----------------
Development     | Leon DasSarma
Finance         | Isamu Legleitner
Human Resources | Karsetn Sigstam
Research        | Hilary Kambil
*/
Select dept_name Department_Name , concat(employees.first_name,' ',employees.`last_name`) Department_Manager
 from departments
 join dept_manager using(`dept_no`)
 join employees using (emp_no)
 where dept_manager.to_date > curdate() and gender = 'F'
 order by dept_name;
 
 
#4 Find the current titles of employees currently working in the Customer Service department.

/*
Title              | Count
-------------------+------
Assistant Engineer |    68
Engineer           |   627
Manager            |     1
Senior Engineer    |  1790
Senior Staff       | 11268
Staff              |  3574
Technique Leader   |   241*/

select title, count(title)
from departments
join dept_emp using (dept_no)
join titles using (emp_no)
where dept_name = 'Customer Service' 
and titles.to_date > curdate()
group by title;

#5. Find the current salary of all current managers.

/*
Department Name    | Name              | Salary
-------------------+-------------------+-------
Customer Service   | Yuchang Weedman   |  58745
Development        | Leon DasSarma     |  74510
Finance            | Isamu Legleitner  |  83457
Human Resources    | Karsten Sigstam   |  65400
Marketing          | Vishwani Minakawa | 106491
Production         | Oscar Ghazalie    |  56654
Quality Management | Dung Pesch        |  72876
Research           | Hilary Kambil     |  79393
Sales              | Hauke Zhang       | 101987 */

 Select dept_name Department_Name , concat(employees.first_name,' ',employees.`last_name`) Department_Manager, Salary
 from departments
 join dept_manager using(`dept_no`)
 join employees using (emp_no)
 join salaries using (emp_no)
 where dept_manager.to_date > curdate()
 and salaries.to_date > curdate()
 order by dept_name;
 

#6. Find the number of current employees in each department.

/*
+---------+--------------------+---------------+
| dept_no | dept_name          | num_employees |
+---------+--------------------+---------------+
| d001    | Marketing          | 14842         |
| d002    | Finance            | 12437         |
| d003    | Human Resources    | 12898         |
| d004    | Production         | 53304         |
| d005    | Development        | 61386         |
| d006    | Quality Management | 14546         |
| d007    | Sales              | 37701         |
| d008    | Research           | 15441         |
| d009    | Customer Service   | 17569         |
+---------+--------------------+---------------+*/

select dept_no, dept_name, count(*)
from departments
join dept_emp using (dept_no)
where dept_emp.to_date > curdate()
group by dept_no;

#7 Which department has the highest average salary? Hint: Use current not historic information.

/*
+-----------+----------------+
| dept_name | average_salary |
+-----------+----------------+
| Sales     | 88852.9695     |
+-----------+----------------+*/

select dept_name, avg(salary) as average_salary
from departments
join dept_emp using (dept_no)
join salaries using (emp_no)
where salaries.to_date > curdate()
and dept_emp.to_date > curdate()
group by dept_name
order by average_salary DESC
limit 1;

#8. Who is the highest paid employee in the Marketing department?

/*
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Akemi      | Warwick   |
+------------+-----------+*/
select first_name, last_name, max(salary)
from departments
join dept_emp using (dept_no)
join employees using (emp_no)
join salaries using (emp_no)
where dept_emp.to_date > curdate()
and salaries.to_date > curdate()
and dept_name = 'Marketing'
group by emp_no
order by max(salary) DESC
limit 1;

#9. Which current department manager has the highest salary?

/*
+------------+-----------+--------+-----------+
| first_name | last_name | salary | dept_name |
+------------+-----------+--------+-----------+
| Vishwani   | Minakawa  | 106491 | Marketing |
+------------+-----------+--------+-----------+*/
Select dept_name Department_Name , concat(employees.first_name,' ',employees.`last_name`) Department_Manager, Salary
 from departments
 join dept_manager using(`dept_no`)
 join employees using (emp_no)
 join salaries using (emp_no)
 where dept_manager.to_date > curdate()
 and salaries.to_date > curdate()
 order by salary desc
 limit 1;
 

#10. Bonus Find the names of all current employees, their department name, and their current manager's name.

/*
240,124 Rows

Employee Name | Department Name  |  Manager Name
--------------|------------------|-----------------
 Huan Lortz   | Customer Service | Yuchang Weedman */
 Select concat(employees.first_name,' ',employees.`last_name`) as employee_name, dept_name, dept_manager.emp_no
from departments
join dept_emp using (dept_no)
join dept_manager using (emp_no)
join employees using (emp_no); #needs work on using correct joins





#11. Bonus Who is the highest paid employee within each department.
select dept_name, first_name, last_name, dept_name, max(salary)
from departments
join dept_emp using (dept_no)
join employees using (emp_no)
join salaries using (emp_no)
where dept_emp.to_date > curdate()
and salaries.to_date > curdate()
group by emp_no, dept_name, salary
having max(salary)
order by dept_name, max(salary) DESC;#needs more work on selecting the max salary for each deparment