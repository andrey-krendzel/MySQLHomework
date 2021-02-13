-- 1

SELECT student_number, surname, first_name, gender FROM Student WHERE gender = 'M' ORDER BY student_number ASC

--2

SELECT first_name, surname, student_number, gender, city FROM Student WHERE gender = 'F' AND city = 'Espoo' ORDER BY surname, first_name, student_number ASC

-- 3

SELECT first_name + ', ' + surname AS "Name", city FROM Student  WHERE city = 'Helsinki' ORDER BY Name ASC

-- 4
SELECT surname, first_name, city FROM Student WHERE city != 'Helsinki' ORDER BY surname, first_name ASC

--5 
SELECT postcode, student_number FROM Student ORDER BY postcode, student_number ASC

-- 6
SELECT DISTINCT postcode FROM Student ORDER BY postcode ASC

-- 7
SELECT city, postcode, surname, first_name FROM Student WHERE postcode BETWEEN 00400 AND 00600 OR city = 'Espoo' ORDER BY city, postcode, surname, first_name ASC

-- 8 
SELECT postcode, city, surname, first_name FROM Student WHERE postcode NOT BETWEEN 00600 AND 03000 ORDER BY postcode, city, surname, first_name ASC

-- 9
SELECT description FROM MisconductType WHERE description LIKE '[ACFR]%' ORDER BY description ASC

-- 10
SELECT description FROM MisconductType WHERE description NOT IN ('data', 'research', 'test') ORDER BY description ASC

-- 11
SELECT surname FROM Teacher WHERE surname LIKE '%k[a,o]' ORDER BY surname ASC

-- 12 
SELECT course_code, instance_number, start_date, end_date FROM CourseInstance WHERE end_date IS NULL ORDER BY course_code, instance_number ASC

-- 13
SELECT course_code, instance_number, student_number, grade FROM CourseGrade WHERE grade IS NULL ORDER BY course_code, instance_number, student_number ASC

-- 14
SELECT course_code, instance_number, student_number, grade FROM CourseGrade WHERE course_code = 'a290' ORDER BY course_code, grade, student_number ASC

-- 15
with x as 
(SELECT salary + 500 + 1.15*salary AS new_salary, salary AS old_salary, surname, first_name  FROM Teacher)
SELECT * FROM x WHERE new_salary > 18800 ORDER BY new_salary, surname, first_name DESC

-- 16
SELECT surname, first_name, student_number, (CASE gender
WHEN 'M' THEN 'male' ELSE 'female' END) AS GenderFROM Student ORDER BY surname, first_name, student_number ASC-- 17SELECT start_date, end_date, course_code, instance_number FROM CourseInstance WHERE start_date between '2007-12-01' AND '2008-2-15' AND end_date between '2007-12-01' AND '2008-2-15' ORDER BY start_date, course_code, instance_number