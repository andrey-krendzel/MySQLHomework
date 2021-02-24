-- 1. 

SELECT SUM(participants) AS "Number of participants", course_code FROM CourseInstance GROUP BY course_code ORDER BY 'Number of participants' DESC, course_code ASC

-- 2. 

SELECT COUNT(grade) AS "Number of grades", student_number FROM CourseGrade WHERE grade > 0 GROUP BY student_number ORDER BY 'Number of grades' DESC, student_number ASC

-- 3. a)

SELECT AVG(grade) AS "Average grade", student_number FROM CourseGrade WHERE grade IS NOT NULL GROUP BY student_number ORDER BY student_number ASC

-- b)
SELECT CAST(AVG(CAST(grade AS DECIMAL (4,2))) AS DECIMAL(4,2)) AS "Average grade", student_number 
FROM CourseGrade 
WHERE grade IS NOT NULL 
GROUP BY student_number 
ORDER BY student_number ASC

-- 4 

SELECT teacher_number, COUNT(instance_number) AS "Number of course instances" FROM CourseInstance WHERE teacher_number IS NOT NULL GROUP BY teacher_number ORDER BY teacher_number

-- 5 

SELECT person_in_charge, COUNT(course_code) AS "Number of different courses" FROM Course GROUP BY person_in_charge ORDER BY 'Number of different courses' DESC, person_in_charge ASC

-- 6 

SELECT teacher_number, COUNT(instance_number) AS "Number of course instances" FROM CourseInstance 
WHERE (teacher_number IS NOT NULL) GROUP BY teacher_number HAVING COUNT(instance_number) > 1   ORDER BY teacher_number

-- 7

SELECT student_number, CAST(AVG(CAST(grade AS DECIMAL (4,2))) AS DECIMAL(4,2)) AS "Average grade", MAX(grade) AS "Highest grade", MIN(grade) AS "Lowest grade" FROM CourseGrade GROUP BY student_number

-- 8

SELECT student_number, CAST(AVG(CAST(grade AS DECIMAL (4,2))) AS DECIMAL(4,2)) AS "Average grade", MAX(grade) 
AS "Highest grade", MIN(grade) AS "Lowest grade" FROM CourseGrade GROUP BY student_number HAVING CAST(AVG(CAST(grade AS DECIMAL (4,2))) AS DECIMAL(4,2)) > 3

-- 9 

SELECT course_code, instance_number, participants AS "Participants" FROM CourseInstance WHERE participants > 
(SELECT CAST(AVG(CAST(participants AS DECIMAL (4,2))) AS DECIMAL(4,2)) FROM CourseInstance) 

-- 10 

SELECT student_number, first_name, surname FROM Student WHERE student_number IN (SELECT student_number FROM CourseGrade WHERE grade > 0) ORDER BY surname, first_name, student_number ASC

-- 11
SELECT surname, first_name, teacher_number, salary FROM Teacher WHERE salary > (SELECT MAX(salary) FROM Teacher WHERE campus_code = 'c222')

--	12 
SELECT course_code, course_name FROM Course WHERE course_code IN (SELECT course_code FROM CourseGrade GROUP BY course_code HAVING MIN(grade) > 0) ORDER BY course_code ASC

-- 13 
SELECT course_code, course_name FROM Course WHERE course_code IN (SELECT course_code FROM CourseGrade GROUP BY course_code HAVING MIN(grade) <= 0) ORDER BY course_code ASC

-- 14 
SELECT teacher_number, surname, first_name FROM Teacher WHERE teacher_number NOT IN (SELECT teacher_number FROM CourseInstance WHERE teacher_number IS NOT NULL) ORDER BY surname, first_name, teacher_number