-- alx_book_store.sql

-- 1. DATABASE CREATION
-- -----------------------------------------------------------------
-- Drops the database if it already exists to ensure a clean start
DROP DATABASE IF EXISTS alx_book_store;

-- Creates the new database
CREATE DATABASE alx_book_store;

-- Selects the newly created database for subsequent commands
USE alx_book_store;


-- 2. TABLE CREATION
-- -----------------------------------------------------------------

-- Authors Table: Stores information about authors.
-- Key: author_id (Primary Key)
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215)
);

-- Customers Table: Stores information about customers.
-- Key: customer_id (Primary Key)
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
);

-- Books Table: Stores information about books.
-- Keys: book_id (Primary Key), author_id (Foreign Key)
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    -- Foreign Key Constraint: Links to the Authors table
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Orders Table: Stores information about orders placed by customers.
-- Keys: order_id (Primary Key), customer_id (Foreign Key)
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    -- Foreign Key Constraint: Links to the Customers table
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order_Details Table: Stores the books and quantities for each order.
-- Keys: orderdetailid (Primary Key), order_id (Foreign Key), book_id (Foreign Key)
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    -- Foreign Key Constraint 1: Links to the Orders table
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    -- Foreign Key Constraint 2: Links to the Books table
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- 3. CONFIRMATION (Optional but good practice)
-- -----------------------------------------------------------------
-- SHOW TABLES;
-- DESCRIBE Books;
-- DESCRIBE Order_Details;