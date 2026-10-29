SELECT * FROM pizza_sales

--Daily Trend
SELECT  DATENAME(DW, order_date) AS Order_day,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY DATENAME(DW, order_date);

--Hourly Trend
SELECT DATEPART(HOUR,order_time) AS order_hours,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time);

--Percentage Sales by category
SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS Pct_sales
FROM pizza_sales 
GROUP BY pizza_category

--Percentage Sales by Size
SELECT pizza_size, SUM(total_price) AS Total_sales,CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS Pct_sales
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY Pct_sales DESC;

--Total Pizzas sold by Category
SELECT pizza_category,SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales 
GROUP BY pizza_category;

--Top 5 Best Sellers by Total sold
SELECT  TOP 5 pizza_name, SUM(quantity) AS Total_pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizzas_Sold DESC

--Bottom 5 Worst Sellers by Total sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_pizzas_Sold ASC