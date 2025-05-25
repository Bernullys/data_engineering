Proyecto 1. OLTP

🧱 Paso 1: Definir los Requisitos del Sistema

🎯 Objetivo del sistema:
Registrar ventas de productos a clientes, gestionando productos, clientes, empleados y facturas.

📐 Paso 2: Entidades del sistema
Vamos a identificar las entidades principales que usaremos:

| Entidad      | Descripción                           |
| ------------ | ------------------------------------- |
| Cliente      | Personas que compran productos        |
| Producto     | Los artículos que se venden           |
| Empleado     | El que realiza la venta               |
| Venta        | La factura o registro de una compra   |
| DetalleVenta | Los productos incluidos en cada venta |

🗺 Paso 3: Modelo Entidad-Relación (simplificado)
Cliente (cliente_id, nombre, email, telefono)
Empleado (empleado_id, nombre, puesto)
Producto (producto_id, nombre, precio, stock)
Venta (venta_id, cliente_id, empleado_id, fecha)
DetalleVenta (detalle_id, venta_id, producto_id, cantidad, precio_unitario)

🧩 Relaciones
Un cliente puede tener muchas ventas.
Un empleado puede registrar muchas ventas.
Una venta puede tener muchos detalles.
Cada detalle está asociado a un producto.

⚙ Paso 4: ¿Qué haremos?
Crear las tablas en MySQL desde la terminal.
Insertar algunos datos de prueba.
Hacer consultas básicas (joins, filtros).
Crear una vista.
Crear un procedimiento almacenado.
Crear un trigger.