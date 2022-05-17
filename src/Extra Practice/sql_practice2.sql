use tinycollege2;

-- Q1
SELECT * FROM professor;

-- Q2
SELECT * FROM department;

-- Q3
SELECT stu_fname, stu_lname FROM student;

-- Q4
SELECT stu_fname AS `Firstname`, stu_lname AS `Lastname` FROM student;

-- Q5 List all unique course code from the Class table. (WTF THIS - -;;)
SELECT DISTINCT course_code FROM class;

-- Q6
SELECT DISTINCT course_code, class_room FROM class;

-- Q7
SELECT course_code, crs_credit FROM course;

-- Q8
SELECT class_code, course_code, class_room, class_time FROM class;

-- Q9
SELECT class_room, course_code FROM class
GROUP BY class_room, course_code -- different from only group by class_room
LIMIT 5;

-- Q10
SELECT DISTINCT emp_num, course_code FROM class;

-- Q11
SELECT emp_fname AS `Firstname`, emp_lname AS `Lastname`, emp_dob AS `DoB` FROM professor
LIMIT 10;

-- Q12
SELECT emp_fname AS `Firstname`, emp_lname AS `Lastname`, YEAR(emp_dob) AS `Birthyear` FROM professor
LIMIT 10;

-- Q13
SELECT emp_fname AS `Firstname`, emp_lname AS `Lastname`, (YEAR(CURDATE())-YEAR(emp_dob)) AS `DoB` FROM professor
LIMIT 10;

-- Q14
SELECT * FROM course
ORDER BY crs_credit ASC;

-- Q15
SELECT stu_fname, stu_lname, stu_gpa FROM student
ORDER BY stu_gpa DESC
LIMIT 3;

-- Q16
SELECT stu_fname, stu_lname, stu_gpa FROM student
WHERE stu_gpa >= 3.50;

-- Q17
SELECT stu_fname, stu_lname, stu_gpa FROM student
WHERE stu_gpa >= 3.25 AND stu_gpa < 3.5;

-- Q18
SELECT stu_fname, stu_lname, stu_gpa FROM student
WHERE stu_gpa >= 1.50 AND stu_gpa < 1.80;

-- Q19
SELECT stu_fname, stu_lname, stu_gpa FROM student
WHERE stu_gpa >= 1.80 AND stu_gpa < 2.00;

-- Q20
SELECT stu_fname, stu_lname FROM student
WHERE stu_gpa IS NULL;

-- Q21
SELECT stu_fname, stu_lname FROM student
WHERE stu_dob BETWEEN "1970-01-01" AND "1979-12-31";

-- Q22
SELECT DISTINCT d.dept_code FROM department d
INNER JOIN professor p ON d.dept_code = p.dept_code
ORDER BY dept_code;

-- Q23
SELECT stu_num, stu_fname, stu_lname, stu_dob, stu_class, stu_gpa, dept_code, emp_num FROM student
WHERE emp_num = 209;

-- Q24
SELECT emp_fname, emp_lname, dept_code FROM professor
WHERE dept_code = "CIS" OR dept_code = "MATH"
ORDER BY dept_code ASC;

-- Q25
SELECT * FROM student
WHERE stu_fname LIKE "A%" AND dept_code = "CIS";

-- Q26
SELECT * FROM student
WHERE stu_lname LIKE "%son";

-- Q27
SELECT * FROM course
WHERE course_name LIKE "Intro.%";

-- Q28
SELECT * FROM course
WHERE course_name NOT IN (SELECT course_name FROM course
						WHERE course_name LIKE "Intro.%");

-- Q29
SELECT * FROM course
WHERE dept_code IN ("ACCT", "ECON/FIN", "MKT/MGT");

-- Q30
SELECT * FROM course
WHERE course_code LIKE "%3__"
ORDER BY dept_code ASC;

-- Q31
SELECT class_code, course_code, class_time FROM class
WHERE class_time LIKE "MWF%" AND class_section = 2;

-- Q32
SELECT class_code, course_code, class_time FROM class
WHERE class_time LIKE "%10:00-10:50 a.m." AND class_section = 1;

-- Q33
SELECT class_code, course_code, class_time FROM class
WHERE class_time LIKE "%p.m." AND class_section = 3;

-- Q34
SELECT * FROM class
WHERE emp_num LIKE "1_5"
ORDER BY emp_num ASC;

-- Q35
SELECT course_code, course_name, dept_code FROM course
WHERE dept_code IN ("CIS", "MATH", "ENG")
ORDER BY dept_code ASC;

-- Q36
SELECT course_code, course_name, dept_code FROM course
WHERE course_name LIKE "%Application%";
-- OR --
SELECT course_code, course_name, dept_code FROM course
WHERE course_name REGEXP "Application";

-- Q37
SELECT dept_name, dept_address FROM department
WHERE dept_address LIKE "BBG%";

-- Q38
SELECT dept_name, dept_address FROM department
WHERE dept_address NOT IN (SELECT dept_address FROM department
						WHERE dept_address LIKE "BBG%" OR
							  dept_address LIKE "KLR%");

-- Q39
SELECT class_code, course_code, emp_num FROM class
WHERE emp_num IN (104,105,106,155)
ORDER BY emp_num;

-- Q40
SELECT p.emp_num, course_code, class_time FROM professor p
INNER JOIN class cl ON p.emp_num = cl.emp_num
INNER JOIN department d ON p.dept_code = d.dept_code
WHERE class_time LIKE "MWF%" AND
    course_code LIKE "%3__" AND
    dept_address LIKE "KLR%";
    
-- --
-- 🐰 DONE FOR EXTRA PRACTICE 2 🐰
-- --