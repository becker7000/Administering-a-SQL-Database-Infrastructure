
-- HACER LAS SIGUIENTES CONSULTAS DESDE SQL SERVER MANAGEMENT STUDIO

-- Seleccionando todos los clientes:
SELECT *
FROM SalesLT.Customer;

-- Top 10 productos más caros:
SELECT TOP 10 ProductID, Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;

-- Buscar clientes cuyo apellido empieza con A y ordenarlos por nombre:
SELECT CustomerID, FirstName, LastName, EmailAddress
FROM SalesLT.Customer
WHERE LastName LIKE 'A%'
ORDER BY FirstName;

-- Contando cuantos productos hay por categoría
SELECT pc.Name AS Category, COUNT(p.ProductID) AS TotalProducts
FROM SalesLT.ProductCategory pc
JOIN SalesLT.Product p ON p.ProductCategoryID  = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY TotalProducts DESC;

-- HACER LAS SIGUIENTES CONSULTAS EN EL EDITOR DE CONSULTAS DE AZURE 

-- Total de ventas por cliente (sumatoria del monto ordenado)
SELECT c.CustomerID, c.FirstName+' '+c.LastName AS CustomerName,
	   SUM(soh.TotalDue) AS TotalSpent
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- Obtener los 5 productos más vendidos (por cantidad)
-- Qty (Quantity)
SELECT TOP 5 p.Name, SUM(sod.OrderQty) AS TotalQtySold
FROM SalesLT.SalesOrderDetail sod
JOIN SalesLT.Product p ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY TotalQtySold DESC;
-- GUARDAR CONSULTA: Guardar consulta
-- GUARDAR RESULTADOS: Exportar datos como: .json
