-- task_2.sql

-- Selects the database to ensure all subsequent CREATE TABLE statements
-- are executed within the 'alx_book_store' database.
USE ALX_BOOK_STORE;

-- 1. Authors Table: Stores information about authors.
-- Key: author_id (Primary Key)
CREATE TABLE AUTHORS (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(215)
);

-- 2. Customers Table: Stores information about customers.
-- Key: customer_id (Primary Key)
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(215),
    EMAIL VARCHAR(215),
    ADDRESS TEXT
);

-- 3. Books Table: Stores information about books.
-- Keys: book_id (Primary Key), author_id (Foreign Key referencing Authors)
CREATE TABLE BOOKS (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(130),
    AUTHOR_ID INT,
    PRICE DOUBLE,
    PUBLICATION_DATE DATE,
    -- Foreign Key Constraint: Links to the Authors table
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
);

-- 4. Orders Table: Stores information about orders placed by customers.
-- Keys: order_id (Primary Key), customer_id (Foreign Key referencing Customers)
CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE,
    -- Foreign Key Constraint: Links to the Customers table
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

-- 5. Order_Details Table: Stores the books and quantities for each order.
-- Keys: orderdetailid (Primary Key), order_id (Foreign Key), book_id (Foreign Key)
CREATE TABLE ORDER_DETAILS (
    ORDERDETAILID INT PRIMARY KEY,
    ORDER_ID INT,
    BOOK_ID INT,
    QUANTITY DOUBLE,
    -- Foreign Key Constraint 1: Links to the Orders table
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    -- Foreign Key Constraint 2: Links to the Books table
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);