--buult in 
--customize data po nasi potrebi
-- kako da se najde dolzina na odreden string na LEN site zapisi na FirstName
-- za sekoj zapis si pisuva kolku vkupno karakteri
-- SELECT FirstName, LEN(FirstName) AS [Name Length] From Students;
-- Substring (od startenindex, do koj indeks sakas)
-- UPPER i LOWER 

--LEN()
select FirstName, LEN(LastName) as LastNameLength
from Employees

--SUBSTRING()
--ne e zero index si pocnuva od 1
select Code, SUBSTRING(Code,1,3) as ShortCode
from Products


--REPLACE()
select FirstName, LastName, REPLACE(Gender, 'M', 'Male') as GenderFullName
from Employees



select GETDATE()


select UPPER(FirstName) as FirstNamesToUpperCase, LOWER(LastName) as LastNamesToLowerCase
from Employees







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

