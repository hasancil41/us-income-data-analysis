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
├── data/                   # CSV dataset files
│   ├── USHouseholdIncome_Statistics.csv
│   └── USHouseholdIncome.csv
│
├── scripts/                # SQL scripts
│   ├── data_cleaning.sql
│   └── analysis_queries.sql
│
└── README.md               # Project documentation

---

## Phase 1 — Data Cleaning

The `scripts/data_cleaning.sql` script includes:

- Inspecting raw data and record counts.
- Identifying and removing duplicate rows by `id`.
- Correcting inconsistent state names (e.g., `georia` → `Georgia`).
- Fixing inconsistent place types (e.g., `Boroughs` → `Borough`).
- Filling missing place names where possible.
- Checking and flagging suspicious land and water area values.

---

## Phase 2 — Data Analysis

The `scripts/analysis_queries.sql` script includes:

- Counting unique cities and counties per state.
- Listing largest cities by land area.
- Finding states with highest income variability (standard deviation).
- Analyzing income gaps (mean vs median).
- Ranking top 3 largest cities per state.
- Identifying states with above-average mean income.
- Calculating state-level average income statistics.

---

## How to Use

1. Import the CSV files from the `data/` folder into your SQL database.
2. Run `scripts/data_cleaning.sql` to clean and prepare the data.
3. Run `scripts/analysis_queries.sql` to perform the analysis.
4. Export or visualize results using tools like Tableau or Power BI if desired.

---

## Author

**Hasan Cil**  
[GitHub Profile](https://github.com/hasancil41)


