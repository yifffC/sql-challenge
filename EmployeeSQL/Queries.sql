--Data Analysis #1
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, salaries.salary
FROM employees e
JOIN salaries ON e.emp_no = salaries.emp_no;

--Data Analysis #2
--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date LIKE '%1986';

--Data Analysis #3
--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name
FROM departments d
LEFT JOIN managers m ON m.dept_no = d.dept_no
LEFT JOIN employees e ON m.emp_no = e.emp_no;

--Data Analysis #4
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
LEFT JOIN department_employee de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no;

--Data Analysis #5
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--Data Analysis #6
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp_dept.emp_no, emp_dept.first_name, emp_dept.last_name, emp_dept.dept_name FROM (
	SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
	FROM employees e
	LEFT JOIN department_employee de ON e.emp_no = de.emp_no
	LEFT JOIN departments d ON de.dept_no = d.dept_no)
	AS emp_dept
WHERE emp_dept.dept_name = 'Sales';

--Data Analysis #7
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_dept.emp_no, emp_dept.first_name, emp_dept.last_name, emp_dept.dept_name FROM (
	SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
	FROM employees e
	LEFT JOIN department_employee de ON e.emp_no = de.emp_no
	LEFT JOIN departments d ON de.dept_no = d.dept_no)
	AS emp_dept
WHERE emp_dept.dept_name = 'Sales' OR emp_dept.dept_name = 'Development';

--Data Analysis #8
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(1) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC