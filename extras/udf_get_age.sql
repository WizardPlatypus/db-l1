CREATE FUNCTION CalculateAge(@dob date)
RETURNS int
AS
BEGIN
	RETURN datediff(year, @dob, getdate());
END;