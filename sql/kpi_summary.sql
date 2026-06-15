WITH order_payment_customer AS (
    SELECT
        olist_orders_dataset.order_id,
        olist_customers_dataset.customer_unique_id,
        olist_order_payments_dataset.payment_value
    FROM olist_orders_dataset
    JOIN olist_order_payments_dataset
        ON olist_orders_dataset.order_id = olist_order_payments_dataset.order_id
    JOIN olist_customers_dataset
        ON olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
)

SELECT
    SUM(payment_value) AS revenue,
    COUNT(DISTINCT order_id) AS orders,
    COUNT(DISTINCT customer_unique_id) AS customers,
    SUM(payment_value) / COUNT(DISTINCT order_id) AS aov
FROM order_payment_customer;