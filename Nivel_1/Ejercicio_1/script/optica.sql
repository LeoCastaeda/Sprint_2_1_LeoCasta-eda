-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: optica
-- ------------------------------------------------------
-- Server version	5.7.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Calle` varchar(100) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `Piso` varchar(10) DEFAULT NULL,
  `Puerta` varchar(10) DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `Codigo_Postal` varchar(10) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Fecha_Registro` date DEFAULT NULL,
  `ID_Cliente_Referido` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Cliente`),
  KEY `FK_Cliente_Referido` (`ID_Cliente_Referido`),
  CONSTRAINT `FK_Cliente_Referido` FOREIGN KEY (`ID_Cliente_Referido`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Pérez','Calle del Sol','20','1','A','Madrid','28001','España','612345678','juan.perez@example.com','2024-01-01',NULL),(2,'Ana Gómez','Avenida del Mar','10','2','B','Barcelona','08002','España','623456789','ana.gomez@example.com','2024-02-01',1),(3,'Carlos Ruiz','Calle de la Luna','30','3','C','Valencia','46001','España','634567890','carlos.ruiz@example.com','2024-03-01',2);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `ID_Detalle_Venta` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Venta` int(11) DEFAULT NULL,
  `ID_Gafas` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_Unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Detalle_Venta`),
  KEY `FK_Detalle_Venta` (`ID_Venta`),
  KEY `FK_Detalle_Gafas` (`ID_Gafas`),
  CONSTRAINT `FK_Detalle_Gafas` FOREIGN KEY (`ID_Gafas`) REFERENCES `gafas` (`ID_Gafas`) ON DELETE NO ACTION,
  CONSTRAINT `FK_Detalle_Venta` FOREIGN KEY (`ID_Venta`) REFERENCES `venta` (`ID_Venta`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,1,120.00),(2,2,2,2,150.00),(3,3,3,1,200.00);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `ID_Empleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'María López','645678901','maria.lopez@example.com'),(2,'Pedro Martínez','656789012','pedro.martinez@example.com'),(3,'Lucía Fernández','667890123','lucia.fernandez@example.com');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafas`
--

DROP TABLE IF EXISTS `gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  `fk_Proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Gafas`),
  KEY `FK_Proveedor_Gafas` (`fk_Proveedor`),
  CONSTRAINT `FK_Proveedor_Gafas` FOREIGN KEY (`fk_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafas`
--

LOCK TABLES `gafas` WRITE;
/*!40000 ALTER TABLE `gafas` DISABLE KEYS */;
INSERT INTO `gafas` VALUES (1,'Ray-Ban',1.00,1.25,'metálica','Negro','Verde','Verde',120.00,1),(2,'Oakley',0.50,0.75,'pasta','Rojo','Azul','Azul',150.00,2),(3,'Dior',2.00,2.00,'flotante','Transparente','Gris','Gris',200.00,3);
/*!40000 ALTER TABLE `gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Calle` varchar(100) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `Piso` varchar(10) DEFAULT NULL,
  `Puerta` varchar(10) DEFAULT NULL,
  `Ciudad` varchar(45) DEFAULT NULL,
  `Codigo_Postal` varchar(10) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Fax` varchar(25) DEFAULT NULL,
  `NIF` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor`),
  UNIQUE KEY `NIF` (`NIF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Óptica Lux','Calle Mayor','10','1','A','Madrid','28001','España','912345678','912345679','A12345678'),(2,'Visión Perfecta','Avenida de la Paz','25','2','B','Barcelona','08002','España','934567890','934567891','B23456789'),(3,'Lentes y Más','Calle de la Luz','15','3','C','Valencia','46001','España','961234567','961234568','C34567890');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `ID_Venta` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Venta` date NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Empleado` int(11) DEFAULT NULL,
  `Periodo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Venta`),
  KEY `FK_Venta_Cliente` (`ID_Cliente`),
  KEY `FK_Venta_Empleado` (`ID_Empleado`),
  CONSTRAINT `FK_Venta_Cliente` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`) ON DELETE NO ACTION,
  CONSTRAINT `FK_Venta_Empleado` FOREIGN KEY (`ID_Empleado`) REFERENCES `empleado` (`ID_Empleado`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2024-01-15',1,1,'Enero'),(2,'2024-02-20',2,2,'Febrero'),(3,'2024-03-10',3,1,'Marzo');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-07  0:10:36
