# South African Real Estate SQL Analysis

![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=flat&logo=mysql&logoColor=white)  
![Python](https://img.shields.io/badge/Python-3.8+-3776AB?style=flat&logo=python&logoColor=white)  
![License](https://img.shields.io/badge/License-MIT-green.svg)  
![Status](https://img.shields.io/badge/Status-Complete-success)

> Portfolio project demonstrating advanced SQL analysis of the South African property market using MySQL & Python.

## Overview

- Scope: 5 major SA cities (Cape Town, Johannesburg, Pretoria, Durban, Port Elizabeth)  
- Data: 2,000 property listings, 50 agents, 54 neighborhoods, 600+ price changes  
- Focus: Database design, ETL pipelines, advanced SQL queries, actionable business insights

## Key Insights

| Insight | Observation |
|---------|------------|
| Market Prices | Cape Town premium (+30% vs national avg); Johannesburg apartments most affordable |
| Feature Impact | Solar panels → +12–18%; Boreholes → +8–15%; Combined features → +25% value |
| Top Agents | Fastest sales 40% quicker; multi-city agents outperform single-city |
| Investment Opportunities | 47 properties >15% below market value; Fourways & Centurion best value |
| Quarterly Trends | Cape Town +2–3% QoQ; Johannesburg ±5% volatility; Q4 strongest selling period |

## Database Schema (Simplified)

**Tables:**

- properties – Listings & sales  
- agents – Real estate agents & agencies  
- neighborhoods – Area characteristics & ratings  
- property_features – Amenities (pool, solar, security)  
- price_history – Historical price changes  

**Relationships:**  
- Agents → Properties (1:N)  
- Properties → Features (1:1)  
- Properties → Price History (1:N)  

## Technologies

| Tech | Purpose |
|------|---------|
| MySQL 8.0+ | Database management |
| Python 3.8+ | Data generation & ETL |
| MySQL Connector | Python ↔ MySQL integration |
| Git | Version control |

## Advanced SQL Techniques

- Window Functions: ROW_NUMBER(), RANK(), LAG()  
- CTEs: Recursive & multiple-step queries  
- Complex Joins: Multi-table, self-joins  
- Aggregations & Analytics: GROUP BY, ROLLUP, STDDEV, VARIANCE  
- Conditional Logic: CASE, COALESCE, NULLIF  
- Date Analysis: YEAR(), QUARTER(), DATEDIFF()  

## Project Structure

```
sa-real-estate-sql-analysis/
├── schema/               # Database creation scripts
├── data/                 # Data generation & import scripts
├── queries/              # SQL queries demonstrating analysis
└── documentation/        # Data dictionary & query examples
```

## Sample Queries

- Market Overview: Avg prices by city & property type  
- Feature Impact: Value of solar panels, pools, boreholes  
- Agent Performance: Top sellers by volume & speed  
- Investment Opportunities: Undervalued properties  
- Price Trends: Quarterly & yearly growth analysis  

## Installation

```bash
# Clone repo
git clone https://github.com/yourusername/sa-real-estate-sql-analysis.git
cd sa-real-estate-sql-analysis

# Install dependencies
pip install mysql-connector-python

# Create database & tables
mysql -u root -p < schema/create_tables.sql

# Generate & import sample data
python data/generate_data.py
python data/import_to_mysql.py
```

## Author
- GitHub: @Rekgotso  

**Note:** All data is synthetic for portfolio demonstration purposes.
