# Comandos para la sqlcmd
---

## 1. Listar todos los clientes

```
SELECT CustomerID, FirstName, LastName, EmailAddress
FROM SalesLT.Customer
ORDER BY LastName;
```

## 2. Productos más caros

```
SELECT TOP 10 ProductID, Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;
```

## 3. Productos con sus categorías

```
SELECT p.ProductID, p.Name AS Product, pc.Name AS Category
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID;
```

## 4. Órdenes por cliente (con totales)

```
SELECT 
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    COUNT(o.SalesOrderID) AS Orders,
    SUM(o.TotalDue) AS TotalSpent
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;
```

## 5. Detalle de una orden específica

```
SELECT 
    od.SalesOrderID,
    p.Name,
    od.OrderQty,
    od.UnitPrice,
    od.LineTotal
FROM SalesLT.SalesOrderDetail od
JOIN SalesLT.Product p ON od.ProductID = p.ProductID
WHERE od.SalesOrderID = 71774;
```

## 6. Categorías y cuántos productos contiene cada una

```
SELECT pc.Name AS Category, COUNT(p.ProductID) AS ProductCount
FROM SalesLT.ProductCategory pc
LEFT JOIN SalesLT.Product p ON pc.ProductCategoryID = p.ProductCategoryID
GROUP BY pc.Name
ORDER BY ProductCount DESC;
```

## 7. Órdenes recientes

```
SELECT TOP 20 SalesOrderID, OrderDate, TotalDue
FROM SalesLT.SalesOrderHeader
ORDER BY OrderDate DESC;
```

## 8. Buscar clientes por correo

```
SELECT CustomerID, FirstName, LastName, EmailAddress
FROM SalesLT.Customer
WHERE EmailAddress LIKE '%gmail%';
```

## 9. Clientes y su última orden

```
SELECT 
    c.CustomerID,
    c.FirstName + ' ' + c.LastName AS FullName,
    MAX(o.OrderDate) AS LastOrderDate
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY LastOrderDate DESC;
```

## 10. Productos sin imagen

```
SELECT ProductID, Name, ProductNumber
FROM SalesLT.Product
WHERE ThumbnailPhotoFileName IS NULL;
```

---

# **Comandos generales**

## 11. Ver todas las bases de datos

```
SELECT name 
FROM sys.databases;
```

## 12. Ver todas las tablas de la base actual

```
SELECT name 
FROM sys.tables 
ORDER BY name;
```

## 13. Ver columnas de una tabla

```
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Customer';
```

## 14. Ver usuarios del sistema

```
SELECT name, type_desc 
FROM sys.database_principals
WHERE type IN ('S','E','X');
```

## 15. Ver tamaño de la base de datos

```
SELECT 
    DB_NAME() AS DatabaseName,
    SUM(size) * 8 / 1024 AS SizeMB
FROM sys.master_files
WHERE database_id = DB_ID()
GROUP BY database_id;
```

## 16. Consultas recientes (plans)

```
SELECT TOP 20 
    qs.last_execution_time,
    SUBSTRING(qt.text, 1, 150) AS QueryText
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
ORDER BY qs.last_execution_time DESC;
```

## 17. Ver roles del sistema

```
SELECT * FROM sys.database_role_members;
```

## 18. Crear una vista

```
CREATE VIEW vw_ProductBasic AS
SELECT ProductID, Name, ListPrice FROM SalesLT.Product;
```

## 19. Ver vistas creadas

```
SELECT name FROM sys.views;
```

## 20. Ver procedimientos almacenados

```
SELECT name FROM sys.procedures;
```

---
