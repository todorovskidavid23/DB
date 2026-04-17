--Constraints
--validacja za inserts
-- dokolku ne se vnese vresnot sakame default da imame kolona 
-- ako ne ti vnesam grad stavi Skopje primerche
-- Defualt Constraint ne si obvrzan da vnesuvas ako imas samo ednagodina

-- ADD CONSTRAINT defualt_city
-- DEFAULT 'Skopje'

create table Products_Test(
	[Id] int IDENTITY(1,1) not null,
	[Code] nvarchar(50) null,
	[Name] nvarchar(100) null,
	[Description] nvarchar(max) null,
	[Weight] decimal(18,2) null,
	[Price] decimal(18,2) null Constraint [DFT_Products_Test_Price] DEFAULT 0,
	[Cost] decimal(18,2) null,
Constraint [PK_Product_Test] primary key (Id),
 --defualt da bide 0
)

insert into Products_Test(Code, Name, Description, Weight, Cost)
values
('P001','Product 1','Description for Product 1',1.5,5.00)

--mora WITH CHECK pred ADD CONSTRAINT
alter table Products_Test WITH CHECK
ADD CONSTRAINT Products_test_Code_Unique UNIQUE(Code)
insert into Products_Test(Code, Name, Description, Weight, Cost)
values
('P001','Product 1','Description for Product 1',1.5,5.00)

--DEFAULT Constraint for Weight
alter table Products_Test 
ADD CONSTRAINT DF_ProductTest_Weight
DEFAULT 100 FOR [Weight]
insert into Products_Test(Code, Name, Description, Cost)
values
('P002','Product 2','Description for Product 2',5.00)

select * from Products_Test



--CHECK Constraint
--ogranicuvanje na nekoja kolona so proverka
--treba dase proveri pred da se insertne check ako go zadovoli constraintot dodadi ako ne ne dodavaj

alter table Products_Test with check
add constraint CHK_ProductsTest_Price
CHECK (Price >= 0)

insert into Products_Test(Code, Name, Description, Price, Cost)
values
('P004','Product 4','Description for Product 4',10,5.00)
