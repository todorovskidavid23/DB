CREATE OR ALTER VIEW vv_CustomerOrders
AS
select c.Id, c.[Name], count(o.Id) as TotalOrderCount
from Orders o
join Customers c on o.CustomerId = c.Id
group by c.Id, c.[Name]
GO

select * from vv_CustomerOrders
order by TotalOrderCount desc




CREATE VIEW vv_EmployeeOrders
AS
select *
from Orders 