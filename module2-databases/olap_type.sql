-- CREATE DATABASE IF NOT EXISTS olap_db;

-- USE olap_db;

-- Tabla única, con datos ya integrados desde otras fuentes (clientes, productos, ventas, etc.)
-- CREATE TABLE IF NOT EXISTS ventas_analiticas (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     fecha DATE NOT NULL,
--     producto VARCHAR(100) NOT NULL,
--     categoria VARCHAR(50) NOT NULL,
--     region VARCHAR(50) NOT NULL,
--     cantidad INT NOT NULL,
--     precio_unitario DECIMAL(10, 2) NOT NULL
-- );

-- INSERT INTO ventas_analiticas (fecha, producto, categoria, region, cantidad, precio_unitario)
-- VALUES 
-- ('2025-01-05', 'Laptop X1', 'Tecnología', 'Norte', 5, 800.00),
-- ('2025-01-07', 'Impresora Z', 'Oficina', 'Sur', 3, 200.00),
-- ('2025-01-09', 'Laptop X1', 'Tecnología', 'Norte', 2, 800.00),
-- ('2025-02-01', 'Silla Ergonómica', 'Oficina', 'Centro', 10, 150.00),
-- ('2025-02-12', 'Laptop X1', 'Tecnología', 'Sur', 1, 800.00),
-- ('2025-03-01', 'Impresora Z', 'Oficina', 'Centro', 4, 200.00);

-- --------- Consultas analíticas típicas ---------
-- 1. Ventas totales por región:
SELECT region, SUM(cantidad * precio_unitario) AS ventas_totales_por_region
FROM ventas_analiticas
GROUP BY region;

-- 2. Total de productos vendidos por categoría:
SELECT categoria, SUM(cantidad) AS productos_vendidos
FROM ventas_analiticas
GROUP BY categoria;

-- 3. Ventas por mes:
SELECT DATE_FORMAT(fecha, '%Y-%m') AS mes , SUM(cantidad*precio_unitario) AS ventas_por_mes
FROM ventas_analiticas
GROUP BY mes;


-- ------------- Ejemplos de Optimización --------------

-- Vistas --
-- Crear una vista de ventas por región
CREATE VIEW ventasxregion AS
SELECT region, SUM(cantidad*precio_unitario) AS ventas
FROM ventas_analiticas
GROUP BY region;
-- Usarla como si fuera una tabla
SELECT * FROM ventasxregion
ORDER BY ventas ASC
LIMIT 2;

-- Procedimientos almacenados --
DELIMITER $$
CREATE PROCEDURE obtener_ventas_por_categoria(IN cat VARCHAR(50))
BEGIN
    SELECT categoria, SUM(cantidad*precio_unitario) AS totalxcategoria
    FROM ventas_analiticas
    WHERE categoria = cat
    GROUP BY categoria;
END $$

DELIMITER ;

-- Ejecutar el procedimiento almacenado:
CALL obtener_ventas_por_categoria('Oficina');
CALL obtener_ventas_por_categoria('Tecnología');

-- Funciones definidas por el usuario (UDF) --
DELIMITER $$

CREATE FUNCTION total_venta(cantidad INT, precio DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN cantidad * precio;
END $$

DELIMITER ;

-- Usarla en una consulta
SELECT producto, total_venta(cantidad, precio_unitario) AS total
FROM ventas_analiticas;


-- Triggers (Disparadores) --
-- Crear tabla de actualización:
CREATE TABLE IF NOT EXISTS cambio_reciente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(50),
    fecha DATETIME
);
-- Crear trigger:
DELIMITER $$
CREATE TRIGGER actualizar_ventas
    AFTER UPDATE ON ventas_analiticas
    FOR EACH ROW
BEGIN
    INSERT INTO cambio_reciente (producto, fecha)
    VALUES (NEW.producto, NOW());
END $$
DELIMITER ;

-- Probar el trigger:
UPDATE ventas_analiticas
SET categoria = 'Nueva tecnologia'
WHERE producto = 'Laptop X1';

-- Verificar la tabla de cambios recientes:
SELECT * FROM cambio_reciente;