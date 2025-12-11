-- ======================================================
-- Curso: Optimización de SQL Server
-- Instructor: Erick Álvarez
-- Tema: Introducción a los Planes de Ejecución
-- Descripción: Script de práctica para analizar rendimiento,
--              uso de índices y lectura de planes de ejecución.
-- ======================================================

------------------------------------------------------
-- 1️. Seleccionamos la base de datos de trabajo
------------------------------------------------------
USE WideWorldImporters;   -- Cambia el contexto a la base WideWorldImporters
GO                         -- Separa el lote de instrucciones (obligatorio después de USE)

------------------------------------------------------
-- 2️. Activamos estadísticas de E/S (entrada/salida)
------------------------------------------------------
SET STATISTICS IO ON;      -- Muestra información sobre las lecturas lógicas y físicas 
GO                         -- que realiza cada consulta (útil para analizar rendimiento)

------------------------------------------------------
-- 3️. Consulta de práctica con múltiples INNER JOIN
------------------------------------------------------
SELECT TOP 10000 *          -- Devuelve los primeros 10,000 registros
FROM Application.People p   -- Tabla de personas (alias p)
INNER JOIN Sales.InvoiceLines i  -- Unión con líneas de factura (alias i)
    ON p.PersonID = i.LastEditedBy  -- Relación: persona que editó la línea de factura
INNER JOIN Warehouse.StockItemTransactions s  -- Unión con transacciones de inventario
    ON p.PersonID = s.LastEditedBy            -- Relación: persona que editó la transacción
ORDER BY i.StockItemID;   -- Ordena el resultado por ID de ítem de inventario
-- << EJECUTAR PERO ACTIVANDO UN PLAN DE EJECUCIÓN, 
--    SELECCIONAR Y VER EL TAB PLAN DE EJECUCIÓN >>

GO

------------------------------------------------------
-- Comparación entre subconsultas y agregados directos
------------------------------------------------------

SET STATISTICS IO ON;  -- Activamos nuevamente las estadísticas de E/S para medir eficiencia

-- Ejemplo 1: Dos subconsultas separadas
SELECT 
    (SELECT MAX([OrderDate]) FROM [Sales].[Orders]) AS mx,  -- Máxima fecha de pedido
    (SELECT MIN([BackorderOrderID]) FROM [Sales].[Orders]) AS mn; -- Mínimo ID de pedido pendiente
GO

-- Ejemplo 2: Misma consulta optimizada con funciones agregadas en una sola lectura
SELECT 
    MAX([OrderDate]) AS mx,           -- Máxima fecha de pedido
    MIN([BackorderOrderID]) AS mn     -- Mínimo ID de pedido pendiente
FROM [Sales].[Orders];                -- Fuente: tabla de pedidos
GO

------------------------------------------------------
-- Conclusión:
-- Estas consultas permiten observar cómo cambia el plan de ejecución
-- y el número de lecturas lógicas según el método usado (subconsultas vs agregación directa).
-- Analiza el plan de ejecución estimado o real para ver diferencias de rendimiento.
------------------------------------------------------
