
-- SQL query scripts for:
-- 1The top grades for each student
-- 2 Sort students by the courses that they are enrolled in
-- 3 Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course
-- 4 Finding which student and professor have the most courThe average grade that is given by each professor
-- ses in common

CREATE DATABASE educacion;
USE  educacion;

CREATE TABLE Students(
StudentId INT PRIMARY KEY,
StudentNameSurname VARCHAR (255) NOT NULL
);

CREATE TABLE Professors(
ProfessorID INT PRIMARY KEY,
ProfessorNameSurname VARCHAR(255) NOT NULL

);

CREATE TABLE Courses(
CourseId INT PRIMARY KEY,
CourseName VARCHAR(50) NOT NULL,
Professor INT,

foreign key(Professor) REFERENCES Professors(ProfessorID)

);

CREATE TABLE Grades(
GradeID INT PRIMARY KEY,
Student INT,
Course INT,
Grade double NOT NULL,

foreign key(Student) REFERENCES Students(StudentId),
foreign key(Course) references Courses(CourseId)

);

-- Insert data
INSERT INTO Students (StudentID, StudentNameSurname) VALUES (1, 'Andoni Serrano Fernandez');
INSERT INTO Students (StudentID, StudentNameSurname) VALUES (2, 'Manuel Guiterres del Barrio');
INSERT INTO Students (StudentID, StudentNameSurname) VALUES (3, 'Olatz Salmeron Llaguno');
INSERT INTO Students(StudentID, StudentNameSurname) VALUES (4, "Alberto Casado");

INSERT INTO Professors (ProfessorID, ProfessorNameSurname) VALUES (1, 'Andoni García');
INSERT INTO Professors (ProfessorID, ProfessorNameSurname) VALUES (2, 'Javier Saurez Garcia');


INSERT INTO Courses (CourseID, CourseName, Professor) VALUES (1, 'Javascript', 1);
INSERT INTO Courses (CourseID, CourseName, Professor) VALUES (2, 'Java', 2);

INSERT INTO Grades (GradeID, Student, Course, Grade) VALUES (1, 1, 1, 9.75);
INSERT INTO Grades (GradeID, Student, Course, Grade) VALUES (2, 2, 1, 8.6);
INSERT INTO Grades (GradeID, Student, Course, Grade) VALUES (3, 3, 2, 8.90);
INSERT INTO Grades (GradeID, Student, Course, Grade) Values(4,4,2,7.25);

-- Queries 1

SELECT Professor, AVG(Grade) AS Grade
FROM GRADes INNER JOIN Courses ON Grades.Course = Courses.CourseId group by Professor;

-- Queries 2

SELECT Student, MAX(Grade) As MAX_GRADE FROM
Grades GROUP BY Student;
 -- Queries 3
 
 SELECT st.StudentID, st.StudentNameSurname AS Name , co.CourseName AS course
 FROM Students As st INNER JOIN Grades As gr ON st.StudentID = gr.Student
 JOIN Courses AS co ON gr.Course = co.CourseID
 ORDER BY co.CourseName, st.StudentNameSurname;
 
 -- Queries 4
 
 SELECT co.courseName, AVG(gr.Grade) AS Average FROM COURSES AS co
 INNER JOIN Grades As gr ON gr.Course = co.CourseId
 GROUP BY co.CourseName
 ORDER BY AVG(gr.Grade);