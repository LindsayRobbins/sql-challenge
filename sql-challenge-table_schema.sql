DROP TABLE IF EXISTS titles;

--CREATE THE TABLE for titles
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

SELECT * FROM titles

DROP TABLE IF EXISTS employees CASCADE;

--CREATE THE TABLE for employees
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR,
	bith_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

SELECT * FROM employees

DROP TABLE IF EXISTS departments;

--CREATE THE TABLE for departments
CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR

);

SELECT * FROM departments

DROP TABLE IF EXISTS dept_manager CASCADE;

--CREATE THE TABLE for dept_manager
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT,		
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),	
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_manager;

DROP TABLE IF EXISTS dept_emp CASCADE;

--CREATE THE TABLE for dept_emp
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_emp

DROP TABLE IF EXISTS salaries CASCADE;

--CREATE THE TABLE for salaries
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries