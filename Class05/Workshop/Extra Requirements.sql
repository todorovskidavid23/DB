--SELECT *
--FROM Pizzas

--SELECT p.Name, p.Description, t.Name
--FROM PizzaToppings pt
--JOIN Pizzas p ON p.Id = pt.PizzaId
--JOIN Toppings t ON t.Id = pt.ToppingId
--WHERE p.Id=4

--FUNCTIONS--
--Create a function that concatenates First and Last Name of a user--

CREATE OR ALTER FUNCTION dbo.GetUserFullName
(
	@FirstName nvarchar(50),
	@LastName nvarchar(50)
)
returns nvarchar(101)
AS
BEGIN
	return CONCAT(@FirstName, ' ', @LastName);
END
GO

SELECT dbo.GetUserFullName(FirstName,LastName) as UserFullName
FROM Users
GO

--Create a view for all undelivered pizzas with user full names--

CREATE OR ALTER VIEW dbo.vv_UndeliveredPizzas
AS
SELECT 
	o.Id,
	dbo.GetUserFullName(u.FirstName,u.LastName) as UserFullName, 
	p.Name as PizzaName,
	od.Quantity,
	od.Price as SingleItemPrice,
	od.Quantity * od.Price as TotalOrderPrice
FROM Orders o
INNER JOIN Users u ON u.Id=o.UserId
INNER JOIN OrderDetails od ON  od.OrderId = o.Id
INNER JOIN Pizzas p ON p.Id = od.PizzaId
WHERE o.IsDelivered = 0;
GO

SELECT *
FROM vv_UndeliveredPizzas
GO



CREATE OR ALTER VIEW dbo.vw_PizzasByPopularity
AS
SELECT 
	p.Id,
	p.Name as PizzaName,
	SUM(od.Quantity) AS TotalQuantity
FROM Pizzas p
INNER JOIN OrderDetails od ON od.PizzaId = p.Id
GROUP BY p.Id, p.Name
GO

SELECT *
FROM vw_PizzasByPopularity
ORDER BY TotalQuantity DESC

SELECT *
FROM OrderDetails