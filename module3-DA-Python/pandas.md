📦 ¿Qué es pandas?
pandas es una biblioteca de análisis y manipulación de datos muy poderosa y flexible. Es ampliamente utilizada en ciencia de datos, ingeniería de datos, finanzas, entre otros.

Permite trabajar con datos estructurados (como tablas), facilitando tareas como:

Lectura y escritura de datos (CSV, Excel, bases de datos).
Limpieza y transformación de datos.
Análisis estadístico.
Filtrado y agrupamiento.
Visualización básica.

🛠️ Instalación
pip install pandas
O si estás en Jupyter Notebook:
!pip install pandas

🧱 Principales clases
1. pandas.Series
Representa una columna de datos (unidimensional), con índice.
Similar a un array de NumPy, pero con etiquetas.

import pandas as pd
s = pd.Series([1, 2, 3], index=["a", "b", "c"])

2. pandas.DataFrame
Representa una tabla (datos bidimensionales), como una hoja de cálculo.
Es la estructura central de pandas.

data = {
    "nombre": ["Ana", "Luis", "Marta"],
    "edad": [28, 34, 25]
}
df = pd.DataFrame(data)

🔧 Métodos principales

Lectura y escritura.

pd.read_csv("archivo.csv")         # Leer CSV
df.to_csv("salida.csv")            # Guardar CSV
pd.read_excel("archivo.xlsx")      # Leer Excel
df.to_excel("salida.xlsx")         # Guardar Excel

Exploración de datos.

df.head()          # Primeras filas
df.tail()          # Últimas filas
df.info()          # Resumen del DataFrame
df.describe()      # Estadísticas básicas
df.shape           # (filas, columnas)

Selección y filtrado.

df["edad"]                 # Acceder a una columna
df[["nombre", "edad"]]     # Varias columnas
df[df["edad"] > 30]        # Filtrado por condición

Transformación.

df["edad_nueva"] = df["edad"] + 1        # Nueva columna
df.drop("columna", axis=1)               # Eliminar columna
df.sort_values("edad")                   # Ordenar
df.rename(columns={"nombre": "Nombre"})  # Renombrar

Agrupamiento.

df.groupby("ciudad").mean()       # Promedio por grupo
df.groupby("ciudad").agg(["mean", "sum"])

📊 Usos principales
Análisis exploratorio de datos (EDA).
Limpieza de datos (eliminar nulos, duplicados, etc.).
Transformación y normalización de datos.
Cálculos estadísticos y agregaciones.
Preparación de datos para modelos de Machine Learning.
Visualización básica (con .plot() y librerías como matplotlib o seaborn).