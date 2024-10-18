-- Create database for a school
DROP DATABASE IF EXISTS school_mgtDB;
CREATE DATABASE school_mgtDB;
USE school_mgtDB;

-- Create the Relevant Tables
CREATE TABLE departments (
    department_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(150)
);
 
CREATE TABLE students (
    student_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    dob DATE,
    gender ENUM('M', 'F'),
    enrollment_date DATE,
    enrollment_status ENUM('Enrolled', 'Pending', 'Completed') DEFAULT 'Pending',
    grade_level INT
);

CREATE TABLE teachers (
    teacher_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(35) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    hire_date DATE NOT NULL,
    terminate_date DATE,
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE classes (
    class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    FOREIGN KEY (course_id)
        REFERENCES courses (course_id),
    teacher_id INT,
    FOREIGN KEY (teacher_id)
        REFERENCES teachers (teacher_id),
    class_time TIME,
    classroom VARCHAR(100)
);

CREATE TABLE enrollment (
    enrollment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    class_id INT,
    FOREIGN KEY (class_id)
        REFERENCES classes (class_id),
    enrollment_date DATE
);

CREATE TABLE grades (
    grade_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    grade CHAR(5),
    grade_date DATE
);


