📘 Temas del módulo 2:
¿Qué es y cómo funciona una base de datos?
    Sub Lenguajes SQL: DDL, DML, DCL (con MySQL)
Modelado de bases de datos transaccionales (OLTP)
Modelado de bases de datos analíticas (OLAP)
    Optimización: vistas, procedimientos almacenados, funciones y triggers
Lecturas complementarias:
    Blog: Creación de OLTP en Medium
    Blog: Creación de OLAP en Medium

🧱 Tema 1: ¿Qué es una base de datos y cómo funciona?
📌 Definición
Una base de datos es un sistema organizado para almacenar, gestionar y recuperar datos de manera eficiente.
 Se utiliza en casi todas las aplicaciones modernas: desde redes sociales hasta sistemas bancarios.

🧰 Sistema Gestor de Bases de Datos (DBMS)
Un DBMS (como MySQL, PostgreSQL o SQL Server) es el software que permite:
    Crear bases de datos
    Insertar, consultar, actualizar y eliminar datos
    Controlar permisos de acceso
    Garantizar integridad y seguridad

🧠 Sub-lenguajes SQL
El lenguaje SQL (Structured Query Language) se divide en 3 sub-lenguajes principales:

1. DDL – Data Definition Language
Sirve para definir la estructura de las bases de datos.
📘 Comandos comunes:
CREATE → crea tablas, bases de datos, etc.
ALTER → modifica estructuras
DROP → elimina objetos

Ejemplo:
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

2. DML – Data Manipulation Language
Sirve para manipular datos (insertar, leer, actualizar, borrar).
📘 Comandos comunes:
INSERT → agregar datos
SELECT → consultar datos
UPDATE → modificar datos
DELETE → eliminar datos

Ejemplo:
INSERT INTO usuarios (nombre, email)
VALUES ('Ana Gómez', 'ana@example.com');

3. DCL – Data Control Language
Sirve para controlar permisos y acceso.
📘 Comandos comunes:
GRANT → otorgar permisos
REVOKE → retirar permisos

Ejemplo:
GRANT SELECT, INSERT ON usuarios TO 'usuario_app';

Crear usuario y dar permiso de solo lectura:
CREATE USER 'lector'@'localhost' IDENTIFIED BY 'lectorpwd';
GRANT SELECT ON empresa_db.* TO 'lector'@'localhost';


🔠 ¿Qué significa OLTP?
OLTP = Online Transaction Processing (Procesamiento de Transacciones en Línea)

💡 ¿Qué es OLTP?
Es un tipo de sistema de bases de datos diseñado para gestionar muchas transacciones simples y rápidas en tiempo real, como:

Insertar un nuevo cliente
Actualizar el salario de un empleado
Consultar una factura
Registrar una venta

⚙️ Características de una base de datos OLTP:
Característica	Descripción
🔄 Alta concurrencia	Soporta muchos usuarios simultáneamente
🧾 Transacciones rápidas	Operaciones pequeñas como INSERT, UPDATE, DELETE
🧩 Datos normalizados	Tablas con relaciones bien definidas
💾 Acceso a registros únicos	Consultas enfocadas en pocos registros
💥 Integridad de datos	Altamente consistente, con reglas estrictas

📌 Ejemplos comunes de sistemas OLTP:
Sistemas bancarios
Plataformas de ventas en línea
Aplicaciones de gestión empresarial (ERP)
Sistemas de atención médica


OLAP = Online Analytical Procesing:
🔷 1. ¿Qué es un modelo OLAP?
OLAP está diseñado para consultas analíticas y toma de decisiones, no para transacciones. Se organiza con un modelo de:
    Tabla de hechos: registra eventos cuantificables (por ejemplo, ventas).
    Tablas de dimensiones: describen las entidades de negocio (cliente, producto, tiempo, empleado...).

Entender la diferencia entre OLTP y OLAP es clave para todo ingeniero de datos. Vamos al grano:

| Característica         | **OLTP** (Online Transaction Processing)       | **OLAP** (Online Analytical Processing) |
| ---------------------- | ---------------------------------------------- | --------------------------------------- |
| 🎯 Objetivo principal  | Ejecutar transacciones rápidamente             | Analizar grandes volúmenes de datos     |
| 📊 Tipo de operaciones | `INSERT`, `UPDATE`, `DELETE`, `SELECT` simples | `SELECT` complejos con agregaciones     |
| 👥 Usuarios típicos    | Empleados operativos, usuarios finales         | Analistas, científicos de datos         |
| 💾 Estructura de datos | Altamente normalizada (evita duplicidad)       | Desnormalizada (mejora rendimiento)     |
| ⚡ Velocidad            | Alta velocidad para pocas filas                | Alta velocidad para millones de filas   |
| 🔐 Integridad de datos | Altamente estricta                             | Puede tolerar cierta latencia           |
| 📆 Ejemplo de uso      | Registrar una compra                           | Analizar ventas mensuales por región    |


🧩 Ejemplo sencillo:
OLTP:
-- Registrar una nueva compra
INSERT INTO ventas (cliente_id, fecha, total)
VALUES (123, '2025-05-13', 250.00);

OLAP:
-- Analizar ventas por mes y región
SELECT region, MONTH(fecha) AS mes, SUM(total) AS total_mensual
FROM ventas
JOIN clientes ON ventas.cliente_id = clientes.id
GROUP BY region, MONTH(fecha);

📦 OLAP en la práctica suele trabajar con:
Data Warehouses (Almacenes de datos)
Vistas Materializadas
Cubos OLAP (en herramientas BI)
Datos agregados y resumidos

🧠 ¿Por qué es importante esta diferencia?
Como Data Engineer, tú preparas el camino para ambos:
📥 Conectar y estructurar datos en OLTP
🏗️ Transformarlos y cargarlos en OLAP para análisis


    Optimización: vistas, procedimientos almacenados, funciones y triggers
✅ 1. Vistas
Una vista es una consulta guardada como si fuera una tabla virtual.
✅ 2. Procedimientos almacenados
Son bloques de SQL reutilizables.
✅ 3. Funciones definidas por el usuario (UDF)
✅ 4. Triggers (Disparadores)
Se ejecutan automáticamente cuando ocurre un evento.

Diferencias entre Procedimiento Almacenado y Función Definida por el Usuario:

| Característica                | Procedimiento Almacenado (`PROCEDURE`)                    | Función Definida por el Usuario (`FUNCTION`)      |
| ----------------------------- | --------------------------------------------------------- | ------------------------------------------------- |
| **Propósito principal**       | Ejecutar una serie de acciones                            | Calcular y devolver un valor específico           |
| **Devuelve un valor**         | No necesariamente                                         | **Sí**, siempre devuelve **un solo valor**        |
| **Se usa en sentencias SQL**  | ❌ No se puede usar directamente en una `SELECT`           | ✅ Sí se puede usar en una `SELECT`, `WHERE`, etc. |
| **Parámetros**                | Puede tener **múltiples parámetros** `IN`, `OUT`, `INOUT` | Solo tiene **parámetros de entrada** (`IN`)       |
| **Llamada desde SQL**         | `CALL nombre_procedimiento(...)`                          | Se usa como una función: `SELECT funcion(...)`    |
| **Puede modificar datos**     | ✅ Sí (con `INSERT`, `UPDATE`, `DELETE`)                   | ⚠️ No debería modificar datos (solo calcular)     |
| **Usos típicos**              | Automatizar tareas, procesos complejos                    | Realizar cálculos o transformaciones rápidas      |
| **Puede tener transacciones** | ✅ Sí                                                      | ❌ No                                              |

⚠️ Reglas importantes:
Las funciones deben ser determinísticas (devolver el mismo resultado con los mismos inputs).
Los procedimientos son más flexibles, ideales para lógica compleja y cambios en la base de datos.