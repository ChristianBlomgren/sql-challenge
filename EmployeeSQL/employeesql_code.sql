DROP TABLE departments;

--Creating tables for csv files
CREATE TABLE departments(
dept_no VARCHAR(10) NOT NULL,
dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE dept_emp(
emp_no VARCHAR(10) NOT NULL,
dept_no VARCHAR(10) NOT NULL
);

CREATE TABLE dept_manager(
dept_no VARCHAR(10) NOT NULL,
emp_no VARCHAR(10) NOT NULL
);

CREATE TABLE employees(
emp_no VARCHAR(10) NOT NULL,
emp_title_id VARCHAR(10) NOT NULL,
birth_date DATE,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
sex CHAR NOT NULL,
hire_date DATE
);

CREATE TABLE salaries(
emp_no VARCHAR(10) NOT NULL,
salary VARCHAR(6) NOT NULL	
);

CREATE TABLE titles(
title_id VARCHAR(10) NOT NULL,
title VARCHAR(20) NOT NULL
);

--Adding smaller dataset via console so that
--quotations could be removed to prevent
--joining errors
INSERT INTO departments(dept_no, dept_name)
VALUES('d001','Marketing'),
('d002','Finance'),
('d003','Human Resources'),
('d004','Production'),
('d005','Development'),
('d006','Quality Management'),
('d007','Sales'),
('d008','Research'),
('d009','Customer Service');
	
SELECT * FROM titles