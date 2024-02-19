/* Drop the grade_points table if it exists to avoid errors on rerun */
DROP TABLE IF EXISTS grade_points;


/* Create grade_points table mapping letter grades to numeric grades */
CREATE TABLE grade_points (
    grade CHAR(2) PRIMARY KEY,
    points DECIMAL(2, 1) CHECK (points BETWEEN 0 AND 4)
);

/* Populate the grade_points table */
INSERT INTO grade_points (grade, points) VALUES
('A', 4.0), ('A-', 3.7), ('B+', 3.3), ('B', 3.0), ('B-', 2.7),
('C+', 2.3), ('C', 2.0), ('C-', 1.7), ('D+', 1.3), ('D', 1.0),
('F', 0.0);

/*Table grade_points*/
SELECT * FROM grade_points ORDER BY points DESC;


/* a foreign key from the grade column in the existing takes table to the new grade_points table*/
ALTER TABLE takes
ADD FOREIGN KEY (grade)
REFERENCES grade_points(grade);

/*creating view v_takes_points*/
CREATE OR REPLACE VIEW v_takes_points AS
SELECT ID, course_id, sec_id, semester, year, takes.grade, points
FROM takes
LEFT JOIN grade_points
ON takes.grade = grade_points.grade;


/*view v_takes_points that returns the data in takes table along with the numeric equivalent of the grade*/
SELECT * FROM v_takes_points;

/*Compute the total number of grade points (credits * grade points) earned by student X (pick a student id from the DB)*/
SELECT
    student.ID,
    student.name,
    COALESCE(SUM(credits * points), 0) AS total_grade_points
FROM
    student
LEFT JOIN
    takes ON student.id = takes.id
JOIN
    course ON takes.course_id = course.course_id
JOIN
    grade_points ON takes.grade = grade_points.grade
WHERE
    student.ID = '00128' AND takes.grade IS NOT NULL
GROUP BY
    student.ID;


/*Compute the GPA - i.e. total grade points / total credits -  for the same student in the previous question*/
SELECT
    student_id,
    CASE
        WHEN total_credits > 0 THEN total_grade_points / total_credits
        ELSE 0
    END AS GPA
FROM (
    SELECT
        t.ID as student_id,
        SUM(c.credits * gp.points) AS total_grade_points,
        SUM(c.credits) as total_credits
    FROM
        takes AS t
    LEFT JOIN course AS c ON t.course_id = c.course_id
    LEFT JOIN grade_points AS gp ON t.grade = gp.grade
    WHERE T.id= '00128'
    GROUP BY t.id
) AS gpa;



/*  Find the GPA of all students, i.e. not just for one student at a time*/
SELECT
    s.id,
    ROUND(IFNULL(SUM(c.credits * gp.points) / SUM(c.credits), 0), 3) AS GPA
FROM student AS s
LEFT JOIN takes AS t ON s.id = t.id
LEFT JOIN course AS c ON t.course_id = c.course_id
LEFT JOIN grade_points AS gp ON t.grade = gp.grade
GROUP BY s.id;


/* Create a view v_student_gpa (id, gpa) that gives a dynamic version of the information in the previous question*/

CREATE OR REPLACE VIEW v_student_gpa AS
SELECT
    s.id,
    IFNULL(SUM(c.credits * gp.points) / SUM(c.credits), 0) AS GPA
FROM student AS s
LEFT JOIN takes AS t ON s.id = t.id
LEFT JOIN course AS c ON t.course_id = c.course_id
LEFT JOIN grade_points AS gp ON t.grade = gp.grade
GROUP BY s.id;


/*View Table: v_student_gpa*/
SELECT * FROM v_student_gpa;
