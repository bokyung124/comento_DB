CREATE DATABASE  IF NOT EXISTS `comento` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `comento`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: comento
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` varchar(20) NOT NULL,
  `cs_id` varchar(10) NOT NULL,
  `pd_id` varchar(10) NOT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cs_id` (`cs_id`),
  KEY `pd_id` (`pd_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`pd_id`) REFERENCES `product` (`pd_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('ct01','cs01','pd01',1),('ct02','cs02','pd02',3),('ct03','cs03','pd04',2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cate_id` varchar(10) NOT NULL,
  `cate_name` varchar(30) NOT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('ct01','top'),('ct02','neat'),('ct03','pants'),('ct04','skirt'),('ct05','dress'),('ct06','sports'),('ct07','outer');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_log`
--

DROP TABLE IF EXISTS `cus_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cus_log` (
  `cs_id` varchar(10) NOT NULL,
  `cs_name` varchar(30) NOT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `birth` year DEFAULT NULL,
  `cs_path` varchar(20) NOT NULL,
  `cs_phone` varchar(23) NOT NULL,
  PRIMARY KEY (`cs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_log`
--

LOCK TABLES `cus_log` WRITE;
/*!40000 ALTER TABLE `cus_log` DISABLE KEYS */;
INSERT INTO `cus_log` VALUES ('cs04','james','M',2003,'p03','010-33-23'),('cs05','Mic','F',1983,'p05','01092372938');
/*!40000 ALTER TABLE `cus_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cs_id` varchar(10) NOT NULL,
  `cs_name` varchar(30) NOT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `birth` year DEFAULT NULL,
  `cs_path` varchar(20) NOT NULL,
  `cs_phone` varchar(23) NOT NULL,
  PRIMARY KEY (`cs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('cs01','anna','F',2001,'p01','010-0028-3928'),('cs02','jane','M',1992,'p02','010-3492-3119'),('cs03','bell','F',1998,'p01','010-0038-9899'),('cs04','james','M',2003,'p03','010-33-23'),('cs05','Mic','F',1983,'p05','01092372938');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pd_id` varchar(10) NOT NULL,
  `pd_name` varchar(30) NOT NULL,
  `pd_price` int NOT NULL,
  `pd_detail` longtext,
  `pd_image` blob NOT NULL,
  `cate_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pd_id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `category` (`cate_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('pd01','sh1',10000,'pretty t-shirt','','ct01'),('pd02','sk1',30000,'cargo skirt','','ct04'),('pd03','dr1',59000,'floral dress','','ct04'),('pd04','tr1',50000,'training set','','ct06');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pur_log`
--

DROP TABLE IF EXISTS `pur_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pur_log` (
  `pc_id` int NOT NULL AUTO_INCREMENT,
  `pc_date` datetime DEFAULT NULL,
  `cs_id` varchar(10) NOT NULL,
  `pd_id` varchar(10) NOT NULL,
  PRIMARY KEY (`pc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pur_log`
--

LOCK TABLES `pur_log` WRITE;
/*!40000 ALTER TABLE `pur_log` DISABLE KEYS */;
INSERT INTO `pur_log` VALUES (1,NULL,'cs03','pd03');
/*!40000 ALTER TABLE `pur_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `pc_id` varchar(20) NOT NULL,
  `pc_date` datetime NOT NULL,
  `cs_id` varchar(10) NOT NULL,
  `pd_id` varchar(10) NOT NULL,
  PRIMARY KEY (`pc_id`),
  KEY `cs_id` (`cs_id`),
  KEY `pd_id` (`pd_id`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON UPDATE CASCADE,
  CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`pd_id`) REFERENCES `product` (`pd_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES ('pc01','2023-08-04 14:21:43','cs01','pd02'),('pc02','2023-08-04 14:21:43','cs02','pd01'),('pc03','2023-08-04 14:21:43','cs03','pd03'),('pc04','2023-08-04 14:21:43','cs02','pd04'),('pc05','2023-08-04 14:21:43','cs04','pd03'),('pc06','2023-08-04 14:21:43','cs03','pd03');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend`
--

DROP TABLE IF EXISTS `recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommend` (
  `cs_id` varchar(10) NOT NULL,
  `pd_id` varchar(10) NOT NULL,
  `rc_code` varchar(10) NOT NULL,
  KEY `cs_id` (`cs_id`),
  KEY `pd_id` (`pd_id`),
  CONSTRAINT `recommend_ibfk_1` FOREIGN KEY (`cs_id`) REFERENCES `customer` (`cs_id`) ON UPDATE CASCADE,
  CONSTRAINT `recommend_ibfk_2` FOREIGN KEY (`pd_id`) REFERENCES `product` (`pd_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend`
--

LOCK TABLES `recommend` WRITE;
/*!40000 ALTER TABLE `recommend` DISABLE KEYS */;
INSERT INTO `recommend` VALUES ('cs01','pd01','rc01'),('cs02','pd03','rc02'),('cs03','pd02','rc03');
/*!40000 ALTER TABLE `recommend` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-04 14:33:41
