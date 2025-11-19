-- Curso Optimización SQL SERVER
-- Instructor: Erick Alvarez
-- Tema: Índices SQL

USE WideWorldImporters
GO

SET STATISTICS IO ON -- Activamos las estaditicas (datos sobre la consulta)
GO

SELECT TOP 10000 * 
FROM Application.People p INNER JOIN 
       Sales.InvoiceLines i ON p.PersonID = i.LastEditedBy INNER JOIN 
       Warehouse.StockItemTransactions s ON p.PersonID = s.LastEditedBy
ORDER BY i.StockItemID
GO
-- Ejecutar este Query e ir a los planes de ejecución para ver las sugerencias
-- Con esta consulta se estan usando aproximadamente 3GB
