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
