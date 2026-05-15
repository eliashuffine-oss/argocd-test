import psycopg2
from fastapi import FastAPI
import os

app = FastAPI()

def get_db_connection():
    # Connect to the database using environment variables
    conn = psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )
    return conn

@app.get("/")
def read_item():
    try:
        # Establish connection and query the database
        conn = get_db_connection()
        cur = conn.cursor()
        
        # Retrieve the first two records from the table
        cur.execute("SELECT * FROM items WHERE id IN (1,2)")
        record = cur.fetchall()
        
        cur.close()
        conn.close()
        
        if record:
            return [{"id": row[0], "name": row[1]} for row in record]
        return {"message": "No record found."}
        
    except Exception as e:
        return {"error": str(e)}