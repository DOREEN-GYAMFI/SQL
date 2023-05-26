-- 1. Display the content of the employees table
USE megafirm_emo_db;

SELECT *
FROM employees;

-- 2. display the content of the departments table.
SELECT *
FROM departments;

-- 3. Write a simple SQL query to display the last name, job code, hire date and employee number for  each employee.
SELECT employee_id, last_name, job_id, hire_date 
FROM employees;

-- 4. Write a simple SQL query to display the department id and department name for each department
SELECT department_id, department_name
FROM departments;

-- 5. Create a query that displays the last name and salary of employees earning more than £45,000.
SELECT last_name, salary
FROM employees
WHERE salary > 45000 ;

-- 6. Modify this query to display the last name and salary for all employees whose salary is not in the range of £47,000 to £57,000.
SELECT last_name, salary
FROM employees
WHERE salary  NOT IN (salary BETWEEN 47000 AND 57,000);

-- 7. Create a query that displays the last name, hire date and department id of employees called Matos
SELECT last_name, hire_date, department_id
FROM employees
where last_name = 'Matos';

-- 8. Create a query that displays the last name, hire date and salary of employees hired after 1st January 2016.
SELECT last_name, hire_date, salary
FROM employees
where hire_date > 2016-01-01;

-- 9. Create a report to display the last name, job ID, and start date for the employees with the last 
-- names of Matos and Taylor. Order the query in ascending order by start date
SELECT last_name, job_id, hire_date
FROM employees
WHERE Last_name = 'Matos' OR 'Taylor' ;


-- 10.Create a query to list the last name, salary and department ids for employees who earn between 
-- £37,000 and £57,000 and are in department 20 or 40. Label the columns Employee and Annual 
-- Salary, respectively.
SELECT last_name, salary, department_id
FROM employees
where salary between 37000 AND 57000
AND department_id IN (20,40) ;


-- 11.Create a query to list the last name, job id, hire date and salary of employees who work in 
-- department 40 and who earn more than 41000 as well as those who work in the same department 
-- and were hired before the 15th February 2016
SELECT last_name, job_id, hire_date, salary
FROM employees
WHERE department_id = 40
  AND (salary > 41000 OR hire_date < '2016-02-15');
  
-- 12.Create a query to display all employee last names in which the third letter of the name is “a”.
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';

-- 13.Create a query to display the last name of all employees who have both an a and an e in their last name
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';

-- 14.Create a query that displays the last name and hire date for all employees who were hired in 2014.
SELECT last_name, hire_date
FROM employees
Where Hire_date between '2013-12-31' AND '2015-01-01';

-- 15.Create a query to display the last name, job id, and salary for all employees whose job id is 902 or 
-- 903 and whose salary is not equal to £35000, £41000, or £51000.
SELECT last_name,job_id,salary
FROM employees
where job_id = 902 OR job_id = 903
AND salary NOT IN (35000, 41000, 51000) ;

-- 16.Create a query to display the last name, job id, salary, hire date for all employees for which, either 
-- their job id is 909 or 911 and their salary is less than 45000, or they were hired before 3rd March 
-- 2017 and their last names contains the letter ‘o’ as the one letter before last

SELECT last_name,job_id,salary,hire_date
FROM employees
WHERE job_id IN (909, 911)
		AND salary < 45000 OR hire_date < '2017-03-03'
        AND last_name like '%o_';


