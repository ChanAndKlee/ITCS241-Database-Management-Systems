use tinycollege2;

-- Q65 You need to ignore the emp_num 209
SELECT emp_fname, emp_lname, d.dept_code, dept_name FROM professor p
INNER JOIN department d ON p.dept_code = d.dept_code
WHERE p.emp_num != 209 AND d.dept_code = (SELECT dept_code FROM professor
										WHERE emp_num = 209);

-- Q66 **
SELECT fname, COUNT(fname) AS `num_used` FROM (
	SELECT stu_fname AS `fname` FROM student
    UNION ALL
    SELECT emp_fname AS `fname` FROM professor
) AS `bothfname`
GROUP BY fname
HAVING `num_used` >= 2
ORDER BY fname ASC;

-- Q67
SELECT co.course_code, course_name, COUNT(class_code) AS `num_class` FROM course co
LEFT OUTER JOIN class cl ON co.course_code = cl.course_code -- get all of information of class (join and not join)
GROUP BY course_code
HAVING `num_class` = 0;

-- Q68
SELECT emp_fname, emp_lname, YEAR(CURDATE()) - YEAR(EMP_DOB) AS `age` FROM professor
WHERE YEAR(CURDATE()) - YEAR(EMP_DOB) < (SELECT AVG(YEAR(CURDATE()) - YEAR(EMP_DOB)) FROM professor)
ORDER BY `age` ASC;

-- Q69
SELECT s.stu_num, stu_fname, stu_lname FROM student s
WHERE s.stu_num NOT IN (SELECT stu_num FROM enroll) -- student who enrolled the class
ORDER BY stu_num;

-- Q70
SELECT course_name FROM course
WHERE course_name NOT IN (
	SELECT course_name FROM course co
	INNER JOIN class cl ON co.course_code = cl.course_code
);

-- Q71
SELECT CONCAT(emp_fname, " ", emp_lname) AS `fullname`, COUNT(class_code) AS `num_classes` FROM professor p
LEFT OUTER JOIN class cl ON p.emp_num = cl.emp_num
GROUP BY `fullname`
HAVING `num_classes` < 2;

-- Q72
SELECT emp_fname, emp_lname, dept_name FROM professor p
INNER JOIN department d ON p.dept_code = d.dept_code
WHERE emp_fname NOT IN (
	SELECT emp_fname FROM professor -- list of professors that has advisees
    INNER JOIN student s ON p.emp_num = s.emp_num
);

-- Q73
SELECT `First name`, `Last Name` FROM (
	SELECT stu_fname AS `First name`, stu_lname AS `Last Name` FROM student
    WHERE dept_code = "CIS"
    UNION ALL
    SELECT emp_fname AS `First name`, emp_lname AS `Last Name` FROM professor
    WHERE dept_code = "CIS"
) AS `both`;
-- OR --
SELECT stu_fname AS `First name`, stu_lname AS `Last Name` FROM student
WHERE dept_code = "CIS"
UNION ALL
SELECT emp_fname AS `First name`, emp_lname AS `Last Name` FROM professor
WHERE dept_code = "CIS";

-- Q74
SELECT co.course_code, course_name FROM course co
INNER JOIN class cl ON co.course_code = cl.course_code
WHERE class_section = 1 AND co.course_code NOT IN (
	SELECT course_code FROM class
	WHERE class_section = 2
);

-- Q75
SELECT p.emp_num, emp_fname, emp_lname, COUNT(class_code) AS `num_class_tech` FROM professor p
INNER JOIN class cl ON p.emp_num = cl.emp_num
GROUP BY emp_num
HAVING `num_class_tech` > (
	SELECT AVG(num_class_teach) AS `average_teaching` FROM (
		SELECT emp_num, COUNT(class_code) AS `num_class_teach` FROM class
        GROUP BY emp_num
	) AS `avg_teach`
);

-- Q76
SELECT DISTINCT stu_fname, stu_lname FROM student
WHERE LENGTH(stu_lname) < (
	SELECT AVG(LENGTH(stu_lname)) FROM student
)
ORDER BY stu_fname ASC;

-- Q77
SELECT stu_fname, stu_lname FROM student
WHERE LENGTH(stu_fname) > LENGTH(stu_lname)
ORDER BY stu_fname ASC;
-- or --
select stu_fname, stu_lname from student s1
where length(stu_fname) > (
	select length(stu_lname) from student s2
    where s1.stu_num = s2.stu_num
)
order by stu_fname;

-- Q78 **
SELECT d.dept_code, dept_name FROM department d
INNER JOIN professor p ON d.dept_code = p.dept_code
INNER JOIN student s ON d.dept_code = s.dept_code
GROUP BY dept_code
HAVING COUNT(DISTINCT p.emp_num) = COUNT(DISTINCT stu_num);

-- Q79 complicated
SELECT stu_num, stu_fname, stu_lname, stu_gpa, d.dept_code, dept_name FROM student s
INNER JOIN department d ON s.dept_code = d.dept_code
INNER JOIN (
	SELECT dept_code, AVG(stu_gpa) AS `avg_dept_gpa` FROM student
    GROUP BY dept_code
) AS newtab ON d.dept_code = newtab.dept_code
WHERE stu_gpa > avg_dept_gpa
ORDER BY dept_code ASC;

-- Q80
SELECT stu_num, stu_fname, stu_lname, stu_gpa, d.dept_code, dept_name FROM student s
INNER JOIN department d ON s.dept_code = d.dept_code
INNER JOIN (
	SELECT dept_code, MAX(stu_gpa) AS `max_dept_gpa` FROM student
    GROUP BY dept_code
) AS newtab ON d.dept_code = newtab.dept_code
WHERE stu_gpa = max_dept_gpa
ORDER BY dept_code;

-- --
-- 🐰 DONE FOR EXTRA PRACTICE 4 🐰
-- --