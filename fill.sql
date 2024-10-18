-- FILL

USE [University];

INSERT INTO Departments(name) VALUES ('ttp'), ('mi'), ('tk');

INSERT INTO Teachers(first_name, last_name, email, phone, department_id) VALUES
	('Frodo', 'Baggins', 'teacher.ttp@knu.ua', '+380 123 45 67', 1),
	('Gendalf', 'Grey', 'teacher.mi@knu.ua', '+380 123 45 67', 2),
	('Piligrim', 'Took', 'teacher.tk@knu.ua', '+380 123 45 67', 3);

INSERT INTO Parents(first_name) VALUES ('Sauron'), ('Saruman'), ('Radogast');

INSERT INTO Groups(name, curator_id) VALUES ('ttp', 1), ('mi', 2), ('tk', 3);

INSERT INTO Students(first_name, last_name, parent_id, group_id) VALUES
	('The', 'Master', 1, 1),
	('Lord', 'Elrond', 2, 2),
	('Dr', 'Who', 3, 3);

INSERT INTO Courses(name, department_id) VALUES
	('Theory of Programming', 1),
	('Artificial Intelligence', 2),
	('Databases', 3);

INSERT INTO Enrollment(course_id, group_id) VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO Classes(name, course_id, teacher_id) VALUES
	('TP lectures', 1, 1),
	('TP practice', 1, 1),
	('AI lectures', 2, 2),
	('AI practice', 2, 2),
	('DB lectures', 3, 3),
	('DB practice', 3, 3);

INSERT INTO Assignments(title, class_id) VALUES
	('DBMS', 2),
	('Syntax', 4),
	('Machine Learning', 6);

INSERT INTO Grades(grade, student_id, assignment_id, turned_in, graded, graded_by) VALUES
	(99, 1, 1, '2024-10-18', '2024-10-19', 1),
	(99, 2, 2, '2024-10-18', '2024-10-19', 2),
	(99, 3, 3, '2024-10-18', '2024-10-19', 3);

INSERT INTO Attendance(student_id, class_id, date, status) VALUES
	(1, 1, '2024-10-19', 1),
	(1, 2, '2024-10-19', 1),
	(3, 3, '2024-10-19', 1);

INSERT INTO Timetables(class_id, teacher_id, dow, slot) VALUES
	(3, 3, 1, 1),
	(1, 1, 2, 2),
	(2, 2, 3, 3);
