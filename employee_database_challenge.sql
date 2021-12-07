-- DELIVERABLE ONE --
-- Retrieve emp_no, first_name, and last_name from Employees file
SELECT emp_no, first_name, last_name
FROM employees;
 -- Retrieve titles, from_date, to_date from Titles
 SELECT title, from_date, to_date
 FROM titles;
 
 -- Use INTO clause to create a new table
 -- Filter employees by birth year. order by emp_no
 Select emp.emp_no, 
 emp.first_name, 
 emp.last_name, 
 emp.birth_date, 
 tt.title,
 tt.from_date,
 tt.to_date
 INTO retirement_titles
 FROM titles AS tt
 JOIN employees as emp
 ON (tt.emp_no = emp.emp_no)
 WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
 ORDER BY tt.emp_no asc, from_date desc
 
 -- use select to retrieve emp_no, first name, and last name from retirement titles
 SELECT emp_no, first_name, last_name
 FROM retirement_titles
 
 --use distinct on to create a new table to remove duplicate entires
 SELECT DISTINCT ON (emp_no) emp_no, 
first_name, last_name,
title, from_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no asc, from_date desc;
select * from unique_titles

-- use count function to create a table for retiring titles
select count(utt.title) as "title_count",
title
into retiring_titles 
from unique_titles as utt
group by utt.title
order by title_count desc;

select * from retiring_titles


-- DELIVERABLE TWO -- 
-- retrieve emp_no, first_name, last_name, and birth_date from employees table
SELECT emp_no, 
first_name, 
last_name,
birth_date 
from employees
-- retrieve from_date, to_date form dept_emp table
SELECT from_date, 
to_date
from dept_emp
--retrieve title from titles table
select title 
from titles
-- USE DISTINCT ON FUNCTION 
select distinct on (e.emp_no) e.emp_no, e.first_name,
e.last_name, e.birth_date, 
de.from_date, de.to_date
into mentorship_eligibility
from employees
inner join dept_emp as de
on e.emp_no = de.emp_no
inner join titles as tt
on e.emp_no = t.emp_no 
where (e.birth_date between '1965-01-01 and 1965-12-31')
and (de.to_date = '9999-01-01')
order by e.emp_no;


