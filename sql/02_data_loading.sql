-- -----------------------------
-- 02_staging_load.sql
-- Load raw CSV into staging table
-- -----------------------------
DROP TABLE IF EXISTS superstore_raw;

CREATE TABLE superstore_raw (
    `Order Date` VARCHAR(20),
    `Ship Date` VARCHAR(20),
    `Ship Mode` VARCHAR(50),
    `Customer ID` VARCHAR(50),
    `Customer Name` VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    `Postal Code` VARCHAR(50),
    Region VARCHAR(50),
    `Product ID` VARCHAR(50),
    Category VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    `Product Name` VARCHAR(100),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

-- Load CSV
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.5/Uploads/Superstore.csv'
INTO TABLE superstore_raw
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;