CREATE PROCEDURE GetStudentById
	@StudentId int
AS
BEGIN
	SELECT first_name, last_name, email
	FROM Students
	WHERE id = @StudentId;
END;