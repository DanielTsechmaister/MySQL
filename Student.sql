SELECT id, course_name, credit
FROM course
WHERE credit IN (2 , 3)
ORDER BY course_name;

UPDATE course
SET credit = credit+1
WHERE id = 10405 ;


SELECT c.id course_id, c.course_name, d.dept_name
FROM course c, department d
WHERE c.dept_id = d.id
AND budget BETWEEN 10000 AND 15000
ORDER BY c.id DESC;

select c1.ID, c1.course_name, c1.Credit, d.Dept_Name
from course c1 left outer join department d
on c1.Dept_ID = d.id
where c1.Course_Name like 'DATA%' 
order by c1.Credit desc , c1.Course_Name asc;


SELECT DISTINCT d.dept_name, c.course_name
FROM course_offering co, course c, department d
WHERE co.course_id = c.id
 AND c.dept_id = d.id
 AND co.delivery_method = 'ONLINE'
 AND co.course_year = 2014
 AND (co.course_semester = 1 OR co.course_semester = 2);
 
 SELECT dept_id, COUNT(id) "number of courses", AVG(credit) "avg credit"
FROM course
GROUP BY dept_id;

SELECT d.id, COUNT(c.id) "number of courses", AVG(credit) "avg credit"
FROM course c RIGHT OUTER JOIN department d
ON c.dept_id = d.id
GROUP BY d.id;

SELECT s1.id, s1.student_name, s2.id, s2.student_name
FROM Student s1, student s2
WHERE s1.id < s2.id
AND s1.dept_id != s2.dept_id;

SELECT s.id, s.student_name
FROM Student s
WHERE dept_id IN (SELECT d.id
 FROM Department d
 WHERE budget > 10000);
 
 SELECT d.id, d.dept_name
FROM student s, department d
WHERE s.Dept_ID = d.id
 AND phone_number IS NOT NULL
GROUP BY d.id, d.dept_name
HAVING COUNT(*) > 2 ;

SELECT id, dept_name, budget, budget * 1.05
FROM department d
WHERE budget > 10000
AND id IN (SELECT dept_id
 FROM course c
 GROUP BY dept_id
 HAVING COUNT(*) > 3);
 
 INSERT INTO course_offering (course_id, course_year, course_semester, section_id, delivery_method)
SELECT course_id, 2016, 1, 1, 'ONLINE'
FROM course_offering
WHERE course_year = 2015
 AND course_semester = 1
 AND section_id = 1;
 
 DELETE FROM takes
WHERE student_id = 11
AND course_year = 2015;

SELECT DISTINCT s.student_name
FROM student s, takes t
WHERE s.id = t.Student_ID
AND grade >= 85;

