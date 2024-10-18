CREATE FUNCTION GetGroup(@GroupId int)
RETURNS TABLE
AS
RETURN
(
	SELECT s.id as student_id, s.first_name, s.last_name
	FROM Students s
	WHERE s.group_id = @GroupId
);