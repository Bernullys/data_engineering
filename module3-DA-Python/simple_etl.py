import pandas as pd
from sqlalchemy import create_engine
import seaborn as sns
import matplotlib.pyplot as plt

host= "localhost"
user= "root"
password = "MySQLBernard1#"
database = "project_one_db"

connection_str = f"mysql+mysqlconnector://{user}:{password}@{host}/{database}"

engine = create_engine(connection_str)

# Extraction:

df_clientes = pd.read_sql("SELECT * FROM cliente;", engine)
df_empleado = pd.read_sql("SELECT * FROM empleado;", engine)
df_producto = pd.read_sql("SELECT * FROM producto;", engine)
df_venta = pd.read_sql("SELECT * FROM venta;", engine)
df_detalle_venta = pd.read_sql("SELECT * FROM detalle_venta;", engine)
# Print to check:
# print(df_clientes.head())
# print(df_empleado.head())
# print(df_producto.head())
# print(df_venta.head())
# print(df_detalle_venta.head())

# Trasform:

# Merge venta with detalle_venta:
complet_venta = df_detalle_venta.merge(df_venta, on="venta_id", how="inner")
# Merge complet_venta with producto:
complet_venta = complet_venta.merge(df_producto, on="producto_id", how="inner")
# Merge complet_venta with cliente:
complet_venta = complet_venta.merge(df_clientes, on="cliente_id", how="inner")
# Agregation function:
complet_venta["total"] = complet_venta["cantidad"] * complet_venta["precio_unitario"]

# Check data
print(complet_venta[["nombre_y", "nombre_x", "cantidad"]])

# Analys and basic visualization:

top_products = complet_venta.groupby("nombre_x")["cantidad"].sum().sort_values(ascending=False)
print("Top products sold:", top_products)

top_clients = complet_venta.groupby("nombre_y")["total"].sum().sort_values(ascending=False)
print("Top clients:", top_clients)

sell_by_date = complet_venta.groupby("fecha")["total"].sum()
print("Sell by date: ", sell_by_date)


# Save and export complet_venta table:
complet_venta.to_csv("complet_sells.csv", index=False)


# Visualization:

sells_by_client = complet_venta.groupby("nombre_y")["total"].sum().reset_index()

plt.figure(figsize=(8, 5))
sns.barplot(data=sells_by_client, hue="nombre_y", y="total", palette="viridis")
plt.title('Ventas Totales por Cliente')
plt.xlabel('Cliente')
plt.ylabel('Total de Ventas ($)')
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig("Graphic_1.png")