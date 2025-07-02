# Object Relational Mapper (ORM).
# Defining Models and interacting with Database.

# Step 1: Setting up SQLAlchemy ORM.
    # The ORM allows us to define database tables as Python classes and interact with them as objects.

from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import declarative_base, sessionmaker

# Create a Base class fro ORM models
Base = declarative_base()

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(50), nullable=False)
    age = Column(Integer, nullable=False)

class Book(Base):
    __tablename__ = "books"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(50), nullable=False)
    author = Column(String(50), nullable=False)

def run():

    engine = create_engine("sqlite:///exercice2.db", echo=True)



    # Create a Session factory to interact with the database in a controlled and eficient way.
    SessionLocal = sessionmaker(bind=engine)

    #------------------------------------ Define a Table as a Python Class (Model) -------------------------------#



    # Create tables in the database
    Base.metadata.create_all(engine)

    # -------------------------- Adding data -----------------------------------------#

    # Create a session
    session = SessionLocal()

    # Insert data
    new_user = User(name="Bernardo", age=37)

    # Add and commit to the database
    session.add(new_user)
    session.commit()

    # ----------------------- Query data ----------------------------------------------#

    # Retrive all users
    users = session.query(User).all()
    for user in users:
        print(user.id, user.name, user.age)


    # ---------------- Task -------------------------------------------------#
    # Define a new model (Book) with columns: id, title, and author.
    # Insert at least two book records.
    # Query and print all books from the database.



    Base.metadata.create_all(engine)

    session = SessionLocal()
    new_books = [
        Book(title = "Wild Book", author = "Bernardo Antonio"),
        Book(title = "Gear manual", author = "Patricia Rangel"),
        Book(title = "Electrical science", author = "Nicola Tesla")
    ]
    session.add_all(new_books)
    session.commit()

    books = session.query(Book).all()
    for book in books:
        print(book.title)




if __name__ == "__main__":
    run()