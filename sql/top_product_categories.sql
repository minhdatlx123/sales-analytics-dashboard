SELECT
    olist_products_dataset.product_category_name,
    SUM(olist_order_items_dataset.price) AS product_sales
FROM olist_order_items_dataset
JOIN olist_products_dataset
    ON olist_order_items_dataset.product_id = olist_products_dataset.product_id
WHERE 
    olist_products_dataset.product_category_name IS NOT NULL
GROUP BY olist_products_dataset.product_category_name
ORDER BY product_sales DESC
LIMIT 10;