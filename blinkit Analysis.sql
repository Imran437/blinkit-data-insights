SELECT * FROM blinkit_data;


SELECT count(*) FROM blinkit_data;


-- Data Cleaning 

UPDATE blinkit_data 
SET item_fat_content = 
CASE 
WHEN item_fat_content IN ('LF', 'low fat') THEN 'Low Fat'
WHEN item_fat_content ='reg' THEN 'Regular'
ELSE item_fat_content 
END; 




SELECT DISTINCT item_fat_content FROM blinkit_data;

-- Total Sales 

SELECT sum(Total_sales) AS TotalSales FROM blinkit_data;

-- make totalsales in million using cast 

SELECT concat(cast(sum(Total_sales)/1000000 as DECIMAL(10, 2)), 'M') AS TotalSales_in_Million
FROM blinkit_data;


-- Average sales 


SELECT avg(total_sales) AS Average_sales FROM blinkit_data;


SELECT cast(avg(total_sales) AS DECIMAL(10, 2))AS Average_sales FROM blinkit_data;

-- number of items 

SELECT count(*) AS Number_of_items FROM blinkit_data;


-- Total sales of Low Fat 

SELECT item_fat_content, sum(Total_sales) AS Total_sales FROM blinkit_data
WHERE Item_fat_content = 'Low Fat'
GROUP BY Item_fat_content; 


-- Total ales by items 

SELECT item_fat_content, sum(Total_sales) AS Total_sales FROM blinkit_data
GROUP BY Item_fat_content;

-- total sales of 2020 

SELECT sum(total_sales) TotalSales FROM blinkit_data 
WHERE Outlet_Establishment_Year = 2020;


-- Average Rating 

SELECT avg(Rating) AS Avg_Rating FROM blinkit_data;

-- up to decimal points 

SELECT cast(avg(Rating)AS DEC(10, 2)) AS Avg_Rating FROM blinkit_data;

-- Granular requirements  

-- Total sales by fat content 

SELECT item_fat_content, sum(total_sales) AS TotalSales 
FROM blinkit_data 
GROUP BY Item_fat_content
ORDER BY TotalSales DESC;


-- make it as two decimal places 

SELECT item_fat_content, cast(sum(total_sales) AS DECIMAL(10, 2)) AS TotalSales 
FROM blinkit_data 
GROUP BY Item_fat_content
ORDER BY TotalSales DESC;


-- average total sales 
SELECT item_fat_content, cast(avg(total_sales) AS DECIMAL(10, 2)) AS Avg_Sales 
FROM blinkit_data 
GROUP BY Item_fat_content
ORDER BY Avg_Sales DESC;

-- count of orders 

SELECT item_fat_content, 
concat(cast(sum(total_sales)/1000 AS DECIMAL(10, 2)), 'K') AS TotalSales_in_thousand,
cast(avg(total_sales) AS DECIMAL(10, 2)) AS Avg_Sales,
count(*) AS Number_of_items 
FROM blinkit_data 
GROUP BY Item_fat_content
ORDER BY TotalSales_in_thousand DESC;

-- Total Sales by item type 

SELECT item_type, 
cast(sum(total_sales) AS DECIMAL(10, 2)) AS TotalSales,
cast(avg(total_sales) AS DECIMAL(10, 2)) AS Avg_Sales,
count(*) AS Number_of_items 
FROM blinkit_data 
GROUP BY Item_type
ORDER BY TotalSales DESC
LIMIT 5;



-- Fat content by outlet for total sales 

SELECT Outlet_Location_Type, item_fat_content, 
cast(sum(total_sales) AS DECIMAL(10, 2)) AS TotalSales,
cast(avg(total_sales) AS DECIMAL(10, 2)) AS Avg_Sales,
count(*) AS Number_of_items 
FROM blinkit_data 
GROUP BY Outlet_Location_Type, Item_fat_content
ORDER BY Outlet_location_type;


-- Total sales by establishment year 

SELECT Outlet_establishment_year, 
cast(sum(total_sales) AS DECIMAL(10, 2)) AS TotalSales,
cast(avg(total_sales) AS DECIMAL(10, 2)) AS Avg_Sales,
count(*) AS Number_of_items 
FROM blinkit_data 
GROUP BY Outlet_establishment_year
ORDER BY Outlet_establishment_year;


-- Percentage of sales by outlet size 

SELECT outlet_size,
cast(sum(total_sales) AS DECIMAL(10, 2)) AS TotalSales, 
cast(sum(total_sales)*100.0 / sum(sum(total_sales)) OVER() as DECIMAL(10, 2)) AS Percentage_of_TotalSales 
FROM blinkit_data
GROUP BY Outlet_size;


-- Sales by outlet location 

SELECT outlet_location_type,
cast(sum(total_sales) AS DECIMAL(10, 2)) AS TotalSales, 
cast(sum(total_sales)*100.0 / sum(sum(total_sales)) OVER() as DECIMAL(10, 2)) AS Percentage_of_TotalSales 
FROM blinkit_data
GROUP BY Outlet_Location_Type;


-- all metrics by outlet type 

SELECT outlet_type,
cast(sum(total_sales) AS DECIMAL(10, 2)) AS TotalSales, 
cast(sum(total_sales)*100.0 / sum(sum(total_sales)) OVER() as DECIMAL(10, 2)) AS Percentage_of_TotalSales 
FROM blinkit_data
GROUP BY Outlet_type;







