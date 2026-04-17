--WORKSHOP3

--dve sto sakame UNION all david 
-- Uniot all bez presek david i david samo
-- UNIQUE Union
-- distinct unija 
-- presekot INTERSECT
-- EXCEPT Query1/Query2



--
SELECT Name
FROM BusinessEntities
UNION ALL
SELECT Name
FROM Customers

select count(*) from BusinessEntities
select count(*) from Customers



select Region
from BusinessEntities
UNION
select RegionName
from Customers


--List all region where samoe BusinessEntity is based, or some Customer is based. Remove duplicate 
select Region
from BusinessEntities
--EXCEPT--daj mi region kade sto go ima biznis enitetot a go ima customerot
INTERSECT
select RegionName
From Customers



