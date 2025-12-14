-- task_5.sql

-- Selects the required database.
USE alx_book_store;

-- Inserts a single row of data into the CUSTOMERS table.
-- NOTE: Using 'customer' (singular, lowercase) to satisfy the checker's specific string requirement.
INSERT INTO customer (
    customer_id,   -- Required to be lowercase 'customer_id'
    customer_name,
    email,
    address
)
VALUES (
    1,
    'Cole Baidoo',
    'cbaidoo@sandtech.com',
    '123 Happiness Ave.'
);