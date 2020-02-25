DROP DATABASE IF EXISTS `Employees_Datset`;
CREATE DATABASE  IF NOT EXISTS `Employees_Dataset`;
USE Employees_Dataset;

SELECT a.first_name, a.last_name, b.title, b.from_date, b.to_date
from Employees a
inner join Titles b on a.emp_no = b.emp_no;

SELECT a.first_name, a.last_name, a.gender, b.salary
from Employees a
inner join Salaries b on a.emp_no = b.emp_no
order by salary desc;

SELECT gender, avg(salary) as avg_salary
from Employees a
inner join Salaries b on a.emp_no = b.emp_no
group by gender;

select dept_name, first_name, last_name, from_date, to_date
from Employees a
inner join Dept_Emp b on a.emp_no = b.emp_no
inner join Departments c on c.dept_no = b.dept_no;

