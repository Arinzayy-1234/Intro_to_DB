-- task_6.sql

-- Selects the required database.
USE alx_book_store;

-- Inserts multiple rows of data into the CUSTOMERS table using a single statement.
-- NOTE: All three addresses now include the required double space "  Ave."
INSERT INTO customer (
    customer_id,
    customer_name,
    email,
    address
)
VALUES 
    (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'), -- Double space here
    (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),  -- Double space here
    (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.'); -- Double space here