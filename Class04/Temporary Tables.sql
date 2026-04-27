--imaat ista cel table variable 
-- temporaty tabel tabela sto moze da pustame podatoci
-- DA GLUMAT TABELI priveremeno 
--syntax razlika, tabel variable: se nameneti za pomalku podatoci ne se optimizirani za golemi podatocni celini
--ziveat dodeka ni zevee batch edno query toj batch sto se izvrsuva SAMO TAMU ZIVEE
-- Teoporary tabeli podoglemi podatocni setovi CROSS BATCH ziveat dodeka zivee server sesijata
-- prvo se konektirani na serveri vo edna sesija
--TEMPORARY na produkcija na glavnata baza da napravime promena
-- corrupetd data imame i sega sakame  ditekt na taa baza da se napravi pormena
--PRVO BACK UP NA BAZATA
--OD DADEA TABLE USERS DA NAPRAVIME TEMOPORARY USERS TEMP STO GI KOPIRA SITE USERS
-- DA SI MENUVMAE 

-- Table Variable --
-- Visible only in the batch where it is DECLARED
DECLARE @FemaleEmployeeList TABLE
(
	EmployeeID int not null,
	FirstName nvarchar(100) null,
	LastName nvarchar(100)
)


--INSERT INTO @FemaleEmployeeList (EmployeeID, FirstName, LastName)
--VALUES (101,'Ana','Nikilova'),
--	   (102,'Aleksandra','Petrovska'),
--	   (103,'Bojana','Bojanovska')

--SELECT *
--FROM @FemaleEmployeeList

--mora se od pocetok da selektirame

--SELECT *
--FROM Employees
--WHERE Gender='F'


INSERT INTO @FemaleEmployeeList(EmployeeID, FirstName, LastName)
SELECT Id, FirstName, LastName
FROM Employees
WHERE Gender='F'


SELECT *
FROM @FemaleEmployeeList




-- Temporary Table

CREATE TABLE #MaleEmployeeTempTable
(
	EmployeeID int NOT NULL,
	FirstName nvarchar(100) NULL,
	LastName nvarchar(100) NULL
)
---mozeme i vo novo query da se selektira

INSERT INTO #MaleEmployeeTempTable (EmployeeID, FirstName, LastName)
SELECT Id, FirstName, LastName
FROM Employees
WHERE Gender = 'M'


SELECT * 
FROM #MaleEmployeeTempTable

--BATCH SE MISLIS OD GO DO GO ili BEGIN END, ne e cela scripta

--[ USERS ]
--    |
--    | 1:N
--    ↓
--[ ORDERS ]
--    |
--    | 1:N
--    ↓
--[ ORDER_DETAILS ] >------< [ PIZZAS ]
--        |
--        | N:1
--        ↓
--[ PIZZA_SIZES ]

--[ PIZZAS ] >------< [ TOPPINGS ]

