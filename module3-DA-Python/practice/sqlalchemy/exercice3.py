# In this lesson, you’ll learn how to:
# ✅ Query all records
# ✅ Filter data using filter() and filter_by()
# ✅ Use comparison operators (==, <, >, like())
# ✅ Use first(), all(), limit(), and count()

# Querying All Data: Example: Get All Users
'''
session = SessionLocal()  # Open a session

users = session.query(User).all()  # Get all users
for user in users:
    print(user.id, user.name, user.age)

session.close()  # Always close session

all() return a list of all records.
'''

# Filtering Data with filter(): Example: Get Users Older than 25
'''
users = session.query(User).filter(User.age > 25).all()
for user in users:
    print(user.name, user.age)

session.close()  # Always close session

Operators we can use in filter():
== (equal)
!= (not equal)
< (less than)
> (greater than)
<= (less than or equal)
>= (greater than or equal)
'''

# Using filter_by() for simple filters: Example: Get a User Named "Alice"
'''
user = session.query(User).filter_by(name="Alice").first()
print(user.id, user.name, user.age)

session.close()  # Always close session

Difference Between filter() and filter_by():
filter() is more powerful and allows complex conditions (<, >, !=, etc.).
filter_by() is simpler but only supports == conditions.
'''

# Using like(), in(), and between(). Examples:
'''
from sqlalchemy import like

users = session.query(User).filter(User.name.like("A%")).all()

users = session.query(User).filter(User.age.in_([20, 25, 30])).all()

users = session.query(User).filter(User.age.between(20, 30)).all()

'''

# Using first(), count(), and limit(). Examples:
'''
user = session.query(User).first()
print(user.name, user.age)
return the first record or None if no data is found.

user_count = session.query(User).count()
print("Total Users:", user_count)
returns the total number of records in a table.

users = session.query(User).limit(3).all()
restricts the number of results returned.
'''

# --------------- Task ---------------------------------#
# Query and print all Book records.
# Find all books where the author's name starts with "M".
# Count how many books are in the database.
# Retrieve the first two books using limit().

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from exercice2 import Book, User

DATABASE_URL = "sqlite:///exercice2.db"

engine = create_engine(DATABASE_URL)
Base = declarative_base()
SessionLocal = sessionmaker(bind=engine)

with SessionLocal() as session:
    books = session.query(Book).all()

for book in books:
    print(book.title)

