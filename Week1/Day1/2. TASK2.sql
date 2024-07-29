/* Author - K. Dushyant Reddy */
/* GitHub Link - https://github.com/Dushyant029/Dushyant_Tasks */

/* Problem Statement*/
-- 1. Create a Database and Tables
--    - Create a new database called `school_management`.
--    - Within the `school_management` database, create the following tables:
--      - `students` (student_id, first_name, last_name, email, phone_number, date_of_birth)
--      - `courses` (course_id, course_name, course_description, credits)
 
-- 2. Modify Table Structure
--    - Add a new column `grade` (VARCHAR(2)) to the `students` table.
--    - Change the data type of the `phone_number` column in the `students` table to VARCHAR(15).
 
-- 3. Insert Data into Tables
--    - Insert at least 3 records into the `students` table.
--    - Insert at least 5 records into the `courses` table.
 
-- 4. Query Data
--    - Write a SELECT statement to retrieve all students' first names, last names, and email addresses.
 
-- 6. Drop Objects
--    - Drop the `students` table from the `school_management` database.
--    - Drop the `school_management` database


/* It will create the Database named school_management */
CREATE DATABASE school_management;

/* It will use the database*/
USE school_management;

/* It will create the Table named students with Columns - student_id, first_name, last_name, email, phone_number, date_of_birth with its datatypes */
CREATE TABLE students(
	student_id int primary key,
    first_name varchar(20),
    last_name varchar(10),
    email varchar(40),
    phone_number int, 
    date_of_birth date
);

/* It will create the Table named courses with Columns - course_id, course_name, course_description, credits with its datatypes */
CREATE TABLE courses(
	course_id int primary key,
    course_name varchar(20), 
    course_description varchar(50),
    credits int
);

/* It will add new column grade to the students table*/
ALTER TABLE students ADD grade varchar(2);

/* It will change the datatype of phone_number from int to varchar(15) of students table*/
ALTER TABLE students MODIFY COLUMN phone_number varchar(15);

/* It will insert the data in the students table */
INSERT INTO students VALUES
	(1, "RAMU","ANANT","ramua@revature.com","7984651320","2005-01-01","A"),
	(2, "RAJU","BNANT","rajub@revature.com","7412589630","2004-02-20","B"),
    (3, "KAJU","CNANT","rajuc@revature.com","9632587410","2003-03-15","C"),
    (4, "SAJU","DNANT","sajud@revature.com","1478523690","2002-04-06","D"),
    (5, "LAJU","ENANT","lajue@revature.com","1236547892","2001-05-13","E");
    
/* It will display all the records of students in the table */
SELECT * FROM students;

/* It will insert the data in the courses table */
INSERT INTO courses VALUES 
	(1,"Computer Science","It is a study of softwares",10),
    (2,"Maths","It is a study of theories and theorems",6),
    (3,"English","It is a foreign language",9),
    (4,"DSA","It is a study of algorithms",12),
    (5,"Cloud Computing","It is a study of delivering the services",15);

/* It will display all the records of courses in the table */
SELECT * FROM courses;
    
/* It will display the students' first names, last names, and email addresses */
SELECT first_name, last_name, email FROM students;

/* It will drop the students table */
DROP TABLE students;

/* It will drop the school management database */
DROP DATABASE school_management;