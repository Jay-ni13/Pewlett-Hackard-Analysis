-- Deliverable 1
-- Retrieve the employee number, name, and title of all current employees
-- who are elegible for retirement
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Remove duplicate rows to show current title of retiring employees
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;

-- Retrieve the number of retiring titles
SELECT COUNT(ut.emp_no) AS "count", ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2
-- Retrieve the employee number, name, and title of all current employees born
-- in 1965 who would be elegible for a mentorship program.
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	ed.from_date, ed.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN employee_dept AS ed
		ON e.emp_no = ed.emp_no
	INNER JOIN titles AS t
		ON e.emp_no = t.emp_no
	WHERE (t.to_date = '9999-01-01')
		AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;

-- Supplemental
-- Retrieve retiring count by department.
SELECT COUNT(ut.emp_no) AS "count_r", ed.dept_no, d.dept_name
INTO retire_count_dept
FROM unique_titles AS ut
	INNER JOIN employee_dept AS ed
		ON ut.emp_no = ed.emp_no
	INNER JOIN departments AS d
		ON ed.dept_no = d.dept_no
	WHERE ed.to_date = '9999-01-01'
GROUP BY ed.dept_no, d.dept_name
ORDER BY count_r DESC;

SELECT * FROM retire_count_dept;

-- Retirement counts by year
SELECT COUNT (e.emp_no) AS "count_year_1"
FROM employees AS e
INNER JOIN employee_dept AS ed
ON e.emp_no = ed.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1952-12-31')
AND ed.to_date = '9999-01-01'
ORDER BY count_year_1;

SELECT COUNT (e.emp_no) AS "count_year_2"
FROM employees AS e
INNER JOIN employee_dept AS ed
ON e.emp_no = ed.emp_no
WHERE (e.birth_date BETWEEN '1953-01-01' AND '1953-12-31')
AND ed.to_date = '9999-01-01'
ORDER BY count_year_2;

SELECT COUNT (e.emp_no) AS "count_year_3"
FROM employees AS e
INNER JOIN employee_dept AS ed
ON e.emp_no = ed.emp_no
WHERE (e.birth_date BETWEEN '1954-01-01' AND '1954-12-31')
AND ed.to_date = '9999-01-01'
ORDER BY count_year_3;

SELECT COUNT (e.emp_no) AS "count_year_4"
FROM employees AS e
INNER JOIN employee_dept AS ed
ON e.emp_no = ed.emp_no
WHERE (e.birth_date BETWEEN '1955-01-01' AND '1955-12-31')
AND ed.to_date = '9999-01-01'
ORDER BY count_year_4;

-- Eligible mentors by dept
SELECT COUNT (me.emp_no) AS "count_m", ed.dept_no, d.dept_name
INTO mentorship_by_dept
FROM mentorship_eligibility AS me
	INNER JOIN employee_dept AS ed
		ON me.emp_no = ed.emp_no
	INNER JOIN departments AS d
		ON ed.dept_no = d.dept_no
	WHERE (ed.to_date = '9999-01-01')
GROUP BY ed.dept_no, d.dept_name
ORDER BY count_m DESC;

SELECT * FROM mentorship_by_dept;