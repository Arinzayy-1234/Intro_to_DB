# MySQLServer.py

import mysql.connector
from mysql.connector import errorcode

# Configuration for connecting to the MySQL server
# NOTE: Replace these placeholder values with your actual MySQL credentials.
config = {
    'user': 'YOUR_MYSQL_USER',      # e.g., 'root' or your custom user
    'password': 'YOUR_MYSQL_PASSWORD', # e.g., 'mypassword123'
    'host': '127.0.0.1',            # or your host address
    # We do NOT specify 'database' here, as we are creating it
}

DATABASE_NAME = "alx_book_store"

def create_database():
    """
    Connects to the MySQL server and attempts to create the database 
    'alx_book_store' if it does not already exist.
    """
    # Initialize connection and cursor to None
    cnx = None
    cursor = None
    
    try:
        # 1. Establish the connection to the MySQL server
        print(f"Attempting to connect to MySQL server at {config['host']}...")
        cnx = mysql.connector.connect(**config)
        
        # 2. Create a cursor object to execute SQL queries
        cursor = cnx.cursor()
        
        # 3. Execute the SQL command to create the database 
        #    (using IF NOT EXISTS to prevent failure if it already exists)
        sql_query = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"
        cursor.execute(sql_query)
        
        print(f"Database '{DATABASE_NAME}' created successfully!")

    except mysql.connector.Error as err:
        # Handle connection and database-related errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Access denied! Check your MySQL username and password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            # This error is less likely here but included for completeness
            print("Error: Database does not exist.")
        else:
            # Print any other unexpected MySQL error
            print(f"Error connecting to the database: {err}")
            
    except Exception as e:
        # Handle general Python exceptions (e.g., incorrect configuration dictionary)
        print(f"An unexpected error occurred: {e}")

    finally:
        # 4. Handle the closing of the cursor and connection (MANDATORY)
        if cursor:
            cursor.close()
            # print("Cursor closed.")
        if cnx and cnx.is_connected():
            cnx.close()
            print("Connection to MySQL server closed.")
            
if __name__ == "__main__":
    create_database()