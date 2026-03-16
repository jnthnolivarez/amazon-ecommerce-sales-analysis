CREATE TABLE amazon_sales_raw (
    order_id VARCHAR(50),
    order_date DATE,
    status VARCHAR(50),
    category VARCHAR(50),
    sku VARCHAR(100),
    qty INT,
    amount NUMERIC,
    ship_city VARCHAR(100),
    ship_state VARCHAR(100),
    ship_postal_code VARCHAR(20)
);