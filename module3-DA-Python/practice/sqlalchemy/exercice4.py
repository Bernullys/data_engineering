# In this lesson, you’ll learn how to:
# ✅ Update records using .update() and modifying objects.
# ✅ Delete records using .delete() and .remove().

# Step 1: Updating Data
# There are two ways to update data in SQLAlchemy:
#     Modify an object and commit changes.
#     Use .update() for batch updates.

# Method1: Modify an Object and Commit:
'''
session = SessionLocal()
# Find a user by name
user = session.query(User).filter_by(name="Alice").first()
if user:
    user.age = 30  # Modify the attribute
    session.commit()  # Save changes
This fetches the user named "Alice", changes their age to 30, and commits the update.
'''

# Method2: Batch Updates with .update():
'''
If you want to update multiple records at once, use .update():
session.query(User).filter(User.age < 25).update({"age": 25})
session.commit()
 This updates all users with an age less than 25 and sets their age to 25.
 Important: .update() doesn't update Python objects in memory, only in the database. You'll need to re-query if you want to see the changes in Python.
'''

# Step 2: Deleting Data:
# Just like updating, there are two ways to delete data.

# Method 1: Delete a Single Record:
'''
user = session.query(User).filter_by(name="Alice").first()
if user:
    session.delete(user)  # Delete the object
    session.commit()  # Save changes
This deletes the first user named "Alice" from the database.
'''

# Method 2: Delete Multiple Records Using .delete()
'''
session.query(User).filter(User.age < 20).delete()
session.commit()
This removes all users younger than 20 from the database.
Important: .delete() also works only in the database. If you need to keep track of deleted objects in Python, you must manage that manually.
'''

# --------------- Task --------------------------------------#
# Update the author of a book where the title is "Harry Potter I" to "J.K. Rowling".
# Increase the age of all users older than 30 by 2 years.
# Delete a book where the title is "Harry Potter II".
# Delete all books written by "Unknown Author".

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from exercice2 import User, Book

BASEURL = "sqlite:///exercice2.db"
engine = create_engine(BASEURL)
SessionLocal = sessionmaker(bind=engine)
Base = declarative_base()

with SessionLocal() as session:
    session.query(User).filter(User.name =="Bernardo").update({"age": 37})
    session.commit()

with SessionLocal() as session:
    session.query(Book).filter(Book.title == "Wild Book").update({"author": "Crazy Person"})
    session.commit()

with SessionLocal() as session:
    first_electrical_book = session.query(Book).filter(Book.title == "Electrical science").first()
    if first_electrical_book:
        session.delete(first_electrical_book)
    session.commit()    

with SessionLocal() as session:
    session.query(Book).filter(Book.author == "Crazy Person").delete()
    session.commit()