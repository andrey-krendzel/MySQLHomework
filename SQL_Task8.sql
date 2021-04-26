
-- 1.1.
(SELECT surname FROM Student)
UNION
(SELECT surname FROM Teacher)
ORDER BY surname

-- 1.2. 
(SELECT city FROM Campus)
INTERSECT
(SELECT city FROM Student)
ORDER BY city

-- 1.3. 
(SELECT city FROM Campus)
EXCEPT
(SELECT city FROM Student)
ORDER BY city

-- 1.4. 
(SELECT YEAR(birth_date) AS "Year" FROM Student)
UNION
(SELECT YEAR(birth_date) AS "Year" FROM Teacher)
ORDER BY 'Year'

-- 1.5. 
(SELECT YEAR(birth_date) AS "Year" FROM Student)
INTERSECT
(SELECT YEAR(birth_date) AS "Year" FROM Teacher)
ORDER BY 'Year'

-- 1.6. 
(SELECT YEAR(birth_date) AS "Year" FROM Teacher)
EXCEPT
(SELECT YEAR(birth_date) AS "Year" FROM Student)
ORDER BY 'Year'

-- 1.7. 
(SELECT YEAR(birth_date) AS "Year" FROM Student)
EXCEPT
(SELECT YEAR(birth_date) AS "Year" FROM Teacher)
ORDER BY 'Year' DESC