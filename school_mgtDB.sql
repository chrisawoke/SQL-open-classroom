-- Create Database for a school
DROP DATABASE IF EXISTS school_mgtDB;
CREATE DATABASE school_mgtDB;
USE school_mgtDB;

-- Create the relevant tables
DROP TABLE IF EXISTS students;
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
    department_id INT,
    salary DECIMAL(10 , 2 ) CHECK (salary >= 0),
    FOREIGN KEY (department_id)
        REFERENCES departments (department_id)
);

CREATE TABLE departments (
    department_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(150)
);

CREATE TABLE courses (
    course_id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    department_id INT,
    credits INT,
    FOREIGN KEY (department_id)
        REFERENCES departments (department_id)
);


