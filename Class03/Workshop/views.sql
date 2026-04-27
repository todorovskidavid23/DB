
--View e virtuelna tabela 
-- tabela sto cklucuva podatoci od povekje tabeli m mesto da se zamarme sto kako bese relacia
-- ednas pisuvame query kreirame view i pravime virtuelna tabela
-- performanso moze da bide problem
-- a viewto ednas kje pockeame da se desi toj join i tie podatoci se cuvaat vo virtuelan tabela



-- za demo wokrshop 3


--Views--
--Create View
CREATE OR ALTER VIEW [Total amount of orders per business entity] AS
select be.[Name], sum(o.TotalPrice) as TotalPricePerEntity
from Orders o
join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.[Name]
go

select * from [Total amount of orders per business entity]

--site 
-- ocekuvame ako se prati se da raboti SEKOGAS PROVERUVAJ
