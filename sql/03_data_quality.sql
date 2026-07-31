-- SQL Business KPI Case Study
-- Data-quality checks for SQLite
-- Expected result: issue_count should be 0 for every check.

WITH data_quality_checks AS (
    SELECT
        'customers_missing_required_values' AS check_name,
        COUNT(*) AS issue_count
    FROM customers
    WHERE customer_name IS NULL
       OR TRIM(customer_name) = ''
       OR customer_segment IS NULL
       OR TRIM(customer_segment) = ''
       OR signup_date IS NULL

    UNION ALL

    SELECT
        'duplicate_customer_emails',
        COUNT(*)
    FROM (
        SELECT LOWER(TRIM(email))
        FROM customers
        WHERE email IS NOT NULL
          AND TRIM(email) <> ''
        GROUP BY LOWER(TRIM(email))
        HAVING COUNT(*) > 1
    )

    UNION ALL

    SELECT
        'products_with_invalid_values',
        COUNT(*)
    FROM products
    WHERE product_name IS NULL
       OR TRIM(product_name) = ''
       OR category IS NULL
       OR TRIM(category) = ''
       OR unit_cost < 0
       OR unit_price < unit_cost
       OR active_flag NOT IN (0, 1)

    UNION ALL

    SELECT
        'orders_with_invalid_values',
        COUNT(*)
    FROM orders
    WHERE order_date IS NULL
       OR order_status NOT IN ('Completed', 'Returned', 'Cancelled')
       OR sales_channel NOT IN (
           'Online',
           'Marketplace',
           'Sales Representative'
       )
       OR shipping_amount < 0

    UNION ALL

    SELECT
        'order_items_with_invalid_values',
        COUNT(*)
    FROM order_items
    WHERE quantity <= 0
       OR unit_price < 0
       OR unit_cost < 0
       OR discount_pct < 0
       OR discount_pct > 100

    UNION ALL

    SELECT
        'orders_without_matching_customers',
        COUNT(*)
    FROM orders AS o
    LEFT JOIN customers AS c
        ON o.customer_id = c.customer_id
    WHERE c.customer_id IS NULL

    UNION ALL

    SELECT
        'order_items_without_matching_orders',
        COUNT(*)
    FROM order_items AS oi
    LEFT JOIN orders AS o
        ON oi.order_id = o.order_id
    WHERE o.order_id IS NULL

    UNION ALL

    SELECT
        'order_items_without_matching_products',
        COUNT(*)
    FROM order_items AS oi
    LEFT JOIN products AS p
        ON oi.product_id = p.product_id
    WHERE p.product_id IS NULL

    UNION ALL

    SELECT
        'orders_without_line_items',
        COUNT(*)
    FROM orders AS o
    LEFT JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE oi.order_id IS NULL
)

SELECT
    check_name,
    issue_count,
    CASE
        WHEN issue_count = 0 THEN 'PASS'
        ELSE 'REVIEW'
    END AS check_status
FROM data_quality_checks
ORDER BY check_name;
