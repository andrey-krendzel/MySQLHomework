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
SELECT MONTH(birth_date) AS "Number of birth month", surname, first_name, student_number FROM Student ORDER BY 'Number of birth month', surname, first_name, student_number ASC

-- 12
SELECT COUNT(student_number) AS "Students" FROM Student WHERE MONTH(birth_date) = 5 ORDER BY 'Students' ASC

-- 13
SELECT DATENAME(QUARTER, start_date) AS "Quarter", start_date, course_code, instance_number FROM CourseInstance ORDER BY 'Quarter', start_date, course_code, instance_number ASC

-- 14
SELECT MONTH(birth_date) AS "Month", DAY(birth_date) AS "Day", surname, first_name, student_number FROM Student ORDER BY 'Month', 'Day', surname, first_name, student_number ASC

-- 15
SELECT COUNT(student_number) AS "Amount of students" FROM Student WHERE DATENAME(WEEKDAY, birth_date) = 'Sunday'

-- 16
SELECT LEFT(SYSDATETIME(), 10) AS "Current date", DATENAME(WEEKDAY, LEFT(SYSDATETIME(), 10)) AS "Weekday"

-- 17
SELECT DATEDIFF(DAY, start_date, end_date) AS "Course length", course_code, instance_number FROM CourseInstance ORDER BY 'Course length', course_code, instance_number ASC 

-- 18
SELECT DATEDIFF(YEAR, birth_date, LEFT(SYSDATETIME(), 10)) AS "Age", surname, first_name, student_number FROM Student ORDER BY 'Age' DESC, surname ASC, first_name ASC, student_number ASC