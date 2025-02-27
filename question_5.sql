SELECT dim_products.category, ((dim_products.sale_price - dim_products.cost_price)* orders.product_quantity) AS profit
FROM dim_products
JOIN orders ON dim_products.product_code = orders.product_code
JOIN dim_date ON orders.order_date = dim_date.date
JOIN dim_stores ON orders.store_code = dim_stores.store_code
WHERE dim_date.year = '2021' AND dim_stores.country_region = 'Wiltshire'
ORDER BY profit ASC
LIMIT 1;