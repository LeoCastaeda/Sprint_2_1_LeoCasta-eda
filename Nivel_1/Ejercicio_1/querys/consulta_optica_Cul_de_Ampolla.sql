-- Consultas para la base de datos de la óptica

-- 1. Listar el total de compras de un cliente
SELECT 
    c.Nombre AS Cliente,
    COUNT(dv.ID_Detalle_Venta) AS Total_Compras
FROM 
    cliente c
JOIN 
    venta v ON c.ID_Cliente = v.ID_Cliente
JOIN 
    detalle_venta dv ON v.ID_Venta = dv.ID_Venta
GROUP BY 
    c.ID_Cliente;

-- 2. Listar las diferentes gafas que ha vendido un empleado durante un año
SELECT 
    e.Nombre AS Empleado,
    g.Marca AS Gafas_Vendidas
FROM 
    empleado e
JOIN 
    venta v ON e.ID_Empleado = v.ID_Empleado
JOIN 
    detalle_venta dv ON v.ID_Venta = dv.ID_Venta
JOIN 
    gafas g ON dv.ID_Gafas = g.ID_Gafas
WHERE 
    v.Fecha_Venta BETWEEN '2023-01-01' AND '2023-12-31'  -- Ajusta el año según sea necesario
GROUP BY 
    e.ID_Empleado, g.ID_Gafas;

-- 3. Listar los diferentes proveedores que han suministrado gafas vendidas con éxito
SELECT DISTINCT 
    p.Nombre AS Proveedor
FROM 
    proveedor p
JOIN 
    gafas g ON p.ID_Proveedor = g.fk_Gafas_Proveedor
JOIN 
    detalle_venta dv ON g.ID_Gafas = dv.ID_Gafas
JOIN 
    venta v ON dv.ID_Venta = v.ID_Venta
WHERE 
    dv.Cantidad > 0;  -- Considerando que la venta es exitosa si se ha vendido al menos una unidad
