# South African Real Estate SQL Analysis

![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=flat&logo=mysql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.8+-3776AB?style=flat&logo=python&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)

> **A SQL portfolio project demonstrating advanced database design and querying skills using synthetic South African real estate data.**

---

## ⚠️ Important Notice

**This project uses entirely synthetic (fake) data generated for educational and SQL proficiency demonstration purposes only.** All property listings, prices, agent information, neighborhoods, and market data are fictional and do not represent actual real estate information.

---

## 📊 Project Overview

This portfolio project showcases SQL expertise through comprehensive analysis of a realistic South African property market database. The project demonstrates:

- **Database Design** - Normalized relational schema with proper relationships
- **Data Modeling** - 5 interconnected tables representing real-world entities
- **ETL Pipeline** - Python scripts for data generation and MySQL import
- **Advanced SQL** - Complex queries using window functions, CTEs, joins, and aggregations
- **Business Analytics** - Answering real-world questions through data analysis

### Geographic Coverage

The synthetic dataset covers 5 major South African cities with 50+ neighborhoods:
- **Johannesburg** (Gauteng)
- **Cape Town** (Western Cape)
- **Pretoria** (Gauteng)
- **Durban** (KwaZulu-Natal)
- **Port Elizabeth** (Eastern Cape)

---

## 🗃️ Database Schema

### Tables Overview

| Table | Records | Description |
|-------|---------|-------------|
| **properties** | 2,000 | Property listings with location, pricing, and status |
| **agents** | 50 | Real estate agents and their agencies |
| **neighborhoods** | 54 | Neighborhood characteristics and ratings |
| **property_features** | 2,000 | Property amenities (pool, solar, security, etc.) |
| **price_history** | ~600 | Historical price changes |

### Key Relationships

- **agents** → **properties** (one-to-many)
- **properties** → **property_features** (one-to-one)
- **properties** → **price_history** (one-to-many)
- **neighborhoods** (reference data for analysis)

### South African Specific Features

The database includes SA-specific attributes relevant to the local market:
- **Solar Panels** - Load shedding mitigation
- **Boreholes** - Water security
- **Erf Size** - Plot/land size in square meters
- **Security Systems** - Standard SA property feature

---

## 🚀 Getting Started

### Prerequisites

- MySQL 8.0+
- Python 3.8+
- Git

### Quick Setup

```bash
# 1. Clone repository
git clone https://github.com/yourusername/sa-real-estate-sql-analysis.git
cd sa-real-estate-sql-analysis

# 2. Install Python dependencies
pip install mysql-connector-python

# 3. Create database and tables
mysql -u root -p < schema/create_tables.sql

# 4. Generate synthetic data
cd data
python generate_data.py

# 5. Import data to MySQL
python import_to_mysql.py
```

---

## 📁 Project Structure

```
sa-real-estate-sql-analysis/
│
├── README.md                      # Project documentation
├── LICENSE                        # MIT License
├── .gitignore                     # Git ignore rules
│
├── schema/
│   └── create_tables.sql         # Database schema
│
├── data/
│   ├── generate_data.py          # Generates synthetic CSV data
│   ├── import_to_mysql.py        # Loads CSV into MySQL
│   └── *.csv                     # Generated data files (not tracked)
│
└── queries/
    ├── 01_market_overview.sql
    ├── 02_sales_performance.sql
    ├── 03_feature_impact.sql
    ├── 04_geographic_trends.sql
    ├── 05_price_volatility.sql
    ├── 06_agent_performance.sql
    ├── 07_growth_analysis.sql
    ├── 08_size_analysis.sql
    ├── 09_investment_opportunities.sql
    └── 10_comprehensive_report.sql
```

---

## 👤 Author

Created and maintained by [@Rekgotso](https://github.com/Rekgotso)

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Disclaimer:** This is a portfolio project using synthetic data for SQL demonstration purposes only. All data is fictional and generated programmatically.
