SELECT DATE_TRUNC(order_date,month) AS order_month,
COUNT(DISTINCT o.user_name) AS total_monthly_users,
COUNT(DISTINCT CASE WHEN user.customer_state = "JAWA TIMUR" THEN user.user_name END) AS total_monthly_users_from_jawa_timur,
COUNT(order_id) AS total_monthly_orders
FROM {{ ref('int_sales_database__order') }} AS o
LEFT JOIN {{ ref('int_sales_database__user') }} AS user ON user.user_name = o.user_name
GROUP BY order_month
ORDER BY order_month