USE superstore_sales;
SELECT * FROM e_comm_py2;

#1. Find the total sales and total profit for each category
SELECT category, 
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM e_comm_py2
GROUP BY category;

#2. Find the top 5 states by sales
SELECT state, 
SUM(sales) AS total_sales
FROM e_comm_py2
GROUP BY state
ORDER BY total_sales DESC 
LIMIT 5;

#3. Find the average discount given in each segment
SELECT segment,
AVG(discount) AS avg_discount
FROM e_comm_py2
GROUP BY segment;

#4. Find categories where total profit is negative
SELECT category,
SUM(profit) AS total_profit
FROM e_comm_py2
GROUP BY category
HAVING SUM(profit) < 0;

#5. Show the 10 highest-selling products
SELECT product_name,
SUM(sales) AS total_sales
FROM e_comm_py2
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

#6. Find the 10 most loss-making products
SELECT product_name,
SUM(profit) AS total_profit
FROM e_comm_py2
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;

#7. Find the top 3 customers who generated the highest revenue
SELECT customer_name,
SUM(sales) AS total_sales
FROM e_comm_py2
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 3;

#8. Rank products based on total sales
SELECT product_name,
SUM(sales) AS total_sales,
RANK() OVER(ORDER BY SUM(sales) DESC) AS sales_rnk
FROM e_comm_py2
GROUP BY product_name;

#9. Find the top-selling product in each category
WITH product_sales AS (
    SELECT category, product_name,
        SUM(sales) AS total_sales,
        ROW_NUMBER() OVER(
            PARTITION BY category
            ORDER BY SUM(sales) DESC
        ) AS rn
    FROM e_comm_py2
    GROUP BY category, product_name
)
SELECT *
FROM product_sales
WHERE rn = 1;

#10. Show each order along with the customer's total sales
SELECT order_id, customer_name, sales,
    SUM(sales) OVER(
        PARTITION BY customer_name
    ) AS customer_total_sales
FROM e_comm_py2;

#11. Calculate cumulative sales by order date
WITH daily_sales AS (
    SELECT order_date,
	SUM(sales) AS daily_sales
    FROM e_comm_py2
    GROUP BY order_date
)
SELECT order_date, daily_sales,
    SUM(daily_sales) OVER(
        ORDER BY order_date
    ) AS running_total
FROM daily_sales;

#12. Using a CTE, find customers whose total sales are greater than the overall average customer sales
WITH customer_sales AS (
    SELECT customer_name,
	SUM(sales) AS total_sales
    FROM e_comm_py2
    GROUP BY customer_name
)
SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

#13. Using a CTE, find the top 5 products by profit
WITH product_profit AS (
    SELECT product_name,
	SUM(profit) AS total_profit
    FROM e_comm_py2
    GROUP BY product_name
)
SELECT *
FROM product_profit
ORDER BY total_profit DESC
LIMIT 5;

#14. Using multiple CTEs, find the category having the highest profit
WITH category_profit AS (
    SELECT category,
	SUM(profit) AS total_profit
    FROM e_comm_py2
    GROUP BY category
),
ranked_category AS (
    SELECT *,
    RANK() OVER(
		   ORDER BY total_profit DESC
           ) AS rnk
    FROM category_profit
)
SELECT category, total_profit
FROM ranked_category
WHERE rnk = 1;

#15. Find month-wise sales growth percentage
WITH monthly_sales AS (
    SELECT  DATE_FORMAT(order_date,'%Y-%m'),
	SUM(sales) AS sales
    FROM e_comm_py2
    GROUP BY DATE_FORMAT(order_date,'%Y-%m')
)
SELECT month, sales,
    LAG(sales) OVER(ORDER BY month) AS previous_month_sales,
    ROUND(
        ((sales -
          LAG(sales) OVER(ORDER BY month))
          /
          LAG(sales) OVER(ORDER BY month)
        ) * 100,
        2
    ) AS growth_percent
FROM monthly_sales;

#16. Find customers who placed more than 5 orders and generated sales above ₹10,000
SELECT customer_name,
COUNT(DISTINCT order_id) AS orders,
SUM(sales) AS total_sales
FROM e_comm_py2
GROUP BY customer_name
HAVING COUNT(DISTINCT order_id) > 5
   AND SUM(sales) > 10000;
   
#17. Find products that generated sales but overall resulted in a loss
SELECT product_name,
SUM(sales) AS sales,
SUM(profit) AS profit
FROM e_comm_py2
GROUP BY product_name
HAVING SUM(profit) < 0;

#18. Find the second highest selling state
WITH state_sales AS (
    SELECT state,
	SUM(sales) AS total_sales,
	DENSE_RANK() OVER(
            ORDER BY SUM(sales) DESC
        ) AS rnk
    FROM e_comm_py2
    GROUP BY state
)
SELECT *
FROM state_sales
WHERE rnk = 2;