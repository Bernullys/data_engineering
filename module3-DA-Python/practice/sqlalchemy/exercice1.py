# Excercice1:
    # Create a table with different columns.
    # Insert and retrieve data from it.

from sqlalchemy import create_engine, insert, select, MetaData, Table, Column, Integer, String

# This is like have a .sql file but in python... for me like this has not advantage. 

# Creates an engine object
engine = create_engine("sqlite:///exercice1.db", echo= True) # echo=True prints SQL queries

# Metadata stores table definition
metadata = MetaData()

# Define a users table
users = Table(
    "users", metadata,
    Column("id", Integer, primary_key=True),
    Column("name", String(50)),
    Column("age", Integer),
    Column("email", String(80)),
    Column("RUN", String(15))
)

# Creates the table in the database
metadata.create_all(engine)

# Insert data
with engine.connect() as connection:
    connection.execute(insert(users), {"name": "Bernardo", "age": 37, "email": "bernardo@gmail.com", "RUN": "123456789"})
    connection.commit()

# Read data:
with engine.connect() as connection:
    result = connection.execute(select(users))
    for row in result:
        print(row)