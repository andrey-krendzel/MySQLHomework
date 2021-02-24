-- 1 

SELECT surname, first_name, course_code, CourseInstance.teacher_number, instance_number 
FROM Teacher JOIN CourseInstance ON Teacher.teacher_number = CourseInstance.teacher_number ORDER BY surname, first_name, course_code, instance_number 

-- 2
SELECT course_code, course_name, surname + ' ' + first_name AS "Person in charge" FROM Course JOIN Teacher ON Course.person_in_charge = Teacher.teacher_number ORDER BY course_code ASC

-- 3
SELECT CourseGrade.student_number, AVG(grade) AS "GPA", surname, first_name FROM CourseGrade JOIN Student ON CourseGrade.student_number = Student.student_number 
GROUP BY CourseGrade.student_number, surname, first_name ORDER BY surname, first_name, student_number

-- 4a Current advisors

SELECT surname, first_name, AcademicAdvisor.teacher_number, start_date, end_date FROM AcademicAdvisor JOIN Teacher ON AcademicAdvisor.teacher_number = Teacher.teacher_number WHERE end_date IS NULL ORDER BY surname, first_name, AcademicAdvisor.teacher_number ASC

-- 4b

SELECT surname, first_name, AcademicAdvisor.teacher_number, start_date, end_date FROM AcademicAdvisor JOIN Teacher ON AcademicAdvisor.teacher_number = Teacher.teacher_number ORDER BY surname, first_name, AcademicAdvisor.teacher_number ASC

-- 5

SELECT description FROM MisconductIncident JOIN MisconductType ON MisconductIncident.misconduct_code = MisconductType.misconduct_code ORDER BY description

-- 6 

SELECT surname, first_name, Student.student_number, course_code FROM Student JOIN CourseGrade ON Student.student_number = CourseGrade.student_number  WHERE grade > 2

-- 7
SELECT course_code, course_name, teacher_number, surname, first_name FROM Course JOIN Teacher ON Course.person_in_charge = Teacher.teacher_number WHERE course_code = 'a730' ORDER BY Course.person_in_charge ASC

-- 8
SELECT course_name, grade, surname, first_name, CourseGrade.student_number FROM CourseGrade 
JOIN Student ON CourseGrade.student_number = Student.student_number
JOIN Course ON CourseGrade.course_code = Course.course_code 
WHERE gender = 'F' AND grade > 0
ORDER BY course_name, grade DESC, surname, first_name, CourseGrade.student_number ASC

--9 
SELECT CourseGrade.course_code, course_name, grade AS "Grade five" FROM Student 
JOIN CourseGrade ON Student.student_number = CourseGrade.student_number 
JOIN Course  ON CourseGrade.course_code = Course.course_code
WHERE grade = 5 AND gender = 'F'
ORDER BY Course.course_code ASC

-- 10

SELECT DISTINCT surname, first_name, Student.student_number FROM Student 
JOIN CourseGrade ON Student.student_number = CourseGrade.student_number 
WHERE grade = 3 
ORDER BY surname, first_name, Student.student_number ASC

-- 11
SELECT DISTINCT Teacher.teacher_number, surname, first_name, MONTH(grade_date) AS "Grade month" FROM CourseGrade
JOIN Teacher ON CourseGrade.examiner = Teacher.teacher_number
WHERE MONTH(grade_date) = 5 
ORDER BY Teacher.teacher_number

-- 12
SELECT gender, CAST(AVG(CAST(grade AS DECIMAL (4,2))) AS DECIMAL(4,2)) AS "Average",
COUNT(grade) AS "Number of grades"
FROM CourseGrade
JOIN Student ON CourseGrade.student_number = Student.student_number
GROUP BY gender
ORDER BY 'Average' DESC

-- 13
SELECT DISTINCT campus_name, teacher_number
FROM Campus
JOIN AcademicAdvisor ON Campus.campus_code = AcademicAdvisor.campus_code
ORDER BY campus_name, teacher_number ASC

-- 14
SELECT MisconductIncident.course_code, instance_number, course_name, MisconductIncident.student_number, surname, first_name, description
FROM MisconductIncident
JOIN MisconductType ON MisconductIncident.misconduct_code = MisconductType.misconduct_code
JOIN Course ON MisconductIncident.course_code = Course.course_code
JOIN Student ON MisconductIncident.student_number = Student.student_number

-- 15 