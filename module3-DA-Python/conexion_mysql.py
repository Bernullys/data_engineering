import mysql.connector 
from mysql.connector import Error

try:
    conexion = mysql.connector.connect(
        host= "localhost",
        user= "root",
        password = "MySQLBernard1#",
        database = "project_one_db"
    )

    if conexion.is_connected():
        print("Conexion exitosa a la base de datos")

    cursor = conexion.cursor()
    cursor.execute("SELECT * FROM empleado")
    resultado = cursor.fetchall()
    for r in resultado:
        print(r)
    cursor.close()
    conexion.close()

except Error as e:
    print(f"Error al conectar: {e}")

finally:
    if "conexion" in locals() and conexion.is_connected():
        conexion.close()
        print("Conexión cerrada")
