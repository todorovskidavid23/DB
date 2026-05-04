--SELECT * FROM dbo.Employees

CREATE OR ALTER PROCEDURE usp_GetEmployeesByGender
(
	@Gender NCHAR='M',
	@GenderCount INT OUT --rezultatot sto treba da se vrati
)
AS
BEGIN
	SELECT * 
	FROM dbo.Employees
	WHERE Gender=@Gender

	SELECT @GenderCount=COUNT(Id)
	FROM dbo.Employees
	WHERE Gender=@Gender
END
GO

DECLARE @GenderCountResult INT
EXECUTE usp_GetEmployeesByGender @Gender='F',@GenderCount=@GenderCountResult OUT

SELECT @GenderCountResult as GenderCount

---2
--Find Product Details from specific Product (by Product name) 
--Return the product price and total quantity of 
--the ordered items for the product

SELECT *  FROM dbo.Products
SELECT * FROM OrderDetails
GO
--detailt,product price i total quantity

CREATE OR ALTER PROCEDURE usp_FindProductDetailtByName
(
	@ProductName NVARCHAR(100),
	@ProductPrice DECIMAL(18,2) OUTPUT,
	@TotalQuantity INT OUTPUT
)
AS
BEGIN
	--Select the product details
	SELECT 
		p.[Name] AS ProductName,
		p.[Description] as ProductDescription,
		p.Price as ProductPrice
	FROM dbo.Products p
	WHERE p.[Name]=@ProductName

	--Set ProductPrice Output
	--18 vkupno 2 decimali
	SELECT @ProductPrice = p.Price
    FROM dbo.Products p
    WHERE p.[Name] = @ProductName

	--Total Quantity
	SELECT @TotalQuantity=SUM(od.Quantity)
	FROM dbo.Products p
	JOIN OrderDetails od ON p.Id=od.ProductId
	WHERE p.[Name] = @ProductName



END
GO

DECLARE @ProductPrice decimal(18,2),@TotalQuantityResult INT, @TotalPrice DECIMAL(18,2)

EXEC usp_FindProductDetailtByName 
'Cereals',
@ProductPrice=@ProductPrice OUTPUT,
@TotalQuantity=@TotalQuantityResult OUTPUT