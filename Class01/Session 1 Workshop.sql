use [master]
go


DROP DATABASE IF EXISTS [SEDC]
GO


create database [SEDC]
go


use [SEDC]
go


-- Make sure no tables exists before creating them--
--dbo.Customer primer toa znaci shema povekje shemi default dbo, isti tablei no razlicna shema
-- 
drop table if exists [dbo].[OrderDetails]
drop table if exists [dbo].[Orders]
drop table if exists [dbo].[Customers]
drop table if exists [dbo].[Employees]
drop table if exists [dbo].[BusinessEntities]
drop table if exists [dbo].[Products]




create table Customers(
	[Id] int IDENTITY(1,1) not null,
	[Name] nvarchar(100) not null,
	[AccountNumber] nvarchar(100) null,
	[City] nvarchar(100) null,
	[RegionName] nvarchar(100) null,
	[CustomerSize] nvarchar(10) null,
	[PhoneNumber] nvarchar(20) null,
	[IsActive] bit not null,
Constraint [PK_Customer] primary key (Id)
)

create table Employees(
	[Id] int IDENTITY(1,1) not null,
	[FirstName] nvarchar(100) not null,
	[LastName] nvarchar(100) not null,
	[DateOfBirth] date null,
	[Gender] nchar(1) null,
	[HireDate] date null,
	[NationalIdNumber] nvarchar(20) null,
Constraint [PK_Employee] primary key (Id)
)

create table Products(
	[Id] int IDENTITY(1,1) not null,
	[Code] nvarchar(50) null,
	[Name] nvarchar(100) null,
	[Description] nvarchar(max) null,
	[Weight] decimal(18,2) null,
	[Price] decimal(18,2) null,
	[Cost] decimal(18,2) null,
Constraint [PK_Product] primary key (Id)
)

create table Orders(
	[Id] bigint IDENTITY(1,1) not null,
	[OrderDate] date null,
	[Status] smallint null,
	[BusinessEntityId] int null,
	[CustomerId] int null,
	[EmployeeId] int null,
	[TotalPrice] decimal(18,2) null,--vo total price imame kolona so decimal broj vkupno 18 cifri od koi 2 decimalni
	[Comment] nvarchar(max) null,
Constraint [PK_Order] primary key (Id)
)

create table OrderDetails(
	[Id] int IDENTITY(1,1) not null,
	[OrderId] bigint null,
	[ProductId] int null,
	[Quantity] int null,
	[Price] decimal (18,2) null,
Constraint [PK_OrderDetail] primary key (Id)
)

create table BusinessEntities(
	[Id] int IDENTITY(1,1) not null,
	[Name] nvarchar(100) null,
	[Region] nvarchar(1000) null,
	[Zipcode] nvarchar(10) null,
	[Size] nvarchar(10) null,
Constraint [PK_BusinessEntity] primary key (Id)
)
go