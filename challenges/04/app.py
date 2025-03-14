import os
import time

def connect_to_database():
    username = "myuser"
    password = "hardcodedpassword"  # Vulnerable!
    print(f"Connecting to database with user: {username}", flush=True)
    print(f"Connecting to database with password: {password}", flush=True)
    # Database connection logic here
    time.sleep(3600)

if __name__ == "__main__":
    connect_to_database()
