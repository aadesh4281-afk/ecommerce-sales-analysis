

CREATE DATABASE ECommerce_Data

use  ECommerce_Data


CREATE TABLE ecommerce (
    order_id INT,
    order_date DATE,
    region VARCHAR(50),
    category VARCHAR(50),
    segment VARCHAR(50),
    product_name VARCHAR(100),
    sales FLOAT,
    quantity INT,
    profit FLOAT
);




INSERT INTO ecommerce (
    order_id,
    order_date,
    region,
    category,
    segment,
    product_name,
    sales,
    quantity,
    profit
)
SELECT 
    OrderID,        
    Date,          
    Region,         
    Category,      
    Segment,       
    SubCategory,   
    Sales,         
    Quantity,       
    Profit         
FROM dbo.Ecommerce_1000_Rows_Dataset;





SELECT COUNT(*) FROM ecommerce;


---Total Sales & Profit

SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM ecommerce;


---Sales by Category

SELECT category, SUM(sales) AS total_sales
FROM ecommerce
GROUP BY category
ORDER BY total_sales DESC;


---Sales by Region

SELECT region, SUM(sales) AS total_sales
FROM ecommerce
GROUP BY region
ORDER BY total_sales DESC;


---Top 5 Products

SELECT TOP 5 product_name, SUM(sales) AS total_sales
FROM ecommerce
GROUP BY product_name
ORDER BY total_sales DESC;


---Monthly Trend

SELECT 
    FORMAT(order_date, 'yyyy-MM') AS month,
    SUM(sales) AS total_sales
FROM ecommerce
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;

