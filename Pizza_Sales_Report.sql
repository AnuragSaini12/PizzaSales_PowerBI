select * from pizza_sales

-------------Total Revenue------------------
select SUM(total_price) AS Total_Revenue from pizza_sales

------------Average Order Value-------------------
select SUM(total_price) / COUNT(Distinct order_id) as Avg_Order_Value from pizza_sales

-------------Total Pizza Sold------------------
select SUM(quantity) As Total_Pizza_Sold from pizza_sales

--------------Total Orders-----------------
Select SUM(Distinct order_id) As Total_Orders from pizza_sales

------------Average Pizza Per Order----------------
select CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(Distinct order_id) As decimal(10,2)) AS DECIMAL(10,2)) 
AS Average_Pizzas_Per_Order from pizza_sales

--------------Daily Trend For Total Orders----------------------
Select DATENAME(DW, order_date) as order_day, count(Distinct order_id) As Total_Orders 
from pizza_sales
Group By DATENAME(DW, order_date)

---------------Monthly Trend For Total Orders--------------------
Select DATENAME(MONTH, order_date) as Month_Name, count(Distinct order_id) As Total_Orders 
from pizza_sales
Group By DATENAME(MONTH, order_date)
ORDER By Total_Orders DESC

-------------Percentage of sales by pizza orders--------------
select pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 / 
(select SUM(total_price) from pizza_sales where MONTH(order_date) = 1) AS PCT
from pizza_sales
where MONTH(order_date) = 1
Group By pizza_category

-------------Percentage of sales by pizza Size--------------
select pizza_size, CAST(sum(total_price) As Decimal(10,2)) as Total_Sales, CAST(sum(total_price) * 100 / 
(select SUM(total_price) from pizza_sales) As Decimal(10,2)) AS PCT
from pizza_sales
where DATEPART(QUARTER, order_date) = 1
Group By pizza_size
Order By PCT DESC


select TOP 5 pizza_name, SUM(quantity) as Total_Pizzas_Sold 
from pizza_sales
Where Month(order_date) = 8
Group By pizza_name
Order BY SUM(quantity) ASC
 