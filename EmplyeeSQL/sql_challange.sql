Create table employees(
emp_no INTEGER NOT NULL,
birth_date VARCHAR(30),
first_name varchar(20),
last_name  varchar(20),
gender  varchar(2),
hire_date  varchar(20),
PRIMARY KEY (emp_no));

select * from employees

Create table salaries (
emp_no int,
salary int ,
from_date  varchar(20),
to_date  varchar(20) ,
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

CREATE TABLE Titles (
emp_no int,
title varchar(2000),
from_date  varchar(2000),
to_date  varchar(2000) ,
foreign key (emp_no) REFERENCES employees(emp_no));

select * from titles


CREATE TABLE Departments(
dept_no varchar(20),
dept_name  varchar(20),
PRIMARY KEY (dept_no));
select * from Departments

create table Dept_emp(
emp_no int,
dept_no varchar(20),
from_date  varchar(20),
to_start  varchar(20),
foreign key (dept_no) REFERENCES Departments(dept_no),
foreign key (emp_no) REFERENCES employees(emp_no));

select * from dept_emp

Create Table Dept_manager (
dept_no varchar(20), 
emp_no int,
from_date  varchar(20),
to_date  varchar(20),
foreign key (dept_no) REFERENCES Departments(dept_no),
foreign key (emp_no) REFERENCES employees(emp_no));

select * from Dept_manager

--1 List the following details of each employee: employee number, last name, first name, gender, and salary

Select e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", e.gender as "Gender ", s.salary as "Salary"
from employees e
join salaries s on e.emp_no= s.emp_no

--2 List employees who were hired in 1986.
Select emp_no  as "Employee Number", first_name as "Last Name", last_name as "First Name", hire_date as "Hired Date in 1986" from employees 
where hire_date BETWEEN '1986-01-00' and '1986-12-00';

--3  List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
select dept.dept_no as "Department Number ",dept.dept_name as "Department Name", dm.emp_no as "Employee Number", e.last_name as "Last Name",e.first_name as "First Name", dm.to_date as "Start Date" , dm.from_date as "Employment Date" from departments dept
join dept_manager dm on dept.dept_no= dm.dept_no
join employees e on dm.emp_no = e.emp_no

-- 4 List the department of each employee with the following information: employee number, last name, 
--first name, and department name.

select e.emp_no as "Employee Number", e.last_name as "Last Name",  e.first_name as "First Name", dept.dept_name as "Department Name" from departments dept
join dept_emp de on dept.dept_no = de.dept_no
join employees e on de.emp_no = e.emp_no
group by dept.dept_name, e.emp_no


--5 List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name as "First name ", last_name as "Last Name" from employees 
where first_name = 'Hercules' 
and last_name LIKE  'B%'


-- 6 List all employees in the Sales department, including their employee number,last name, first name, and department name.
select e.emp_no as "Employee Number" ,e.last_name as "Last Name",e.first_name as "First Name", dept.dept_name as "Department Name" from employees e 
join dept_emp de on e.emp_no = de.emp_no
join departments dept on de.dept_no = dept.dept_no 
where dept.dept_name = 'Sales'


--7 List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select e.emp_no as "Employee Number" ,e.last_name as "Last Name",e.first_name as "First Name", dept.dept_name as "Department Name" from employees e 
join dept_emp de on e.emp_no = de.emp_no
join departments dept on de.dept_no = dept.dept_no 
where dept.dept_name = 'Development' 
or dept.dept_name = 'Sales'

--8 In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
select last_name as "Last Name", count(last_name) as "Total Count of Last Names" from employees 
group by last_name 
order by count(last_name) desc

