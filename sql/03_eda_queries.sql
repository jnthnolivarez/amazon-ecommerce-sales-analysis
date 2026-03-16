-- Monthly revenue
SELECT
DATE_TRUNC('month', order_date::date) AS month,
SUM(amount) AS monthly_revenue
FROM amazon_sales_clean
WHERE order_stage = 'Completed'
GROUP BY month
ORDER BY month;

-- Revenue by category
SELECT
category,
SUM(amount) AS revenue
FROM amazon_sales_clean
WHERE order_stage = 'Completed'
GROUP BY category
ORDER BY revenue DESC;

-- Failure rate by state
SELECT
ship_state,
COUNT(*) FILTER (WHERE order_stage = 'Failed') AS failed_orders,
COUNT(*) AS total_orders
FROM amazon_sales_clean
GROUP BY ship_state;
