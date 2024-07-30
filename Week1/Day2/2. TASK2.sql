/* Author - K. Dushyant Reddy */
/* GitHub Link - https://github.com/Dushyant029/Dushyant_Tasks */

/* Problem Statement*/
-- Employees Table
-- EmployeeID: INT, Primary Key
-- FirstName: VARCHAR(50), Not Null
-- LastName: VARCHAR(50), Not Null
-- Email: VARCHAR(100), Not Null, Unique
-- Salary: INT, Not Null
-- DepartmentID: INT
-- Departments Table

-- DepartmentID: INT, Primary Key
-- DepartmentName: VARCHAR(50), Not Null
-- Projects Table

-- ProjectID: INT, Primary Key
-- ProjectName: VARCHAR(100), Not Null
-- DepartmentID: INT, Foreign Key referencing Departments(DepartmentID)
-- Sample Data
-- Departments Table

-- DepartmentID: 1, DepartmentName: 'Marketing'
-- DepartmentID: 2, DepartmentName: 'Sales'
-- DepartmentID: 3, DepartmentName: 'IT'
-- DepartmentID: 4, DepartmentName: 'Finance'
-- DepartmentID: 5, DepartmentName: 'HR'
-- Employees Table

-- EmployeeID: 1, FirstName: 'John', LastName: 'Doe', Email: 'john.doe@company.com', Salary: 60000, DepartmentID: 1
-- EmployeeID: 2, FirstName: 'Jane', LastName: 'Smith', Email: 'jane.smith@company.com', Salary: 75000, DepartmentID: 2
-- EmployeeID: 3, FirstName: 'Michael', LastName: 'Johnson', Email: 'michael.johnson@company.com', Salary: 85000, DepartmentID: 1
-- EmployeeID: 4, FirstName: 'Emily', LastName: 'Williams', Email: 'emily.williams@company.com', Salary: 72000, DepartmentID: 3
-- EmployeeID: 5, FirstName: 'David', LastName: 'Brown', Email: 'david.brown@company.com', Salary: 65000, DepartmentID: 2
-- EmployeeID: 6, FirstName: 'Sarah', LastName: 'Davis', Email: 'sarah.davis@company.com', Salary: 90000, DepartmentID: 3
-- Projects Table

-- ProjectID: 1, ProjectName: 'Project A', DepartmentID: 1
-- ProjectID: 2, ProjectName: 'Project B', DepartmentID: 2
-- ProjectID: 3, ProjectName: 'Project C', DepartmentID: 3
-- ProjectID: 4, ProjectName: 'Project D', DepartmentID: 4
-- ProjectID: 5, ProjectName: 'Project E', DepartmentID: 5

-- Practice Questions
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

/* It will create the Table named Employees with Columns - EmployeeID, FirstName, LastName, Email, Salary, DepartmentID */
CREATE TABLE Employees(
	EmployeeID int PRIMARY KEY, 
    FirstName varchar(50) NOT NULL, 
	LastName varchar(50) NOT NULL,
    Email varchar(100) NOT NULL UNIQUE, 
    Salary int NOT NULL,
    DepartmentID INT
);

/* It will insert the data in the table*/
INSERT INTO Employees VALUES
	(1, 'John', 'Doe', 'john.doe@company.com', 60000, 1),
    (2, 'Jane', 'Smith', 'jane.smith@company.com', 75000, 2),
    (3, 'Michael', 'Johnson', 'michael.johnson@company.com', 85000, 1),
    (4, 'Emily', 'Williams', 'emily.williams@company.com', 72000, 3),
    (5, 'David', 'Brown', 'david.brown@company.com', 65000, 2),
    (6, 'Sarah', 'Davis', 'sarah.davis@company.com', 90000, 3);

/* It will create the Table named Departments with Columns - DepartmentID, DepartmentName */
CREATE TABLE Departments(
	DepartmentID int PRIMARY KEY,
    DepartmentName varchar(50) NOT NULL
);

/* It will insert the data in the table*/
INSERT INTO Departments VALUES
	(1, 'Marketing'),
    (2, 'Sales'),
    (3, 'IT'),
    (4, 'Finance'),
    (5, 'HR');

/* It will display all the records in the table */
SELECT * FROM Departments;

/* It will create the Table named Projects with Columns - ProjectID, ProjectName, DepartmentID */
CREATE TABLE Projects(
	ProjectID int PRIMARY KEY,
    ProjectName varchar(100) NOT NULL,
    DepartmentID int, FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Projects VALUES
	(1, 'Project A', 1),
    (2, 'Project B', 2),
    (3, 'Project C', 3),
    (4, 'Project D', 4),
    (5, 'Project E', 5);
    
/* It will display all the records in the table */
SELECT * FROM Projects;


/* 1. It will ensure that the salary of an employee is greater than 0 */
ALTER TABLE Employees ADD CHECK (Salary>0);
-- 6 row(s) affected Records: 6  Duplicates: 0  Warnings: 0

/* 2. It will create a foreign key constraint in the Employees table to reference the DepartmentID in the Departments table */
ALTER TABLE Employees ADD FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
-- 6 row(s) affected Records: 6  Duplicates: 0  Warnings: 0

/* 3. It will create a unique constraint on the Email column in the Employees table */
ALTER TABLE Employees ADD UNIQUE (Email);
-- 0 row(s) affected, 1 warning(s): 1831 Duplicate index 'Email_2' defined on the table 'rev.employees'. This is deprecated and will be disallowed in a future release. Records: 0  Duplicates: 0  Warnings: 1

/* 4. It will create a primary key constraint on the DepartmentID column in the Departments table*/
ALTER TABLE Departments ADD PRIMARY KEY (DepartmentID); 
-- Error Code: 1068. Multiple primary key defined

/* 5. It will create a foreign key constraint in the Projects table to reference the DepartmentID in the Departments table */
ALTER TABLE Projects ADD FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);
-- 5 row(s) affected Records: 5  Duplicates: 0  Warnings: 0

/* 6. It will insert a new employee with a DepartmentID that does not exist in the Departments table and observe the foreign key constraint violation. */
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary, DepartmentID) VALUES 
	(13, 'Dushyant', 'R', 'dushyantr@company.com', 100000, 2);
-- 1 row(s) affected

/* 7. It will try to insert a duplicate email address into the Employees table and observe the unique constraint violation */
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Salary) VALUES 
	(13, 'Dushyant', 'R', 'jane.smith@company.com', 100000);
-- Error Code: 1062. Duplicate entry 'jane.smith@company.com' for key 'employees.Email_Updt'

/* 8. It will delete a department from the Departments table that is being referenced by the Employees table and observe the foreign key constraint violation */
DELETE FROM Departments WHERE DepartmentID=2;
-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`rev`.`employees`, CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`))

/* 9. It will update the DepartmentID of an existing employee to a value that does not exist in the Departments table and observe the foreign key constraint violation */
UPDATE Employees SET DepartmentID=2 WHERE EmployeeID=1;
-- 1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0
