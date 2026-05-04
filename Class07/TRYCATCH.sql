--try carch
--ako se sluci nekon errora da se hendal
--sto e problemot 
--TRY CATCH
--

SELECT 1/0 AS RESULT

BEGIN TRY
	SELECT 1/0 AS RESULT
	PRINT 'Yey, we devided by zero'
END TRY

BEGIN CATCH
	PRINT 'An error Occured'
	SELECT
	ERROR_NUMBER() as ErrorNumber,
	ERROR_SEVERITY() AS ErrorSeverity,
	ERROR_STATE() AS ErrorState,
	ERROR_PROCEDURE() AS ErrorProcedure,
	ERROR_LINE() AS ErrorLine,
	ERROR_MESSAGE() AS ErrorMessage
END CATCH
GO


--groupa ba povekje insert 
--ili site kje padnat uspoesno ili site kje padant 
--ako go nemame ova nema a se izvrsi ednoto zapise a drigoto paggja,
--imame podatok sto nema znacenje
--grupa na sql komandi 


--
BEGIN TRANSACTION;

--isli kje se izvrsat site kako edno ili niedno

COMMIT; --so zavsuva si se izvrsuvaat
GO


--so pomis ba eeie gabskubg da se resi problem

--EXAMPLE ERROR HANDLING I TRANSAKCII

CREATE OR ALTER PROCEDURE usp_CreateOrderWithDetails
(
	@CustomerId INT,
	@BusinessEntityId INT,
	@EmployeeId INT,
	@ProductId int,
	@Quantity INT,
	@Price DECIMAl(18,2),
	@Comment NVARCHAR(200)
)
AS 
BEGIN
	--Step1 Create the order
	INSERT INTO [Orders](OrderDate,Status,BusinessEntityId,CustomerId,EmployeeId,TotalPrice,Comment)
	VALUES(GETUTCDATE(),0,@BusinessEntityId,@CustomerId,@EmployeeId,0,@Comment)
	
	DECLARE @LastOrderId INT = SCOPE_IDENTITY();--go zima posledniot id
	
	--Step2 Add the details
	INSERT INTO dbo.OrderDetails(OrderId,ProductId,Quantity,Price)
	VALUES(@LastOrderId,@ProductId,@Quantity,@Price)

	--Step3 Update total Price
	UPDATE [Orders]
	SET TotalPrice = @Quantity * @Price
	WHERE Id = @LastOrderId


END
GO

EXEC usp_CreateOrderWithDetails
	@CustomerId =1,
	@BusinessEntityId =1,
	@EmployeeId =1,
	@ProductId =1,
	@Quantity =1,
	@Price =24.99,
	@Comment='This will work'
GO

SELECT *
FROM dbo.[Orders]
ORDER BY Id DESC
SELECT *
FROM dbo.[OrderDetails]
ORDER BY Id DESC