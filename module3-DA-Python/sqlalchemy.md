🧰 ¿Qué es SQLAlchemy?

SQLAlchemy es una biblioteca de Python para trabajar con bases de datos SQL. Te permite interactuar con bases de datos de forma segura y eficiente, usando:
    SQL nativo (SQL Expression Language)
    ORM (Object Relational Mapper): te permite trabajar con tablas como si fueran clases y filas como objetos Python.

🛠️ Instalación

pip install sqlalchemy

Si vas a usar SQLite (viene por defecto con Python), no necesitas más.
Para MySQL, PostgreSQL u otros motores, necesitas el driver adicional, por ejemplo:

pip install psycopg2-binary  # PostgreSQL
pip install pymysql          # MySQL

🧱 Clases y Componentes principales

1. create_engine
Crea una conexión a la base de datos.

from sqlalchemy import create_engine
engine = create_engine("sqlite:///ejemplo.db")

2. MetaData, Table, Column (SQL Expression Language)
Permite definir estructuras de tabla a bajo nivel.

from sqlalchemy import MetaData, Table, Column, Integer, String

metadata = MetaData()
usuarios = Table(
    "usuarios", metadata,
    Column("id", Integer, primary_key=True),
    Column("nombre", String),
)
metadata.create_all(engine)

3. ORM: declarative_base, Session, y clases modelo

from sqlalchemy.orm import declarative_base, sessionmaker

Base = declarative_base()

class Usuario(Base):
    __tablename__ = "usuarios"
    id = Column(Integer, primary_key=True)
    nombre = Column(String)

Base.metadata.create_all(engine)
Session = sessionmaker(bind=engine)
session = Session()

🔧 Métodos comunes
ORM: CRUD (Create, Read, Update, Delete)

# Crear
nuevo_usuario = Usuario(nombre="Ana")
session.add(nuevo_usuario)
session.commit()

# Leer
usuarios = session.query(Usuario).all()

# Filtrar
ana = session.query(Usuario).filter_by(nombre="Ana").first()

# Actualizar
ana.nombre = "Ana María"
session.commit()

# Eliminar
session.delete(ana)
session.commit()

📌 Usos principales
Mapeo objeto-relacional (ORM)
    Permite trabajar con bases de datos usando clases y objetos.
Abstracción de SQL
    Puedes cambiar de SQLite a PostgreSQL o MySQL con poco o ningún cambio en tu código.
Migraciones (junto con Alembic)
    Para mantener la estructura de la base de datos sincronizada con tu código.
Consultas complejas
    Puedes construir SQL dinámicamente usando Python.
Integración en frameworks
    Muy usado con FastAPI, Flask y otros frameworks web.

🧾 Métodos más comunes de SQLAlchemy ORM

| Método / Función                   | ¿Para qué se utiliza?                                                                                       |
| ---------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| `session.add(obj)`                 | Agrega una instancia del modelo a la sesión para insertarla en la base de datos.                            |
| `session.add_all([obj1, obj2])`    | Agrega múltiples objetos a la sesión.                                                                       |
| `session.commit()`                 | Guarda los cambios en la base de datos (ejecuta las operaciones pendientes).                                |
| `session.rollback()`               | Revierte todos los cambios no comprometidos. Muy útil en caso de error.                                     |
| `session.delete(obj)`              | Marca un objeto para eliminarlo de la base de datos.                                                        |
| `session.query(Model)`             | Realiza una consulta sobre un modelo de base de datos.                                                      |
| `query.all()`                      | Devuelve **todas** las filas del resultado de una consulta.                                                 |
| `query.first()`                    | Devuelve la **primera fila** del resultado de la consulta.                                                  |
| `query.filter(condición)`          | Filtra resultados usando condiciones tipo SQL (==, >, <, etc.).                                             |
| `query.filter_by(columna=valor)`   | Filtra resultados usando argumentos por nombre (solo `=`).                                                  |
| `query.get(id)`                    | Busca una fila por su **clave primaria**.                                                                   |
| `session.flush()`                  | Empuja los cambios a la base de datos **sin hacer commit**. Útil para generar claves primarias automáticas. |
| `session.close()`                  | Cierra la sesión y libera recursos.                                                                         |
| `Model.__tablename__`              | Define el nombre de la tabla asociada al modelo.                                                            |
| `Model.query.count()`              | Devuelve el número de filas en una tabla.                                                                   |
| `Model.query.order_by(...)`        | Ordena los resultados por una columna.                                                                      |
| `Base.metadata.create_all(engine)` | Crea todas las tablas definidas en los modelos.                                                             |
| `Base.metadata.drop_all(engine)`   | Elimina todas las tablas definidas en los modelos.                                                          |

🧠 Ejemplo rápido: 

# Crear un nuevo usuario
usuario = Usuario(nombre="Ana")
session.add(usuario)
session.commit()

# Consultar
usuarios = session.query(Usuario).filter_by(nombre="Ana").all()

# Actualizar
ana = session.query(Usuario).first()
ana.nombre = "Ana María"
session.commit()

# Eliminar
session.delete(ana)
session.commit()
