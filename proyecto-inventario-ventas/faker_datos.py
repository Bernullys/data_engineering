from sqlalchemy import create_engine, text

host = "localhost"
user = "root"
password = ""
database = "mysql"

connection_str = f"mysql+mysqlconnector://{user}:{password}@{host}/{database}"

engine = create_engine(connection_str)

with engine.connect() as connection:
    result = connection.execute(text("SELECT * FROM user;"))
    for row in result:
        print(row)