-- TABLE SCHEMATAS
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

-- 1. List: employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name,  employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

-- 2. List: first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List: manager of each department along with their department number,
--department name, employee number, last name, and first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4. List: department number for each employee along with that employee’s employee number,
-- last name, first name, and department name
SELECT departments.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no;

-- 5. List: first name, last name, and sex of each
-- employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List: each employee in the Sales department,
-- including their employee number, last name, and first name
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
WHERE dept_no = 'd007';

-- 7. List: each employee in the Sales and Development departments,
-- including their employee number, last name, first name, and department name
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

-- 8. List: frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;