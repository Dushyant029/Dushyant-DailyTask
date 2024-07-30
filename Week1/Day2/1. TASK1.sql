/* Author - K. Dushyant Reddy */
/* GitHub Link - https://github.com/Dushyant029/Dushyant_Tasks */

/* Problem Statement*/
-- ### Table Details
-- **Table Name:** Employees
-- **Columns:**
-- - **EmployeeID:** INT, Primary Key
-- - **FirstName:** VARCHAR(50), Not Null
-- - **LastName:** VARCHAR(50), Not Null
-- - **Email:** VARCHAR(100), Not Null
-- - **Salary:** INT, Not Null
-- - **Department:** VARCHAR(50)

-- ### Sample Records
-- **Employees Table**
-- - EmployeeID: 1, FirstName: 'John', LastName: 'Doe', Email: 'john.doe@company.com', Salary: 60000, Department: 'Marketing'
-- - EmployeeID: 2, FirstName: 'Jane', LastName: 'Smith', Email: 'jane.smith@company.com', Salary: 75000, Department: 'Sales'
-- - EmployeeID: 3, FirstName: 'Michael', LastName: 'Johnson', Email: 'michael.johnson@company.com', Salary: 85000, Department: 'Marketing'
-- - EmployeeID: 4, FirstName: 'Emily', LastName: 'Williams', Email: 'emily.williams@company.com', Salary: 72000, Department: 'IT'
-- - EmployeeID: 5, FirstName: 'David', LastName: 'Brown', Email: 'david.brown@company.com', Salary: 65000, Department: 'Sales'
-- - EmployeeID: 6, FirstName: 'Sarah', LastName: 'Davis', Email: 'sarah.davis@company.com', Salary: 90000, Department: 'IT'
-- - EmployeeID: 7, FirstName: 'Robert', LastName: 'Miller', Email: 'robert.miller@company.com', Salary: 70000, Department: 'Finance'
-- - EmployeeID: 8, FirstName: 'Jessica', LastName: 'Wilson', Email: 'jessica.wilson@company.com', Salary: 65000, Department: 'Finance'
-- - EmployeeID: 9, FirstName: 'Daniel', LastName: 'Anderson', Email: 'daniel.anderson@company.com', Salary: 72000, Department: 'IT'
-- - EmployeeID: 10, FirstName: 'Ashley', LastName: 'Taylor', Email: 'ashley.taylor@company.com', Salary: 58000, Department: 'Sales'
-- - EmployeeID: 11, FirstName: 'William', LastName: 'Brown', Email: 'william.brown@company.com', Salary: 78000, Department: 'Marketing'
-- - EmployeeID: 12, FirstName: 'Sophia', LastName: 'Davis', Email: 'sophia.davis@company.com', Salary: 62000, Department: 'HR'


-- ### Practice Questions for Constraints, Primary Key, and Foreign Key
-- 1. Create a constraint to ensure that the salary of an employee is greater than 0.
-- 2. Create a foreign key constraint in the Employees table to reference the DepartmentID in the Departments table.
-- 3. Create a unique constraint on the Email column in the Employees table.
-- 4. Create a primary key constraint on the DepartmentID column in the Departments table.
-- 5. Create a foreign key constraint in the Projects table to reference the DepartmentID in the Departments table.
-- 6. Insert a new employee with a DepartmentID that does not exist in the Departments table and observe the foreign key constraint violation.
-- 7. Attempt to insert a duplicate email address into the Employees table and observe the unique constraint violation.
-- 8. Delete a department from the Departments table that is being referenced by the Employees table and observe the foreign key constraint violation.
-- 9. Update the DepartmentID of an existing employee to a value that does not exist in the Departments table and observe the foreign key constraint violation.



/* It will use the database*/
USE Revature;

/* It will create the Table named Employees with Columns - EmployeeID, FirstName, LastName, Email, Salary, Department */
CREATE TABLE Employees(
	EmployeeID int PRIMARY KEY, 
    FirstName varchar(50) NOT NULL, 
	LastName varchar(50) NOT NULL,
    Email varchar(100) NOT NULL, 
    Salary int NOT NULL,
    Department varchar(50)
);

/* It will insert the data in the table*/
INSERT INTO Employees VALUES
	(1, 'John', 'Doe', 'john.doe@company.com', 60000, 'Marketing'),
    (2, 'Jane', 'Smith','jane.smith@company.com', 75000, 'Sales'),
    (3, 'Michael','Johnson', 'michael.johnson@company.com', 85000, 'Marketing'),
    (4, 'Emily', 'Williams','emily.williams@company.com',  72000, 'IT'),
    (5, 'David', 'Brown', 'david.brown@company.com', 65000, 'Sales'),
    (6, 'Sarah', 'Davis', 'sarah.davis@company.com', 90000, 'IT'),
    (7, 'Robert', 'Miller','robert.miller@company.com', 70000, 'Finance'),
    (8, 'Jessica', 'Wilson','jessica.wilson@company.com', 65000, 'Finance'),
    (9, 'Daniel', 'Anderson','daniel.anderson@company.com', 72000, 'IT'),
    (10, 'Ashley', 'Taylor','ashley.taylor@company.com', 58000, 'Sales'),
    (11, 'William', 'Brown', 'william.brown@company.com', 78000, 'Marketing'),
    (12, 'Sophia', 'Davis','sophia.davis@company.com', 62000, 'HR');
    
/* It will display all the records in the table */
SELECT * FROM Employees;

/* It will create the Table named Departments with Columns - DepartmentID, DepartmentName */
CREATE TABLE Departments(
	DepartmentID int PRIMARY KEY,
    DepartmentName varchar(50) NOT NULL
);

/* It will display all the records in the table */
SELECT * FROM Departments;

/* It will create the Table named Projects with Columns - ProjectID, ProjectName, DepartmentID */
CREATE TABLE Projects(
	ProjectID int PRIMARY KEY,
    ProjectName varchar(100) NOT NULL,
    DepartmentID int, FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

/* It will display all the records in the table */
SELECT * FROM Projects;


/* 1. It will ensure that the salary of an employee is greater than 0 */
ALTER TABLE Employees ADD CHECK (Salary>0);
-- 12 row(s) affected Records: 12  Duplicates: 0  Warnings: 0	0.078 sec

/* 2. It will create a foreign key constraint in the Employees table to reference the DepartmentID in the Departments table */
ALTER TABLE Employees ADD FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
-- Error Code: 1072. Key column 'DepartmentID' doesn't exist in table	0.000 sec

/* 3. It will create a unique constraint on the Email column in the Employees table */
ALTER TABLE Employees ADD UNIQUE (Email);
-- 0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0 

/* 4. It will create a primary key constraint on the DepartmentID column in the Departments table*/
ALTER TABLE Departments ADD PRIMARY KEY (DepartmentID); 
-- Error Code: 1068. Multiple primary key defined

/* 5. It will create a foreign key constraint in the Projects table to reference the DepartmentID in the Departments table */
ALTER TABLE Projects ADD FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
-- 0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0

/* 6. It will insert a new employee with a DepartmentID that does not exist in the Departments table and observe the foreign key constraint violation. */
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID) VALUES 
	(13, 'Dushyant', 'R', 'dushyantr@company.com', 100000, 2);
-- Error Code: 1054. Unknown column 'DepartmentID' in 'field list'

/* 7. It will try to insert a duplicate email address into the Employees table and observe the unique constraint violation */
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary) VALUES 
	(13, 'Dushyant', 'R', 'jane.smith@company.com', 100000);
-- Error Code: 1062. Duplicate entry 'jane.smith@company.com' for key 'employees.Email_Updt'

/* 8. It will delete a department from the Departments table that is being referenced by the Employees table and observe the foreign key constraint violation */
DELETE FROM Departments WHERE DepartmentID=2;
-- 0 row(s) returned

/* 9. It will update the DepartmentID of an existing employee to a value that does not exist in the Departments table and observe the foreign key constraint violation */
UPDATE Employees SET DepartmentID=2 WHERE EmployeeID=1; 
-- 0 row(s) affected

    