ALTER TABLE Products
ADD CONSTRAINT DF_Products_Price
DEFAULT (0) FOR Price

--imame dva podatoka so unique
ALTER TABLE Products
ADD CONSTRAINT UC_Product_Name
UNIQUE ([Name]);



--Check Constraint

ALTER TABLE Products
ADD CONSTRAINT CK_Products_Price_Cost
CHECK (Price <= 2 * Cost);

--NOT NULL Constraint

--GreatDetails

--PRIMARY KEY CONSTRAINT

