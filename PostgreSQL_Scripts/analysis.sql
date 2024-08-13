-- Scripts for data analysis, be sure to run each section one at a time.


-- Employee number, last name, first name, gender, and salary
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
left join salaries as s
on (e.emp_no = s.emp_no)
order by s.salary desc

-- First name, last name, hire date for all employees hired in the year 1986
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date

-- Manager of each department with department number, name, employee number,
-- last name followed by first name
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
from dept_manager as dm
inner join departments as d
on (dm.dept_no = d.dept_no)
inner join employees as e
on (dm.emp_no = e.emp_no)

-- The department number for each employee along with their employee number, last name
-- first name, and department name
select d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no)
order by e.emp_no

-- First name, last name, gender of employees with the first name Hercules and whose last name
-- begins with B
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'

-- Each employee in the sales department, employee number, last name, followed by first name
select e.emp_no, e.last_name, e.first_name
from employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no)
where d.dept_name = 'Sales'
order by e.emp_no

-- Each employee in the Sales and Development departments, including their employee number, last name
-- followed by their first, and department name
select e.emp_no, e.first_name, e.last_name, d.dept_name
from employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join departments as d
on (de.dept_no = d.dept_no)
where d.dept_name in ('Sales', 'Development')
order by e.emp_no

-- How often employees share each last name.
select last_name, count(last_name) as "Number of Occurences"
from employees
group by last_name
order by "Number of Occurences" desc