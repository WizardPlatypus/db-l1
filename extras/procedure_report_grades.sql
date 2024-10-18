CREATE PROCEDURE ReportGrades
	@StudentId int
AS
BEGIN
	SELECT
		c.name,
		g.grade,
		g.id,
		g.graded
	FROM Grades g
	JOIN Classes c ON g.assignment_id = c.id
	WHERE g.student_id = @StudentId;
END;