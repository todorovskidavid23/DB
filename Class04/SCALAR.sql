-- scalarni funkcii se vikaat ama se reusability primer za funkcija

-- CREATE FUNCTION IME
-- AS

--Template
--CREATE FUNCTION fn_EmployeeFullName(@EmployeeId int)
--RETURNS nvarchar(100)
--AS
--BEGIN
--END
--GO


CREATE FUNCTION fn_EmployeeFullName(@EmployeeId int)
RETURNS nvarchar(100)
AS
BEGIN
	DECLARE @Result NVARCHAR(100)
	
	SELECT @Result = FirstName + ' ' + LastName
	FROM Employees
	WHERE Id=@EmployeeId
	
	RETURN @Result

END
GO

--vo programmabillity imame functions i imame scalar functions

SELECT dbo.fn_EmployeeFullName(101) as FullName

SELECT * FROM Employees