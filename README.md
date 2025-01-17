
```markdown
# Pizza Sales Data Analysis

## Problem Statement

We need to analyze key indicators for our pizza sales data to gain insights into our business performance. Specifically, we want to calculate the following metrics:

### KPI's Requirement

1. **Total Revenue**: The sum of the total price of all pizza orders.
   
   **SQL Query:**
   ```sql
   SELECT SUM(total_price) AS Total_Revenue 
   FROM pizza_sales;
   ```

2. **Average Order Value**: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
   
   **SQL Query:**
   ```sql
   SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value 
   FROM pizza_sales;
   ```

3. **Total Pizzas Sold**: The sum of the quantities of all pizzas sold.
   
   **SQL Query:**
   ```sql
   SELECT SUM(quantity) AS Total_pizza_sold 
   FROM pizza_sales;
   ```

4. **Total Orders**: The total number of orders placed.
   
   **SQL Query:**
   ```sql
   SELECT COUNT(DISTINCT order_id) AS Total_Orders 
   FROM pizza_sales;
   ```

5. **Average Pizzas Per Order**: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.
   
   **SQL Query:**
   ```sql
   SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
   CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order 
   FROM pizza_sales;
   ```

## Charts Requirement

We would like to visualize various aspects of our pizza sales data to gain insights and understand key trends. The following chart requirements are identified:

### 1. Daily Trend for Total Orders

Create a bar chart that displays the daily trend of total orders over a specific time period. This chart will help us identify any patterns or fluctuations in order volumes on a daily basis.

**SQL Query:**
```sql
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);
```

**Chart Image:**
![Daily Trend for Total Orders](path/to/your/image/daily_trend_orders.png)

### 2. Monthly Trend for Total Orders

Create a line chart that illustrates the monthly trend of total orders. This chart will allow us to identify peak months or periods of high order activity.

**SQL Query:**
```sql
SELECT DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date);
```

**Chart Image:**
![Monthly Trend for Total Orders](path/to/your/image/monthly_trend_orders.png)

### 3. Percentage of Sales by Pizza Category

Create a pie chart that shows the distribution of sales across different pizza categories. This chart will provide insights into the popularity of various pizza categories and their contribution to overall sales.

**SQL Query:**
```sql
SELECT pizza_category, 
       CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;
```

**Chart Image:**
![Percentage of Sales by Pizza Category](path/to/your/image/sales_by_category.png)

### 4. Percentage of Sales by Pizza Size

Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. This chart will help us understand customer preferences for pizza sizes and their impact on sales.

**SQL Query:**
```sql
SELECT pizza_size, 
       CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
       CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;
```

**Chart Image:**
![Percentage of Sales by Pizza Size](path/to/your/image/sales_by_size.png)

### 5. Total Pizzas Sold by Pizza Category

Create a funnel chart that presents the total number of pizzas sold for each pizza category. This chart will allow us to compare the sales performance of different pizza categories.

**SQL Query:**
```sql
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
```

**Chart Image:**
![Total Pizzas Sold by Pizza Category](path/to/your/image/pizzas_by_category.png)

### 6. Top 5 Best Sellers by Revenue, Total Quantity, and Total Orders

Create a bar chart highlighting the top 5 best-selling pizzas based on Revenue, Total Quantity, and Total Orders. This chart will help us identify the most popular pizza options.

**SQL Query for Revenue:**
```sql
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;
```

**SQL Query for Quantity:**
```sql
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;
```

**SQL Query for Orders:**
```sql
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;
```

**Chart Image:**
![Top 5 Best Sellers](path/to/your/image/top_5_best_sellers.png)

### 7. Bottom 5 Best Sellers by Revenue, Total Quantity, and Total Orders

Create a bar chart showcasing the bottom 5 worst-selling pizzas based on the Revenue, Total Quantity, Total Orders. This chart will enable us to identify underperforming or less popular pizza options.

**SQL Query for Revenue:**
```sql
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;
```

**SQL Query for Quantity:**
```sql
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;
```

**SQL Query for Orders:**
```sql
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;
```

**Chart Image:**
![Bottom 5 Best Sellers](path/to/your/image/bottom_5_best_sellers.png)

---

### Note

If you want to apply the `pizza_category` or `pizza_size` filters to the above queries, you can use the `WHERE` clause. For example:

```sql
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC;
```

---
