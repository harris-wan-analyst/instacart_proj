-- Create orders table to import csv file

CREATE TABLE IF NOT EXISTS instacart_mdl.orders
(
    "id " character varying(255),
    order_id numeric,
    product_id numeric,
    add_to_cart_order numeric,
    reordered numeric,
    user_id numeric,
    order_day_of_week character varying,
    order_hour_of_day numeric,
    product_name character varying(255),
    aisle_id numeric,
    department_id numeric,
    aisle character varying(255),
    department character varying(255),
    CONSTRAINT orders_pkey PRIMARY KEY ("id ")
);


-- Copy and inset csv file to table

COPY instacart_mdl.orders 
(
	"id",
	order_id,
	product_id,
	add_to_cart_order,
	re_ordered,
	user_id,
	order_day_of_week,
	order_hour_of_day,
	product_name,
	aisle_id,
	department_id,
	aisle,
	department
)
FROM 'path/to/instacart.csv'
DELIMITER ',' CSV HEADER;


-- Copy the original table as backup 

CREATE TABLE instacart_mdl.orders_copy AS
TABLE instacart_mdl.orders;


-- Alter data type of "order_day_of_week" from numeric to varchar 

ALTER TABLE instacart_mdl.orders
ALTER COLUMN order_day_of_week TYPE VARCHAR;


-- Change "order_day_of_week" from 0-6 to Sunday-Saturday

UPDATE instacart_mdl.orders
SET order_day_of_week = CASE 
WHEN order_day_of_week = '0' THEN 'Sunday'
WHEN order_day_of_week = '1' THEN 'Monday'
WHEN order_day_of_week = '2' THEN 'Tuesday'
WHEN order_day_of_week = '3' THEN 'Wednesday'
WHEN order_day_of_week = '4' THEN 'Thursday'
WHEN order_day_of_week = '5' THEN 'Friday'
WHEN order_day_of_week = '6' THEN 'Saturday'
END;