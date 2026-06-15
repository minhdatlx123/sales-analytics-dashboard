SELECT
    EXTRACT(MONTH FROM olist_orders_dataset.order_purchase_timestamp) AS month_number,
    TO_CHAR(olist_orders_dataset.order_purchase_timestamp, 'FMMonth') AS month_name,
    SUM(olist_order_payments_dataset.payment_value) AS revenue
FROM olist_orders_dataset
JOIN olist_order_payments_dataset
    ON olist_orders_dataset.order_id = olist_order_payments_dataset.order_id
GROUP BY
    EXTRACT(MONTH FROM olist_orders_dataset.order_purchase_timestamp),
    TO_CHAR(olist_orders_dataset.order_purchase_timestamp, 'FMMonth')
ORDER BY month_number;