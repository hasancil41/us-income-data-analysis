-- 1. Select all records from US_household_income table
SELECT *
FROM US_household_income;

-- 2. Select all records from US_household_income_statistics table
SELECT *
FROM US_household_income_statistics;

-- 3. Count distinct number of cities and counties per state, order by number of cities descending
SELECT State_Name, 
       COUNT(DISTINCT City) AS num_cities, 
       COUNT(DISTINCT County) AS num_county
FROM US_household_income
GROUP BY State_Name
ORDER BY num_cities DESC;

-- 4. Select top 10 cities with the largest land area (ALand) across all states
SELECT State_Name, City, ALand
FROM US_household_income
ORDER BY ALand DESC
LIMIT 10;

-- 5. List states ordered by highest standard deviation (Stdev) of income from statistics table
SELECT State_Name, Stdev
FROM US_household_income_statistics
ORDER BY Stdev DESC;

-- 6. Calculate income gap (Mean - Median) for states where both values are positive; order by income gap ascending
SELECT State_Name, Mean, Median, (Mean - Median) AS income_gap
FROM US_household_income_statistics
WHERE Mean > 0 AND Median > 0
ORDER BY income_gap ASC;

-- 7. Using CTE, find top 3 cities by land area (ALand) per state
WITH CityLandRanking AS (
    SELECT State_Name, City, ALand,
           ROW_NUMBER() OVER (PARTITION BY State_Name ORDER BY ALand DESC) AS rn
    FROM US_household_income
)
SELECT State_Name, City, ALand
FROM CityLandRanking
WHERE rn <= 3
ORDER BY State_Name, ALand DESC;

-- 8. Select states with Mean income above the average Mean income (only positive Means), including average Mean income as reference
SELECT 
  State_Name,
  Mean,
  Median,
  (SELECT ROUND(AVG(Mean), 2) 
   FROM US_household_income_statistics 
   WHERE Mean > 0) AS Avg_Mean_Income
FROM US_household_income_statistics
WHERE Mean > (
    SELECT AVG(Mean) 
    FROM US_household_income_statistics 
    WHERE Mean > 0
)
AND Mean > 0  -- Also filter main rows for positive Mean
ORDER BY Mean DESC;

-- 9. Select top 10 cities by land area along with the average Median income for their state
SELECT 
    t1.State_Name, 
    t1.City, 
    t1.ALand,       
    (
        SELECT AVG(Median) 
        FROM US_household_income_statistics t2
        WHERE t2.State_Name = t1.State_Name AND Median > 0
    ) AS State_Median_Income
FROM US_household_income t1
ORDER BY t1.ALand DESC
LIMIT 10;

-- 10. (Duplicate of #8) Select states with Mean income above average Mean income, including average Mean income as reference
SELECT 
  State_Name,
  Mean,
  Median,
  (SELECT ROUND(AVG(Mean), 2) 
   FROM US_household_income_statistics 
   WHERE Mean > 0) AS Avg_Mean_Income
FROM US_household_income_statistics
WHERE Mean > (
    SELECT AVG(Mean) 
    FROM US_household_income_statistics 
    WHERE Mean > 0
)
AND Mean > 0  -- Filter main rows for positive Mean
ORDER BY Mean DESC;

-- 11. Calculate average Mean, Median, and Stdev income per state, excluding non-positive values; order by average Mean descending
SELECT 
  State_Name,
  ROUND(AVG(Mean), 2) AS Avg_Mean,
  ROUND(AVG(Median), 2) AS Avg_Median,
  ROUND(AVG(Stdev), 2) AS Avg_Stdev
FROM US_household_income_statistics
WHERE Mean > 0 AND Median > 0 AND Stdev > 0
GROUP BY State_Name
ORDER BY Avg_Mean DESC;
