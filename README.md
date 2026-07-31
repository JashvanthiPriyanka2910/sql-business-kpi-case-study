# SQL Business KPI Case Study

A complete SQL portfolio project that uses a fictional retail-style dataset to demonstrate relational data modeling, data-quality validation, KPI analysis, and executive-level business communication.

## Project Overview

The project was built in SQLite and analyzes customer, product, order, and order-item data. All names, emails, transactions, and amounts are synthetic and were created only for portfolio use.

The analysis focuses on:

- Revenue and profitability
- Monthly performance trends
- Product-category performance
- Regional performance
- Average order value
- Repeat-customer behavior
- Data completeness and referential integrity

## KPI Snapshot

| KPI | Result |
|---|---:|
| Completed orders | 17 |
| Active customers | 12 |
| Total net revenue | $7,622.33 |
| Average order value | $448.37 |
| Gross profit | $3,090.33 |
| Gross margin | 40.54% |
| Contribution profit | $2,845.33 |
| Repeat-customer rate | 41.67% |

## Key Findings

- Technology was the strongest category, generating $3,948.04 in net revenue.
- August was the highest-revenue month, with $2,455.18 in net revenue.
- The East region produced the highest revenue and average order value.
- The South region had the lowest average order value, suggesting a potential cross-selling opportunity.
- Five of twelve customers with completed orders were repeat customers.
- Monthly gross margins remained positive throughout the analysis period.

## Repository Structure

```text
sql-business-kpi-case-study/
├── README.md
├── sql/
│   ├── 01_schema.sql
│   ├── 02_seed_data.sql
│   ├── 03_data_quality.sql
│   └── 04_kpi_analysis.sql
└── reports/
    └── executive_summary.md
```

## SQL Skills Demonstrated

- Relational schema design
- Primary and foreign keys
- Index creation
- Data validation
- Joins
- Common table expressions
- Aggregations
- Conditional logic
- Date-based analysis
- Profit and margin calculations
- Business KPI development

## Run Order

Run the files in this order using SQLite:

1. `sql/01_schema.sql`
2. `sql/02_seed_data.sql`
3. `sql/03_data_quality.sql`
4. `sql/04_kpi_analysis.sql`

The data-quality file is designed to return `PASS` when no issues are found.

## Executive Summary

Detailed KPI tables, findings, recommendations, limitations, and reproducibility notes are available in:

[`reports/executive_summary.md`](reports/executive_summary.md)

## Business Recommendations

- Prioritize high-performing Technology products while monitoring margin.
- Study the East region's customer and order mix to understand its higher order value.
- Test bundles and cross-selling strategies in the South region.
- Create a repeat-purchase campaign for one-time customers.
- Track the main KPIs in a recurring business-intelligence dashboard.

## Limitations

- The dataset is small and synthetic.
- Results are illustrative and are not intended for forecasting.
- Returned and cancelled orders are excluded from primary revenue KPIs.
- The analysis covers July through December 2025.
- Operating expenses beyond product and shipping costs are not included.

## Responsible Use

This repository contains no employer-confidential information, customer records, internal systems data, or real personally identifiable information.

## Author

**Jashvanthi Priyanka**

[LinkedIn](https://www.linkedin.com/in/jashvanthi-priyanka)
