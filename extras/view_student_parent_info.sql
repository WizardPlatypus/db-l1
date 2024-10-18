CREATE VIEW StudentParentInfo
AS
SELECT
	s.id as student_id,
	s.first_name as student_first_name,
	s.last_name as student_last_name,
	p.first_name as parent_first_name,
	p.last_name as parent_last_name,
	p.email as parent_email
FROM Students s
JOIN Parents p ON s.parent_id = p.id;