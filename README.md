# 🏠 US Household Income SQL Project

## Overview
This project analyzes U.S. household income data using SQL. It is organized into two main phases:

- **Phase 1 — Data Cleaning:** Prepare and clean raw data for accurate analysis.
- **Phase 2 — Data Analysis:** Explore income patterns, geographic distribution, and statistics.

---

## Dataset

This project uses two CSV files located in the `data/` folder:

1. **USHouseholdIncome_Statistics.csv** — Income statistics per state:
   - `id` — Unique identifier
   - `State_Name` — State name
   - `Mean` — Mean household income
   - `Median` — Median household income
   - `Stdev` — Standard deviation of income
   - `sum_w` — Weight or count of samples

2. **USHouseholdIncome.csv** — Geographic and demographic data:
   - `row_id` — Unique row identifier
   - `id` — Identifier linked to statistics
   - `State_Code` — State code
   - `State_Name` — State name
   - `State_ab` — State abbreviation
   - `County` — County name
   - `City` — City name
   - `Place` — Place name
   - `Type` — Type of place (e.g., Borough)
   - `Primary` — Primary indicator (Y/N)
   - `Zip_Code` — Zip code
   - `Area_Code` — Telephone area code
   - `ALand` — Land area
   - `AWater` — Water area
   - `Lat` — Latitude
   - `Lon` — Longitude

Make sure to load these datasets into your SQL database before running the scripts.

---

## Project Structure

us-household-income-project/
│
├── data/
│   ├── USHouseholdIncome_Statistics.csv     # Income stats dataset CSV
│   └── USHouseholdIncome.csv                 # Geographic and demographic dataset CSV
│
├── scripts/
│   ├── data_cleaning.sql                     # SQL queries for cleaning data
│   └── analysis_queries.sql                  # SQL queries for analysis
│
└── README.md                                # This project documentation file


## Author

Hasan Cil  
[GitHub Profile](https://github.com/hasancil41)
