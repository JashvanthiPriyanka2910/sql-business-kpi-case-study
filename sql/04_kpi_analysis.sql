-- SQL Business KPI Case Study
-- Business KPI analysis for SQLite
-- Revenue calculations include item-level discounts.
-- Only completed orders are included unless stated otherwise.


-- 1. Overall business KPI summary

WITH order_financials AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.order_date,
        o.shipping_amount,
        SUM(
            oi.quantity
            * oi.unit_price
            * (1 - oi.discount_pct / 100.0)
        ) AS net_revenue,
        SUM(
            oi.quantity * oi.unit_cost
        ) AS total_cost
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY
        o.order_id,
        o.customer_id,
        o.order_date,
        o.shipping_amount
)

SELECT
    COUNT(DISTINCT order_id) AS completed_orders,
    COUNT(DISTINCT customer_id) AS active_customers,
    ROUND(SUM(net_revenue), 2) AS total_net_revenue,
    ROUND(AVG(net_revenue), 2) AS average_order_value,
    ROUND(SUM(total_cost), 2) AS total_product_cost,
    ROUND(SUM(net_revenue - total_cost), 2) AS gross_profit,
    ROUND(SUM(shipping_amount), 2) AS total_shipping_cost,
    ROUND(
        SUM(net_revenue - total_cost - shipping_amount),
        2
    ) AS contribution_profit
FROM order_financials;


-- 2. Monthly revenue and profit trend

WITH order_financials AS (
    SELECT
        o.order_id,
        o.order_date,
        o.shipping_amount,
        SUM(
            oi.quantity
            * oi.unit_price
            * (1 - oi.discount_pct / 100.0)
        ) AS net_revenue,
        SUM(
            oi.quantity * oi.unit_cost
        ) AS total_cost
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY
        o.order_id,
        o.order_date,
        o.shipping_amount
)

SELECT
    STRFTIME('%Y-%m', order_date) AS sales_month,
    COUNT(order_id) AS completed_orders,
    ROUND(SUM(net_revenue), 2) AS net_revenue,
    ROUND(SUM(net_revenue - total_cost), 2) AS gross_profit,
    ROUND(
        100.0 * SUM(net_revenue - total_cost)
        / NULLIF(SUM(net_revenue), 0),
        2
    ) AS gross_margin_pct
FROM order_financials
GROUP BY STRFTIME('%Y-%m', order_date)
ORDER BY sales_month;


-- 3. Product category performance

SELECT
    p.category,
    SUM(oi.quantity) AS units_sold,
    ROUND(
        SUM(
            oi.quantity
            * oi.unit_price
            * (1 - oi.discount_pct / 100.0)
        ),
        2
    ) AS net_revenue,
    ROUND(
        SUM(
            oi.quantity
            * (
                oi.unit_price
                * (1 - oi.discount_pct / 100.0)
                - oi.unit_cost
            )
        ),
        2
    ) AS gross_profit
FROM orders AS o
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN products AS p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY net_revenue DESC;


-- 4. Regional performance

WITH order_financials AS (
    SELECT
        o.order_id,
        o.customer_id,
        SUM(
            oi.quantity
            * oi.unit_price
            * (1 - oi.discount_pct / 100.0)
        ) AS net_revenue
    FROM orders AS o
    JOIN order_items AS oi
        ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY
        o.order_id,
        o.customer_id
)

SELECT
    c.region,
    COUNT(DISTINCT f.order_id) AS completed_orders,
    COUNT(DISTINCT c.customer_id) AS active_customers,
    ROUND(SUM(f.net_revenue), 2) AS net_revenue,
    ROUND(AVG(f.net_revenue), 2) AS average_order_value
FROM order_financials AS f
JOIN customers AS c
    ON f.customer_id = c.customer_id
GROUP BY c.region
ORDER BY net_revenue DESC;


-- 5. Repeat-customer analysis

WITH completed_customer_orders AS (
    SELECT
        customer_id,
        COUNT(*) AS completed_order_count
    FROM orders
    WHERE order_status = 'Completed'
    GROUP BY customer_id
)

SELECT
    COUNT(*) AS customers_with_completed_orders,
    SUM(
        CASE
            WHEN completed_order_count > 1 THEN 1
            ELSE 0
        END
    ) AS repeat_customers,
    ROUND(
        100.0
        * SUM(
            CASE
                WHEN completed_order_count > 1 THEN 1
                ELSE 0
            END
        )
        / NULLIF(COUNT(*), 0),
        2
    ) AS repeat_customer_rate_pct
FROM completed_customer_orders;
