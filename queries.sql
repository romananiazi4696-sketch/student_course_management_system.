   ============================================================
    Student Course Management System
    SQL Practice Queries
    Database: student_course_db
    DBMS: MariaDB
   ============================================================


   ============================================================
   1. BASIC SELECT QUERIES
   ============================================================

-- Display all students
SELECT *
FROM student;

-- Display all courses
SELECT *
FROM course;

-- Display all enrollment records
SELECT *
FROM enrollment;


   ============================================================
   2. WHERE CLAUSE
   ============================================================

-- Students from CS department with ID greater than 103
SELECT *
FROM student
WHERE Department = 'CS'
  AND student_ID > 103;

-- Courses having 3 credit hours and belonging to CS department
SELECT *
FROM course
WHERE credit_Hours = 3
  AND Department = 'CS';

-- Courses that are not offered by CS department
SELECT *
FROM course
WHERE NOT Department = 'CS';

-- Students whose names start with 'A'
SELECT *
FROM student
WHERE student_name LIKE 'A%';

-- Students whose names contain 'a'
SELECT *
FROM student
WHERE student_name LIKE '%a%';

-- Students belonging to CS or IT department
SELECT *
FROM student
WHERE Department IN ('CS', 'IT');


   ============================================================
   3. AGGREGATE FUNCTIONS
   ============================================================

-- Count total students
SELECT COUNT(student_ID) AS total_students
FROM student;

-- Count total courses
SELECT COUNT(course_name) AS total_courses
FROM course;

-- Find average credit hours
SELECT AVG(credit_Hours) AS average_credit_hours
FROM course;

-- Find maximum credit hours
SELECT MAX(credit_Hours) AS maximum_credit_hours
FROM course;

-- Find minimum credit hours
SELECT MIN(credit_Hours) AS minimum_credit_hours
FROM course;

-- Find total credit hours
SELECT SUM(credit_Hours) AS total_credit_hours
FROM course;


   ============================================================
   4. GROUP BY
   ============================================================

-- Count students in each department
SELECT Department, COUNT(*) AS total_students
FROM student
GROUP BY Department;

-- Count courses in each department
SELECT Department, COUNT(*) AS total_courses
FROM course
GROUP BY Department;

-- Calculate total credit hours for each department
SELECT Department, SUM(credit_Hours) AS total_credit_hours
FROM course
GROUP BY Department;


   ============================================================
   5. HAVING
   ============================================================

-- Departments having more than one student
SELECT Department, COUNT(*) AS total_students
FROM student
GROUP BY Department
HAVING COUNT(*) > 1;

-- Departments having more than one course
SELECT Department, COUNT(*) AS total_courses
FROM course
GROUP BY Department
HAVING COUNT(*) > 1;


   ============================================================
   6. ORDER BY
   ============================================================

-- Display students in ascending order of student ID
SELECT *
FROM student
ORDER BY student_ID ASC;

-- Display students alphabetically by name
SELECT *
FROM student
ORDER BY student_name ASC;

-- Display courses from highest to lowest credit hours
SELECT *
FROM course
ORDER BY credit_Hours DESC;


   ============================================================
   7. INNER JOIN — TWO TABLES
   ============================================================

-- Display student names with their enrolled course IDs
SELECT
    student.student_name,
    enrollment.course_ID
FROM student
INNER JOIN enrollment
    ON student.student_ID = enrollment.student_ID;


   ============================================================
   8. INNER JOIN — THREE TABLES
   ============================================================

-- Display student names with their course names
SELECT
    student.student_name,
    course.course_name
FROM student
INNER JOIN enrollment
    ON student.student_ID = enrollment.student_ID
INNER JOIN course
    ON enrollment.course_ID = course.course_ID;


-- Display complete student-course enrollment details
SELECT
    student.student_name,
    course.course_name,
    enrollment.Enrollment_date
FROM student
INNER JOIN enrollment
    ON student.student_ID = enrollment.student_ID
INNER JOIN course
    ON enrollment.course_ID = course.course_ID;


   ============================================================
   9. INNER JOIN WITH WHERE
   ============================================================

-- Display CS students and the courses they are enrolled in
SELECT
    student.student_name,
    course.course_name
FROM student
INNER JOIN enrollment
    ON student.student_ID = enrollment.student_ID
INNER JOIN course
    ON enrollment.course_ID = course.course_ID
WHERE student.Department = 'CS';


   ============================================================
   10. LEFT JOIN
   ============================================================

-- Display all students, including those
-- who are not enrolled in any course
SELECT
    student.student_name,
    enrollment.course_ID
FROM student
LEFT JOIN enrollment
    ON student.student_ID = enrollment.student_ID;


-- Display student names and course names,
-- including students with no enrollment
SELECT
    student.student_name,
    course.course_name
FROM student
LEFT JOIN enrollment
    ON student.student_ID = enrollment.student_ID
LEFT JOIN course
    ON enrollment.course_ID = course.course_ID;


   ============================================================
   11. RIGHT JOIN
   ============================================================

-- Display all courses and their enrolled students
SELECT
    student.student_name,
    enrollment.course_ID
FROM student
RIGHT JOIN enrollment
    ON student.student_ID = enrollment.student_ID;


-- Display courses including courses with no enrollment
SELECT
    course.course_name,
    enrollment.student_ID
FROM enrollment
RIGHT JOIN course
    ON enrollment.course_ID = course.course_ID;


   ============================================================
   13. SUBQUERIES
   ============================================================

-- Courses having credit hours greater than
-- the average credit hours of all courses
SELECT *
FROM course
WHERE credit_Hours > (
    SELECT AVG(credit_Hours)
    FROM course
);


-- Courses having the same credit hours as course_ID 201
SELECT *
FROM course
WHERE credit_Hours = (
    SELECT credit_Hours
    FROM course
    WHERE course_ID = 201
);


   ============================================================
   14. EXISTS
   ============================================================

-- Students who are enrolled in at least one course
SELECT *
FROM student s
WHERE EXISTS (
    SELECT 1
    FROM enrollment e
    WHERE e.student_ID = s.student_ID
);


   ============================================================
   15. NOT EXISTS
   ============================================================

-- Students who are not enrolled in any course
SELECT *
FROM student s
WHERE NOT EXISTS (
    SELECT 1
    FROM enrollment e
    WHERE e.student_ID = s.student_ID
);


   ============================================================
   16. CORRELATED SUBQUERY
   ============================================================

-- Students whose ID is greater than the average
-- student ID within their own department
SELECT
    s.student_ID,
    s.student_name,
    s.Department
FROM student s
WHERE s.student_ID > (
    SELECT AVG(s2.student_ID)
    FROM student s2
    WHERE s2.Department = s.Department
);


   ============================================================
   17. UNION
   ============================================================

-- Display departments from Student and Course tables
-- without duplicate values
SELECT Department
FROM student

UNION

SELECT Department
FROM course;


   ============================================================
   18. UNION ALL
   ============================================================

-- Display departments from both tables,
-- including duplicate values
SELECT Department
FROM student

UNION ALL

SELECT Department
FROM course;


   ============================================================
   19. JOIN + GROUP BY + HAVING
   ============================================================

-- Count enrolled students for each course
SELECT
    course.course_name,
    COUNT(enrollment.student_ID) AS enrolled_students
FROM course
LEFT JOIN enrollment
    ON course.course_ID = enrollment.course_ID
GROUP BY course.course_ID, course.course_name
HAVING COUNT(enrollment.student_ID) > 0
ORDER BY enrolled_students DESC;


   ============================================================
   20. DATABASE STRUCTURE CHECKS
   ============================================================

-- Check Student table structure
DESCRIBE student;

-- Check Course table structure
DESCRIBE course;

-- Check Enrollment table structure
DESCRIBE enrollment;

-- Check indexes
SHOW INDEX FROM student;


   ============================================================
   21. FOREIGN KEY CHECK
   ============================================================

-- Check foreign key relationships of Enrollment table
SELECT
    CONSTRAINT_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'student_course_db'
  AND TABLE_NAME = 'enrollment'
  AND REFERENCED_TABLE_NAME IS NOT NULL;


   ============================================================
   22. CONSTRAINT & INTEGRITY TESTING
   ============================================================

-- Duplicate Primary Key test
-- Expected: Duplicate key error

-- INSERT INTO course
-- (course_ID, course_name, credit_Hours, Department)
-- VALUES (201, 'Test Course', 3, 'CS');


-- Invalid Foreign Key test
-- Expected: Foreign key constraint error

-- INSERT INTO enrollment
-- (Enrollment_ID, student_ID, course_ID, Enrollment_date)
-- VALUES (1000, 999, 201, '2026-08-25');


-- Duplicate Email test
-- Expected: UNIQUE constraint error

-- INSERT INTO student
-- (student_ID, student_name, Email, Department)
-- VALUES (109, 'Test Student', 'existing@email.com', 'CS');


-- NOT NULL test
-- Expected: NULL should not be accepted for a NOT NULL column

-- INSERT INTO student
-- (student_ID, student_name, Email, Department)
-- VALUES (110, NULL, 'test110@gmail.com', 'CS');


   ============================================================
   23. REFERENTIAL INTEGRITY TEST
   ============================================================

-- Deleting a student who is referenced by Enrollment
-- should be restricted by the foreign key relationship.

-- DELETE FROM student
-- WHERE student_ID = 106;


   ============================================================
   END OF SQL PRACTICE QUERIES
   ============================================================