/* Chapter 3.7: Create table instructor */
select * from instructor;

/* Chapter 3.32: Average salary by department */
select dept_name, avg(salary) as avg_salary from instructor group by dept_name;

/* Chapter 3.16: Retrieve instructors with calculated monthly salary */
select ID, name, salary/12 as monthly_salary from instructor;

/* Chapter 3.25: Instructors with salary between 90k and 100k */
select name from instructor where salary between 90000 and 100000;

/* Chapter 3.31: Find the average salary of instructors in the Computer Science department */
select avg(salary) as average_salary from instructor where dept_name = 'Comp. Sci.';

/* Chapter 3.24: List in alphabetic order the names of all instructors  */
select distinct name from instructor order by name;

/* Chapter 3.23: Find the names of all instructors whose name includes the substring “dar”. */
select name from instructor where name like '%dar%';

/* Chapter 3.19: Find the names of all instructors who have taught some course and the course_id */
select name, course_id from instructor, teaches where instructor.ID = teaches.ID;

/* Chapter 3.18: Cartesian product of instructor and teaches */
select * from instructor, teaches;

/* Chapter 3.14: Find the department names of all instructors, and remove duplicates */
select distinct dept_name from instructor;

/* Chapter 3.13: find the names of all instructors */
select name from instructor;

/* Homework query #1: Retrieve all courses that have the letters a, e, i in THAT order in their names */
SELECT * FROM course
WHERE LOWER(title) LIKE '%a%e%i%';

/*test*/
SELECT course_id FROM course WHERE LOWER(title) LIKE '%a%e%i%';


/* Homework query #2: Retrieve all courses that have the letters a, e, i i ANY order in their names */
select * from course where lower(title) like '%a%' and lower(title) like '%e%' and lower(title) like '%i%';

/* Homework query #3: Retrieve the names of all students who failed a course (grade of F) along with the name of the course that they failed */
SELECT S.name, C.title
FROM student S
JOIN takes T ON S.ID = T.ID
JOIN course C ON T.course_id = C.course_id
WHERE T.grade = 'F' AND S.name = 'Levy';

/*test fail*/
SELECT S.name AS student_name, C.title AS course_title
FROM student S
JOIN takes T ON S.ID = T.ID
JOIN course C ON T.course_id = C.course_id
WHERE T.grade = 'F';


/* Homework query #4: Retrieve the percentage of solid A grades compared to all courses, and rename that column "Percent_A" */
SELECT (COUNT(CASE WHEN grade = 'A' THEN 1 ELSE NULL END) * 100.0 / COUNT(*)) AS Percent_A
FROM takes;


/* Homework query #5:Retrieve the names and numbers of all courses that do not have prerequisites.  */
SELECT C.title, C.course_id
FROM course C
LEFT JOIN prereq P ON C.course_id = P.course_id
WHERE P.prereq_id IS NULL;


/* Homework query #6: Retrieves the names of all students and their advisors if they have one. */
SELECT
    s.name AS student_name,
    s.id AS student_id,
    i.name AS advisor_name
FROM
    student s
LEFT JOIN
    advisor a ON s.id = a.s_ID
LEFT JOIN
    instructor i ON a.i_ID = i.ID



