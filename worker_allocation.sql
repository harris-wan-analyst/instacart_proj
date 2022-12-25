-- Help Instacart effectively allocate workers for different time periods and departments

-- What is the daily user usage and purchase amount? 

SELECT 
	order_day_of_week,
	COUNT(DISTINCT user_id) user_count,
	COUNT(product_id) prod_order,
	COUNT(product_id) / COUNT(DISTINCT user_id) user_avg_purchase
FROM instacart_mdl.orders
GROUP BY 1
ORDER BY 3 DESC;

-- We can also look in the form of weekday and weekend.

SELECT 
	CASE WHEN order_day_of_week IN ('Saturday', 'Sunday') THEN 'Weekend'
	ELSE 'Weekday' 
	END AS time_period,
	COUNT(DISTINCT user_id) user_count,
	COUNT(product_id) prod_order,
	COUNT(product_id) / COUNT(DISTINCT user_id) user_avg_purchase
FROM instacart_mdl.orders
GROUP BY 1
ORDER BY 3 DESC;


-- What time do users typically purchase their products? 

SELECT 
	order_hour_of_day,
	COUNT(product_id) prod_order
FROM instacart_mdl.orders
GROUP BY 1
ORDER BY 2 DESC;

-- We can also categorize the hour of day 

SELECT 
	CASE WHEN order_hour_of_day BETWEEN 5 AND 11 THEN 'Morning'
		 WHEN order_hour_of_day BETWEEN 12 AND 17 THEN 'Afternoon'
		 WHEN order_hour_of_day BETWEEN 18 AND 21 THEN 'Evening'
		 ELSE 'Night'
	END AS part_of_day,
	COUNT(product_id) prod_order
FROM instacart_mdl.orders
GROUP BY 1
ORDER BY 2 DESC;

-- Which aisle(s) and department(s) will be the busiest in terms of day and hour?

WITH product_rank AS (
SELECT 
	order_day_of_week,
	order_hour_of_day,
	aisle,
	department,
	COUNT(product_id) prod_order,
	DENSE_RANK () OVER 
		(PARTITION BY order_day_of_week
		 ORDER BY COUNT(product_id) DESC) rnk
FROM instacart_mdl.orders
GROUP BY 1, 2, 3, 4)

SELECT
	order_day_of_week,
	order_hour_of_day,
	aisle,
	department,
	prod_order
FROM product_rank 
WHERE rnk = 1
ORDER BY 5 DESC;

-- Which aisle(s) and department(s) will be the busiest in terms of day and hour?


WITH product_rank AS (
SELECT 
	order_day_of_week,
	order_hour_of_day,
	department,
	COUNT(product_id) prod_order,
	DENSE_RANK () OVER 
		(PARTITION BY order_day_of_week
		 ORDER BY COUNT(product_id)) rnk
FROM instacart_mdl.orders
GROUP BY 1, 2, 3)

SELECT
	order_day_of_week,
	order_hour_of_day,
	department,
	prod_order
FROM product_rank 
WHERE rnk = 1
ORDER BY 4;
