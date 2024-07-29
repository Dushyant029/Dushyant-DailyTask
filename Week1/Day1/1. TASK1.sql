/* Author - K. Dushyant Reddy */
/* GitHub Link - https://github.com/Dushyant029/Dushyant_Tasks */

/* Problem Statement*/
--  TASK 1;
-- Create a database with a table named students. 
-- The table has fields s_id (student ID), s_name (student name), and s_age (student age). 
-- Create the table and insert the following values: (1, "Ram", 21) and (2, "Shamam", 21). 
-- Write a SQL query to display all records present in the students table.


/* It will create the Database named Revature */
CREATE DATABASE Revature;

/* It will display the Databases which had created */
SHOW DATABASES;

/* It will use the database*/
USE Revature;

/* It will create the Table named Students with Columns - Student ID, Student Name and Student Age with its datatypes */
CREATE TABLE Students(s_id int primary key, s_name varchar(20), s_age varchar(10));

/* It will insert the data in the table*/
INSERT INTO Students VALUES(1,"RAM",21),(2,"SHAMAM",21);


/* It will display all the records in the table*/
SELECT * FROM Students;