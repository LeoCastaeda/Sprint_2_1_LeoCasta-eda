-- Consultar cuántos productos de tipo "Bebidas" se han vendido en una determinada localidad
SELECT 
    SUM(pp.Cantidad) AS Total_Vendido
FROM 
    pedido_producto pp
JOIN 
    pedido p ON pp.ID_Pedido = p.ID_Pedido
JOIN 
    cliente c ON p.ID_Cliente = c.ID_Cliente
WHERE 
    pp.ID_Producto IN (SELECT ID_Producto FROM producto WHERE Tipo_De_Producto = 'Bebida')
    AND c.Localidad = 'NombreDeLaLocalidad';  -- Reemplaza 'NombreDeLaLocalidad' con la localidad deseada

-- Consultar cuántas órdenes ha efectuado un determinado empleado/a
SELECT 
    e.Nombre, 
    e.Apellidos, 
    COUNT(p.ID_Pedido) AS Total_Pedidos
FROM 
    empleado e
LEFT JOIN 
    pedido p ON e.ID_Empleado = p.ID_Empleado
WHERE 
    e.ID_Empleado = 1  -- Reemplaza '1' con el ID del empleado deseado
GROUP BY 
    e.ID_Empleado;
