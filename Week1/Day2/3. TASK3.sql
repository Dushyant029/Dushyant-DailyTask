/* Author - K. Dushyant Reddy */
/* GitHub Link - https://github.com/Dushyant029/Dushyant_Tasks */

/* Problem Statement*/
-- Tasks: 
-- - Select the first name, last name, and salary of the top 3 employees with the highest salaries.
-- - Select the first name, last name, and salary of the top 3 employees with the lowest salaries.
-- - Select the first name, last name, and salary of the employee with the 2nd highest salary.
-- - Select the first name, last name, and salary of the employee with the 2nd lowest salary.
-- - Select the first name, last name, and salary of the employee with the 3rd highest salary.
-- - Select the first name, last name, and salary of the employee with the 3rd lowest salary.
-- - Select the first name, last name, email, and salary of employees with a salary between 65000 and 80000, ordered by their first name in descending order, and limit the result to 3 rows.


/* 1.*/
SELECT FirstName, LastName, Salary from Employees ORDER BY Salary DESC LIMIT 3;

/* 2. */
SELECT FirstName, LastName, Salary from Employees ORDER BY Salary ASC LIMIT 3;

/* 3. */
SELECT FirstName, LastName, Salary from Employees ORDER BY Salary DESC LIMIT 1,1;

/* 4 */
SELECT FirstName, LastName, Salary from Employees ORDER BY Salary ASC LIMIT 1,1;

/* 5. */
SELECT FirstName, LastName, Salary from Employees ORDER BY Salary DESC LIMIT 2,1;

/* 6. */
SELECT FirstName, LastName, Salary from Employees ORDER BY Salary ASC LIMIT 2,1;

/* 7. */
SELECT FirstName, LastName, Email, Salary from Employees WHERE Salary BETWEEN 65000 AND 80000 ORDER BY FirstName DESC LIMIT 3;