-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: youtube
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
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal` (
  `ID_Canal` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `Fecha_Creacion` datetime NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Canal`),
  KEY `Fk_ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `Fk_ID_Usuario` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `ID_Comentario` int(11) NOT NULL AUTO_INCREMENT,
  `Text` text NOT NULL,
  `Fecha_Comentario` datetime NOT NULL,
  `ID_Video` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Comentario`),
  KEY `ID_Video` (`ID_Video`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`ID_Video`) REFERENCES `video` (`ID_Video`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiqueta` (
  `ID_Etiqueta` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Etiqueta` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Etiqueta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_dislike_comentario`
--

DROP TABLE IF EXISTS `like_dislike_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_dislike_comentario` (
  `ID_Comentario` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Tipo_Voto` enum('Like','Dislike') NOT NULL,
  `Fecha_Voto` datetime NOT NULL,
  PRIMARY KEY (`ID_Comentario`,`ID_Usuario`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `like_dislike_comentario_ibfk_1` FOREIGN KEY (`ID_Comentario`) REFERENCES `comentario` (`ID_Comentario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `like_dislike_comentario_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_dislike_comentario`
--

LOCK TABLES `like_dislike_comentario` WRITE;
/*!40000 ALTER TABLE `like_dislike_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_dislike_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_dislike_video`
--

DROP TABLE IF EXISTS `like_dislike_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_dislike_video` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Video` int(11) NOT NULL,
  `Tipo_Voto` enum('Like','Dislike') NOT NULL,
  `Fecha_Voto` datetime NOT NULL,
  PRIMARY KEY (`ID_Usuario`,`ID_Video`),
  KEY `ID_Video` (`ID_Video`),
  CONSTRAINT `like_dislike_video_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `like_dislike_video_ibfk_2` FOREIGN KEY (`ID_Video`) REFERENCES `video` (`ID_Video`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_dislike_video`
--

LOCK TABLES `like_dislike_video` WRITE;
/*!40000 ALTER TABLE `like_dislike_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_dislike_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `ID_Playlist` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Fecha_Creacion` datetime NOT NULL,
  `Estado` enum('Publica','Privada') NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`ID_Playlist`),
  KEY `ID_Usuario` (`ID_Usuario`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_video`
--

DROP TABLE IF EXISTS `playlist_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_video` (
  `ID_Playlist` int(11) NOT NULL,
  `ID_Video` int(11) NOT NULL,
  `Fecha_Adicion` datetime NOT NULL,
  PRIMARY KEY (`ID_Playlist`,`ID_Video`),
  KEY `ID_Video` (`ID_Video`),
  CONSTRAINT `playlist_video_ibfk_1` FOREIGN KEY (`ID_Playlist`) REFERENCES `playlist` (`ID_Playlist`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `playlist_video_ibfk_2` FOREIGN KEY (`ID_Video`) REFERENCES `video` (`ID_Video`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_video`
--

LOCK TABLES `playlist_video` WRITE;
/*!40000 ALTER TABLE `playlist_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripcion`
--

DROP TABLE IF EXISTS `suscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripcion` (
  `ID_Usuario` int(11) NOT NULL,
  `ID_Canal` int(11) NOT NULL,
  `Fecha_Suscripcion` datetime NOT NULL,
  PRIMARY KEY (`ID_Usuario`,`ID_Canal`),
  KEY `ID_Canal` (`ID_Canal`),
  CONSTRAINT `suscripcion_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE,
  CONSTRAINT `suscripcion_ibfk_2` FOREIGN KEY (`ID_Canal`) REFERENCES `canal` (`ID_Canal`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripcion`
--

LOCK TABLES `suscripcion` WRITE;
/*!40000 ALTER TABLE `suscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Nombre_Usuario` varchar(100) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Sexo` enum('Masculino','Femenino','Otro') NOT NULL,
  `Pais` varchar(100) NOT NULL,
  `Codigo_Postal` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `ID_Video` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(255) NOT NULL,
  `Descripcion` text NOT NULL,
  `Tamano` int(11) NOT NULL,
  `Nombre_Archivo` varchar(255) NOT NULL,
  `Duracion` time NOT NULL,
  `Thumbnail` varchar(255) DEFAULT NULL,
  `Numero_Reproducciones` int(11) DEFAULT '0',
  `Numero_Likes` int(11) DEFAULT '0',
  `Numero_Dislikes` int(11) DEFAULT '0',
  `Estado` enum('Público','Oculto','Privado') NOT NULL,
  `Fecha_Publicacion` datetime NOT NULL,
  `ID_canal` int(11) NOT NULL,
  PRIMARY KEY (`ID_Video`),
  KEY `id_canal_idx` (`ID_canal`),
  CONSTRAINT `id_canal` FOREIGN KEY (`ID_canal`) REFERENCES `canal` (`ID_Canal`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_etiqueta`
--

DROP TABLE IF EXISTS `video_etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_etiqueta` (
  `ID_Video` int(11) NOT NULL,
  `ID_Etiqueta` int(11) NOT NULL,
  PRIMARY KEY (`ID_Video`,`ID_Etiqueta`),
  KEY `ID_Etiqueta` (`ID_Etiqueta`),
  CONSTRAINT `ID_Etiqueta` FOREIGN KEY (`ID_Etiqueta`) REFERENCES `etiqueta` (`ID_Etiqueta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ID_Video` FOREIGN KEY (`ID_Video`) REFERENCES `video` (`ID_Video`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_etiqueta`
--

LOCK TABLES `video_etiqueta` WRITE;
/*!40000 ALTER TABLE `video_etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_etiqueta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-07  0:11:59
