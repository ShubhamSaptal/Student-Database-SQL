-- Student Database Project

-- 1. Create Database
CREATE DATABASE student_db;
USE student_db;

-- 2. Create Tables
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    dob DATE
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100),
    credits INT
);

CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 3. Insert Sample Data
INSERT INTO Students (first_name, last_name, email, phone, dob) VALUES
('Ayush', 'Jadhav', 'ayush@example.com', '9876543210', '2003-02-15'),
('Rohan', 'Patil', 'rohan@example.com', '9123456780', '2002-11-10');

INSERT INTO Courses (course_name, credits) VALUES
('Java Programming', 4),
('Database Systems', 3),
('Machine Learning', 4);

INSERT INTO Enrollments (student_id, course_id, enroll_date) VALUES
(1, 1, '2024-08-01'),
(1, 2, '2024-08-05'),
(2, 3, '2024-09-10');

-- 4. Essential SQL Queries

-- Fetch all students
SELECT * FROM Students;

-- Fetch student with courses enrolled
SELECT s.first_name, s.last_name, c.course_name, e.enroll_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- Update student phone
UPDATE Students SET phone = '9998887777' WHERE student_id = 1;

-- Delete an enrollment
DELETE FROM Enrollments WHERE enroll_id = 2;
