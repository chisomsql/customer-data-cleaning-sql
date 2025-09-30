-- Customer Data Cleaning Project
-- Cleaning script for Customers table:
-- 1. Remove extra spaces
-- 2. Standardize capitalization
-- 3. Handle NULL values
-- 4. Remove duplicates

USE CustomerDB;

----------------------------------------------------------
-- STEP 1: Remove extra spaces in names
----------------------------------------------------------
UPDATE Customers
SET FullName = TRIM(REPLACE(FullName, '  ', ' '));

----------------------------------------------------------
-- STEP 2: Standardize capitalization of names
-- Capitalize first letter, lowercase rest
----------------------------------------------------------
UPDATE Customers
SET FullName = CONCAT(
    UPPER(SUBSTRING(TRIM(FullName), 1, 1)),
    LOWER(SUBSTRING(TRIM(FullName), 2))
);

----------------------------------------------------------
-- STEP 3: Standardize capitalization of cities
-- (handles only first word; "Port Harcourt" needs custom handling)
----------------------------------------------------------
UPDATE Customers
SET City = CONCAT(
    UPPER(SUBSTRING(TRIM(City), 1, 1)),
    LOWER(SUBSTRING(TRIM(City), 2))
)
WHERE City IS NOT NULL;

----------------------------------------------------------
-- STEP 4: Fix NULL values in Email and Balance
-- Replace NULL balances with 0
----------------------------------------------------------
UPDATE Customers
SET Balance = 0
WHERE Balance IS NULL;

-- Replace NULL emails with placeholder
UPDATE Customers
SET Email = CONCAT(
    LOWER(REPLACE(FullName, ' ', '.')), '@example.com'
)
WHERE Email IS NULL;

----------------------------------------------------------
-- STEP 5: Remove duplicate records
-- Keep the lowest CustomerID when duplicates exist
----------------------------------------------------------
DELETE c1 FROM Customers c1
JOIN Customers c2
  ON c1.FullName = c2.FullName
 AND c1.City = c2.City
 AND c1.Email = c2.Email
 AND c1.CustomerID > c2.CustomerID;

----------------------------------------------------------
-- STEP 6: Verify cleaned data
----------------------------------------------------------
SELECT * FROM Customers;
