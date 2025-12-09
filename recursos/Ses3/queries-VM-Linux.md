
---

## 1. Crear una base de datos

```sql
CREATE DATABASE InventarioDB;
GO

-- Comprobar:
SELECT name
FROM sys.database;

-- Ajustar:
USE InventarioDB;
GO

```

---

## 2. Crear una tabla (ejemplo: Productos)

```sql
USE InventarioDB;
GO

CREATE TABLE Productos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Cantidad INT NOT NULL,
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO
```

---

## 3. Insertar datos (CREATE)

```sql
INSERT INTO Productos (Nombre, Precio, Cantidad)
VALUES ('Laptop Lenovo', 15000.00, 10),
       ('Mouse Logitech', 350.00, 50);
GO
```

---

## 4. Consultar datos (READ)

```sql
SELECT * FROM Productos;
GO
```

---

## 5. Actualizar y eliminar datos (UPDATE / DELETE)

### Actualizar:

```sql
UPDATE Productos
SET Precio = 16000.00
WHERE Id = 1;
GO
```

### Eliminar:

```sql
DELETE FROM Productos
WHERE Id = 2;
GO
```

---

