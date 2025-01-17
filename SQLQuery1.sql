SELECT * FROM pizza_sales;

-- A. KPI’s

-- 1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


-- 2. Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;
