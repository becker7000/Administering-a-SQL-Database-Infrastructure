
---

> # *Comandos para probar la conexión a un servidor local (On-premise) SQL Server desde la SQLCMD en WSL.*

# **1. Mostrar la versión del servidor**

```sql
SELECT @@VERSION;
GO
```

---

# **2. Mostrar todas las bases de datos**

```sql
SELECT name FROM sys.databases;
GO
```

---

# **3. Crear una base de datos de prueba**

```sql
CREATE DATABASE PruebaWSL;
GO
```

Confirmar que se creó:

```sql
SELECT name 
FROM sys.databases 
WHERE name = 'PruebaWSL';
GO
```

---

# **4. Usar la base de datos**

```sql
USE PruebaWSL;
GO
```

---

# **5. Crear una tabla**

```sql
CREATE TABLE Personas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Edad INT
);
GO
```

---

# **6. Insertar datos**

```sql
INSERT INTO Personas (Nombre, Edad)
VALUES ('Carlos', 30),
       ('María', 24),
       ('Juan', 40);
GO
```

---

# **7. Consultar la tabla**

```sql
SELECT * FROM Personas;
GO
```

---

# **8. Actualizar datos**

```sql
UPDATE Personas
SET Edad = 35
WHERE Nombre = 'Carlos';
GO
```

---

# **9. Eliminar un registro**

```sql
DELETE FROM Personas
WHERE Nombre = 'Juan';
GO
```

---

# **10. Eliminar la base de datos de prueba**

Salir primero de la BD:

```sql
USE master;
GO
```

Eliminar:

```sql
DROP DATABASE PruebaWSL;
GO
```

---
