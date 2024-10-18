USE [University];

DROP TABLE IF EXISTS Timetables;
DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Exams;
DROP TABLE IF EXISTS Events;
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS ClubsMembership;
DROP TABLE IF EXISTS Clubs;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Attendance;

DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Parents;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Assignments;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Teachers;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name nvarchar(100) NOT NULL,
);

CREATE TABLE Teachers(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  first_name nvarchar(50) NOT NULL,
  last_name nvarchar(50) NOT NULL,
  email nvarchar(100) NOT NULL,
  phone nvarchar(20),
  department_id int FOREIGN KEY REFERENCES Departments(id),
);

CREATE TABLE Classes(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name nvarchar(100) NOT NULL,
  course_id int,
  teacher_id int FOREIGN KEY REFERENCES Teachers(id),
);

CREATE TABLE Assignments(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  title nvarchar(30) NOT NULL,
  description text,
  due date,
  class_id int FOREIGN KEY REFERENCES Classes(id),
);

CREATE TABLE Groups(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name nvarchar(10) NOT NULL,
  curator_id int FOREIGN KEY REFERENCES Teachers(id),
);

CREATE TABLE Parents(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  first_name nvarchar(50),
  last_name nvarchar(50),
  email nvarchar(100),
  phone nvarchar(20),
);

CREATE TABLE Students(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  first_name nvarchar(50) NOT NULL,
  last_name nvarchar(50) NOT NULL,
  email nvarchar(100),
  phone nvarchar(20),
  dob date,
  parent_id int FOREIGN KEY REFERENCES Parents(id),
  group_id int FOREIGN KEY REFERENCES Groups(id),
);

CREATE TABLE Attendance(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  student_id int FOREIGN KEY REFERENCES Students(id) NOT NULL,
  class_id int FOREIGN KEY REFERENCES Classes(id) NOT NULL,
  date date NOT NULL,
  status bit NOT NULL,
);

CREATE TABLE Books(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  title nvarchar(100) NOT NULL,
  author nvarchar(100) NOT NULL,
  isbn nvarchar(20) NOT NULL,
  available int NOT NULL,
);

CREATE TABLE Clubs(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name nvarchar(20) NOT NULL,
  president_id int FOREIGN KEY REFERENCES Students(id),
);

CREATE TABLE ClubsMembership(
  club_id int NOT NULL,
  student_id int FOREIGN KEY REFERENCES Students(id) NOT NULL
);

CREATE TABLE Courses(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name nvarchar(100) NOT NULL,
  department_id int FOREIGN KEY REFERENCES Departments(id) NOT NULL,
);

CREATE TABLE Enrollment(
  course_id int NOT NULL,
  group_id int FOREIGN KEY REFERENCES Groups(id) NOT NULL
);

CREATE TABLE Events(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name nvarchar(100),
  date date,
  description nvarchar(200),
);

CREATE TABLE Exams(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name nvarchar(100) NOT NULL,
  date date NOT NULL,
  class_id int FOREIGN KEY REFERENCES Classes(id) NOT NULL,
);

CREATE TABLE Grades(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  grade int NOT NULL,
  student_id int FOREIGN KEY REFERENCES Students(id) NOT NULL,
  assignment_id int FOREIGN KEY REFERENCES Assignments(id) NOT NULL,
  turned_in date NOT NULL,
  graded date NOT NULL,
  graded_by int NOT NULL,
  deleted bit,
);

CREATE TABLE Timetables(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  class_id int FOREIGN KEY REFERENCES Classes(id) NOT NULL,
  teacher_id int FOREIGN KEY REFERENCES Teachers(id) NOT NULL,
  dow int NOT NULL,
  slot int NOT NULL,
);


