--Create new Procedure called CreateOrder
--Procedure should create only Order info (Table order)
--Procedure Should return the total number of orders in the system for the Customer from the new Order(regardless the BusinessEntity)
--Procedure Should return second resultset with the ttal amount of all orders got the customer and business entity on inpuy (regardless the businessEntity)
--
--SELECT * FROM dbo.Orders
--SELECT * FROM dbo.OrderDetails

CREATE OR ALTER PROCEDURE dbo_usp_CreateOrder
(
    @CustomerId INT,
    @BusinessEntityId INT,
    @EmployeeId INT,
    @TotalCustomerOrders INT OUT,
    @TotalCustomerBEOrders INT OUT
)
AS
BEGIN
    -- 1. CREATE ORDER
    
    INSERT INTO dbo.Orders
    (
        OrderDate,
        Status,
        BusinessEntityId,
        CustomerId,
        EmployeeId
        --TotalPrice,
        --Comment
    )
    VALUES
    (
        GETDATE(),
        0,
        @BusinessEntityId,
        @CustomerId,
        @EmployeeId
    );

    SET @TotalCustomerOrders=
    (
        SELECT COUNT(*)FROM dbo.[Orders] o WHERE CustomerId=@CustomerId
    )

    SET @TotalCustomerBEOrders=
    (
        SELECT COUNT(*)FROM dbo.[Orders] o WHERE CustomerId=@CustomerId
        AND BusinessEntityId=@BusinessEntityId
    )

    
    
    -- Total orders for customer
    
    SELECT 
        COUNT(*) AS TotalOrdersForCustomer
    FROM Orders
    WHERE CustomerId = @CustomerId;

    
    -- Total amount for customer + business entity
    SELECT 
        ISNULL(SUM(od.Quantity * od.OrderId), 0) AS TotalAmount
    FROM Orders o
    JOIN OrderDetails od ON o.Id = od.OrderId
    WHERE o.CustomerId = @CustomerId
      AND o.BusinessEntityId = @BusinessEntityId;

END
GO

DECLARE @TotalCustomerOrders INT, @TotalCustomerBEOrders INT

EXEC dbo_usp_CreateOrder
    @CustomerId=4,
    @BusinessEntityId=4,
    @EmployeeId=1,
    @TotalCustomerOrders = @TotalCustomerOrders OUT,
    @TotalCustomerBEOrders=@TotalCustomerBEOrders OUT

SELECT @TotalCustomerOrders AS TotalCustomerOrders, 
    @TotalCustomerBEOrders AS TotalCustomerBEOrders