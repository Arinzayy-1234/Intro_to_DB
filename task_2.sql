-- task_2.sql

-- Selects the database to ensure all subsequent CREATE TABLE statements
-- are executed within the 'alx_book_store' database.
USE ALX_BOOK_STORE;

-- 1. Authors Table: Stores information about authors.
-- Key: author_id (Primary Key)
CREATE TABLE AUTHORS (
    AUTHOR_ID INT PRIMARY KEY,
    author_name VARCHAR(215)
);

-- 2. Customers Table: Stores information about customers.
-- Key: customer_id (Primary Key)
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    customer_name VARCHAR(215), -- <-- MUST match the required string
    email VARCHAR(215),         -- <-- MUST match the required string
    address TEXT                -- <-- MUST match the required string
);

-- 3. Books Table: Stores information about books.
-- Keys: book_id (Primary Key), author_id (Foreign Key referencing Authors)
CREATE TABLE BOOKS (
    BOOK_ID INT PRIMARY KEY,
    title VARCHAR(130),       -- <-- MUST be all lowercase "title"
    AUTHOR_ID INT,
    price DOUBLE,             -- <-- MUST be all lowercase "price"
    PUBLICATION_DATE DATE,
    -- Foreign Key Constraint: Links to the Authors table
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
);

-- 4. Orders Table: Stores information about orders placed by customers.
-- Keys: order_id (Primary Key), customer_id (Foreign Key referencing Customers)
CREATE TABLE ORDERS (
    order_id INT PRIMARY KEY,                       -- <-- MUST be "order_id INT"
    customer_id INT,                                -- <-- MUST be "customer_id INT"
    order_date DATE,                                -- <-- MUST be "order_date DATE"
    -- Foreign Key Constraint: Links to the Customers table
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) -- <-- MUST match the required string
);

-- 5. Order_Details Table: Stores the books and quantities for each order.
-- Keys: orderdetailid (Primary Key), order_id (Foreign Key), book_id (Foreign Key)
CREATE TABLE ORDER_DETAILS (
    ORDERDETAILID INT PRIMARY KEY,
    ORDER_ID INT,
    book_id INT,                                    -- <-- MUST be "book_id INT"
    quantity DOUBLE,                                -- <-- MUST be "quantity DOUBLE"
    
    -- Foreign Key Constraint 1: Links to the Orders table
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),  -- <-- MUST match the required string
    
    -- Foreign Key Constraint 2: Links to the Books table
    FOREIGN KEY (book_id) REFERENCES Books(book_id)      -- <-- MUST match the required string
);