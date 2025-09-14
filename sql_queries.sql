CREATE DATABASE salesdb;
USE salesdb;

CREATE TABLE sales (
    Row_ID INT AUTO_INCREMENT PRIMARY KEY,   -- generated automatically
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Region VARCHAR(50),
    Product_Category VARCHAR(50),
    Product_Name VARCHAR(200),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Total_Sales DECIMAL(12,2)
);
-- to check 
SELECT * FROM sales LIMIT 10;

-- top 10 customers by total spend
SELECT Customer_ID, ROUND(SUM(Total_Sales),2) AS Total_Spend
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Spend DESC
LIMIT 10;

-- products are the top revenue generators
SELECT Product_Name, ROUND(SUM(Total_Sales),2) AS Total_Revenue
FROM sales
GROUP BY Product_Name
ORDER BY Total_Revenue DESC
LIMIT 10;

-- product categories generate the most revenue
SELECT Product_Category, ROUND(SUM(Total_Sales),2) AS Total_Revenue
FROM sales
GROUP BY Product_Category
ORDER BY Total_Revenue DESC;

-- regions are strongest in terms of sales?
SELECT Region, ROUND(SUM(Total_Sales),2) AS Total_Revenue
FROM sales
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- the average spend per customer order?
SELECT Customer_ID, 
       ROUND(AVG(Total_Sales),2) AS Avg_Order_Value,
       COUNT(DISTINCT Order_ID) AS Orders
FROM sales
GROUP BY Customer_ID
ORDER BY Avg_Order_Value DESC
LIMIT 10;

-- do sales change month by month?
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
       ROUND(SUM(Total_Sales),2) AS Total_Revenue
FROM sales
GROUP BY Month
ORDER BY Month;

-- products sell in high quantities vs bring high revenue?
SELECT Product_Name,
       SUM(Quantity) AS Total_Units,
       ROUND(SUM(Total_Sales),2) AS Total_Revenue
FROM sales
GROUP BY Product_Name
ORDER BY Total_Revenue DESC
LIMIT 10;

-- categories dominate in each region?
SELECT Region, Product_Category, ROUND(SUM(Total_Sales),2) AS Total_Revenue
FROM sales
GROUP BY Region, Product_Category
ORDER BY Region, Total_Revenue DESC;

-- orders are considered high-value (above 5,000 in sales)?
SELECT Order_ID, Customer_ID, Total_Sales
FROM sales
WHERE Total_Sales > 5000
ORDER BY Total_Sales DESC;

-- the lifetime sales value of each customer?
SELECT Customer_ID, ROUND(SUM(Total_Sales),2) AS Lifetime_Value
FROM sales
GROUP BY Customer_ID
ORDER BY Lifetime_Value DESC;

-- Customer Ranking by Revenue
SELECT Customer_ID,
       ROUND(SUM(Total_Sales),2) AS Total_Spend,
       RANK() OVER (ORDER BY SUM(Total_Sales) DESC) AS Rank_By_Revenue
FROM sales
GROUP BY Customer_ID
ORDER BY Total_Spend DESC;

-- Total Sales
SELECT SUM(Total_Sales) AS Total_Sales
FROM sales;

-- Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales;

-- Total Customers
SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM sales;

-- Average Order Value
SELECT SUM(Total_Sales) * 1.0 / COUNT(DISTINCT Order_ID) AS Avg_Order_Value
FROM sales;

-- Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales;

-- Total Customers
SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM sales;

-- Average Order Value
SELECT SUM(Total_Sales) * 1.0 / COUNT(DISTINCT Order_ID) AS Avg_Order_Value
FROM sales;

-- Customer Lifetime Value
SELECT Customer_ID, SUM(Total_Sales) AS Lifetime_Value
FROM sales
GROUP BY Customer_ID
ORDER BY Lifetime_Value DESC;

-- Average Customer Value
SELECT SUM(Total_Sales) * 1.0 / COUNT(DISTINCT Customer_ID) AS Avg_Customer_Value
FROM sales;

-- Product Revenue + Quantity
SELECT Product_Name,
       SUM(Total_Sales) AS Product_Revenue,
       SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY Product_Name
ORDER BY Product_Revenue DESC;

-- Monthly Sales
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
       SUM(Total_Sales) AS Monthly_Sales
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month;

-- Orders above 5000
SELECT Order_ID, Customer_ID, SUM(Total_Sales) AS Order_Total
FROM sales
GROUP BY Order_ID, Customer_ID
HAVING SUM(Total_Sales) > 5000
ORDER BY Order_Total DESC;

-- KPI Metrics
SELECT 
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Total_Sales) AS Product_Revenue,
    SUM(Total_Sales) / COUNT(DISTINCT Order_ID) AS Average_Order_Value
FROM sales;

-- Product Revenue by Customer (Top Customers)
SELECT 
    Customer_ID,
    SUM(Total_Sales) AS Product_Revenue
FROM sales
GROUP BY Customer_ID
ORDER BY Product_Revenue DESC
LIMIT 10;

-- High Value Orders + Total Orders + Total Quantity by Product
SELECT 
    Product_Name,
    SUM(CASE WHEN Total_Sales > 5000 THEN 1 ELSE 0 END) AS High_Value_Orders,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY Product_Name
ORDER BY High_Value_Orders DESC;

-- Total Orders by Month
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month;

-- Total Quantity by Category
SELECT 
    Product_Category,
    SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY Product_Category
ORDER BY Total_Quantity DESC;

-- Region Sales
SELECT 
    Region,
    SUM(Total_Sales) AS Total_Sales
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Monthly Sales
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Total_Sales) AS Monthly_Sales
FROM sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month;
















