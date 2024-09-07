-- Consultas SQL

-- a) Insertar, Modificar y Eliminar un Proveedor, Compra y Detalle Compra (DetCompra):

-- Insertar Proveedor:
INSERT INTO Proveedores (ID_Proveedor, Nombre, Dirección, Teléfono) 
VALUES (1, 'Proveedor A', 'Calle Falsa 123', '555-1234');

-- Modificar Proveedor:
UPDATE Proveedores 
SET Nombre = 'Proveedor B', Dirección = 'Avenida Siempre Viva 742' 
WHERE ID_Proveedor = 1;

-- Eliminar Proveedor:
DELETE FROM Proveedores 
WHERE ID_Proveedor = 1;

-- Insertar Compra:
INSERT INTO Compras (ID_Compra, ID_Proveedor, Fecha, Total) 
VALUES (1, 1, '2024-08-25', 1000.00);

-- Modificar Compra:
UPDATE Compras 
SET Total = 1100.00 
WHERE ID_Compra = 1;

-- Eliminar Compra:
DELETE FROM Compras 
WHERE ID_Compra = 1;

-- Insertar Detalle Compra:
INSERT INTO DetCompra (ID_Compra, ID_Producto, Cantidad, Precio_Unitario) 
VALUES (1, 101, 5, 200.00);

-- Modificar Detalle Compra:
UPDATE DetCompra 
SET Cantidad = 6 
WHERE ID_Compra = 1 AND ID_Producto = 101;

-- Eliminar Detalle Compra:
DELETE FROM DetCompra 
WHERE ID_Compra = 1 AND ID_Producto = 101;

-- b) Listar todas las compras con los datos del cliente dado un año y mes:
SELECT c.ID_Compra, c.Fecha, c.Total, cl.Nombre 
FROM Compras c
JOIN Clientes cl ON c.ID_Cliente = cl.ID_Cliente 
WHERE YEAR(c.Fecha) = 2024 AND MONTH(c.Fecha) = 8;

-- c) Listar Número, Fecha y Total de todas las compras y ventas:
SELECT 'Compra' AS Tipo, ID_Compra AS Número, Fecha, Total 
FROM Compras 
UNION 
SELECT 'Venta', ID_Venta, Fecha, Total 
FROM Ventas;

-- d) Listar todas las producciones del año 2020 que contengan las 5 cecinas más vendidas:
SELECT p.ID_Produccion, p.Fecha 
FROM Producciones p
JOIN DetalleProduccion dp ON p.ID_Produccion = dp.ID_Produccion
WHERE YEAR(p.Fecha) = 2020 
AND dp.ID_Producto IN (
    SELECT dv.ID_Producto 
    FROM Ventas v
    JOIN DetalleVenta dv ON v.ID_Venta = dv.ID_Venta
    WHERE dv.Categoria = 'Cecina'
    GROUP BY dv.ID_Producto 
    ORDER BY SUM(dv.Cantidad) DESC
    LIMIT 5
);