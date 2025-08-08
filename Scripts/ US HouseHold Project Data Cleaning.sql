-- 1. Select all records from US_household_income table
SELECT *
FROM US_household_income;

-- 2. Select all records from US_household_income_statistics table
SELECT *
FROM US_household_income_statistics;

-- 3. Count total number of IDs in US_household_income table
SELECT COUNT(ID)
FROM US_household_income;

-- 4. Count total number of rows in US_household_income_statistics table
SELECT COUNT(*)
FROM US_household_income_statistics;

-- 5. Select all records from US_household_income (duplicate query, can be removed if needed)
SELECT *
FROM US_household_income;

-- 6. Select all records from US_household_income_statistics (duplicate query, can be removed if needed)
SELECT *
FROM US_household_income_statistics;

-- 7. Find duplicate IDs in US_household_income table
SELECT id, COUNT(id)
FROM US_household_income
GROUP BY id
HAVING COUNT(id) > 1;

-- 8. Find detailed duplicate records in US_household_income using row numbering
SELECT *
FROM (
  SELECT id, row_id,
         ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
  FROM US_household_income
) duplicates
WHERE row_num > 1;

-- 9. Delete duplicate rows in US_household_income table, keeping only one record per ID
DELETE FROM US_household_income
WHERE row_id IN (
  SELECT row_id
  FROM (
    SELECT id,
           row_id,
           ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
    FROM US_household_income
  ) duplicates
  WHERE row_num > 1
);

-- 10. Find duplicate IDs in US_household_income_statistics table
SELECT id, COUNT(id)
FROM US_household_income_statistics
GROUP BY id
HAVING COUNT(id) > 1;

-- 11. Count occurrences of each State_Name in US_household_income table
SELECT State_Name, COUNT(State_Name)
FROM US_household_income
GROUP BY State_Name;

-- 12. Correct misspelled state name 'georia' to 'Georgia' in US_household_income
UPDATE US_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

-- 13. Correct misspelled state name 'alabama' (lowercase) to 'Alabama' in US_household_income
UPDATE US_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

-- 14. Find rows in US_household_income where Place is NULL
SELECT *
FROM US_household_income
WHERE Place IS NULL;

-- 15. Update Place to 'Autaugaville' for specific City and County values
UPDATE US_household_income
SET Place = 'Autaugaville'
WHERE City = 'Vinemont'
  AND County = 'Autauga County';

-- 16. Count occurrences of each Type in US_household_income table
SELECT Type, COUNT(Type)
FROM US_household_income
GROUP BY Type;

-- 17. Correct Type 'Boroughs' to singular 'Borough' in US_household_income
UPDATE US_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';

-- 18. Select ALand and AWater where AWater is 0, 1, or NULL for data review
SELECT ALand, AWater
FROM US_household_income
WHERE AWater = '0' OR AWater = 1 OR AWater IS NULL;
