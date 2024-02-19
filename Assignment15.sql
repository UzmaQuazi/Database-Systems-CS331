DROP TABLE IF EXISTS final_exam_student;
DROP TABLE IF EXISTS final_exam;
DROP TABLE IF EXISTS final_student;
DROP TABLE IF EXISTS final_state;

/* Create final_state table */
CREATE TABLE final_state(
    state_abrv    CHAR(2) PRIMARY KEY NOT NULL,
    state_name    VARCHAR(30) NOT NULL
);

/* Create final_student table */
CREATE TABLE final_student (
    student_id      INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    first_name      VARCHAR(25) NOT NULL,
    middle_initial  CHAR(1),
    last_name       VARCHAR(25) NOT NULL,
    address         VARCHAR(25) NOT NULL,
    city            VARCHAR(25) NOT NULL,
    state           CHAR(2) NOT NULL,
    phone_number    VARCHAR(20) NOT NULL,
    dob             DATE NOT NULL
);

/* Create final_exam table */
CREATE TABLE final_exam (
    exam_id        INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    course_id      INT NOT NULL,
    semester       VARCHAR(25) NOT NULL,
    year           INT NOT NULL,
    take_home      BOOL NOT NULL,
    description    VARCHAR(50) NOT NULL,
    instructor_id  INT
);

/* Create final_exam_student table */
CREATE TABLE final_exam_student (
    exam_id         INT NOT NULL,
    student_id      INT NOT NULL,
    score           NUMERIC(4,1) NOT NULL,
    PRIMARY KEY (exam_id, student_id)
);


