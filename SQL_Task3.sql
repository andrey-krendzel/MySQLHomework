-- 1 

SELECT COUNT(*) FROM CourseGrade

-- 2 

SELECT COUNT(grade) FROM CourseGrade

-- 3

SELECT COUNT(teacher_number) FROM Teacher WHERE salary > 16000

-- 4

SELECT MAX(salary) AS "Maximum salary", MIN(salary) AS "Minimum salary", AVG(salary) AS "Average salary", SUM(salary) AS "Total salary" FROM Teacher 

-- 5

SELECT AVG(grade) FROM CourseGrade
SELECT CAST(AVG(grade *1.00) AS Decimal(4,2)) FROM CourseGrade
SELECT CAST(AVG(grade * 1.0) AS DECIMAL(2,0)) AS "Average of Grade" FROM CourseGrade

-- 6
SELECT COUNT(grade) FROM CourseGrade WHERE grade = 3 

-- 7
SELECT CAST(AVG(grade * 1.0) AS DECIMAL(2,0)) FROM CourseGrade WHERE student_number = 'o473'

-- 8
SELECT COUNT(first_name) FROM Student WHERE first_name LIKE 'K%'

-- 9
SELECT COUNT(surname) FROM Teacher WHERE surname LIKE 'T%'

-- 10
SELECT first_name + '.' + surname + '@takkula.fi' AS "Default email" FROM Student ORDER BY "Default email" ASC

-- 11
