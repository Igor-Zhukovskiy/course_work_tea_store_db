CREATE DATABASE  IF NOT EXISTS `tea_store` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tea_store`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: tea_store
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Tess'),(2,'Greenfield'),(3,'Lipton'),(4,'Ahmad Tea'),(5,'Принцесса Нури'),(6,'Sunrise ceramics'),(7,'Айзерчай');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Черный чай'),(2,'Зеленый чай'),(3,'Пуэр'),(4,'Фруктовый'),(5,'Купажированный'),(6,'Пасуда');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(25) DEFAULT NULL,
  `bonus_points` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Игорь Витальевич','79190712230',8),(2,'Анастасия Грачева','79190626235',0),(3,'Кирил Тракторов','79197740221197',10),(4,'Емилилия Бабаренко','79191640221',47);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Андрей Грачев'),(2,'Иван Иванов'),(3,'Александр Алесканрович');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `units` enum('gr','pcs') DEFAULT NULL,
  `price_per_unit` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_items_brands1_idx` (`brand_id`),
  KEY `fk_items_categories1_idx` (`category_id`),
  CONSTRAINT `fk_items_brands1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `fk_items_categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Удовольствие',1,1,340,'gr',145),(2,'Флирт',2,1,217,'gr',270),(3,'Лайм',2,1,309,'gr',190),(4,'Фиеста',4,1,100,'gr',100),(5,'Восход',1,1,590,'gr',200),(6,'Пинаколада',4,1,94,'gr',321),(7,'Сон в лесу',5,1,450,'gr',463),(8,'Лето',4,1,722,'gr',390),(9,'Мягкий персик',4,2,777,'gr',120),(10,'Барбарисовый сад',1,2,10,'gr',242),(11,'Зеленая мелиса',2,2,500,'gr',379),(12,'Весенняя мелодия',1,5,160,'gr',100),(13,'Фантазия эрлгрея',1,1,610,'gr',500),(14,'Золотой цейлон',1,2,211,'gr',430),(15,'Жасминовая мечта',5,2,152,'gr',249),(16,'Полет дракона',3,2,180,'gr',460),(17,'Желтый слог',4,3,414,'gr',660),(18,'Свежесть мохито',5,3,550,'gr',470),(19,'Баланс и спокойствие',5,3,119,'gr',530),(20,'Зеленый порох',1,3,202,'gr',630),(21,'Мелиса с лимоном',5,3,520,'gr',320),(22,'Эрлгрей',1,3,111,'gr',653),(23,'Бодрость',1,3,199,'gr',310),(24,'Класический черный',1,4,710,'gr',360),(25,'Эрлгрей',1,4,210,'gr',544),(26,'Кардамон',5,4,230,'gr',299),(27,'Высокогорный цейлон',1,4,10,'gr',240),(28,'Цейлон',1,4,174,'gr',630),(29,'Персик и маракуйя',4,4,112,'gr',360),(30,'Черная смородина',4,5,191,'gr',550),(31,'Магия бергамота',5,5,161,'gr',165),(32,'Высокогорный',1,5,513,'gr',652),(33,'Яркий лимон',5,5,524,'gr',652),(34,'Цейлонский отборный',1,5,210,'gr',701),(35,'Набор пиалок',6,6,106,'pcs',1200),(36,'Глинянный чайник',6,6,3,'pcs',1590),(37,'Керамическая гайванька',6,6,10,'pcs',100);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_employees1_idx` (`employee_id`),
  KEY `fk_orders_clients1_idx` (`client_id`),
  CONSTRAINT `fk_orders_clients1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `fk_orders_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2022-05-30',0,1,NULL),(2,'2022-05-30',0,2,1),(3,'2022-05-30',0,2,4),(4,'2022-04-30',0,3,NULL),(5,'2022-05-31',0,1,NULL),(6,'2022-05-31',0,2,3),(7,'2022-06-01',0,1,NULL),(8,'2022-06-02',0,1,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `units` enum('gr','pcs') DEFAULT NULL,
  `price_per_unit` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sales_orders1_idx` (`order_id`),
  KEY `fk_sales_items1_idx` (`item_id`),
  CONSTRAINT `fk_sales_items1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `fk_sales_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,13,10,24,'gr',242),(2,2,22,50,250,'gr',500),(3,2,27,300,900,'gr',300),(4,3,3,120,229,'gr',190),(5,4,36,1,1590,'pcs',1590),(6,4,21,100,320,'gr',320),(7,4,15,100,249,'gr',249),(8,4,10,300,726,'gr',242),(9,5,5,20,126,'gr',630),(10,5,9,50,60,'gr',120),(11,6,1,50,73,'gr',145),(12,7,16,420,1932,'gr',460),(13,8,3,50,95,'gr',190);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tea_store'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-31  1:07:56
