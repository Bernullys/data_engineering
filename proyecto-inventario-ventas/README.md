Proyecto: Sistema de Gestión de Inventario y Ventas para una Tienda Electrónica

🧱 1. Objetivo del proyecto
Diseñar e implementar una base de datos transaccional que permita registrar:

Clientes
Empleados
Productos
Ventas
Detalles de ventas
Inventario

🧩 2. Entidades y relaciones

cliente: Datos del cliente
empleado: Quien realiza la venta
producto: Catálogo de productos disponibles
venta: Cabecera de venta (quién compra, quién vende, cuándo)
detalle_venta: Productos individuales vendidos en cada venta
inventario: Control del stock disponible por producto

🗂️ 3. Estructura mínima de tablas (modelo relacional)

cliente (cliente_id, nombre, correo, telefono)
empleado (empleado_id, nombre, cargo)
producto (producto_id, nombre, descripcion, precio_unitario)
venta (venta_id, cliente_id, empleado_id, fecha)
detalle_venta (detalle_id, venta_id, producto_id, cantidad)
inventario (producto_id, stock)

🔁 4. Acciones clave (comportamiento del sistema)

Cuando se registra una venta:
Se actualiza el inventario.
Se agregan registros a venta y detalle_venta.

Se pueden consultar:
Las ventas por cliente, empleado o rango de fechas.
Productos más vendidos.
Stock actual.

🔧 5. Herramientas necesarias

MySQL (desde terminal o Workbench)
Opcional: script SQL para poblar datos ficticios

📁 6. Estructura del proyecto en carpetas (recomendado)

proyecto-inventario-ventas/
│
├── modelo_erd.png                  # Diagrama entidad-relación
├── creacion_tablas.sql            # Script para crear todas las tablas
├── datos_iniciales.sql            # Inserts con datos de ejemplo
├── procedimientos.sql             # Procedimientos almacenados
├── triggers.sql                   # Triggers (actualizar stock, por ejemplo)
├── vistas.sql                     # Vistas útiles para reportes
└── README.md                      # Explicación del proyecto

🧪 7. ¿Qué aprenderás y demostrarás?

Diseño de modelos relacionales
Normalización de datos
Uso de claves primarias/foráneas
Triggers y procedimientos
Buenas prácticas OLTP
Operaciones SQL reales (INSERT, UPDATE, JOIN, GROUP BY, etc.)


------------------------------------------------------------------------------------------------------------------------------

Se crearan datos para las tablas utilizando la libreria Faker de Python.

