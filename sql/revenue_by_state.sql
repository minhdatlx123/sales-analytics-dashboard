SELECT
    olist_customers_dataset.customer_state,
    SUM(olist_order_payments_dataset.payment_value) AS revenue
FROM olist_orders_dataset
JOIN olist_customers_dataset
    ON olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
JOIN olist_order_payments_dataset
    ON olist_orders_dataset.order_id = olist_order_payments_dataset.order_id
GROUP BY olist_customers_dataset.customer_state
ORDER BY revenue DESC
LIMIT 10;