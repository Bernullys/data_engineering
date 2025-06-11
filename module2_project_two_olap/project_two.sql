-- Usaremos la misma db del proyecto uno.

-- Tablas de dimensiones:

CREATE TABLE IF NOT EXISTS dim_cliente (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    email VARCHAR(30),
    telefono VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS dim_producto (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(500),
    precio DECIMAL(10,2),
    stock INT
);

-- CREATE TABLE IF NOT EXISTS dim_tiempo (
--     tiempo_id INT PRIMARY KEY AUTO_INCREMENT,
--     fecha DATE,
--     anio INT,
--     mes INT,
--     dia INT
-- );

CREATE TABLE IF NOT EXISTS dim_empleado (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    puesto VARCHAR(30)
);

-- Tablas de hechos:

CREATE TABLE IF NOT EXISTS hecho_venta (
    venta_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    producto_id INT,
    tiempo_id DATE,
    empleado_id INT,
    cantidad INT,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES dim_cliente(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES dim_producto(producto_id),
    FOREIGN KEY (empleado_id) REFERENCES dim_empleado(empleado_id)
);

-- INSERT INTO dim_cliente (nombre, email, telefono)
-- SELECT DISTINCT nombre, email, telefono
-- FROM cliente;

-- INSERT INTO dim_producto (nombre, precio, stock)
-- SELECT DISTINCT nombre, precio, stock
-- FROM producto;

-- INSERT INTO dim_empleado (nombre, puesto)
-- SELECT DISTINCT nombre, puesto
-- FROM empleado;

-- INSERT INTO hecho_venta (cliente_id, producto_id, tiempo_id, empleado_id, cantidad, total)
-- SELECT
--     v.cliente_id,
--     dv.producto_id,
--     v.fecha,
--     v.empleado_id,
--     dv.cantidad,
--     dv.cantidad * dv.precio_unitario AS total
-- FROM venta v
-- JOIN detalle_venta dv ON dv.venta_id = v.venta_id;

-- Producto mas vendido:

SELECT dp.nombre, SUM(hv.producto_id)
FROM dim_producto dp
JOIN hecho_venta hv ON hv.producto_id = dp.producto_id
GROUP BY dp.nombre
LIMIT 1;

-- Cliente con mas compras:

SELECT dc.nombre, SUM(hv.cantidad)
FROM dim_cliente dc
JOIN hecho_venta hv ON hv.cliente_id = dc.cliente_id
GROUP BY dc.nombre
LIMIT 1;
