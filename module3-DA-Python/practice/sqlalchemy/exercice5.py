# Lesson 5: Defining Relationships Between Tables in SQLAlchemy ORM
# Relational databases are all about connections. In this lesson, you'll learn how to:
# ✅ Define one-to-many and many-to-one relationships
# ✅ Use ForeignKey and relationship()
# ✅ Access related records using dot notation (user.books, book.user)


# ✅ Step 1: Define a One-to-Many Relationship
# Let’s say:
# One User can have many Books
# Each Book belongs to one User

# Creates the User and Book models (new ones)

from sqlalchemy import create_engine, MetaData, Column, Integer, String, ForeignKey
from sqlalchemy.orm import declarative_base, sessionmaker, relationship


engine = create_engine("sqlite:///exercice5.db")

Base = declarative_base()

SessionLocal = sessionmaker(bind=engine)

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=False)
    age = Column(Integer, nullable=False)
    # Relationship: One user has many books
    books = relationship("Book", back_populates="owner")


class Book(Base):
    __tablename__ = "books"

    id = Column(Integer, primary_key=True)
    title = Column(String(50), nullable=False)
    author = Column(String(50), nullable=False)
    # Foreign key to users table:
    user_id = Column(Integer, ForeignKey("users.id"))
    # Relationship: Each book belongs to one user
    owner = relationship("User", back_populates="books")

# ✅ Step 2: Create the Tables Again

Base.metadata.create_all(engine)

# ✅ Step 3: Add Related Data


first_users = [
    User(name = "Bernardo", age = 37),
    User(name = "Patricia", age = 34)
]

first_books = [
    Book(title = "Be Sussessfull", author = "Thomas D", owner = first_users[0]),
    Book(title = "Be Happy", author = "Luna D", owner = first_users[1])

]

'''
Insert data only once:

with SessionLocal() as session:
    session.add_all(first_users)
    session.commit()

'''


# ✅ Step 4: Query Related Data

# Bring a user:

with SessionLocal() as session:
    user_info = session.query(User).filter_by(name = "Patricia").first()

    print("User: ", user_info.name)
    for book in user_info.books:
        print(f"Books: {book.title}")

with SessionLocal() as session:
    book = session.query(Book).filter_by(title= "Be Sussessfull").first()
    print(f"Book: {book.title}, belongs to {book.owner.name}")

# Summary: Relationship Terms
'''
| Concept        | Keyword                         | Example                                      |
| -------------- | ------------------------------- | -------------------------------------------- |
| One-to-Many    | `relationship()` + `ForeignKey` | User → Books                                 |
| Back reference | `back_populates`                | Makes it two-way (user.books and book.owner) |

'''

