import pandas as pd
from sqlalchemy import create_engine

# Connection data:
host= "localhost"
user= "root"
password = "MySQLBernard1#"
database = "project_one_db"

# Connection string:
connection_str = f"mysql+mysqlconnector://{user}:{password}@{host}/{database}"
# Create the connection engine:
engine = create_engine(connection_str)
# Read cliente table:
# df is used by data frame:
df_clientes = pd.read_sql("SELECT * FROM cliente;", engine)
# Print the query:
print(df_clientes)