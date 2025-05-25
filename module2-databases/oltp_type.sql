-- SELECT * FROM empleados;

-- UPDATE empleados
-- SET salario = 5000.50
-- WHERE nombre = 'Ana Pérez';

-- DELETE
-- FROM empleados
-- WHERE nombre = 'Marta Ríos';

-- CREATE TABLE IF NOT EXISTS departamentos (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     nombre VARCHAR(50) NOT NULL
--     );

-- INSERT INTO departamentos (nombre)
-- VALUES
-- ('Analisis de Datos'),
-- ('Ingenieria'),
-- ('Gerencia');

-- ALTER TABLE empleados
-- ADD COLUMN departamento_id INT;

-- ALTER TABLE empleados
-- ADD FOREIGN KEY(departamento_id) REFERENCES departamentos(id);

-- UPDATE empleados
-- SET departamento_id = 3
-- WHERE puesto = 'CEO';

-- SELECT empleados.nombre, puesto, salario, departamentos.nombre AS departamento_tipo
-- FROM empleados
-- JOIN departamentos ON departamentos.id = empleados.departamento_id;