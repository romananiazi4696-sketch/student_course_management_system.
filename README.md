
# Student Course Management System:


A relational database project built using **MariaDB and SQL** to manage students, courses, and course enrollments.
This project was created as a practical Database Systems project to apply the SQL and database concepts I have been learning through hands-on practice.

---

## 📌 Project Overview:


The **Student Course Management System** organizes information about students, available courses, and student enrollments.

The database contains three main tables:

- **Student** – stores student information
- **Course** – stores course information
- **Enrollment** – records which students are enrolled in which courses

The main focus of this project was to understand how related data is structured, connected, queried, and maintained in a relational database.

---

## 🎯 Objectives:


- Design a simple relational database
- Create and relate multiple tables
- Use Primary Keys and Foreign Keys
- Apply database constraints and maintain data integrity
- Practice SQL queries for data retrieval and analysis
- Work with aggregate functions and grouping
- Practice different types of JOINs
- Use subqueries and correlated subqueries
- Apply normalization and functional dependency concepts
- Test database constraints and relationships
- Create and verify a database backup

---

##  Database Structure:

### Student:

Stores information about students.

| Column | Description | Key |
|---|---|---|
| `student_ID` | Unique ID of the student | Primary Key |
| `student_name` | Name of the student | — |
| `Email` | Email address | UNIQUE |
| `Department` | Student's department | — |

### Course:

Stores information about available courses.

| Column | Description | Key |
|---|---|---|
| `course_ID` | Unique ID of the course | Primary Key |
| `course_name` | Name of the course | — |
| `credit_Hours` | Credit hours of the course | — |
| `Department` | Department offering the course | — |

### Enrollment:

Connects students with the courses they are enrolled in.

| Column | Description | Key |
|---|---|---|
| `Enrollment_ID` | Unique ID of the enrollment | Primary Key |
| `student_ID` | ID of the enrolled student | Foreign Key |
| `course_ID` | ID of the selected course | Foreign Key |
| `Enrollment_date` | Date of enrollment | — |

---

## 🔗 Relationships:


The **Enrollment** table connects the Student and Course tables.

```text
Student ─────── Enrollment ─────── Course


Foreign key relationships:

Student.student_ID  →  Enrollment.student_ID
Course.course_ID    →  Enrollment.course_ID
This represents a many-to-many relationship between Students and Courses, implemented through the Enrollment table.

 ER Diagram:

The ER diagram shows the three entities, their attributes, Primary Keys, Foreign Keys, and relationships.

 SQL Concepts Practiced:

Basic SQL:

. SELECT
. WHERE
. AND
. OR
. NOT
. IN
. LIKE
. ORDER BY

Aggregate Functions:

. COUNT()
. AVG()
. SUM()
. MAX()
. MIN()

Grouping:

. GROUP BY
. HAVING

JOINs:

. INNER JOIN
. LEFT JOIN
. RIGHT JOIN

Subqueries:

. Basic subqueries
. Correlated subqueries
. EXISTS
. NOT EXISTS

Other SQL Concepts:

. UNION
. UNION ALL
. Indexing concepts

 Constraints & Data Integrity:

The project also includes practical work with database constraints and integrity rules:
. Primary Key
. Foreign Key
. NOT NULL
. UNIQUE
. CHECK
. Referential Integrity

These constraints were tested using valid and invalid inputs to verify that the database maintains consistent and reliable data.

 Database Testing:

The database was tested throughout the project to verify that the tables, relationships, queries, and constraints were working correctly.
Testing included:
. Duplicate Primary Key testing
. Invalid Foreign Key testing
. UNIQUE constraint testing
. NOT NULL constraint testing
. Referential integrity testing
. SQL query testing
. Removing unwanted test records after testing

 Backup & Recovery:

A SQL backup of the database was created using phpMyAdmin.
The backup was also used with a separate test database to practice the basic database recovery process.

 Technologies & Tools:

. MariaDB
purpose:  Relational Database Management System

. SQL
PURPOSE:  Creating, managing, and querying the database

. phpMyAdmin
PURPOSE:  Database management and SQL execution

. XAMPP
PURPOSE:  Local development environment

. draw.io
PURPOSE:  ER diagram creation


 Project Files:

Student-Course-Management-System/
│
├── Student_course_db.sql
├── queries.sql
├── ER Diagram.png
└── README.md

. Student_course_db.sql Contains the database structure and SQL required to create and populate the project database.
. queries.sql Contains the SQL queries practiced during the project, including filtering, aggregate functions, grouping, JOINs,
subqueries, correlated subqueries, and other SQL concepts.
. ER Diagram.png Visual representation of the database entities, attributes, keys, and relationships.

 How to Run:

1. Install XAMPP and start the required services.
2. Open phpMyAdmin.
3. Create the required database.
4. Import Student course.sql.
5. The tables and data will be restored.
6. Open queries.sql to explore and run the practiced queries.

 Learning Outcome:

Building this project helped me move beyond learning SQL syntax and actually apply database concepts in a working relational database.
Through this project, I gained practical experience with:
. Relational database design
. Primary and Foreign Keys
. Constraints and data integrity
. SQL querying
. Aggregate functions
. GROUP BY and HAVING
. JOINs
. Subqueries
. Correlated subqueries
. Normalization
. Functional dependencies
. Database testing
. Backup and recovery
This project gave me a stronger practical foundation in Database Systems and SQL.

 Author:

Romana Niazi
BS Computer Science Student

 Project Status:

Completed — Database Systems Practice Project.
