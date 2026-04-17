--redosled na Clause
--From e prva komanda izbira vrkstuva podatoci
--Where filtrira
--GroupBy agregira po nekoj uslov
--having filter po GropuBy
--Select vrakja isfiltrirana data
--Orderby sortira
--Limit limitira row count limit 2 podatoka

--Operatori
-- = Equal dali nesto e endakva na druga vrednost
-- <> not Equal
-- Like Pattern Match
-- Between e kako Range


--Filtrirame so Where Like e za string koga prebaruvame
-- start wih letter B WHere LastName LIKE 'b%'
-- 

-- 1. Find all Employees with FirstName = 'Goran'
SELECT *
FROM Employees
WHERE FirstName = 'Goran'


-- 2. Find all Employees with LastName starting with 'S'
SELECT *
FROM Employees
WHERE LastName LIKE 'S%'


-- 3. Find all Employees with DateOfBirth greater than '01.01.1988'
SELECT *
FROM Employees
WHERE DateOfBirth > '1988-01-01'


-- 4. Find all Male employees
SELECT *
FROM Employees
WHERE Gender = 'M'



-- 5. Find all employees hired in January 1998

SELECT *
FROM Employees
WHERE HireDate between '1998-01-01' and '1998-02-01'



-- 6. Find all Employees with LastName starting with 'A' hired in January 2019
SELECT *
FROM Employees
WHERE LastName LIKE 'A%' and 
HireDate between '2019-01-01' and '2019-02-01'


--WORKSHOP 02

--ORDER BY
-- c# imavme .orderby asc i desc
-- Default e po rastecki redosled ASC

-- 1. Find all Employees with FirstName = 'Aleksandar' ordered by LastName
SELECT *
FROM Employees
WHERE FirstName = 'Aleksandar'
ORDER BY LastName


-- 2. List all Employees ordered by FirstName
SELECT *
FROM Employees
ORDER BY FirstName ASC;


-- 3. Find all Male employees ordered by HireDate (latest first)
SELECT *
FROM Employees
WHERE Gender = 'M'   -- or 'M' depending on schema
ORDER BY HireDate DESC;


