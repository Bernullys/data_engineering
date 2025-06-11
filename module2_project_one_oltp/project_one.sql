-- CREATE DATABASE project_one_db;
-- USE project_one_db;

CREATE TABLE IF NOT EXISTS cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(30) UNIQUE,
    telefono VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS empleado (
    empleado_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    puesto VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS producto (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE IF NOT EXISTS venta (
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    empleado_id INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id)
);

CREATE TABLE IF NOT EXISTS detalle_venta (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (venta_id) REFERENCES venta(venta_id),  
    FOREIGN KEY (producto_id) REFERENCES producto(producto_id)
);

-- INSERT INTO cliente (nombre, email, telefono)
-- VALUES
-- ('Ana Torres', 'ana.torres@email.com', '987654321'),
-- ('Luis Gómez', 'luis.gomez@email.com', '956123789'),
-- ('Marcela Díaz', 'marcela.diaz@email.com', '944789321');

-- INSERT INTO empleado (nombre, puesto)
-- VALUES 
-- ('Carlos Ruiz', 'Vendedor'),
-- ('Lucía Herrera', 'Vendedor');

-- INSERT INTO producto (nombre, precio, stock)
-- VALUES 
-- ('Laptop Lenovo', 2400.00, 15),
-- ('Monitor LG 24"', 750.00, 30),
-- ('Teclado Mecánico', 120.00, 50),
-- ('Mouse Inalámbrico', 80.00, 70);


-- INSERT INTO venta (cliente_id, empleado_id, fecha)
-- VALUES 
-- (1, 1, '2025-05-10'),
-- (2, 2, '2025-05-11');

-- INSERT INTO detalle_venta (venta_id, producto_id, cantidad, precio_unitario)
-- VALUES 
-- (1, 1, 1, 2400.00), -- Ana compra una laptop
-- (1, 2, 1, 750.00), -- Ana compra un monitor
-- (2, 4, 1, 80.00);   -- Luis compro un mouse

-- ---------------- Crear una vista -----------------------------------
-- CREATE VIEW productos_x_clientes AS
-- SELECT
--     cliente.nombre AS nombre_cliente,
--     producto.nombre AS nombre_producto,
--     detalle_venta.cantidad AS cantidades
-- FROM venta
-- JOIN detalle_venta ON detalle_venta.venta_id = venta.venta_id
-- JOIN cliente ON cliente.cliente_id = venta.cliente_id
-- JOIN producto ON producto.producto_id = detalle_venta.producto_id;

SELECT * FROM productos_x_clientes;

-- ---------------- Crear procedimiento almacenado ---------------------
-- DELIMITER $$
-- CREATE PROCEDURE nueva_venta (
--     IN in_cliente_id INT,
--     IN in_empleado_id INT,
--     IN in_producto_id INT,
--     IN in_cantidad INT,
--     IN in_precio_unitario DECIMAL(10, 2)
-- )
-- BEGIN
--     DECLARE nueva_venta_id INT;

--     INSERT INTO venta(cliente_id, empleado_id, fecha)
--     VALUES (in_cliente_id, in_empleado_id, NOW());

--     SET nueva_venta_id = LAST_INSERT_ID();

--     INSERT INTO detalle_venta(venta_id, producto_id, cantidad, precio_unitario)
--     VALUES (nueva_venta_id, in_producto_id, in_cantidad, in_precio_unitario);

--     UPDATE producto
--     SET stock = stock - in_cantidad
--     WHERE producto_id = in_producto_id;

-- END $$

-- DELIMITER ;

CALL nueva_venta(1, 1, 1, 1, 2400.00);

-- ---------------- Crear un trigger ----------------------------------
-- Cada vez que se haga una nueva_venta, almacenar en una tabla nueva el empleado que la realizo

CREATE TABLE IF NOT EXISTS venta_x_empleado (
    venta_x_empleado_id INT AUTO_INCREMENT PRIMARY KEY,
    empleado_id INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id)
);

-- DELIMITER $$
-- CREATE TRIGGER actualizar_vxe
--     AFTER INSERT ON venta
--     FOR EACH ROW
-- BEGIN
--     INSERT INTO venta_x_empleado(empleado_id, fecha)
--     VALUES (NEW.empleado_id, NEW.fecha);
-- END $$
-- DELIMITER ;

SELECT * FROM venta_x_empleado;

SELECT * FROM venta;