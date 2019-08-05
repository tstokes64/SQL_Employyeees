
CREATE TABLE Employee (
  emp_no varchar(100) primary Key,
  birth_date date,
  first_name varchar(100),
  last_name varchar(100),
  gender varchar(10),
  hire_date date
);


CREATE TABLE Departments (
  Dept_no Varchar (100) primary key,
  Dept_name varchar(100)
);

CREATE TABLE Salaries (
  emp_no varchar(100),
  Salary Int,
  from_date date,
  to_date date, 
	foreign key (emp_no) references employee(emp_no)
);


CREATE TABLE Titles(
  emp_no varchar(100),
  title Varchar(100),
  from_date Date,
  to_date Date,
	foreign key (emp_no) references employee(emp_no)
);

CREATE TABLE department_manager (
  dept_no varchar(100),
  emp_no varchar(100),
  from_date date,
  to_date date,
	foreign key (dept_no) references Departments(dept_no),
	foreign key (emp_no) references employee(emp_no)
);

CREATE TABLE department_Employee (
  emp_no varchar(100),
  dept_no Varchar(100),
  from_date date,
  to_date date,
	foreign key (dept_no) references Departments(Dept_no),
	foreign key (emp_no) references employee(emp_no)
);


-- 1.)####DONE#### List the following details of each employee: employee number, last name, first name, gender, and salary.
select salary, last_name, first_name, gender
From Salaries inner join Employee
	on salaries.emp_no = Employee.emp_no

-- 2.)####DONE#### List employees who were hired in 1986.
Select first_name, last_name, hire_date
from Employee
where hire_date between '1986-01-01' and '1986-12-31'


-- 3.)####DONE#### List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
Select employee.emp_no, department_Employee.emp_no, department_Employee.from_date, department_Employee.to_date, employee.last_name, employee.first_name
	From Employee 
		inner join department_Employee
			on Employee.emp_no = department_Employee.emp_no

-- 4.)####DONE#### List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.
select last_name, first_name, emp_no, dept_name
	From Employee inner join department_Employee 
		on Employee.emp_no = department_Employee.emp_no
			inner join departments
				on departments_Employee.dept_no = departments.deprt_no
				
-- 5.)####DONE#### List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name
	from Employee 
		where first_name LIKE 'Hercules' and last_name LIKE 'B%'

-- 6.)####DONE#### List all employees in the Sales department, including their employee number, last name, first name, and department name.
select last_name, first_name, Employee.emp_no, dept_name 
	From Employee inner join department_Employee
		on Employee.emp_no = department_Employee.emp_no
		inner join Departments
			on department_employee.dept_no = departments.dept_no
	where dept_name = 'Sales' 

-- 7.)####DONE#### List all employees in the Sales and Development departments, including their 
--    employee number, last name, first name, and department name.
select last_name, first_name, Employee.emp_no, dept_name 
	From Employee inner join department_Employee 
		on employee.emp_no = department_employee.emp_no
			inner join Departments 
		on department_employee.dept_no = departments.dept_no
	where dept_name = 'Sales' or dept_name = 'Devlopment' 

-- 8.)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select last_name, count(last_name) from employee 
Group by last_name
Order by count(last_name) desc;

