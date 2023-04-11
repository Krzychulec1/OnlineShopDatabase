--Sum of all available hoodies with M size	
SELECT Product.Type_of_product, Product_position.Size, (Product_position.Amount_available) AS Available_amount
	FROM Product_position
	JOIN Product_version ON Product_position.Product_position_ID = Product_version.Version_ID
	JOIN Product ON Product_version.Version_ID = Product.Product_ID
		WHERE Product.Type_of_product = 'Hoodie' AND 
			  Product_position.Size = 'Medium';


--Total amount of products available in each warehouse and the average price of each product version
SELECT Warehouse_name, SUM(Amount_available) AS total_amount, AVG(Product_value) AS avg_price
	FROM Product_position, Warehouse,Product_version, Prices
		WHERE Product_position.Warehouse_ID = Warehouse.Warehouse_ID AND
		Product_position.Version_ID = Product_version.Version_ID AND
		Product_version.Version_ID = Prices.Product_position_ID
	GROUP BY Warehouse_name;


--Names of products that have at least one version with a pattern and the amount available in the warehouse
SELECT Type_of_product, Amount_available, Warehouse_name
	FROM Product
	JOIN Product_position ON Product.Product_ID = Product_position.Product_position_ID
	JOIN Warehouse ON Product_position.Warehouse_ID = Warehouse.Warehouse_ID
		WHERE EXISTS (SELECT Version_ID FROM Product_version WHERE Product_version.Product_ID = Product.Product_ID AND Pattern IS NOT NULL);


--View of all available product versions and their prices when price is lower than 70
SELECT Product.Type_of_product, Product_version.Color, Product_version.Pattern, Product_position.Size, Prices.Product_value
	FROM Product
	JOIN Product_version ON Product.Product_ID = Product_version.Version_ID
	JOIN Product_position ON Product_version.Version_ID = Product_position.Product_position_ID
	JOIN Prices ON Product_position.Product_position_ID = Prices.Code
	WHERE Prices.Product_value <70;

--A query using a view to show the total revenue of each product type from the past month, ordered by revenue in descending order:
CREATE VIEW Monthly_revenue AS
SELECT type_of_product, SUM(Prices.Product_value*Product_type_order.Amount_ordered) AS Revenue
	FROM Product, Prices,Product_type_order,Product_position
		WHERE Product_type_order.Product_type_order_ID= Product_position.Product_position_ID AND
			  Product_position.Product_position_ID= Prices.Code AND
			  Product_position.Product_position_ID = Product.Product_ID
	GROUP BY Product.Type_of_product;
SELECT* FROM Monthly_revenue
ORDER BY Revenue DESC;
			  
--Name, surname and order date of the order that had item that was out of stock
SELECT Customer_name,Customer_surname, Order_date
FROM Customer_order
JOIN Customer ON Customer_order.Customer_ID = Customer.Customer_ID
	WHERE Order_ID IN (SELECT Order_ID FROM Product_type_order
		WHERE Product_position_ID IN (SELECT Product_position_ID FROM Product_position
			WHERE Amount_available = 0));

--Product type and its total revenue if its price is above the average price
SELECT Type_of_product, SUM(Product_value*Amount_ordered) as Total_Revenue
FROM Product_type_order
JOIN Prices ON Product_type_order.Product_position_ID = Prices.Product_position_ID
JOIN Product_version ON Product_type_order.Product_position_ID = Product_version.Product_ID
JOIN Product ON Product_version.Product_ID = Product.Product_ID
	WHERE Product_value > (SELECT AVG(Product_value) FROM Prices
		JOIN Product_position ON Prices.Product_position_ID = Product_position.Product_position_ID
		JOIN Product_version ON Product_position.Version_ID = Product_version.Version_ID
		JOIN Product ON Product_version.Product_ID = Product.Product_ID
			WHERE Type_of_product = Product.Type_of_product)
GROUP BY Type_of_product;

--customers that placed orders in the past year and the money they paid
SELECT Customer_name,Customer_surname, COUNT(Customer_order.Order_ID) as Total_Orders, SUM(Product_value*Amount_ordered) as Total_Revenue
FROM Customer_order
JOIN Customer ON Customer_order.Customer_ID = Customer.Customer_ID
JOIN Product_type_order ON Product_type_order.Product_type_order_ID=Customer_order.Customer_ID
JOIN Product_position ON Product_position.Product_position_ID = Product_type_order.Product_type_order_ID
JOIN Prices ON Prices.Code = Product_position.Product_position_ID
	WHERE Order_date BETWEEN DATEADD(year, -1, GETDATE()) AND GETDATE()
GROUP BY Customer_surname, Customer_name
ORDER BY Total_Orders DESC;