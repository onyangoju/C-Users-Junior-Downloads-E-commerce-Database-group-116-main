USE Ecommerce;
-- Creating Product table.
CREATE TABLE Product(
ProductId INT PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR(100) NOT NULL,
BrandId INT NOT NULL,
ProductCategoryId INT NOT NULL,
FOREIGN KEY (BrandId) REFERENCES Brand (BrandId),
FOREIGN KEY (ProductCategoryId) REFERENCES ProductCategory (ProductCategoryId)
);

-- Creating Brand table.
CREATE TABLE Brand(
BrandId INT PRIMARY KEY AUTO_INCREMENT,
BrandName VARCHAR (100)
);

-- Creating ProductCategory table.
CREATE TABLE ProductCategory (
ProductCategoryId INT PRIMARY KEY AUTO_INCREMENT,
CategoryName VARCHAR(50)
);

-- Inserting data into Brand table.
INSERT INTO Brand (BrandName)
VALUES ("Urban Threads"),
("MetroMan Apparel"),
("LunaBelle Fashion"),
("DenimDiva"),
("FlexWear"),
("ChicTote"),
("Valor Leather");

-- Inserting data into ProductCategory table.
INSERT INTO ProductCategory (CategoryName)
VALUES ("Men's Wear"),
("Women's Wear"),
("Footwear"),
("Ladies Bag"),
("Men's Bag");

-- Inserting data in Product table
INSERT INTO Product(ProductName, BrandId, ProductCategoryId)
VALUES ("Classic polo shirt", 1, 1),
("Slim fit chino", 2, 1),
("Floral mini dress", 3, 2),
("High-waist denim jeans", 4, 2),
("Canva sneakers", 5, 3),
("Leather crossbody bag", 6, 4),
("RFID-protected men's wallet", 7, 5);

-- Creating AttributeCategory table.
CREATE TABLE AttributeCategory(
AttributeCategoryId INT PRIMARY KEY AUTO_INCREMENT,
CategoryName VARCHAR (50)
);

-- Inserting data into AttributeCategory.
INSERT INTO AttributeCategory (CategoryName)
VALUES ("Physical");

-- Creating AttributeType table.
CREATE TABLE AttributeType(
AttributeTypeId INT PRIMARY KEY AUTO_INCREMENT,
AttributeName VARCHAR (50)
);

-- Inserting data into AttributeType.
INSERT INTO AttributeType (AttributeName)
VALUES ("Text"),
("Boolean"),
("Number"),
("Decimal");

-- Creating ProductAttribute table.
CREATE TABLE ProductAttribute (
ProductAttributeId INT PRIMARY KEY AUTO_INCREMENT,
AttributeName VARCHAR (50),
AttributeValue VARCHAR(50),
AttributeTypeId INT,
AttributeCategoryId INT,
ProductId INT NOT NULL,
FOREIGN KEY (AttributeTypeId) REFERENCES AttributeType(AttributeTypeId),
FOREIGN KEY (AttributeCategoryId) REFERENCES AttributeCategory(AttributeCategoryId),
FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);

-- Inserting data into ProductAttribute table.
INSERT INTO ProductAttribute (AttributeName, AttributeValue, AttributeTypeId, AttributeCategoryId, ProductId)
VALUES ("Material", "Cotton", 1, 1, 1),
("Stretchable fabric", "Yes", 2,1, 2),
("Lightweight", "Yes", 2, 1, 3),
("Dark-wash", "Yes", 2, 1, 4),
("Material", "Canva", 1, 1, 5),
("Material", "Leather", 1, 1, 6),
("Material", "Leather", 1, 1, 7);

-- Creating color table.
CREATE TABLE Color(
ColorId INT PRIMARY KEY AUTO_INCREMENT,
ColorName VARCHAR (50)
);

-- Inserting data into ColorId
INSERT INTO Color(ColorName)
VALUES ("Black"),
("Red"),
("White"),
("Navy blue"),
("Khaki"),
("Pink"),
("Maroon"),
("Grey"),
("Brown"),
("Beige");

-- Creating ProductImage table.
CREATE TABLE ProductImage (
  ProductImageId INT PRIMARY KEY AUTO_INCREMENT,
  ImageUrl VARCHAR(255) NOT NULL,
  ProductId INT NOT NULL,
  FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
);

-- Creating ProductItem table.
CREATE TABLE ProductItem (
 ProductItemId INT PRIMARY KEY AUTO_INCREMENT,
  ProductId INT NOT NULL,
  ProductAttributeId INT NOT NULL,
  Price DECIMAL,
  FOREIGN KEY (ProductId) REFERENCES Product(ProductId),
  FOREIGN KEY (ProductAttributeId) REFERENCES ProductAttribute(ProductAttributeId)
   );

   -- Inserting data int ProductItem table.
INSERT INTO ProductItem (ProductId, ProductAttributeId, Price)
VALUES (1, 8, 2600),
(2, 9, 4550),
(3, 10, 5460),
(4, 11, 4940),
(5, 12, 3900),
(6, 13, 6500),
(7, 14, 3640);

-- Creating SizeCategory table.
CREATE TABLE SizeCategory(
SizeCategoryId INT PRIMARY KEY AUTO_INCREMENT,
SizeName VARCHAR (50)
);

-- Inserting data into SizeCategory table.
INSERT INTO SizeCategory (SizeName)
VALUES ("Men's clothes size"),
("Women's clothes size"),
("Men's shoe size"),
("Women shoe size"),
("Bag size"),
("Wallet size");

-- Creating SizeOption table.
CREATE TABLE SizeOption(
SizeOptionId INT PRIMARY KEY AUTO_INCREMENT,
SizeCategoryId INT NOT NULL,
SizeValue VARCHAR (50),
FOREIGN KEY (SizeCategoryId) REFERENCES SizeCategory(SizeCategoryId)
);

-- Insertin data into SizeOption table.
INSERT INTO SizeOption (SizeCategoryId, SizeValue)
VALUES (1, "S"),
(1, "M"),
(1, "L"),
(1, "XL"),
(1, "30"),
(1, "31"),
(1, "34"),
(1, "36"),
(2, "XS"),
(2, "S"),
(2, "M"),
(2, "L"),
(2, "26"),
(2, "28"),
(2, "30"),
(2, "32"),
(3, "38"),
(3, "39"),
(3, "40"),
(3, "41"),
(3, "42"),
(5, "S"),
(6, "Slim"),
(6, "Compact"),
(6, "Long");

-- Creating ProductVariation table.
CREATE TABLE ProductVariation(
ProductVariationId INT PRIMARY KEY AUTO_INCREMENT,
ProductId INT NOT NULL,
ColorId INT NOT NULL,
SizeOptionId INT NOT NULL,
Stock INT
);

-- Inserting data into ProductVariation table.
INSERT INTO ProductVariation (ProductId, ColorId, SizeOptionId, Stock)
VALUES
(1, 1, 1, 1),
(1, 4, 2, 12),
(1, 1, 3, 9),
(1, 3, 4, 3),
(2, 8, 5, 17),
(2, 8, 6, 7),
(2, 5, 7, 6),
(2, 5, 8, 2),
(3, 3, 9, 1),
(3, 6, 2, 12),
(3, 6, 3, 9),
(3, 3, 1, 3),
(4, 8, 10, 17),
(4, 8, 11, 7),
(4, 5, 5, 6),
(4, 5, 6, 2),
(5, 8, 12, 17),
(5, 8, 13, 7),
(5, 5, 14, 6),
(5, 5, 15, 2),
(6, 9, 16, 2),
(6, 10, 16, 2),
(6, 1, 16, 2),
(6, 6, 16, 2),
(7, 9, 17, 9),
(7, 9, 18, 6),
(7, 1, 19, 12);

