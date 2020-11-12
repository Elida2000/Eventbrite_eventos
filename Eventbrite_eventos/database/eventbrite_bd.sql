-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: eventbrite
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `categorias-eventos`
--

DROP TABLE IF EXISTS `categorias-eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias-eventos` (
  `idCategorias-eventos` int NOT NULL AUTO_INCREMENT,
  `nombreCat` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategorias-eventos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias-eventos`
--

LOCK TABLES `categorias-eventos` WRITE;
/*!40000 ALTER TABLE `categorias-eventos` DISABLE KEYS */;
INSERT INTO `categorias-eventos` VALUES (1,'Arte'),(2,'Música'),(3,'Negocios'),(4,'Religion'),(5,'Fiesta');
/*!40000 ALTER TABLE `categorias-eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas` (
  `idEntrada` int NOT NULL AUTO_INCREMENT,
  `idPedidos` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idEntrada`),
  KEY `idPedidos_idx` (`idPedidos`),
  CONSTRAINT `idPedidos` FOREIGN KEY (`idPedidos`) REFERENCES `pedidos` (`idPedidos`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT INTO `entradas` VALUES (1,1,'C'),(2,1,'C'),(3,2,'C'),(4,2,'C'),(5,3,'C'),(6,3,'C'),(7,3,'C'),(8,3,'C'),(9,3,'C');
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `idEventos` int NOT NULL AUTO_INCREMENT,
  `idUsuarios` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `categoria` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `valorEntrada` double NOT NULL,
  `capacidad` int NOT NULL,
  `disponibilidad` int NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `tipo` int NOT NULL,
  PRIMARY KEY (`idEventos`),
  KEY `idUsuarios_idx` (`idUsuarios`),
  KEY `idCategoria_idx` (`categoria`),
  KEY `idTipo_idx` (`tipo`),
  CONSTRAINT `idCategoria` FOREIGN KEY (`categoria`) REFERENCES `categorias-eventos` (`idCategorias-eventos`),
  CONSTRAINT `idTipo` FOREIGN KEY (`tipo`) REFERENCES `tipo-eventos` (`idtipo-eventos`),
  CONSTRAINT `idUsuarios` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,1,'Fiesta XV',5,'2020-11-26','18:36:00','Ven a la fiesta XV de mi nieta',2,150,146,'Santa Tecla','El Salvador','Residencial Veranda, pasaje B, casa 29',2),(2,1,'Matrimonio',4,'2021-04-15','15:00:00','Matrimonio de Sara y Tomás',0,100,95,'Sonsonate','El Salvador','Iglesia de Sonsonate',2);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idPedidos` int NOT NULL AUTO_INCREMENT,
  `idEventos` int NOT NULL,
  `idUsuario` int NOT NULL,
  `cantidad` int NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`idPedidos`),
  KEY `idEvento_idx` (`idEventos`),
  KEY `idUsuarios_idx` (`idUsuario`),
  CONSTRAINT `idEvento` FOREIGN KEY (`idEventos`) REFERENCES `eventos` (`idEventos`),
  CONSTRAINT `idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,2,2,4),(2,1,3,2,4),(3,2,1,2,0);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetadecredito`
--

DROP TABLE IF EXISTS `tarjetadecredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjetadecredito` (
  `idTarjetaDeCredito` int NOT NULL AUTO_INCREMENT,
  `numeroTarjeta` varchar(45) NOT NULL,
  `codigoSeguridad` int NOT NULL,
  `vencimiento` date NOT NULL,
  `idUsuarios` int NOT NULL,
  PRIMARY KEY (`idTarjetaDeCredito`),
  KEY `fk_tarjetaDeCredito_usuarios1_idx` (`idUsuarios`),
  CONSTRAINT `fk_tarjetaDeCredito_usuarios1` FOREIGN KEY (`idUsuarios`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetadecredito`
--

LOCK TABLES `tarjetadecredito` WRITE;
/*!40000 ALTER TABLE `tarjetadecredito` DISABLE KEYS */;
INSERT INTO `tarjetadecredito` VALUES (1,'789645123698',569,'2025-03-01',1),(2,'789456123789',894,'2032-05-01',2),(3,'741852963147',258,'2026-06-01',3);
/*!40000 ALTER TABLE `tarjetadecredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo-eventos`
--

DROP TABLE IF EXISTS `tipo-eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo-eventos` (
  `idtipo-eventos` int NOT NULL AUTO_INCREMENT,
  `nombreTipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipo-eventos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo-eventos`
--

LOCK TABLES `tipo-eventos` WRITE;
/*!40000 ALTER TABLE `tipo-eventos` DISABLE KEYS */;
INSERT INTO `tipo-eventos` VALUES (1,'Conferencia'),(2,'Fiesta'),(3,'Charla'),(4,'Foro');
/*!40000 ALTER TABLE `tipo-eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `userName` varchar(45) NOT NULL,
  `correoElectronico` varchar(50) NOT NULL,
  `contrasenna` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Frank','El Salvador','La Libertad','FAMO','frank@frank.com','0000'),(2,'Tere','USA','Michigan','terx','ter@ter.com','1234'),(3,'Juan','Honduras','Tegucigalpa','John','juan@juan.com','4567');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eventbrite'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-04 21:28:35
