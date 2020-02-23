use Week2_lab;

SELECT a.first_name, a.last_name, b.title, b.from_date, b.to_date
from employees a
inner join titles b on a.emp_no = b.emp_no;

SELECT a.first_name, a.last_name, a.gender, b.salary
from employees a
inner join salaries b on a.emp_no = b.emp_no
order by salary desc;

SELECT gender, avg(salary) as avg_salary
from employees a
inner join salaries b on a.emp_no = b.emp_no
group by gender;

select dept_name, first_name, last_name, from_date, to_date
from employees a
inner join dept_emp b on a.emp_no = b.emp_no
inner join departments c on c.dept_no = b.dept_no;

