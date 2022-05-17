/* --------------------------------------------------------------
--   Please fill in your information in this comment block --  
--   Student ID: 6388040
--   Fullname: Ariya Phengphon
--   Section: 2
------------------------------------------------------------- */
use tinycollege2;

-- Q1
SELECT cl.class_code, course_name, emp_fname, emp_lname, COUNT(s.stu_num) AS `num_stu` FROM class cl
INNER JOIN course co ON co.course_code = cl.course_code
INNER JOIN professor p ON p.emp_num = cl.emp_num
INNER JOIN enroll e ON e.class_code = cl.class_code
INNER JOIN student s ON s.stu_num = e.stu_num
WHERE class_section = 3
GROUP BY p.emp_num;

-- Q2
SELECT cl.class_code, course_name FROM class cl
JOIN course co ON co.course_code = cl.course_code
WHERE cl.class_code NOT IN
					(SELECT cl.class_code FROM class cl		-- all of the class_code thats in the enroll list
					 JOIN enroll e ON e.class_code = cl.class_code)
ORDER BY cl.class_code;

-- Q3
SELECT stu_fname AS `first name`, stu_lname AS `last name`, stu_num AS `ID` FROM student
WHERE stu_fname LIKE "C%"
UNION
SELECT emp_fname AS `first name`, emp_lname AS `last name`, emp_num AS `ID` FROM professor
WHERE emp_fname LIKE "C%";

-- Q4*-*
SELECT cl.course_code FROM class cl
LEFT JOIN enroll e ON e.class_code = cl.class_code
LEFT JOIN student s ON s.stu_num = e.stu_num
WHERE class_section = 1 AND
	  cl.course_code NOT IN
						(SELECT cl.course_code FROM class cl
						LEFT JOIN enroll e ON e.class_code = cl.class_code
						LEFT JOIN student s ON s.stu_num = e.stu_num
						WHERE class_section = 2)
GROUP BY COURSE_CODE
ORDER BY cl.course_code;

-- Q5
SELECT DISTINCT stu_fname AS `stu_fname` FROM student
WHERE `stu_fname` IN
				(SELECT emp_fname AS `emp_fname` FROM professor)
				ORDER BY `stu_fname`;
-- Q6
SELECT stu_fname, stu_lname, s1.stu_gpa FROM student s1
HAVING stu_gpa > (SELECT AVG(stu_gpa) FROM student s2
				WHERE s2.dept_code = "MATH")
ORDER BY s1.stu_gpa DESC;

-- Q7
CREATE VIEW vw_topstudents AS
SELECT stu_num, stu_fname, stu_lname, s1.stu_gpa, dept_code FROM student s1
WHERE s1.stu_gpa = (SELECT MAX(s2.stu_gpa) FROM student s2
					WHERE s1.dept_code = s2.dept_code)
ORDER BY dept_code ASC;

SELECT * FROM vw_topstudents;