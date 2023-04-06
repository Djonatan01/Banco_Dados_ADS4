-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: BD07
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Itens_pedido`
--

DROP TABLE IF EXISTS `Itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Itens_pedido` (
  `Num_PED` int(11) NOT NULL,
  `Cod_PROD` int(11) NOT NULL,
  `Quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`Num_PED`,`Cod_PROD`),
  KEY `Cod_PROD` (`Cod_PROD`),
  CONSTRAINT `Itens_pedido_ibfk_1` FOREIGN KEY (`Num_PED`) REFERENCES `Pedido` (`Num_PED`),
  CONSTRAINT `Itens_pedido_ibfk_2` FOREIGN KEY (`Cod_PROD`) REFERENCES `Produto` (`Cod_PROD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Itens_pedido`
--

LOCK TABLES `Itens_pedido` WRITE;
/*!40000 ALTER TABLE `Itens_pedido` DISABLE KEYS */;
INSERT INTO `Itens_pedido` VALUES (3,4,25),(3,6,20),(3,8,50),(3,17,30),(3,123,15),(4,8,10),(5,6,35),(5,17,121),(6,6,30),(6,8,20),(6,123,10),(7,4,20),(7,8,20),(7,17,20);
/*!40000 ALTER TABLE `Itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pedido` (
  `Num_PED` int(11) NOT NULL,
  `Data_PED` date DEFAULT NULL,
  `prazo_entrega` date DEFAULT NULL,
  `Cod_CLI` int(11) DEFAULT NULL,
  `Cod_VEND` int(11) DEFAULT NULL,
  PRIMARY KEY (`Num_PED`),
  KEY `Cod_CLI` (`Cod_CLI`),
  KEY `Cod_VEND` (`Cod_VEND`),
  CONSTRAINT `Pedido_ibfk_1` FOREIGN KEY (`Cod_CLI`) REFERENCES `cliente` (`Cod_CLI`),
  CONSTRAINT `Pedido_ibfk_2` FOREIGN KEY (`Cod_VEND`) REFERENCES `Vendedor` (`Cod_VEND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
INSERT INTO `Pedido` VALUES (3,'2020-09-03','2020-09-10',2,6),(4,'2020-10-04','2020-10-14',1,3),(5,'2020-10-05','2020-10-22',3,6),(6,'2020-10-10','2020-11-10',2,5),(7,'2020-10-15','2020-10-25',3,5);
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produto`
--

DROP TABLE IF EXISTS `Produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Produto` (
  `Cod_PROD` int(11) NOT NULL,
  `Desc_PROD` varchar(30) DEFAULT NULL,
  `Unidade` char(10) DEFAULT NULL,
  `Valor_PROD` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_PROD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produto`
--

LOCK TABLES `Produto` WRITE;
/*!40000 ALTER TABLE `Produto` DISABLE KEYS */;
INSERT INTO `Produto` VALUES (4,'Cartolina','folha',0.40),(6,'Chocolate','kg',2.40),(8,'Leite','L',1.56),(17,'Farinha','kg',1.01),(123,'Manteiga','kg',1.40);
/*!40000 ALTER TABLE `Produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendedor`
--

DROP TABLE IF EXISTS `Vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendedor` (
  `Cod_VEND` int(11) NOT NULL,
  `Nome_VEND` varchar(20) DEFAULT NULL,
  `Salario` decimal(7,2) DEFAULT NULL,
  `faixa_comissao` char(1) DEFAULT NULL,
  PRIMARY KEY (`Cod_VEND`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendedor`
--

LOCK TABLES `Vendedor` WRITE;
/*!40000 ALTER TABLE `Vendedor` DISABLE KEYS */;
INSERT INTO `Vendedor` VALUES (1,'Mariana Paes',800.15,'A'),(2,'Valter Abreu',400.05,'B'),(3,'Andre Moura',240.10,'C'),(5,'Joaquim Silva',200.05,'C'),(6,'João Lins',670.15,'A');
/*!40000 ALTER TABLE `Vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `Cod_CLI` int(11) NOT NULL,
  `Nome_CLI` varchar(20) DEFAULT NULL,
  `Fone` varchar(15) DEFAULT NULL,
  `Endereco_CLI` varchar(30) DEFAULT NULL,
  `Cidade` varchar(20) DEFAULT NULL,
  `CEP` char(10) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  `CGC` char(20) DEFAULT NULL,
  `InscE` char(10) DEFAULT NULL,
  PRIMARY KEY (`Cod_CLI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Maria Santana','11-2434 4567',NULL,'São Paulo','01345-456','SP',NULL,'2345'),(2,'Pedro Gomes',NULL,'Rua Pinheiros, 456','Curitiba',NULL,'PR',NULL,NULL),(3,'Carla Dias','11-98740049','Rua Diva, 678','São Paulo',NULL,'SP',NULL,NULL),(4,'Mario Vieira','41-4567 5675',NULL,'Curitiba','45045-011','PR',NULL,'6547'),(5,'Joana Bandeira',NULL,'Rua Dois, 1456','Fortaleza',NULL,'CE',NULL,'5634');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'BD07'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-03 10:19:33
