CREATE TRIGGER LogGradeChange
ON Grades
AFTER UPDATE
AS
BEGIN
	IF UPDATE(grade)
	BEGIN
		IF object_id('GradeLog', 'U') is null
			CREATE TABLE GradeLog (
				student_id int,
				assignment_id int,
				old_grade int,
				new_grade int,
				changed_at datetime
			);
		INSERT INTO GradeLog(student_id, assignment_id, old_grade, new_grade, changed_at)
		SELECT i.id as student_id, d.grade as old_grade, i.grade as new_grade, GETDATE() as changed_at
		FROM inserted i
		JOIN deleted d ON i.id = d.id;
	END;
END;