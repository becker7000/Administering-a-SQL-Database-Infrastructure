-- Seleccionando los primeros 8 productos
SELECT TOP 8 p.ProductID, p.Name, p.Color
FROM SalesLT.Product p;

-- Productos sin ventas registradas
SELECT p.ProductID, p.Name, sod.OrderQty
FROM SalesLT.Product p
LEFT JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE sod.ProductID IS NULL;

-- Orden promedio de compra por año
SELECT YEAR(OrderDate) AS Year, AVG(TotalDue) AS AvgOrderAmount
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY Year;

-- Insertando datos en la BD
INSERT INTO SalesLT.ProductCategory (Name, rowguid, ModifiedDate)
VALUES ('Electric Accessories',NEWID(),GETDATE());

-- Revisamos los cambios
SELECT *
FROM SalesLT.ProductCategory;

-- Luego eliminarlo
DELETE FROM SalesLT.ProductCategory
WHERE Name = 'Electric Accessories';
