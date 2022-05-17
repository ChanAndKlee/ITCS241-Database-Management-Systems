/* --------------------------------------------------------------
--   Please fill in your information in this comment block --  
--   Student ID: 6388040
--   Fullname: Ariya Phengphon
--   Section: 2
------------------------------------------------------------- */

USE tinycollege2;

-- Q1
SELECT CONCAT(EMP_FNAME, " ", EMP_LNAME) AS Name, (YEAR(CURDATE()) - YEAR(EMP_DOB)) AS Age FROM Professor
ORDER BY Age DESC
LIMIT 10;

-- Q2
SELECT ROUND(AVG(STU_GPA), 2) AS 'Average CIS GPA' FROM Student
WHERE DEPT_CODE = 'CIS';

-- Q3
SELECT COUNT(DEPT_CODE) AS '# of Courses' FROM Course
WHERE CRS_CREDIT = 3 AND DEPT_CODE IN ('CIS', 'MATH', 'BIOL', 'ENG');

-- Q4
SELECT DEPT_CODE, COUNT(*) AS 'Total # of Students' FROM Student
WHERE DEPT_CODE IN ('CIS', 'MATH', 'BIOL', 'ENG')
GROUP BY DEPT_CODE;

-- Q5
SELECT DEPT_CODE, ROUND(AVG(STU_GPA), 2) AS `Average GPA` FROM Student
GROUP BY DEPT_CODE
ORDER BY `Average GPA` DESC;

-- Q6
SELECT DEPT_CODE, ROUND(AVG(STU_GPA), 2) AS `Average GPA` FROM Student
GROUP BY DEPT_CODE
HAVING `Average GPA` > 3.00
ORDER BY `Average GPA` DESC;

-- Q7
SELECT STU_CLASS, COUNT(STU_GPA) AS `Total students with GPA`, ROUND(AVG(STU_GPA), 2) AS `Average class GPA` FROM Student
GROUP BY STU_CLASS
ORDER BY STU_CLASS ASC;

-- Q8
SELECT STU_NUM, CONCAT(STU_FNAME, " ", STU_LNAME) AS student, CONCAT(P.EMP_FNAME, " ", P.EMP_LNAME) AS advisor
FROM Student S
INNER JOIN Professor P
ON S.EMP_NUM = P.EMP_NUM
WHERE P.EMP_FNAME LIKE 'P%' OR P.EMP_FNAME LIKE 'A%'
ORDER BY advisor ASC;

-- Q9
SELECT P.EMP_NUM, DEPT_CODE, CONCAT(EMP_FNAME, " ", EMP_LNAME) AS professor, COUNT(C.EMP_NUM) AS `Total classes`
FROM Professor P
INNER JOIN Class C
ON P.EMP_NUM = C.EMP_NUM
WHERE DEPT_CODE = 'CIS'
GROUP BY C.EMP_NUM
HAVING `Total classes` >= 3;

-- Q10
SELECT STU_FNAME, STU_LNAME, E.CLASS_CODE, GRADE, C.COURSE_CODE
FROM Student S
INNER JOIN Enroll E ON S.STU_NUM = E.STU_NUM  -- can be swap order
INNER JOIN Class  C ON E.CLASS_CODE = C.CLASS_CODE
WHERE C.COURSE_CODE LIKE 'CIS%'
ORDER BY COURSE_CODE, GRADE ASC;