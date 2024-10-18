CREATE TRIGGER MarkAbsent
ON Attendance
AFTER INSERT
AS
BEGIN
	INSERT INTO Attendance(student_id, class_id, date, status)
	SELECT s.id as student_id, c.id as class_id, i.date as attendance_date, 0
	FROM Students s
	CROSS JOIN Classes c
	LEFT JOIN inserted i ON s.id = i.student_id AND c.id = i.class_id
	WHERE i.student_id IS NULL AND i.date = CAST(GETDATE() AS DATE);
END;