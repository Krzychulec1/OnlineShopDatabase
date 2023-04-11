CREATE TABLE Product (
	Product_ID INT CHECK(Product_ID>0 AND Product_ID<999999) PRIMARY KEY,
	Type_of_product VARCHAR(40),
	Material VARCHAR(40) CHECK(Material NOT LIKE '%[^A-Z]%') NOT NULL,
	Sleeve_lenght VARCHAR(40) CHECK(Sleeve_lenght NOT LIKE '%[^A-Z]%'),
	Style VARCHAR(40) CHECK(Style NOT LIKE '%[^A-Z]%'),
	Collar VARCHAR(40),
	Pockets BIT,
	Hood BIT,
);

CREATE TABLE Product_version (
	Version_ID INT PRIMARY KEY CHECK(Version_ID>0 AND Version_ID<999999),
	Pattern VARCHAR(40)CHECK(Pattern LIKE '%[A-Z-]%'),
	Color VARCHAR(40) CHECK(Color NOT LIKE '%[^A-Z]%')NOT NULL,
	Product_ID INT REFERENCES Product ON DELETE CASCADE,
);

CREATE TABLE Sizes (
	Code INT CHECK (Code>0 AND Code<9999) PRIMARY KEY,
	Size_name VARCHAR(40) NOT NULL,
	Size_length INT CHECK(Size_length >0),
	Size_width INT CHECK(Size_width>0),
	Sleeve_lenght INT CHECK(Sleeve_lenght>0)
);

CREATE TABLE Warehouse (
	Warehouse_ID INT PRIMARY KEY,
	Warehouse_name VARCHAR(40) CHECK(Warehouse_name LIKE '%[A-Z-]%') NOT NULL,
);

CREATE TABLE Product_position (
	Product_position_ID INT PRIMARY KEY CHECK(Product_position_ID>0 AND Product_position_ID<999999),
	Size VARCHAR(10) CHECK(Size LIKE '%[A-Z-]%') NOT NULL,
	Amount_available INT NOT NULL CHECK(Amount_available>=0),
	Warehouse_ID INT REFERENCES Warehouse ON DELETE SET NULL,
	Code INT REFERENCES Sizes ON DELETE SET NULL,
	Version_ID INT REFERENCES Product_version ON DELETE CASCADE,
);

CREATE TABLE Prices (
	Code INT PRIMARY KEY CHECK(Code>0 AND Code<999999),
	Product_value MONEY NOT NULL CHECK (Product_value > 0),
	Value_for_regular_customer MONEY CHECK (Value_for_regular_customer>0),
	Since DATE NOT NULL,
	Product_position_ID INT REFERENCES Product_position ON DELETE CASCADE,
);

CREATE TABLE Customer (
	Customer_ID INT PRIMARY KEY,
	Customer_name VARCHAR(40) CHECK(Customer_name LIKE '%[A-Z-]%') NOT NULL,
	Customer_surname VARCHAR(40) CHECK(Customer_surname LIKE '%[A-Z-]%')NOT NULL,
	E_mail VARCHAR(40),
	City VARCHAR(40) CHECK(City LIKE '%[A-Z-]%')NOT NULL,
	Street VARCHAR(40)CHECK(Street LIKE '%[A-Z-]%')NOT NULL,
	Postcode VARCHAR(6) NOT NULL,
	Number_of_bulding INT NOT NULL CHECK (Number_of_bulding>0),
	Number_of_flat INT CHECK (Number_of_flat >0),
);

ALTER TABLE Customer
	ADD is_regular_customer BIT;

CREATE TABLE Customer_order (
	Order_ID INT PRIMARY KEY,
	Order_date DATE NOT NULL,
	Order_hour TIME NOT NULL,
	Customer_ID INT REFERENCES Customer ON DELETE SET NULL,
);

CREATE TABLE Payment (
	Payment_ID INT PRIMARY KEY,
	Type_of_payment VARCHAR(40) CHECK(Type_of_payment LIKE '%[A-Z-]%') NOT NULL,
	Payment_date DATE NOT NULL,
	Payment_hour TIME NOT NULL,
	Customer_ID INT REFERENCES Customer_order ON DELETE SET NULL,
);

CREATE TABLE Shipment (
	Package_ID INT PRIMARY KEY  CHECK (Package_ID>0 AND Package_ID<999999),
	Shipment_type VARCHAR(40),
	Delivery_man_number INT NOT NULL CHECK (Delivery_man_number>0),
	Estimated_arrival DATE NOT NULL,
	Warehouse_ID INT REFERENCES Warehouse ON DELETE SET NULL,
	Payment_ID INT REFERENCES Payment ON DELETE SET NULL,
	Order_ID INT REFERENCES Customer_order ON DELETE CASCADE,
);

CREATE TABLE Product_type_order (
	Product_type_order_ID INT PRIMARY KEY,
	Amount_ordered INT CHECK (Amount_ordered>=0) NOT NULL,
	Product_position_ID INT REFERENCES Product_position ON DELETE CASCADE ,
	Order_ID INT REFERENCES Customer_order ON DELETE CASCADE,
);

CREATE TABLE A(
	Column_1 INT,
	Column_2 INT,
	PRIMARY KEY (Column_1,Column_2),
);

CREATE TABLE B(
	Column_3 INT,
	Column_4 INT,
	Column_5 INT PRIMARY KEY,
	FOREIGN KEY(Column_3,Column_4) REFERENCES A(Column_1,Column_2),
);
