-- Ver todas las tablas
SELECT * 
FROM sys.tables;

-- Consultar clientes
SELECT CustomerID, FirstName, LastName, EmailAddress
FROM SalesLT.Customer;

-- Productos
SELECT ProductID, Name, Color, ListPrice
FROM SalesLT.Product;

-- Pedidos con su cliente (JOIN)
SELECT 
    soh.SalesOrderID,
    c.FirstName,
    c.LastName,
    soh.OrderDate,
    soh.TotalDue
FROM SalesLT.SalesOrderHeader AS soh
JOIN SalesLT.Customer AS c
    ON soh.CustomerID = c.CustomerID;

-- Top 10 productos más caros
SELECT TOP 10 Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;

-- Cantidad de productos por categoría
SELECT 
    pc.Name AS Category,
    COUNT(p.ProductID) AS TotalProductos
FROM SalesLT.ProductCategory pc
JOIN SalesLT.Product p ON pc.ProductCategoryID = p.ProductCategoryID
GROUP BY pc.Name;

-- Confirmar conexión y estado del servidor
SELECT @@VERSION AS Version, DB_NAME() AS BaseDeDatosActual;
