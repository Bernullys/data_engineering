import mysql.connector 
from mysql.connector import Error
import pandas as pd

try:
    conexion = mysql.connector.connect(
        host= "localhost",
        user= "root",
        password = "MySQLBernard1#",
        database = "project_one_db"
    )

    if conexion.is_connected():
        print("Conexion exitosa a la base de datos")

    query = "SELECT * FROM cliente"
    df_clientes = pd.read_sql(query, con=conexion)
    print(df_clientes.head())

except Error as e:
    print(f"Error al conectar: {e}")

finally:
    if "conexion" in locals() and conexion.is_connected():
        conexion.close()
        print("Conexión cerrada")
