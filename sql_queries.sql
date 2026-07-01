-- =========================================
-- SALES PERFORMANCE & REVENUE ANALYSIS SQL
-- =========================================

-- 1. Total Revenue
SELECT SUM(sales_amount) AS total_revenue
FROM sales;


-- 2. Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM sales;


-- 3. Average Order Value
SELECT 
    SUM(sales_amount) / COUNT(DISTINCT order_id) AS avg_order_value
FROM sales;


-- 4. Monthly Sales Trend
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales_amount) AS monthly_revenue
FROM sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;


-- 5. Daily Sales Trend
SELECT 
    order_date,
    SUM(sales_amount) AS daily_sales
FROM sales
GROUP BY order_date
ORDER BY order_date;


-- 6. Top 5 Products by Revenue
SELECT 
    product_name,
    SUM(sales_amount) AS revenue
FROM sales
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 5;


-- 7. Bottom 5 Products (Low Performance)
SELECT 
    product_name,
    SUM(sales_amount) AS revenue
FROM sales
GROUP BY product_name
ORDER BY revenue ASC
LIMIT 5;


-- 8. Top 5 Customers
SELECT 
    customer_name,
    SUM(sales_amount) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;


-- 9. Customer Purchase Frequency
SELECT 
    customer_name,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY customer_name
ORDER BY total_orders DESC;


-- 10. Region-wise Sales
SELECT 
    region,
    SUM(sales_amount) AS revenue
FROM sales
GROUP BY region
ORDER BY revenue DESC;


-- 11. Category-wise Sales
SELECT 
    category,
    SUM(sales_amount) AS revenue
FROM sales
GROUP BY category
ORDER BY revenue DESC;


-- 12. Sub-category Performance
SELECT 
    sub_category,
    SUM(sales_amount) AS revenue
FROM sales
GROUP BY sub_category
ORDER BY revenue DESC;


-- 13. Sales by Year
SELECT 
    YEAR(order_date) AS year,
    SUM(sales_amount) AS yearly_sales
FROM sales
GROUP BY YEAR(order_date)
ORDER BY year;


-- 14. Top Region by Orders
SELECT 
    region,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY region
ORDER BY total_orders DESC;


-- 15. Repeat Customers
SELECT 
    customer_name,
    COUNT(order_id) AS order_count
FROM sales
GROUP BY customer_name
HAVING COUNT(order_id) > 1
ORDER BY order_count DESC;


-- 16. Sales Contribution Percentage by Category
SELECT 
    category,
    SUM(sales_amount) AS revenue,
    (SUM(sales_amount) * 100.0 / (SELECT SUM(sales_amount) FROM sales)) AS percentage_contribution
FROM sales
GROUP BY category
ORDER BY percentage_contribution DESC;


-- 17. Highest Single Order Value
SELECT 
    order_id,
    MAX(sales_amount) AS highest_order_value
FROM sales
GROUP BY order_id
ORDER BY highest_order_value DESC
LIMIT 1;


-- 18. Orders Per Day
SELECT 
    order_date,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY order_date
ORDER BY order_date;


-- 19. Customer-wise Average Spend
SELECT 
    customer_name,
    AVG(sales_amount) AS avg_spend
FROM sales
GROUP BY customer_name
ORDER BY avg_spend DESC;


-- 20. Region-wise Average Sales
SELECT 
    region,
    AVG(sales_amount) AS avg_sales
FROM sales
GROUP BY region
ORDER BY avg_sales DESC;

-- =========================================
-- END OF FILE
-- =========================================
