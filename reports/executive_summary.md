# Executive Summary

## Project Scope

This case study analyzes a fictional retail-style dataset using SQLite. The analysis includes only completed orders unless otherwise stated. All customer names, email addresses, transactions, and amounts are synthetic and were created for portfolio use.

## KPI Snapshot

| KPI | Result |
|---|---:|
| Completed orders | 17 |
| Active customers | 12 |
| Total net revenue | $7,622.33 |
| Average order value | $448.37 |
| Total product cost | $4,532.00 |
| Gross profit | $3,090.33 |
| Gross margin | 40.54% |
| Shipping cost | $245.00 |
| Contribution profit | $2,845.33 |
| Repeat customers | 5 |
| Repeat-customer rate | 41.67% |

## Monthly Performance

| Month | Completed Orders | Net Revenue | Gross Profit | Gross Margin |
|---|---:|---:|---:|---:|
| 2025-07 | 3 | $1,563.60 | $614.60 | 39.31% |
| 2025-08 | 4 | $2,455.18 | $958.18 | 39.03% |
| 2025-09 | 2 | $506.10 | $237.10 | 46.85% |
| 2025-10 | 3 | $1,209.64 | $513.64 | 42.46% |
| 2025-11 | 2 | $1,203.85 | $448.85 | 37.28% |
| 2025-12 | 3 | $683.96 | $317.96 | 46.49% |

## Category Performance

| Category | Units Sold | Net Revenue | Gross Profit |
|---|---:|---:|---:|
| Technology | 28 | $3,948.04 | $1,581.04 |
| Furniture | 17 | $2,762.69 | $1,007.69 |
| Office Supplies | 41 | $911.60 | $501.60 |

## Regional Performance

| Region | Completed Orders | Active Customers | Net Revenue | Average Order Value |
|---|---:|---:|---:|---:|
| East | 3 | 3 | $2,378.79 | $792.93 |
| Central | 5 | 3 | $2,014.20 | $402.84 |
| West | 4 | 3 | $1,949.28 | $487.32 |
| South | 5 | 3 | $1,280.06 | $256.01 |

## Key Findings

1. **Technology generated the most revenue and gross profit.** It contributed $3,948.04 in net revenue and $1,581.04 in gross profit.

2. **August was the strongest month by revenue.** Net revenue reached $2,455.18 across four completed orders.

3. **The East region had the highest revenue and average order value.** It generated $2,378.79 with an average order value of $792.93.

4. **The South region had the lowest average order value.** Its $256.01 average suggests an opportunity to review product mix, customer segment, or cross-selling potential.

5. **Repeat purchasing is present but limited.** Five of twelve customers with completed orders purchased more than once, producing a 41.67% repeat-customer rate.

6. **Gross profitability was positive across every month.** Monthly gross margins ranged from 37.28% to 46.85%.

## Business Recommendations

- Prioritize Technology products in campaigns while monitoring product-level margins.
- Investigate the East region's customer and order mix to understand its higher average order value.
- Test bundles or cross-selling strategies in the South region to increase order value.
- Develop a repeat-purchase campaign for customers with only one completed order.
- Track revenue, gross profit, contribution profit, and repeat-customer rate in a recurring dashboard.

## Limitations

- The dataset is small and synthetic, so the findings are illustrative rather than predictive.
- The analysis does not include acquisition cost, labor, tax, returns processing, or other operating expenses.
- Returned and cancelled orders are excluded from the primary revenue KPIs.
- Results cover July through December 2025 only.
- No statistical significance testing or forecasting is included.

## Reproducibility

Run the SQL files in this order:

1. `sql/01_schema.sql`
2. `sql/02_seed_data.sql`
3. `sql/03_data_quality.sql`
4. `sql/04_kpi_analysis.sql`

The data-quality checks should return `PASS` for every rule before the KPI analysis is interpreted.
