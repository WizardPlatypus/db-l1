CREATE FUNCTION GetEnrollment(@CourseId int)
RETURNS int
AS
BEGIN
	DECLARE @Count int;
	SELECT @Count = COUNT(*) FROM Enrollment e JOIN Students s ON s.group_id = e.group_id WHERE e.course_id = @CourseId;
	RETURN @Count;
END;