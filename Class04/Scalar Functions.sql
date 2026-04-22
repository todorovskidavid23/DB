--custom funkcii nareceni scalarni funkcii
-- basic porgrami vo SQL
-- funkciite skalarnite moraat da vrakjaat vrednost
-- sumiranje na total price mora dase vrati barem edna vrednost
-- ili kako cela tabela
-- skalarni funkcii ne koristat select delete i nekoja reusable ne treba
-- STORNA PROCEDURA
-- Select moze da se koristi funckjia
-- spored ime i prezime select 10 selecta so razlicen name
-- skalarna funkcija sto moze da prima parametri


DECLARE
	@FirstName nvarchar(100),
	@LastName nvarchar(100)
	
--ime na varijabla i tipo na varijabla;

SET @FirstName='David'
set @LastName='Todorovski'
select @FirstName as FirstName, @LastName as LastName

declare @FullName nvarchar(100)
set @FullName = @FirstName + ' ' + @LastName 

select @FullName as FullName



select @FirstName = 'Viktor', @LastName= 'Stojanovski'


select *
from Employees 
where FirstName = @FirstName AND LastName = @LastName

--select * from Employees

select @FirstName = 'Filip'

if(LEN(@FirstName) > 3)
	select 'Correct Name'
else 
	select 'Name too short!'


--CASE 
--   WHEN 
--   WHEN
--   WHEN
--END