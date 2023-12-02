PIZZA SALES SQL QUERIES
A. KPI’s
1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/87774a1e-efa0-4173-a0be-e0f8fd23babd)

 
2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/63e0bf21-7080-4092-a844-d557eb62463f)

 
3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/88faab48-29f7-4c0e-94be-29b9007dca0c)

4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/2ce76bc0-46a1-4eb4-be1f-b01fef6ddab8)

 
5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/d43764bf-e73a-46b1-9310-3eaf52255dcc)

 
B. Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
Output:
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/702fc413-5c92-476a-a62b-e8d383e9fafc)

 
C. Monthly Trend for Orders
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)Output
 ![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/2ff81987-c541-40c9-82a9-f1aded3a715c)


D. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category
Output
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/4f48942d-e834-4116-99b9-cc9167401df5)

 
E. % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size
Output
 ![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/ff649943-a173-4a41-bb7b-3064ff2bf0e5)


F. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC
Output
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/91d70349-8381-4136-9502-198db974084e)

 
G. Top 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/1694f5b4-0e28-4678-a5d8-3659da209fca)

 
H. Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/100cfa75-07c6-41b5-a226-71eb0a7c3ad6)

 
I. Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
Output
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/b870749a-db60-44e5-baf7-677cfc0886f7)

 
J. Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
Output
 ![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/a3673b3a-1ee4-4a06-aac4-5ede81758453)


K. Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/fae28cfb-c115-439e-bf54-c570c541057a)

 
L. Borrom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
![image](https://github.com/AnuragSaini12/PizzaSales_PowerBI/assets/112411180/36fd621e-4e37-4928-a842-c3d363139c6d)

 
NOTE
If you want to apply the pizza_category or pizza_size filters to the above queries you can use WHERE clause. Follow some of below examples
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC

