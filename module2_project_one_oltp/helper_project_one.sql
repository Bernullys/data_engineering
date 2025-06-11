-- CREATE DATABASE oltp_project_db;

-- USE oltp_project_db;

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

-- ALTER TABLE venta
-- ADD COLUMN fecha DATE NOT NULL;

-- INSERT INTO venta (cliente_id, empleado_id, fecha)
-- VALUES 
-- (1, 1, '2025-05-10'),
-- (2, 2, '2025-05-11');

-- INSERT INTO detalle_venta (venta_id, producto_id, cantidad, precio_unitario)
-- VALUES 
-- (1, 1, 1, 2400.00), -- Ana compra una laptop
-- (2, 4, 1, 80.00);   -- y Luis un mouse

-- Vamos a simular un pequeño sistema de ventas con un carrito temporal que luego se convierte en una venta con sus respectivos detalles:
-- Simular un flujo de venta:
--      El usuario agrega productos a un "carrito".
--      Se ejecuta un procedimiento que:
--          Crea una venta.
--          Copia los ítems del carrito a detalle_venta.
--          Limpia el carrito.

-- Paso 1: Crear tabla temporal carrito:
CREATE TABLE IF NOT EXISTS carrito (
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL
);

-- Paso 2: Insertar productos en el carrito:
INSERT INTO carrito (producto_id, cantidad, precio_unitario)
VALUES
(1, 2, 2400.00),
(3, 1, 1800.00);

-- Paso 3: Crear procedimiento para registrar la venta:
-- Este procedimiento:
--      Recibe el cliente_id y el empleado_id.
--      Crea una nueva venta.
--      Copia los productos del carrito a detalle_venta.
--      Limpia el carrito.

DELIMITER $$

CREATE PROCEDURE procesar_venta(
    IN p_cliente_id INT,
    IN p_empleado_id INT
)
BEGIN
    DECLARE nueva_venta_id INT;

    -- Crear la venta
    INSERT INTO venta (cliente_id, empleado_id, fecha)
    VALUES (p_cliente_id, p_empleado_id, NOW());

    -- Obtener el ID de la venta recién insertada
    SET nueva_venta_id = LAST_INSERT_ID();

    -- Insertar los detalles desde el carrito
    INSERT INTO detalle_venta (venta_id, producto_id, cantidad, precio_unitario)
    SELECT nueva_venta_id, producto_id, cantidad, precio_unitario
    FROM carrito;

    -- Limpiar el carrito
    DELETE FROM carrito;
END $$

DELIMITER ;

-- Paso 4: Ejecutar la venta:
-- Supongamos que el cliente 1 y el empleado 1 están involucrados:
CALL procesar_venta(1, 1);

-- Paso 5: Verificar la venta y los detalles:
SELECT * FROM venta;
SELECT * FROM detalle_venta;


