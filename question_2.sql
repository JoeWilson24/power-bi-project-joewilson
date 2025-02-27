SELECT (dim_products.sale_price* orders.product_quantity) AS revenue, dim_date.month_name
FROM dim_products
JOIN orders ON dim_products.product_code = orders.product_code
JOIN dim_date ON orders.order_date = dim_date.date
WHERE dim_date.year = '2022'
ORDER BY revenue ASC
LIMIT 1;
