🏗️ Estructura del Proyecto
1. Modelo Dimensional
Se adoptó un modelo estrella, que incluye:

Tabla de hechos:

hecho_venta: contiene los datos cuantitativos como el total de la venta, vinculados a claves foráneas que hacen referencia a las dimensiones.

Tablas de dimensiones:

dim_cliente: almacena información descriptiva del cliente.

dim_producto: contiene los atributos de los productos.

dim_empleado: describe a los empleados responsables de las ventas.


2. Creación del Esquema OLAP
Se creó un nuevo esquema en MySQL donde se definieron las tablas del modelo dimensional. Las relaciones entre tablas se establecieron mediante claves foráneas.

3. Carga de Datos desde OLTP
Los datos fueron migrados desde la base de datos transaccional utilizando sentencias INSERT INTO ... SELECT .... Este proceso permitió transformar datos operacionales en información estructurada para análisis.

4. Consultas Analíticas
Se realizaron consultas de ejemplo sobre la base OLAP, tales como:

Producto más vendido.

Cliente con más compras.

Estas consultas permiten generar reportes y dashboards para áreas como ventas, marketing o finanzas.


🛠️ Herramientas Utilizadas
MySQL: motor de base de datos relacional.

Terminal / VSC: para la interacción directa con el sistema de gestión de bases de datos.

Vistas y consultas SQL: para facilitar el análisis de datos.

📌 Conclusión
Este proyecto representa un caso práctico del proceso de transformación de datos desde un entorno operacional a uno analítico, siguiendo principios fundamentales de la ingeniería de datos. Es una base sólida para profundizar en herramientas más avanzadas como data warehouses, BI tools o arquitecturas cloud.