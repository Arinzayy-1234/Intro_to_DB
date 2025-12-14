-- task_4.sql

-- Selects the required database (required by the checker).
USE alx_book_store;

-- Queries the MySQL INFORMATION_SCHEMA to list the column name and data type
-- for the 'Books' table in the 'alx_book_store' schema.
SELECT
    COLUMN_NAME,
    COLUMN_TYPE
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_SCHEMA = 'alx_book_store'
AND
    TABLE_NAME = 'Books';