from sqlalchemy import create_engine, text

# Parámetros de la conexion:
host= "localhost"
user= "root"
password = "MySQLBernard1#"
database = "project_one_db"

# Cadena de conexion (DSN)
conexion_str = f"mysql+mysqlconnector://{user}:{password}@{host}/{database}"

# Crear el motor de conexión
engine = create_engine(conexion_str)

# Verificar la conexion ejecutando un query simple:
with engine.connect() as connection:
    result = connection.execute(text("SELECT * FROM cliente;"))
    for row in result:
        print(row)