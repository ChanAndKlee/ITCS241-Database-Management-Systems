use tinycollege2;

-- Q41
SELECT emp_num, CONCAT(LOWER(emp_fname), ".", LOWER(SUBSTRING(emp_lname,1,3)), "@tinycollege.edu") AS `email` FROM professor
WHERE dept_code = "ACCT";

select stu_num, lower(concat(stu_fname), ".", left(stu_lname, 3), "@tinycvollgu.edu" as "email", stu_gpa) from student;

-- Q42
SELECT * FROM student
WHERE MONTH(stu_dob) = 11
ORDER BY dept_code ASC;
-- or --
select * from student
where monthname(stu_dob) = "November"
order by dept_code asc;

-- Q43
SELECT * FROM student
WHERE DAYOFWEEK(stu_dob) = 5
ORDER BY dept_code ASC;

-- Q44
SELECT emp_fname, emp_lname, (YEAR(CURDATE()) - YEAR(emp_dob)) AS `age` FROM professor
WHERE (YEAR(CURDATE()) - YEAR(emp_dob)) > 75
ORDER BY (YEAR(CURDATE()) - YEAR(emp_dob)) DESC;  -- one the pic no sort, but the question ask sort

-- Q45
SELECT (YEAR(CURDATE()) - YEAR(stu_dob)) AS `age` FROM student
ORDER BY `age` DESC
LIMIT 1;

-- Q46
SELECT ROUND(SUM(stu_gpa)/COUNT(stu_num), 2) AS `AvgGPA` FROM student
WHERE stu_class = 2;

-- Q47 it has one row not match no idea why (stu_class 1)
SELECT stu_class, ROUND(SUM(stu_gpa)/COUNT(stu_num), 2) AS `avgGPA` FROM student
GROUP BY stu_class
ORDER BY stu_class ASC;

-- Q48 art and biol not match
SELECT dept_code, ROUND(SUM(stu_gpa)/COUNT(stu_num), 2) AS `avgGPA` FROM student
GROUP BY dept_code
ORDER BY dept_code;

-- Q49
SELECT stu_class, COUNT(stu_num) FROM student
GROUP BY stu_class
ORDER BY stu_class;

-- Q50
SELECT stu_class, CONCAT("[", MIN(stu_gpa), ", ", MAX(stu_gpa), "]") AS `gpa_range` FROM student
GROUP BY stu_class
ORDER BY stu_class;

-- Q51
SELECT d.dept_code, COUNT(stu_num) AS `num_stu` FROM department d
INNER JOIN student s ON d.dept_code = s.dept_code
GROUP BY dept_code
ORDER BY dept_code;

-- Q52
SELECT d.dept_code, COUNT(p.emp_num) AS `num_prof` FROM department d
INNER JOIN professor p ON d.dept_code = p.dept_code
GROUP BY dept_code
HAVING `num_prof` >= 2
ORDER BY `num_prof` ASC;

-- Q53
SELECT d.dept_code, COUNT(stu_num) AS `num_stu` FROM department d
INNER JOIN student s ON d.dept_code = s.dept_code
WHERE stu_gpa >= 3.00
GROUP BY dept_code
HAVING `num_stu` > 1;

-- Q54
SELECT course_code, COUNT(class_code) AS `num_class` FROM class
GROUP BY course_code
HAVING `num_class` > 2;

-- Q55
SELECT d.dept_code,  COUNT(course_code) AS `num_course` FROM department d
INNER JOIN course c ON d.dept_code = c.dept_code
GROUP BY dept_code
HAVING `num_course` = 1;

-- Q56
SELECT emp_fname, emp_lname, d.dept_code, dept_name, dept_address FROM professor p
INNER JOIN department d ON d.dept_code = p.dept_code
LIMIT 8;

-- Q57
SELECT stu_fname, stu_lname, class_code FROM student s
INNER JOIN enroll e ON s.stu_num = e.stu_num
WHERE dept_code = "CIS" AND grade = "A"
ORDER BY stu_fname ASC;

-- Q58
SELECT stu_fname, stu_lname, COUNT(s.stu_num) AS `num_gradeA` FROM student s
INNER JOIN enroll e ON s.stu_num = e.stu_num
WHERE dept_code = "CIS" AND grade = "A"
GROUP BY s.stu_num
ORDER BY stu_fname ASC;

-- Q59
SELECT emp_fname, emp_lname, COUNT(s.emp_num) AS `num_advisee` FROM professor p
INNER JOIN student s ON p.emp_num = s.emp_num
GROUP BY p.emp_num
HAVING `num_advisee` > 3 -- at least 3, it should include 3?
ORDER BY emp_fname ASC; -- if not order the result diff

-- Q60
SELECT emp_fname, emp_lname, COUNT(p.emp_num) AS `num_class` FROM professor p
INNER JOIN class cl ON p.emp_num = cl.emp_num
INNER JOIN course co ON co.course_code = cl.course_code
WHERE crs_credit = 3
GROUP BY p.emp_num
HAVING `num_class` > 3;

-- Q61
SELECT class_code, co.course_code, course_name, class_time FROM class cl
INNER JOIN course co ON cl.course_code = co.course_code
WHERE course_name LIKE "Intro%" AND class_section = 1 AND dept_code = "CIS";

-- Q62 tricky one !!
SELECT d.dept_code, dept_name, COUNT(DISTINCT(p.emp_num)) AS `num_prof`, COUNT(DISTINCT(s.stu_num)) AS `num_stu`,
		ROUND(COUNT(DISTINCT(s.stu_num))/COUNT(DISTINCT(p.emp_num)), 2) AS `stuprof_ratio` FROM department d
INNER JOIN student s ON s.dept_code = d.dept_code
INNER JOIN professor p ON p.dept_code = d.dept_code
GROUP BY dept_code
ORDER BY dept_code ASC;

-- Q63
SELECT d.dept_code, dept_name, CONCAT(emp_fname, " ", emp_lname) AS `head_dept` FROM department d
INNER JOIN professor p ON d.emp_num = p.emp_num
ORDER BY dept_code ASC;

-- Q64
SELECT s.stu_num, stu_fname, stu_lname, COUNT(s.stu_num) AS `total_class`, SUM(credit) AS `total_credit` FROM student s
INNER JOIN enroll e ON s.stu_num = e.stu_num
GROUP BY stu_num
HAVING `total_class` >= 6 AND `total_credit` >= 18
ORDER BY stu_num;

-- --
-- 🐰 DONE FOR EXTRA PRACTICE 3 🐰
-- Helper : boss (on Q62)
-- --