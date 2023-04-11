INSERT INTO Product VALUES(1,'Shirt','Cotton','Long',NULL,NULL,0,0);
INSERT INTO Product VALUES(2,'Hoodie','Cotton','Long','Streatwear',NULL,0,0);
INSERT INTO Product VALUES(3,'Shirt','Cotton','Short',NULL,NULL,1,1);
INSERT INTO Product VALUES(4,'Jacket','Denim','Long','Vintage',NULL,1,0);
	SELECT* FROM Product;

INSERT INTO Product_version VALUES(1,NULL,'Blue',1);
INSERT INTO Product_version VALUES(2,'Striped','Brown',1);
INSERT INTO Product_version VALUES(3,NULL,'Black',2);
INSERT INTO Product_version VALUES(4,'Checked','White',2);
INSERT INTO Product_version VALUES(5,NULL,'Green',3);
INSERT INTO Product_version VALUES(6,NULL,'Blue',4);
	SELECT* FROM Product_version;

INSERT INTO Sizes VALUES(1,'M',65,47,NULL);
INSERT INTO Sizes VALUES(2,'XL',70,51,NULL);
INSERT INTO Sizes VALUES(3,'XS',61,43,NULL);
INSERT INTO Sizes VALUES(4,'M',114,74,61);
INSERT INTO Sizes VALUES(5,'XLL',135,86,70);
INSERT INTO Sizes VALUES(6,'S',63,45,NULL);
	SELECT* FROM Sizes;

INSERT INTO Warehouse VALUES(1,'Gdansk Airport');
INSERT INTO Warehouse VALUES(2,'Warsaw Airport');
	SELECT* FROM Warehouse;

INSERT INTO Product_position VALUES(1,'M',4500,1,1,1);
INSERT INTO Product_position VALUES(2,'S',5000,1,6,1);
INSERT INTO Product_position VALUES(3,'XL',6000,2,2,1);
INSERT INTO Product_position VALUES(4,'M',6500,1,3,1);
INSERT INTO Product_position VALUES(5,'M',4000,2,4,4);
INSERT INTO Product_position VALUES(6,'XLL',2000,1,5,2);
INSERT INTO Product_position VALUES(7,'XS',3000,1,5,2);
	SELECT* FROM Product_position;

INSERT INTO Prices VALUES(1,140,120,'2022-10-11',1);
INSERT INTO Prices VALUES(2,100,100,'2022-10-01',2);
INSERT INTO Prices VALUES(3,80,75,'2022-02-17',3);
INSERT INTO Prices VALUES(4,140,120,'2022-09-11',4);
INSERT INTO Prices VALUES(5,130,120,'2022-08-11',5);
INSERT INTO Prices VALUES(6,140,120,'2022-10-11',6);
	SELECT* FROM Prices;

INSERT INTO Customer VALUES(1,'Krzysztof','Jeznach','asddfg@wp.pl','Gdañsk','Wawelska','80-034',31,1,1);
INSERT INTO Customer VALUES(2,'Miko³aj','Baliñski','qwert@tlen.pl','Podlasie','Niewiemjaka','54-789',12,1,1);
INSERT INTO Customer VALUES(3,'Kamil','Dêdza','ggfdfsdsa@o2.pl','Tadajewo','Mostowa','73-239',41,NULL,0);
INSERT INTO Customer VALUES(4,'Tomasz','Bernal','adfghdjg@wp.pl','Bydgoszcz','Dworcowa','65-009',90,12,0);
INSERT INTO Customer VALUES(5,'Adam','G¹siorowski','asmnbvcxddfg@wp.pl','Gdañsk','Zaspiañska','80-189',1,54,1);
INSERT INTO Customer VALUES(6,'Patricia','Cajchen','weryuii@tlen.pl','Berlin','Umbegungenstrasse','12-034',1,NULL,0);
	SELECT* FROM Customer;

INSERT INTO Customer_order VALUES(1,'2022-10-11','22:09:55',1);
INSERT INTO Customer_order VALUES(2,'2022-10-01','10:45:10',2);
INSERT INTO Customer_order VALUES(3,'2022-02-21','18:23:58',3);
INSERT INTO Customer_order VALUES(4,'2022-06-09','09:48:30',4);
INSERT INTO Customer_order VALUES(5,'2022-08-25','01:14:05',2);
INSERT INTO Customer_order VALUES(6,'2022-02-25','01:50:05',5);
INSERT INTO Customer_order VALUES(7,'2022-08-28','12:14:05',2);
	SELECT* FROM Customer_order;

INSERT INTO Payment VALUES(1,'2022-10-11','BLIK','22:10:47',1);
INSERT INTO Payment VALUES(2,'2022-10-01','PayPal','10:45:41',2);
INSERT INTO Payment VALUES(3,'2022-02-21','VISA','18:25:09',3);
INSERT INTO Payment VALUES(4,'2022-06-09','MASTERCARD','09:48:37',4);
INSERT INTO Payment VALUES(5,'2022-08-25','BLIK','01:14:56',5);
	SELECT* FROM Payment;

INSERT INTO Shipment VALUES(1,1,'2022-10-13',1,1,1);
INSERT INTO Shipment VALUES(2,1,'2022-10-03',1,2,2);
INSERT INTO Shipment VALUES(3,2,'2022-02-23',1,3,3);
INSERT INTO Shipment VALUES(4,3,'2022-06-11',1,4,4);
INSERT INTO Shipment VALUES(5,2,'2022-08-29',1,5,5);
	SELECT* FROM Shipment;

INSERT INTO Product_type_order VALUES(1,3,'Blue',NULL,'M',4000,1,1);
INSERT INTO Product_type_order VALUES(2,1,'Green',NULL,'S',2000,1,2);
INSERT INTO Product_type_order VALUES(3,2,'Blue',NULL,'M',1000,2,4);
INSERT INTO Product_type_order VALUES(4,10,'Brown','Striped','M',3200,4,2);
INSERT INTO Product_type_order VALUES(5,20,'Brown','Checked','M',3200,4,2);
INSERT INTO Product_type_order VALUES(6,10,'Green','sdsd','M',3200,4,2);
INSERT INTO Product_type_order VALUES(7,40,'Yellow','sdsd','M',3200,4,2);
	SELECT* FROM Product_type_order;



				  




