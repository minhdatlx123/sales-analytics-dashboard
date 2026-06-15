SELECT
    payment_type,
    SUM(payment_value) AS revenue,
    COUNT(DISTINCT order_id) AS orders,
    AVG(payment_value) AS avg_payment_value,
    MIN(payment_value) AS min_payment_value,
    MAX(payment_value) AS max_payment_value
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY revenue DESC;