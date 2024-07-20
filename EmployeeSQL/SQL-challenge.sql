CREATE TABLE departments(
	dept_id INT PRIMARY KEY,
	dept_no VARCHAR,
	dept_name VARCHAR);

CREATE TABLE dept_emp(
	dept_id INT PRIMARY KEY,
	emp_no INT,
	dept_no VARCHAR);

CREATE TABLE dept_manager(
	dept_id INT PRIMARY KEY,
	dept_no	VARCHAR,
	emp_no INT);

CREATE TABLE employees(
	dept_id INT PRIMARY KEY,
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE);

CREATE TABLE salaries(
	dept_id INT PRIMARY KEY,
	emp_no INT,
	salary INT);

CREATE TABLE titles(
	dept_id INT PRIMARY KEY,
	title_id VARCHAR,
	title VARCHAR);