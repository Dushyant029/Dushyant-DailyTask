/* Author - K. Dushyant Reddy */

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