-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: spotify
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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `ID_Album` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `anio_publicacion` varchar(45) NOT NULL,
  `portada` varchar(255) NOT NULL,
  `ID_Artista` int(11) NOT NULL,
  PRIMARY KEY (`ID_Album`),
  KEY `ID_Artista_idx` (`ID_Artista`),
  CONSTRAINT `ID_Artista` FOREIGN KEY (`ID_Artista`) REFERENCES `artista` (`ID_Artista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
INSERT INTO `album` VALUES (1,'Despierta','2021','despierta_portada.jpg',1),(2,'Ecos del silencio','2019','ecos_silencio.jpg',2),(3,'Entre sombras','2020','entre_sombras.jpg',3),(4,'El viaje','2022','el_viaje_portada.jpg',4);
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
CREATE TABLE `artista` (
  `ID_Artista` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Artista`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
INSERT INTO `artista` VALUES (1,'Santiago Ramos','santiago_ramos.jpg'),(2,'Elena Ruiz','elena_ruiz.jpg'),(3,'Los Caminantes','los_caminantes.jpg'),(4,'Manuela Soto','manuela_soto.jpg');
UNLOCK TABLES;

--
-- Table structure for table `artistas_relacionados`
--

DROP TABLE IF EXISTS `artistas_relacionados`;
CREATE TABLE `artistas_relacionados` (
  `ID_Artistas_Relacionados` int(11) NOT NULL,
  `ID_Artista` int(11) NOT NULL,
  PRIMARY KEY (`ID_Artistas_Relacionados`),
  KEY `ID_Artista_idx` (`ID_Artista`),
  CONSTRAINT `ID_Artista` FOREIGN KEY (`ID_Artista`) REFERENCES `artista` (`ID_Artista`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artistas_relacionados`
--

LOCK TABLES `artistas_relacionados` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
CREATE TABLE `cancion` (
  `ID_Cancion` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `duracion` varchar(255) NOT NULL,
  `reproducciones` int(11) NOT NULL DEFAULT '0',
  `ID_Album` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cancion`),
  KEY `ID_album_idx` (`ID_Album`),
  CONSTRAINT `ID_album` FOREIGN KEY (`ID_Album`) REFERENCES `album` (`ID_Album`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cancion`
--

LOCK TABLES `cancion` WRITE;
INSERT INTO `cancion` VALUES (1,'Volar lejos','3:45',2500,1),(2,'Sonido del mar','4:15',5000,2),(3,'Silencio profundo','2:50',1200,3),(4,'Caminos cruzados','3:10',8000,4);
UNLOCK TABLES;

--
-- Table structure for table `favorita_cancion`
--

DROP TABLE IF EXISTS `favorita_cancion`;
CREATE TABLE `favorita_cancion` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Cancion` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`,`ID_Cancion`),
  KEY `ID_Cancion_idx` (`ID_Cancion`),
  CONSTRAINT `ID_Cancion` FOREIGN KEY (`ID_Cancion`) REFERENCES `cancion` (`ID_Cancion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `favorita_cancion_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorita_cancion`
--

LOCK TABLES `favorita_cancion` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `favorito_album`
--

DROP TABLE IF EXISTS `favorito_album`;
CREATE TABLE `favorito_album` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Album` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`,`ID_Album`),
  KEY `ID_Album` (`ID_Album`),
  CONSTRAINT `favorito_album_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `favorito_album_ibfk_2` FOREIGN KEY (`ID_Album`) REFERENCES `album` (`ID_Album`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorito_album`
--

LOCK TABLES `favorito_album` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago` (
  `ID_Pago` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Subscripcion` int(11) NOT NULL,
  `Fecha_Pago` date NOT NULL,
  `Numero_Orden` varchar(255) NOT NULL,
  `Total` decimal(9,2) NOT NULL,
  PRIMARY KEY (`ID_Pago`),
  UNIQUE KEY `Numero_Orden_UNIQUE` (`Numero_Orden`),
  KEY `ID_Subscripcion` (`ID_Subscripcion`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`ID_Subscripcion`) REFERENCES `subscripcion` (`ID_Subscripcion`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
CREATE TABLE `playlist` (
  `ID_Playlist` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Usuario` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Numero_Canciones` int(11) NOT NULL DEFAULT '0',
  `Fecha_Creacion` date NOT NULL,
  `Estado` enum('Activa','Eliminada') NOT NULL,
  `Fecha_Eliminacion` date DEFAULT NULL,
  PRIMARY KEY (`ID_Playlist`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `playlist_compartida`
--

DROP TABLE IF EXISTS `playlist_compartida`;
CREATE TABLE `playlist_compartida` (
  `ID_Playlist` int(11) NOT NULL,
  `ID_Cancion` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Playlist`,`ID_Cancion`),
  KEY `ID_Cancion` (`ID_Cancion`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `playlist_compartida_ibfk_1` FOREIGN KEY (`ID_Playlist`) REFERENCES `playlist` (`ID_Playlist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `playlist_compartida_ibfk_2` FOREIGN KEY (`ID_Cancion`) REFERENCES `cancion` (`ID_Cancion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `playlist_compartida_ibfk_3` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playlist_compartida`
--

LOCK TABLES `playlist_compartida` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `subscripcion`
--

DROP TABLE IF EXISTS `subscripcion`;
CREATE TABLE `subscripcion` (
  `ID_Subscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Plan` varchar(255) NOT NULL,
  `Precio` decimal(9,2) NOT NULL,
  `Duracion` int(11) NOT NULL,
  PRIMARY KEY (`ID_Subscripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subscripcion`
--

LOCK TABLES `subscripcion` WRITE;
INSERT INTO `subscripcion` VALUES (1,'Plan Gratuito',0.00,30),(2,'Plan Premium',9.99,30),(3,'Plan Familiar',14.99,30);
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL UNIQUE,
  `Contrasena` varchar(255) NOT NULL,
  `Fecha_Registro` date NOT NULL,
  `ID_Subscripcion` int(11) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  KEY `ID_Subscripcion_idx` (`ID_Subscripcion`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_Subscripcion`) REFERENCES `subscripcion` (`ID_Subscripcion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
INSERT INTO `usuario` VALUES (1,'Juan Pérez','juan.perez@example.com','123456', '2021-01-01',1),(2,'Maria Garcia','maria.garcia@example.com','abcdef', '2022-02-15',2),(3,'Carlos López','carlos.lopez@example.com','ghijkl', '2021-07-20',3),(4,'Ana Torres','ana.torres@example.com','mnopqr', '2023-03-10',1);
UNLOCK TABLES;

--
-- Table structure for table `vista`
--

DROP TABLE IF EXISTS `vista`;
CREATE TABLE `vista` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Cancion` int(11) NOT NULL,
  `Fecha_Vista` date NOT NULL,
  PRIMARY KEY (`ID_Usuario`,`ID_Cancion`),
  KEY `ID_Cancion_idx` (`ID_Cancion`),
  CONSTRAINT `vista_ibfk_1` FOREIGN KEY (`ID_Cancion`) REFERENCES `cancion` (`ID_Cancion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vista_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vista`
--

LOCK TABLES `vista` WRITE;
UNLOCK TABLES;

-- 
-- Constraints for dumped tables
--

--
-- MySQL dump completed on 2024-09-28 12:34:56
--
