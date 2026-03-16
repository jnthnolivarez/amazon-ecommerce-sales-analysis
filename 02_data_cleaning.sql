-- Replace missing currency
UPDATE amazon_sales_raw
SET currency = 'INR'
WHERE currency IS NULL;

-- Replace missing amount
UPDATE amazon_sales_raw
SET amount = 0
WHERE amount IS NULL;

-- Replace missing city
UPDATE amazon_sales_raw
SET ship_city = 'Unknown'
WHERE ship_city IS NULL;

-- Create order_stage
ALTER TABLE amazon_sales_clean
ADD COLUMN order_stage VARCHAR(20);

UPDATE amazon_sales_clean
SET order_stage =
CASE
    WHEN status = 'Cancelled' THEN 'Failed'
    WHEN status LIKE 'Shipped%' THEN 'Completed'
    ELSE 'In Progress'
END;