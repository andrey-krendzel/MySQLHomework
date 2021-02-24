-- 1

SELECT surname, first_name, teacher_number, course_name FROM Course
JOIN Teacher ON Course.person_in_charge = Teacher.teacher_number
WHERE teacher_number = 'h303' 
ORDER BY course_name ASC

-- 2

SELECT surname, first_name, Teacher.teacher_number, course_name
FROM Teacher 
FULL JOIN Course ON Teacher.teacher_number = Course.person_in_charge

-- 3 

SELECT course_code, instance_number, start_date, surname + ' ' + first_name AS "Teacher", Teacher.teacher_number
FROM CourseInstance 
FULL JOIN Teacher ON CourseInstance.teacher_number = Teacher.teacher_number
WHERE YEAR(start_date) = 2008
ORDER BY course_code, instance_number ASC

-- 4

SELECT campus_name, surname, first_name, teacher_number, course_name
FROM Teacher
FULL JOIN Campus ON Teacher.campus_code = Campus.campus_code
FULL JOIN Course ON Teacher.teacher_number = Course.person_in_charge
WHERE teacher_number IS NOT NULL
ORDER BY campus_name, surname, first_name, teacher_number, course_name

-- 5

SELECT campus_name, COUNT(teacher_number) AS "Number of teachers"
FROM Teacher 
JOIN Campus ON Teacher.campus_code = Campus.campus_code
GROUP BY campus_name
ORDER BY campus_name ASC

-- 6

SELECT surname, first_name, Teacher.teacher_number, start_date, end_date
FROM Teacher
FULL JOIN AcademicAdvisor ON Teacher.teacher_number = AcademicAdvisor.teacher_number
WHERE YEAR(start_date) = 2010 OR YEAR(end_date) = 2010 OR (YEAR(start_date) < 2010 AND YEAR(end_date) > 2010)
ORDER BY surname, first_name, teacher_number ASC



