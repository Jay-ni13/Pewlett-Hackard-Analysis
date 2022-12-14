SELECT * FROM salaries;

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

DROP TABLE titles CASCADE;

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Retirement table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and department_mngr tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN department_mngr as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and employee_dept tables
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    ed.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN employee_dept as ed
ON ri.emp_no = ed.emp_no
WHERE ed.to_date = ('9999-01-01');

SELECT * FROM current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), ed.dept_no
INTO dept_retirement
FROM current_emp as ce
LEFT JOIN employee_dept as ed
ON ce.emp_no = ed.emp_no
GROUP BY ed.dept_no
ORDER BY ed.dept_no;

-- Employee information table
SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.gender,
	s.salary,
	ed.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN employee_dept as ed
ON (e.emp_no = ed.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (ed.to_date = '9999-01-01');

-- List of managers per department
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM department_mngr AS dm
	INNER JOIN departments AS d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN current_emp AS ce
		ON (dm.emp_no = ce.emp_no);
		
-- Department retirees
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp AS ce
	INNER JOIN employee_dept AS ed
		ON (ce.emp_no = ed.emp_no)
	INNER JOIN departments AS d
		ON (ed.dept_no = d.dept_no);
		
-- Sales department retirees
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
INTO sales_dept
FROM retirement_info AS ri
	INNER JOIN employee_dept AS ed
		ON (ri.emp_no = ed.emp_no)
	INNER JOIN departments AS d
		ON (ed.dept_no = d.dept_no)
	WHERE (ed.to_date = '9999-01-01')
 		AND (d.dept_no = 'd007');
		
-- Sales and Development department retirees
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
INTO sales_and_dev_depts
FROM retirement_info AS ri
	INNER JOIN employee_dept AS ed
		ON (ri.emp_no = ed.emp_no)
	INNER JOIN departments AS d
		ON (ed.dept_no = d.dept_no)
	WHERE (ed.to_date = '9999-01-01')
 		AND (d.dept_no IN ('d005', 'd007'));
