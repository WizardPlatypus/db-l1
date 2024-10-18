CREATE PROCEDURE EnrollGroupCourse
	@GroupId int,
	@CourseId int
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Enrollment WHERE group_id = @GroupId AND course_id = @CourseId)
	BEGIN
		PRINT 'Group is already enrolled in this course';
		RETURN;
	END

	INSERT INTO Enrollment VALUES (@GroupId, @CourseId);
	PRINT 'Group enrolled successfully';
END;
