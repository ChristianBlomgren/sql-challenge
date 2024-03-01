--Data Engineering
------------------
--Creating tables for csv files
CREATE TABLE departments(
dept_no VARCHAR(10) NOT NULL,
dept_name VARCHAR(30) NOT NULL,
PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp(
emp_no VARCHAR(10) NOT NULL,
dept_no VARCHAR(10) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
dept_no VARCHAR(10) NOT NULL,
emp_no VARCHAR(10) NOT NULL,
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE employees(
emp_no INT,
emp_title_id VARCHAR(10) NOT NULL,
birth_date DATE,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
sex CHAR NOT NULL,
hire_date DATE,
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries(
emp_no VARCHAR(10) NOT NULL,
salary INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
title_id VARCHAR(10) NOT NULL,
title VARCHAR(20) NOT NULL,
PRIMARY KEY (title_id)
);

--Data Analysis
---------------
--No.1 emp_no, last_name, first_name, sex, salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salary.salary
FROM employees
JOIN salaries AS salary
	ON employees.emp_no = salary.emp_no;
	
--No.2 first_name, last_name, hire_date (In the year 1986)
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <'1987-01-01';

--No.3 department managers (dept_no, dept_name, emp_no, last_name, first_name)
SELECT dept_no.dept_no, dept_name.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_manager AS dept_no
	ON dept_no.emp_no = employees.emp_no 
JOIN departments AS dept_name
	ON dept_name.dept_no = dept_no.dept_no;

--No.4 dept_no, emp_no, last_name, first_name, dept_name
SELECT dept_no.dept_no, employees.emp_no, employees.last_name, employees.first_name, dept_name.dept_name
FROM employees
JOIN dept_emp AS dept_no
	ON dept_no.emp_no = employees.emp_no 
JOIN departments AS dept_name
	ON dept_name.dept_no = dept_no.dept_no;
	
--No.5 all employees with the first name 'Hercules' and last name starting with 'B'(first_name, last_name, sex)
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--No.6 employees in sales department (emp_no, last_name, first_name)
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_emp AS dept_no
	ON dept_no.emp_no = employees.emp_no 
JOIN departments AS dept_name
	ON dept_name.dept_no = dept_no.dept_no
WHERE dept_name = 'Sales';

--No.7 employees in sales and development departments (emp_no, last_name, first_name, dept_name)
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_name.dept_name
FROM employees
JOIN dept_emp AS dept_no
	ON dept_no.emp_no = employees.emp_no 
JOIN departments AS dept_name
	ON dept_name.dept_no = dept_no.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--No.8 frequency counts in descending order of all employee last names.
SELECT employees.last_name, COUNT('employees.last_name') AS "last_name_frequency"
FROM employees
GROUP BY last_name
Order BY last_name_frequency DESC;