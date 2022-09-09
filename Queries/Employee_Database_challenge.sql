-- Deliverable 1:  the number of retiring employees by title

-- 1. retirement_title table for employees who are born bet. 1/1/1995 and 12/21/1955

SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date

INTO retirement_titles
FROM employees as e
LEFT JOIN  titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
ORDER BY e.emp_no ASC;

SELECT * FROM retirement_titles;


-- 2. unique_titles table: use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
 
INTO unique_titles
FROM retirement_titles as rt
WHERE (to_date = '9999-01-01')
ORDER BY rt.emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;


-- 3. retiring_titles table: retrieve the numbers of employees by their most recent job title

SELECT COUNT(ut.title) AS "count",
	ut.title

INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY count DESC;

SELECT * FROM retiring_titles;


-- Deliverable 2: the employees eligible for the mentorship program

SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name,
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title

INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;