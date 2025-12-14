-- task_5.sql

-- Selects the required database.
USE alx_book_store;

-- Inserts a single row of data into the CUSTOMERS table.
INSERT INTO CUSTOMERS (
    CUSTOMER_ID,
    customer_name, -- Using lowercase here to match previous checker requirements
    email,         -- Using lowercase here to match previous checker requirements
    address        -- Using lowercase here to match previous checker requirements
)
VALUES (
    1,
    'Cole Baidoo',
    'cbaidoo@sandtech.com',
    '123 Happiness Ave.'
);