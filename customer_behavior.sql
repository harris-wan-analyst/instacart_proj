-- Help Instacart identify customer ordering behavior 


-- What is the number of users, products, aisles, and departments in the dataset?

SELECT 
	COUNT(DISTINCT user_id) user_count,
	COUNT(DISTINCT product_id) order_count,
	COUNT(DISTINCT aisle_id) aisle_count,
	COUNT(DISTINCT department_id) department_count
FROM instacart_mdl.orders;


-- What is the minimum, maximum, average, and mode of order?

WITH user_product_count AS (
SELECT 
	COUNT(product_id) order_count
FROM instacart_mdl.orders
GROUP BY user_id)

SELECT 
	MIN(order_count) min_order,
	MAX(order_count) max_order, 
	CEIL(AVG(order_count)) avg_order,
	MODE () WITHIN GROUP (ORDER BY order_count) basket_order_frequency
FROM user_product_count;


-- What are the top 10 products customers order? 

SELECT 
	product_name,
	COUNT(*) product_count
FROM instacart_mdl.orders 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;


-- Which product is the most popular in each department? 

WITH department_orders AS (
SELECT 
	department,
	product_name, 
	COUNT(product_id) order_count,
	ROW_NUMBER () OVER (PARTITION BY department ORDER BY COUNT(product_id) DESC) row_num
FROM instacart_mdl.orders
GROUP BY 1,2
ORDER BY 3 DESC)

SELECT 
	department,
	product_name,
	order_count
FROM department_orders
WHERE row_num = 1;


-- Similar, which product is the least popular in each department?

WITH department_orders AS (
SELECT 
	department,
	product_name, 
	COUNT(product_id) order_count,
	ROW_NUMBER () OVER (PARTITION BY department ORDER BY COUNT(product_id)) row_num
FROM instacart_mdl.orders
GROUP BY 1,2
ORDER BY 3 )

SELECT 
	department,
	product_name,
	order_count
FROM department_orders
WHERE row_num = 1;


-- What are the top 5 aisles customers add to cart first? 

SELECT 
	aisle
FROM (SELECT 
		aisle,
		COUNT(*) aisle_count,
		ENSE_RANK () OVER (ORDER BY COUNT(*) DESC) rnk
	  FROM instacart_mdl.orders
	  WHERE add_to_cart_order = 1
	  GROUP BY 1) aisle_rank
WHERE rnk BETWEEN 1 AND 5;


-- Which aisle do customers tend to reorder from? 

SELECT 
	aisle,
	SUM(reordered) reorder_count
FROM instacart_mdl.orders
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


-- What is the average percentage of customers getting the same products reordered?

WITH product_reorder AS (
SELECT
	user_id,
	ROUND (
		100.0 * COUNT(reordered) FILTER (WHERE reordered = 1)/
		COUNT(reordered), 2
		) AS reorder_perc
FROM instacart_mdl.orders
GROUP BY 1)

SELECT 
	ROUND(AVG(reorder_perc),2) || '%' AS avg_reorder
FROM product_reorder;

