
CREATE TABLE sales_data AS

SELECT
o.order_id,
o.order_date,
p.product_id,
p.product_name,
p.category,
c.region,
i.quantity,
i.unit_price,
i.quantity * i.unit_price AS revenue

FROM orders AS o
INNER JOIN order_items AS i
ON o.order_id = i.order_id
INNER JOIN products AS p
ON i.product_id = p.product_id
INNER JOIN customers AS c
ON o.customer_id = c.customer_id

WHERE o.status = 'Completed';

SELECT product_id, product_name, category, SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY product_id, product_name, category
ORDER BY total_revenue DESC, product_id ASC;

SELECT category, SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY category
ORDER BY total_revenue DESC, category ASC;

SELECT region, SUM(revenue) AS total_revenue
FROM sales_data
GROUP BY region
ORDER BY total_revenue DESC, region ASC;