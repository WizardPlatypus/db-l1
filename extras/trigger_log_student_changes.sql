CREATE TRIGGER LogStudentChanges
ON Students
AFTER UPDATE
AS
BEGIN
	IF object_id('StudentLog', 'U') is null
		CREATE TABLE StudentLog (
			student_id int,
			old_first_name VARCHAR(50),
			new_first_name VARCHAR(50),
			old_last_name VARCHAR(50),
			new_last_name VARCHAR(50),
			changed_at datetime
		);
	INSERT INTO StudentLog(student_id, old_first_name, new_first_name, old_last_name, new_last_name, changed_at)
	SELECT d.id as student_id, d.first_name as old_first_name, i.first_name as new_first_name, d.last_name as old_last_name, i.last_name as new_last_name, GETDATE() as changed_at
	FROM inserted i
	JOIN deleted d ON i.id = d.id;
END;