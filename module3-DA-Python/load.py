import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy import Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Connection data:
user = "root"
password= "MySQLBernard1#"
host = "localhost"
port = "3306"
database = "first_load_db"

Base = declarative_base()

class Complete(Base):
    __tablename__ = "complete_venta"

    id = Column(Integer, primary_key=True)
    venta_id = Column(Integer)
    producto_id = Column(Integer)
    cantidad = Column(Integer)
    precio_unitario = Column(Integer)
    cliente_id = Column(Integer)
    empleado_id = Column(Integer)
    fecha = Column(String)
    nombre_producto = Column(String)
    precio = Column(Integer)
    stock = Column(Integer)
    nombre_cliente = Column(String)
    email = Column(String)
    telefono = Column(String)
    total = Column(Integer)
