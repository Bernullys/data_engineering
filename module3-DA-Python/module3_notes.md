Modulo 3. Análisis de Datos con Python:
 
Implementando un proceso ETL con Python
Contenedores
Análisis y Visualización de Datos con Pandas, Seaborn y Matplotlib
Blog: ETL Process with MySQL and Data Analytics with Python

-------------------------------------------------------------------------
Vamos a conectar Python con una base de datos MySQL utilizando una librería muy común llamada mysql-connector-python.

🔧 PRINCIPALES CLASES Y MÉTODOSDE mysql-connector-python_
1. mysql.connector.connect(...)
Función principal para establecer la conexión.
Retorna un objeto de conexión.

📦 OBJETO DE CONEXIÓN (conexion)
2. conexion.cursor()
Crea un cursor para ejecutar comandos SQL.
Devuelve un objeto tipo cursor.

3. conexion.commit()
Confirma (guarda) los cambios en la base de datos.
Necesario después de un INSERT, UPDATE, DELETE.

4. conexion.rollback()
Revierte los cambios no confirmados si ocurre un error.

5. conexion.close()
Cierra la conexión con la base de datos.

🧠 OBJETO CURSOR (cursor)
6. cursor.execute(query, params=None)
Ejecuta una sentencia SQL.
Puedes usar params para pasar parámetros de forma segura (evita SQL Injection).

7. cursor.fetchall()
Recupera todas las filas del resultado de una consulta.

8. cursor.fetchone()
Recupera solo una fila del resultado.

9. cursor.fetchmany(size)
Recupera un número específico de filas.

10. cursor.executemany(query, seq_of_params)
Ejecuta una consulta múltiples veces con diferentes parámetros (útil para inserts masivos).

11. cursor.close()
Cierra el cursor (aunque se cierra automáticamente con la conexión, es buena práctica).

✅ BONUS: CÓMO INSERTAR SEGURO CON PARÁMETROS:
query = "INSERT INTO cliente (nombre, correo) VALUES (%s, %s)"
valores = ("Juan Pérez", "juan@correo.com")
cursor.execute(query, valores)
conexion.commit()

---------------------------------------------------------------------
Ojo:
pandas funciona mejor y de forma oficialmente soportada con conexiones hechas usando SQLAlchemy, no directamente con conexiones mysql-connector (u otras DBAPI2 como psycopg2, etc.). Ver sqlalchemy.md

---------------------------------------------------------------------
Vamos a continuar con la extracción de datos desde MySQL utilizando Pandas y la conexión SQLAlchemy que ya configuramos. Ver archivo conecction_2.py
Despues continuamos con un proceso simple de ETL en simple_etl.py




