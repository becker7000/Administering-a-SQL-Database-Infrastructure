
---

# **1. Crear la base de datos**

```sql
CREATE DATABASE autosdb;
USE autosdb;
```

---

# **2. Crear tablas principales**

### **Tabla: marcas**

```sql
CREATE TABLE marcas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(100)
);
```

### **Tabla: modelos**

```sql
CREATE TABLE modelos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    marca_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    anio INT,
    tipo VARCHAR(50),
    precio DECIMAL(10,2),
    FOREIGN KEY (marca_id) REFERENCES marcas(id)
);
```

---

# **3. Insertar datos de ejemplo**

### **Marcas**

```sql
INSERT INTO marcas (nombre, pais_origen)
VALUES 
  ('Toyota', 'Japón'),
  ('Ford', 'Estados Unidos'),
  ('BMW', 'Alemania'),
  ('Kia', 'Corea del Sur');
```

### **Modelos**

```sql
INSERT INTO modelos (marca_id, nombre, anio, tipo, precio)
VALUES
  (1, 'Corolla', 2022, 'Sedan', 25000),
  (1, 'RAV4', 2023, 'SUV', 35000),
  (2, 'Mustang', 2021, 'Deportivo', 55000),
  (2, 'F-150', 2023, 'Pickup', 45000),
  (3, 'Serie 3', 2022, 'Sedan', 48000),
  (4, 'Sportage', 2023, 'SUV', 30000);
```

---

# **4. Consultas básicas**

### **Listar todas las marcas**

```sql
SELECT * FROM marcas;
```

### **Listar todos los modelos**

```sql
SELECT * FROM modelos;
```

### **Filtrar por año**

```sql
SELECT nombre, anio, tipo 
FROM modelos 
WHERE anio >= 2022;
```

---

# **5. Consultas con JOIN (muy típicas en bases reales)**

### **Modelos con el nombre de la marca**

```sql
SELECT 
    m.nombre AS modelo,
    m.anio,
    m.tipo,
    m.precio,
    ma.nombre AS marca
FROM modelos m
JOIN marcas ma ON m.marca_id = ma.id;
```

### **Modelos SUV con precio menor a 40,000**

```sql
SELECT m.nombre AS modelo, m.precio, ma.nombre AS marca
FROM modelos m
JOIN marcas ma ON m.marca_id = ma.id
WHERE m.tipo = 'SUV' AND m.precio < 40000;
```

---

# **6. Consultas avanzadas**

### **Precio promedio por marca**

```sql
SELECT 
    ma.nombre AS marca,
    AVG(m.precio) AS precio_promedio
FROM modelos m
JOIN marcas ma ON m.marca_id = ma.id
GROUP BY ma.nombre;
```

### **Contar cuántos modelos tiene cada marca**

```sql
SELECT 
    ma.nombre AS marca,
    COUNT(m.id) AS total_modelos
FROM marcas ma
LEFT JOIN modelos m ON ma.id = m.marca_id
GROUP BY ma.nombre;
```

### **Modelos más caros**

```sql
SELECT nombre, precio
FROM modelos
ORDER BY precio DESC
LIMIT 3;
```

---

# **7. Actualizaciones y eliminaciones**

### **Actualizar precio de un modelo**

```sql
UPDATE modelos 
SET precio = 36000 
WHERE nombre = 'RAV4';
```

### **Eliminar un modelo**

```sql
DELETE FROM modelos 
WHERE nombre = 'F-150';
```

---

# **8. Consultas útiles para mantenimiento**

### **Ver tamaño de la base**

```sql
SELECT 
    table_schema AS base,
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS tamano_MB
FROM information_schema.tables
WHERE table_schema = 'autosdb';
```

### **Listar tablas**

```sql
SHOW TABLES;
```
