USE [master]
Go

ALTER DATABASE [PizzaOrdering]
SET SINGLE_USER
WITHOUT ROLLBACK IMMEDIATE
GO
--ako ne se kreira bazata 

DROP DATABASE if EXISTS PizzaOrdering

CREATE DATABASE [PizzaOrdering]
GO

USE [PizzaOrdering]
GO

-- ============
-- DROP TABLES
-- ============
DROP TABLE IF EXISTS Users
DROP TABLE IF EXISTS Pizzas
DROP TABLE IF EXISTS PizzaSizes
DROP TABLE IF EXISTS Toppings
DROP TABLE IF EXISTS Orders
DROP TABLE IF EXISTS OrderDetails
DROP TABLE IF EXISTS PizzaToppings

DROP TABLE IF EXISTS OrderDetailToppings

-- ============
-- CREATE TABLES
-- ============

CREATE TABLE Users(
	Id int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	[Address] nvarchar(150) NOT NULL,
	Phone nvarchar(30) NOT NULL,

)

CREATE TABLE Pizzas(
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(100) NOT NULL,
	Price decimal(10,2) NOT NULL,
	[Description] nvarchar(MAX) NULL,
	SizeId int NOT NULL
)

CREATE TABLE PizzaSizes(
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(50) NOT NULL
)

CREATE TABLE Toppings(
	Id int IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(100) NOT NULL,
	Price decimal(4,2) NOT NULL,
)


CREATE TABLE Orders(
	Id int IDENTITY(1,1) PRIMARY KEY,
	UserId int NOT NULL,
	IsDelivered bit NOT NULL DEFAULT 0,
	TotalPrice decimal(10,2) NOT NULL
)


CREATE TABLE OrderDetails(
	Id int IDENTITY(1,1) PRIMARY KEY,
	PizzaId int NOT NULL,
	OrderId int NOT NULL,
	Quantity int NOT NULL,
	Price decimal(10,2) NOT NULL--UNIT PRICE 

)

CREATE TABLE PizzaToppings(
	Id int IDENTITY(1,1) PRIMARY KEY,
	PizzaId int NOT NULL,
	ToppingId int NOT NULL,
)


--ORDERDETAILS TOPPING m to m

CREATE TABLE OrderDetailToppings(
	Id int IDENTITY(1,1) PRIMARY KEY,
	OrderDetailId int NOT NULL,
	ToppingId int NOT NULL
)



-- ============
-- ADD FOREIGN KEY CONSTRAINTS
-- ============
-- 1->n relacija
ALTER TABLE Pizzas
ADD CONSTRAINT FK_Pizzas_PizzaSizes
FOREIGN KEY (SizeId) REFERENCES PizzaSizes(Id)

--foreign keys se ovde vo pizza topings
--PizzaToping -> Pizza
ALTER TABLE PizzaToppings
ADD CONSTRAINT FK_PizzaToppings_Pizzas
FOREIGN KEY(PizzaId) REFERENCES Pizzas(Id)


ALTER TABLE PizzaToppings
ADD CONSTRAINT FK_PizzaToppings_Toppings
FOREIGN KEY(ToppingId) REFERENCES Toppings(Id)


ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Users
FOREIGN KEY(UserId) REFERENCES Users(Id)

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Pizzas
FOREIGN KEY(PizzaId) REFERENCES Pizzas(Id)

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY(OrderId) REFERENCES Orders(Id)



ALTER TABLE OrderDetailToppings
ADD CONSTRAINT FK_OrderDetailToppings_OrderDetails
FOREIGN KEY (OrderDetailId) REFERENCES OrderDetails(Id)

ALTER TABLE OrderDetailToppings
ADD CONSTRAINT FK_OrderDetailToppings_Toppings
FOREIGN KEY (ToppingId) REFERENCES Toppings(Id)


