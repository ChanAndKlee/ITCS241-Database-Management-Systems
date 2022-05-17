/* --------------------------------------------------------------
--   Please fill in your information in this comment block --  
--   Student ID: 6388040
--   Fullname: Ariya Phengphon
--   Section: 2
------------------------------------------------------------- */
USE tinycollege;
-- Part II: DML - Insert, Update, Delete
-- Q1 & Q2
INSERT INTO Professor (EMP_NUM, EMP_FNAME, EMP_LNAME, EMP_DOB, DEPT_CODE, PROF_EXTENSION)
VALUES (101, 'Charles', 'Xavier', '1975-05-04 00:00:00', 'CIS', NULL),
		(702, 'Stephen', 'Strange', '1988-07-04 00:00:00', 'BIOL', '7702');

-- Q3
INSERT INTO Student (STU_NUM, STU_FNAME, STU_LNAME, STU_DOB, STU_CLASS, STU_GPA, DEPT_CODE, EMP_NUM)
VALUES (773355, 'Ariya', 'Phengphon', '2001-10-11', '2', '3.69', 'CIS', '702');

-- Q4
UPDATE Student
SET EMP_NUM = 101
WHERE STU_NUM = 773355;

-- Q5
UPDATE Professor
SET PROF_EXTENSION = '0077'
WHERE EMP_NUM = 101;

-- Q6
DELETE FROM Professor
WHERE EMP_NUM = 702;

-- Part III: DQL - Select
-- Q7
SELECT * from Student;

-- Q8
SELECT EMP_FNAME, EMP_LNAME, DEPT_CODE FROM Professor
WHERE DEPT_CODE = 'CIS';

-- Q9
SELECT EMP_FNAME, EMP_LNAME FROM Professor
WHERE EMP_FNAME LIKE '%M%' AND EMP_LNAME LIKE '%M%';

-- Q10
SELECT STU_FNAME, STU_LNAME, DEPT_CODE FROM Student
WHERE DEPT_CODE = 'ENG' OR DEPT_CODE = 'ART' OR DEPT_CODE = 'SOC' OR DEPT_CODE = 'HIST'
ORDER BY DEPT_CODE;	-- Or ORDER BY DEPT_CODE ASC => results the same

-- Q11
SELECT COURSE_CODE, COURSE_NAME, (CRS_CREDIT*250) AS 'Tutition Fee', DEPT_CODE FROM Course
WHERE COURSE_NAME LIKE 'Intro%'
ORDER BY DEPT_CODE;

-- Q12
SELECT DISTINCT COURSE_CODE, CLASS_ROOM FROM Class
WHERE CLASS_ROOM LIKE 'KLR%' AND (CLASS_CODE >= 20000 AND CLASS_CODE <= 30000); 