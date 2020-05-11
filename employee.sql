CREATE TABLE departments (
dept_no VARCHAR NOT NULL, 
dept_name VARCHAR NOT NULL,
CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
emp_no INT NOT NULL,
dept_no VARCHAR NOT NULL
);

CREATE TABLE dept_manager (
dept_no VARCHAR NOT NULL,
emp_no INT NOT NULL
);

CREATE TABLE employees (
emp_no INT NOT NULL,
emp_title_id VARCHAR NOT NULL,
birth_date DATE NOT NULL,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
sex VARCHAR NOT NULL,
hire_date DATE NOT NULL,
CONSTRAINT pk_employees PRIMARY KEY (emp_no)
);

CREATE TABLE salaries (
emp_no INT NOT NULL,
salary INT NOT NULL
);

CREATE TABLE titles (
title_id VARCHAR NOT NULL,
title VARCHAR NOT NULL,
CONSTRAINT pk_titles PRIMARY KEY (title_id)
);


ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no)

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no)
REFERENCES departments (dept_no)

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no)

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no)
REFERENCES departments (dept_no)

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no)

ALTER TABLE employees ADD CONSTRAINT fk_employees_title_id FOREIGN KEY (emp_title_id)
REFERENCES titles (title_id)



SELECT * FROM departments
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM employees
SELECT * FROM salaries
SELECT * FROM titles

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01'

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no

SELECT last_name, first_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'

SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT (last_name) DESC