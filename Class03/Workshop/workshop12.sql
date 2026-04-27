-- Workshop 1 & 2

select sum(TotalPrice) as TotalPrice
from Orders
go

select * from Orders

--per e sekogas GroupBy

select be.[Name], sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.[Name]
--sekogas toa sto se grupira obavezno vo select


select be.[Name], sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be on o.BusinessEntityId = be.Id
where o.CustomerId < 20
group by be.[Name]

select * from Customers




select be.[Name], 
max(o.TotalPrice) as MaximumTotalPrice, 
avg(distinct o.TotalPrice) as TotalPriceAverage
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.[Name]



select be.[Name], sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.[Name]
--stom imame group by koristime HAVING
having sum(o.TotalPrice) > 635558


select be.[Name], sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be on o.BusinessEntityId = be.Id
where o.CustomerId < 20
group by be.[Name]
having sum(o.TotalPrice) < 10000




select be.[Name], 
max(o.TotalPrice) as MaximumTotalPrice, 
avg(distinct o.TotalPrice) as TotalPriceAverage
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.[Name]
having sum(o.TotalPrice) > 4 * avg(distinct o.TotalPrice)



--View e virtuelna tabela 
-- tabela sto cklucuva podatoci od povekje tabeli m mesto da se zamarme sto kako bese relacia
-- ednas pisuvame query kreirame view i pravime virtuelna tabela
-- performanso moze da bide problem
-- a viewto ednas kje pockeame da se desi toj join i tie podatoci se cuvaat vo virtuelan tabela



-- za demo wokrshop 3