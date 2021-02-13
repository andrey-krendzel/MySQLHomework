-- 1.1. 
SELECT * FROM Campus

-- 1.2. 

SELECT campus_name, city from Campus ORDER BY city, campus_name

-- 1.3. 

SELECT * from SanctionType ORDER BY sanction_code

-- 1.4. 

SELECT * FROM MisconductType ORDER BY description

-- 1.5. 

SELECT surname, first_name, teacher_number from Teacher ORDER BY surname, first_name, teacher_number

-- 1.6. 

SELECT student_number, surname, first_name, birth_date, gender from Student WHERE gender = 'F' ORDER BY student_number

-- 1.7. 

SELECT salary, surname, first_name, teacher_number FROM Teacher WHERE salary > 16000 ORDER BY salary DESC 

-- 1.8.

SELECT teacher_number FROM Teacher WHERE first_name = 'Veera' AND surname = 'Vainio' 

-- h784

-- 1.9.

SELECT examiner, course_code, instance_number, student_number, grade FROM CourseGrade WHERE examiner = 'h784' ORDER BY course_code, instance_number, student_number ASC

-- 1.10 

SELECT start_date, end_date, course_code, instance_number FROM CourseInstance ORDER BY start_date, end_date, course_code, instance_number

-- 1.11 Group by gender doesn't work

SELECT gender, birth_date, surname, first_name FROM Student  WHERE surname  LIKE '[A-K]%' ORDER BY gender DESC 

-- 1.13

SELECT table_name
 FROM information_schema.tables
ORDER BY table_name

-- 1.14

SELECT table_name, column_name, data_type, character_maximum_length,
 numeric_precision, numeric_scale, is_nullable
 FROM information_schema.columns
WHERE table_name = 'Teacher'

-- 1.15

SELECT table_catalog, table_name, constraint_name, constraint_type
 FROM information_schema.table_constraints
ORDER BY table_name, constraint_name