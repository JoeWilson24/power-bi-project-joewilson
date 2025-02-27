SELECT (dim_products.sale_price* orders.product_quantity) AS revenue, dim_stores.store_code
FROM dim_products
JOIN orders ON dim_products.product_code = orders.product_code
JOIN dim_date ON orders.order_date = dim_date.date
JOIN dim_stores ON orders.store_code = dim_stores.store_code
WHERE dim_date.year = '2022' AND dim_stores.country = 'Germany'
ORDER BY revenue ASC
LIMIT 1;