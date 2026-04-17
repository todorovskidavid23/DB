USE [master]
GO

--IF EXISTS (SELECT name FROM sys.databases WHERE name= 'DemoDb')
--	ALTER DATABASE [DemoDb] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
/* 
  promeni ja databazata sto kje ogranican na eden sigle user do nea
  kje ogranicime eden user do bazata posle nego sakame da izvrsime komanda
*/
--GO

--USE [Master]
--GO

--DROP DATABASE IF EXISTS [DemoDb]
--delete na bazata ako postoi
--GO

--CREATE DATABASE [DemoDb]
--GO

--site querynja da se apliciraat na DemoDb

USE [DemoDb]
GO

--CREATE TABLE--
CREATE TABLE [Customer]
(
	[Id] int IDENTITY(1,1) NOT NULL,--kolonata id kje bide od tip integer pocnuvajkji od 1 i plus 1
	[Name] nvarchar(100) NOT NULL,
	[City] nvarchar(50) NULL,
	--Constraints na tablei ogranicuvanje 
	CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([Id] ASC)--rastecki redosled ASCENDING
)
GO

--SELECT--

select * from Customer

select [Name] from Customer

--INSERT--

insert into Customer([Name], [City])
values ('Vero Skopje', 'Skopje')--stringovi se vo edinecni ''

insert into Customer([Name], [City])
values ('Tinex Skopje', 'Skopje')

insert into Customer([Name], [City])
values ('Vero Strumica', 'Strumica')

insert into Customer([Name], [City])
values ('Vero Kumanovo', 'Kumanovo'),
('Vero Tetovo', 'Tetovo'),
('Vero Ohrid', 'Ohrid')

select * from Customer
select [Name] from Customer
select Id, [City] from Customer

select Id, [Name]
from Customer
where [City] = 'Skopje'


--UPDATE--
update Customer set [Name] = 'Vero Taftalidze', City = 'Skopje'
where [Name] = 'Vero Kumanovo'

update Customer set PhoneNumber='070/456-678'
where Id=2


--sekogas uslov
--DELETE--
delete
from Customer
where [Name] = 'Vero Skopje'

--DROP
DROP TABLE Customer


--ALTER--
--da se smeni tabelata
ALTER TABLE Customer
ADD PhoneNumber nvarchar(20)
--mora ako dodavame kolona taa mora da ima NULL deka nema logika da ja dodavame 

