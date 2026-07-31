-- SQL Business KPI Case Study
-- Synthetic portfolio data for SQLite
-- All names, emails, transactions, and amounts in this file are fictional.

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

INSERT INTO customers (
    customer_id,
    customer_name,
    email,
    customer_segment,
    city,
    state,
    region,
    signup_date
) VALUES
    (1, 'Avery Brooks', 'avery.brooks@example.com', 'Consumer', 'St. Louis', 'MO', 'Central', '2025-01-15'),
    (2, 'Jordan Lee', 'jordan.lee@example.com', 'Corporate', 'Chicago', 'IL', 'Central', '2025-01-22'),
    (3, 'Taylor Morgan', 'taylor.morgan@example.com', 'Small Business', 'Dallas', 'TX', 'South', '2025-02-03'),
    (4, 'Riley Patel', 'riley.patel@example.com', 'Consumer', 'Atlanta', 'GA', 'South', '2025-02-17'),
    (5, 'Casey Nguyen', 'casey.nguyen@example.com', 'Corporate', 'Seattle', 'WA', 'West', '2025-03-01'),
    (6, 'Morgan Diaz', 'morgan.diaz@example.com', 'Consumer', 'Denver', 'CO', 'West', '2025-03-12'),
    (7, 'Quinn Carter', 'quinn.carter@example.com', 'Small Business', 'Boston', 'MA', 'East', '2025-04-05'),
    (8, 'Jamie Kim', 'jamie.kim@example.com', 'Corporate', 'New York', 'NY', 'East', '2025-04-18'),
    (9, 'Cameron Ross', 'cameron.ross@example.com', 'Consumer', 'Phoenix', 'AZ', 'West', '2025-05-06'),
    (10, 'Drew Wilson', 'drew.wilson@example.com', 'Small Business', 'Nashville', 'TN', 'South', '2025-05-20'),
    (11, 'Reese Adams', 'reese.adams@example.com', 'Consumer', 'Columbus', 'OH', 'Central', '2025-06-02'),
    (12, 'Skyler Bennett', 'skyler.bennett@example.com', 'Corporate', 'Philadelphia', 'PA', 'East', '2025-06-16');

INSERT INTO products (
    product_id,
    product_name,
    category,
    subcategory,
    unit_cost,
    unit_price,
    active_flag
) VALUES
    (101, 'Ergonomic Office Chair', 'Furniture', 'Chairs', 145.00, 249.00, 1),
    (102, 'Standing Desk Converter', 'Furniture', 'Desks', 110.00, 189.00, 1),
    (103, 'Wireless Keyboard', 'Technology', 'Accessories', 28.00, 59.00, 1),
    (104, 'Noise-Canceling Headset', 'Technology', 'Audio', 72.00, 129.00, 1),
    (105, '27-Inch Monitor', 'Technology', 'Displays', 165.00, 289.00, 1),
    (106, 'Premium Notebook Set', 'Office Supplies', 'Paper', 8.00, 18.00, 1),
    (107, 'Desk Organization Kit', 'Office Supplies', 'Storage', 19.00, 39.00, 1),
    (108, 'LED Desk Lamp', 'Furniture', 'Lighting', 24.00, 49.00, 1),
    (109, 'USB-C Docking Station', 'Technology', 'Accessories', 68.00, 119.00, 1),
    (110, 'Monthly Planner', 'Office Supplies', 'Paper', 5.00, 14.00, 1);

INSERT INTO orders (
    order_id,
    customer_id,
    order_date,
    order_status,
    sales_channel,
    shipping_amount
) VALUES
    (1001, 1, '2025-07-03', 'Completed', 'Online', 12.00),
    (1002, 2, '2025-07-08', 'Completed', 'Sales Representative', 20.00),
    (1003, 3, '2025-07-15', 'Completed', 'Online', 8.00),
    (1004, 4, '2025-07-21', 'Returned', 'Online', 10.00),
    (1005, 5, '2025-08-02', 'Completed', 'Sales Representative', 25.00),
    (1006, 6, '2025-08-09', 'Completed', 'Online', 9.00),
    (1007, 7, '2025-08-17', 'Completed', 'Marketplace', 14.00),
    (1008, 8, '2025-08-26', 'Completed', 'Sales Representative', 22.00),
    (1009, 9, '2025-09-04', 'Cancelled', 'Online', 0.00),
    (1010, 10, '2025-09-12', 'Completed', 'Marketplace', 11.00),
    (1011, 1, '2025-09-20', 'Completed', 'Online', 15.00),
    (1012, 3, '2025-10-01', 'Completed', 'Online', 12.00),
    (1013, 5, '2025-10-08', 'Completed', 'Sales Representative', 18.00),
    (1014, 11, '2025-10-19', 'Completed', 'Marketplace', 9.00),
    (1015, 12, '2025-11-03', 'Completed', 'Sales Representative', 24.00),
    (1016, 2, '2025-11-14', 'Completed', 'Online', 13.00),
    (1017, 7, '2025-11-25', 'Returned', 'Marketplace', 10.00),
    (1018, 9, '2025-12-05', 'Completed', 'Online', 7.00),
    (1019, 10, '2025-12-15', 'Completed', 'Marketplace', 16.00),
    (1020, 4, '2025-12-28', 'Completed', 'Online', 10.00);

INSERT INTO order_items (
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    unit_cost,
    discount_pct
) VALUES
    (1, 1001, 103, 1, 59.00, 28.00, 0.00),
    (2, 1001, 106, 2, 18.00, 8.00, 0.00),
    (3, 1002, 101, 4, 249.00, 145.00, 10.00),
    (4, 1002, 109, 4, 119.00, 68.00, 5.00),
    (5, 1003, 107, 2, 39.00, 19.00, 0.00),
    (6, 1003, 110, 3, 14.00, 5.00, 0.00),
    (7, 1004, 104, 1, 129.00, 72.00, 0.00),
    (8, 1005, 105, 3, 289.00, 165.00, 8.00),
    (9, 1005, 103, 3, 59.00, 28.00, 0.00),
    (10, 1006, 108, 1, 49.00, 24.00, 0.00),
    (11, 1006, 106, 2, 18.00, 8.00, 0.00),
    (12, 1007, 102, 2, 189.00, 110.00, 5.00),
    (13, 1007, 107, 2, 39.00, 19.00, 0.00),
    (14, 1008, 101, 2, 249.00, 145.00, 12.00),
    (15, 1008, 105, 2, 289.00, 165.00, 10.00),
    (16, 1009, 103, 1, 59.00, 28.00, 0.00),
    (17, 1010, 104, 2, 129.00, 72.00, 5.00),
    (18, 1010, 110, 5, 14.00, 5.00, 0.00),
    (19, 1011, 109, 1, 119.00, 68.00, 0.00),
    (20, 1011, 106, 4, 18.00, 8.00, 0.00),
    (21, 1012, 102, 1, 189.00, 110.00, 0.00),
    (22, 1012, 108, 2, 49.00, 24.00, 0.00),
    (23, 1013, 105, 2, 289.00, 165.00, 7.00),
    (24, 1013, 109, 2, 119.00, 68.00, 5.00),
    (25, 1014, 107, 3, 39.00, 19.00, 0.00),
    (26, 1014, 110, 3, 14.00, 5.00, 0.00),
    (27, 1015, 101, 3, 249.00, 145.00, 15.00),
    (28, 1015, 104, 3, 129.00, 72.00, 10.00),
    (29, 1016, 103, 2, 59.00, 28.00, 0.00),
    (30, 1016, 106, 6, 18.00, 8.00, 5.00),
    (31, 1017, 102, 1, 189.00, 110.00, 0.00),
    (32, 1018, 108, 2, 49.00, 24.00, 0.00),
    (33, 1018, 110, 2, 14.00, 5.00, 0.00),
    (34, 1019, 109, 2, 119.00, 68.00, 8.00),
    (35, 1019, 107, 4, 39.00, 19.00, 0.00),
    (36, 1020, 104, 1, 129.00, 72.00, 0.00),
    (37, 1020, 106, 3, 18.00, 8.00, 0.00);

COMMIT;
