 -- MySQL dump para la base de datos Cul d'Ampolla


-- Estructura de la tabla `direccion`
DROP TABLE IF EXISTS `direccion`;
CREATE TABLE `direccion` (
  `ID_Direccion` int(11) NOT NULL AUTO_INCREMENT,
  `Calle` varchar(100) DEFAULT NULL,
  `Numero` varchar(45) DEFAULT NULL,
  `Piso` varchar(20) DEFAULT NULL,
  `Puerta` varchar(10) DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `Codigo_Postal` varchar(45) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Direccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserción de datos en la tabla `direccion`
INSERT INTO `direccion` (`ID_Direccion`, `Calle`, `Numero`, `Piso`, `Puerta`, `Ciudad`, `Codigo_Postal`, `Pais`) VALUES
(1, 'Calle Mayor', '10', '2', 'A', 'Barcelona', '08001', 'España'),
(2, 'Avenida Diagonal', '500', '', '', 'Barcelona', '08029', 'España'),
(3, 'Calle de la Paz', '15', '1', 'B', 'Madrid', '28001', 'España'),
(4, 'Calle Gran Vía', '25', '', '', 'Madrid', '28013', 'España'),
(5, 'Calle San Juan', '35', '3', 'C', 'Valencia', '46001', 'España');

-- Estructura de la tabla `cliente`
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `ID_Direccion` int(11) NOT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Fecha_Registro` date DEFAULT NULL,
  `ID_Cliente_Referido` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`),
  KEY `Fk_ID_Direccion` (`ID_Direccion`),
  CONSTRAINT `Fk_ID_Direccion` FOREIGN KEY (`ID_Direccion`) REFERENCES `direccion` (`ID_Direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserción de datos en la tabla `cliente`
INSERT INTO `cliente` (`ID_Cliente`, `Nombre`, `ID_Direccion`, `Telefono`, `Correo_Electronico`, `Fecha_Registro`, `ID_Cliente_Referido`) VALUES
(1, 'Leonardo Castañeda', 1, '123456789', 'leonardo@example.com', '2023-01-15', NULL),
(2, 'Maria Pérez', 2, '987654321', 'maria.perez@example.com', '2023-02-20', 1),
(3, 'Carlos López', 3, '555555555', 'carlos.lopez@example.com', '2023-03-25', NULL);

-- Estructura de la tabla `empleado`
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserción de datos en la tabla `empleado`
INSERT INTO `empleado` (`ID_Empleado`, `Nombre`, `Telefono`, `Correo_Electronico`) VALUES
(1, 'Ana Martínez', '666123456', 'ana.martinez@example.com'),
(2, 'Pedro Gómez', '666987654', 'pedro.gomez@example.com');

-- Estructura de la tabla `gafas`
DROP TABLE IF EXISTS `gafas`;
CREATE TABLE `gafas` (
  `ID_Gafas` int(11) NOT NULL AUTO_INCREMENT,
  `Marca` varchar(100) NOT NULL,
  `Graduacion_Ojo_Derecho` decimal(4,2) DEFAULT NULL,
  `Graduacion_Ojo_Izquierdo` decimal(4,2) DEFAULT NULL,
  `Tipo_De_Montura` enum('flotante','pasta','metálica') DEFAULT NULL,
  `Color_Montura` varchar(50) DEFAULT NULL,
  `Color_Cristal_Derecho` varchar(50) DEFAULT NULL,
  `Color_Cristal_Izquierdo` varchar(50) DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `fk_Gafas_Proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Gafas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserción de datos en la tabla `gafas`
INSERT INTO `gafas` (`ID_Gafas`, `Marca`, `Graduacion_Ojo_Derecho`, `Graduacion_Ojo_Izquierdo`, `Tipo_De_Montura`, `Color_Montura`, `Color_Cristal_Derecho`, `Color_Cristal_Izquierdo`, `Precio`, `fk_Gafas_Proveedor`) VALUES
(1, 'Ray-Ban', 0.00, 0.00, 'metálica', 'negra', 'verde', 'verde', 150.00, NULL),
(2, 'Oakley', 0.25, 0.50, 'pasta', 'blanca', 'azul', 'azul', 120.00, NULL),
(3, 'Persol', 0.75, 0.75, 'flotante', 'marrón', 'gris', 'gris', 200.00, NULL);

-- Estructura de la tabla `proveedor`
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `ID_Direccion` int(11) NOT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Fax` varchar(25) DEFAULT NULL,
  `NIF` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor`),
  UNIQUE KEY `NIF_UNIQUE` (`NIF`),
  KEY `ID_Direccion` (`ID_Direccion`),
  CONSTRAINT `ID_Direccion` FOREIGN KEY (`ID_Direccion`) REFERENCES `direccion` (`ID_Direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserción de datos en la tabla `proveedor`
INSERT INTO `proveedor` (`ID_Proveedor`, `Nombre`, `ID_Direccion`, `Telefono`, `Fax`, `NIF`) VALUES
(1, 'Proveedor A', 1, '123456789', '987654321', 'NIF001'),
(2, 'Proveedor B', 2, '555555555', '555555555', 'NIF002');

-- Estructura de la tabla `venta`
DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta` (
  `ID_Venta` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Venta` date NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Empleado` int(11) DEFAULT NULL,
  `Periodo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Venta`),
  KEY `Fk_ID_Cliente` (`ID_Cliente`),
  KEY `Fk_ID_Empleado` (`ID_Empleado`),
  CONSTRAINT `Fk_ID_Cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_ID_Empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserción de datos en la tabla `venta`
INSERT INTO `venta` (`ID_Venta`, `Fecha_Venta`, `ID_Cliente`, `ID_Empleado`, `Periodo`) VALUES
(1, '2023-01-20', 1, 1, 'Enero 2023'),
(2, '2023-02-15', 2, 2, 'Febrero 2023'),
(3, '2023-03-10', 3, 1, 'Marzo 2023');

-- Estructura de la tabla `detalle_venta`
DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE `detalle_venta` (
  `ID_Detalle_Venta` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Venta` int(11) DEFAULT NULL,
  `ID_Gafas` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle_Venta`),
  KEY `ID_Ventas` (`ID_Venta`),
  KEY `ID_Gafas` (`ID_Gafas`),
  CONSTRAINT `ID_Ventas` FOREIGN KEY (`ID_Venta`) REFERENCES `venta` (`ID_Venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_Gafas` FOREIGN KEY (`ID_Gafas`) REFERENCES `gafas` (`ID_Gafas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserción de datos en la tabla `detalle_venta`
INSERT INTO `detalle_venta` (`ID_Detalle_Venta`, `ID_Venta`, `ID_Gafas`, `Cantidad`, `Precio_Unitario`) VALUES
(1, 1, 1, 1, 150.00),
(2, 2, 2, 2, 120.00),
(3, 3, 3, 1, 200.00);

