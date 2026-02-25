-- -----------------------------
-- 01_schema_design.sql
-- Create database and tables
-- -----------------------------
DROP DATABASE IF EXISTS retail_analytics;
CREATE DATABASE retail_analytics;
USE retail_analytics;

-- Customers
CREATE TABLE customers (
    `Customer ID` VARCHAR(50) PRIMARY KEY,
    `Customer Name` VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    `Postal Code` VARCHAR(50),
    Region VARCHAR(50)
);

-- Products
CREATE TABLE products (
    `Product ID` VARCHAR(50) PRIMARY KEY,
    `Product Name` VARCHAR(100),
    Category VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);

-- Orders
CREATE TABLE orders (
    `Order ID` VARCHAR(50) PRIMARY KEY,
    `Customer ID` VARCHAR(50),
    `Order Date` DATE,
    `Ship Date` DATE,
    `Ship Mode` VARCHAR(50),
    Region VARCHAR(50),
    CONSTRAINT fk_orders_customer FOREIGN KEY (`Customer ID`) REFERENCES customers(`Customer ID`)
);

-- Order Items
CREATE TABLE order_items (
    `Order ID` VARCHAR(50),
    `Product ID` VARCHAR(50),
    Quantity INT,
    Sales DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2),
    PRIMARY KEY (`Order ID`, `Product ID`),
    CONSTRAINT fk_items_order FOREIGN KEY (`Order ID`) REFERENCES orders(`Order ID`),
    CONSTRAINT fk_items_product FOREIGN KEY (`Product ID`) REFERENCES products(`Product ID`)
);