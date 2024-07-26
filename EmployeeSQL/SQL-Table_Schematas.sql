CREATE TABLE departments (
    dept_no VARCHAR(20) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(20) NOT NULL);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no VARCHAR(20) NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

CREATE TABLE dept_manager (
    dept_no VARCHAR(20) NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no));

CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(20) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(10),
    hire_date DATE);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary INT NOT NULL);

CREATE TABLE titles (
    emp_title_id VARCHAR(20) NOT NULL,
    title VARCHAR(20) NOT NULL);