CREATE TABLE raw_sales (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate VARCHAR(50), 
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(100)
);

SELECT COUNT(*) FROM raw_sales;
SELECT COUNT(*) FROM raw_sales WHERE CustomerID IS NULL;
SELECT COUNT(*) FROM raw_sales WHERE Quantity < 0;

-- Creating the Cleaned Table 
CREATE TABLE cleaned_retail AS
SELECT 
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,
    (Quantity * UnitPrice) AS TotalRevenue 
FROM raw_sales
WHERE 
    CustomerID IS NOT NULL        
    AND Quantity > 0               
    AND UnitPrice > 0              
    AND NOT InvoiceNo LIKE 'C%';   
    
    

SET SQL_SAFE_UPDATES = 0;


UPDATE raw_sales 
SET InvoiceDate = STR_TO_DATE(InvoiceDate, '%d-%m-%Y %H:%i');

UPDATE cleaned_retail 
SET Description = TRIM(Description),
    Country = TRIM(Country);
    

SET SQL_SAFE_UPDATES = 1;

CREATE VIEW rfm_metrics AS
WITH customer_agg AS (
    SELECT 
        CustomerID,
        MAX(InvoiceDate) AS last_purchase_date,
        COUNT(DISTINCT InvoiceNo) AS frequency,
        SUM(TotalRevenue) AS monetary
    FROM cleaned_retail
    GROUP BY CustomerID
)
SELECT 
    CustomerID,
    -- Recency: Days since the most recent date in the whole dataset
    DATEDIFF((SELECT MAX(InvoiceDate) FROM cleaned_retail), last_purchase_date) AS recency,
    frequency,
    monetary
FROM customer_agg;


SELECT * FROM rfm_metrics LIMIT 10;

SELECT InvoiceDate FROM raw_sales LIMIT 1;

ALTER TABLE raw_sales MODIFY COLUMN InvoiceDate DATETIME;

-- Drop the old tables/views
DROP TABLE IF EXISTS cleaned_retail;
DROP VIEW IF EXISTS rfm_metrics;

-- Re-create the cleaned table
CREATE TABLE cleaned_retail AS
SELECT *, (Quantity * UnitPrice) AS TotalRevenue
FROM raw_sales
WHERE CustomerID IS NOT NULL 
  AND Quantity > 0 
  AND UnitPrice > 0
  AND NOT InvoiceNo LIKE 'C%';
  
CREATE VIEW rfm_metrics AS
WITH customer_agg AS (
    SELECT 
        CustomerID,
        MAX(InvoiceDate) AS last_purchase_date,
        COUNT(DISTINCT InvoiceNo) AS frequency,
        SUM(TotalRevenue) AS monetary
    FROM cleaned_retail
    GROUP BY CustomerID
)
SELECT 
    CustomerID,
    DATEDIFF((SELECT MAX(InvoiceDate) FROM cleaned_retail), last_purchase_date) AS recency,
    frequency,
    monetary
FROM customer_agg;

SELECT * FROM rfm_metrics LIMIT 10;

SELECT 
    CustomerID, 
    recency, 
    frequency, 
    monetary 
FROM rfm_metrics;