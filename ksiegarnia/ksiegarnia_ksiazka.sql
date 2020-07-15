-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: ksiegarnia
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `ksiazka`
--

DROP TABLE IF EXISTS `ksiazka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ksiazka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tytul` varchar(100) DEFAULT NULL,
  `rok_wydania` int(4) unsigned NOT NULL,
  `wydawnictwo` varchar(100) DEFAULT 'brak danych',
  `cena` decimal(9,2) DEFAULT NULL,
  `kategoria` int(11) DEFAULT NULL,
  `strony` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ksiazka_kategoria` (`kategoria`),
  CONSTRAINT `fk_ksiazka_kategoria` FOREIGN KEY (`kategoria`) REFERENCES `kategoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ksiazka`
--

LOCK TABLES `ksiazka` WRITE;
/*!40000 ALTER TABLE `ksiazka` DISABLE KEYS */;
INSERT INTO `ksiazka` VALUES (3,'Java. Techniki zaawansowane',2015,'Helion',99.99,1,690),(4,'Java Persistance. Programowanie aplikacji bazodanowych w Hibernate.',2008,'Helion',88.00,2,800),(5,'Java 8. Przewodnik doswiadczonego programisty.',2015,'Helion',40.00,1,400),(6,'Hibernate w akcji',2016,'Helion',55.99,2,500),(7,'JAVA. Efektywne programowanie. Wydanie III.',2018,'Helion',60.00,1,250),(8,'Java EE 6. Programowanie aplikacji WWW',2016,'Helion',25.50,1,120),(9,'Java 9. przewodnik doswiadczonego programisty',2019,'Helion',100.00,1,850);
/*!40000 ALTER TABLE `ksiazka` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-15 15:26:14
