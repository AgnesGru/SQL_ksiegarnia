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
-- Table structure for table `adres`
--

DROP TABLE IF EXISTS `adres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ulica` varchar(45) DEFAULT NULL,
  `nr_domu` varchar(45) DEFAULT NULL,
  `nr_mieszkania` varchar(40) DEFAULT '0',
  `kod_pocztowy` varchar(6) NOT NULL,
  `miejscowosc` varchar(45) DEFAULT NULL,
  `uzytkownik` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uzytkownik` (`uzytkownik`),
  CONSTRAINT `fk_adres_uzytkownik` FOREIGN KEY (`uzytkownik`) REFERENCES `uzytkownik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adres`
--

LOCK TABLES `adres` WRITE;
/*!40000 ALTER TABLE `adres` DISABLE KEYS */;
INSERT INTO `adres` VALUES (3,'Kolorowa','12a','34','43-100','Warszawa',NULL),(5,'Długa','12a','34','43-100','Gdansk',NULL),(6,'Droga','2a','33','43-100','Gdansk',NULL),(7,'Droga','2a','33','43-100','Pruszcz Gdański',NULL),(8,'Lotnicza','15b','0','83-100','Cieplewo',NULL);
/*!40000 ALTER TABLE `adres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(100) DEFAULT NULL,
  `nazwisko` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Joshua','Blach'),(2,'Cay S','Horstmann'),(3,'Christian','Bauer'),(4,'Gavin','King'),(5,'Gary','Gregory'),(6,'Krzysztof','Rychlicki-Kicior');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor_ksiazka`
--

DROP TABLE IF EXISTS `autor_ksiazka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor_ksiazka` (
  `id_ksiazki` int(11) DEFAULT NULL,
  `id_autora` int(11) DEFAULT NULL,
  KEY `fk_autor_ksiazka_id_ksiazka` (`id_ksiazki`),
  KEY `fk_autor_ksiazka_id_autora` (`id_autora`),
  CONSTRAINT `fk_autor_ksiazka_id_autora` FOREIGN KEY (`id_autora`) REFERENCES `autor` (`id`),
  CONSTRAINT `fk_autor_ksiazka_id_ksiazka` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazka` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor_ksiazka`
--

LOCK TABLES `autor_ksiazka` WRITE;
/*!40000 ALTER TABLE `autor_ksiazka` DISABLE KEYS */;
INSERT INTO `autor_ksiazka` VALUES (7,1),(3,2),(5,2),(4,3),(4,4),(4,5),(6,3),(6,4),(8,6),(9,2);
/*!40000 ALTER TABLE `autor_ksiazka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategoria`
--

DROP TABLE IF EXISTS `kategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa_kategorii` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategoria`
--

LOCK TABLES `kategoria` WRITE;
/*!40000 ALTER TABLE `kategoria` DISABLE KEYS */;
INSERT INTO `kategoria` VALUES (1,'JAVA'),(2,'JPA');
/*!40000 ALTER TABLE `kategoria` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `ksiazka_uzytkownik`
--

DROP TABLE IF EXISTS `ksiazka_uzytkownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ksiazka_uzytkownik` (
  `id_ksiazki` int(11) DEFAULT NULL,
  `id_uzytkownik` int(11) DEFAULT NULL,
  KEY `fk_ksiazka_uzytkownik_id_uzytkownik` (`id_uzytkownik`),
  KEY `fk_ksiazka_uzytkownik_id_ksiazki` (`id_ksiazki`),
  CONSTRAINT `fk_ksiazka_uzytkownik_id_ksiazki` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazka` (`id`),
  CONSTRAINT `fk_ksiazka_uzytkownik_id_uzytkownik` FOREIGN KEY (`id_uzytkownik`) REFERENCES `uzytkownik` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ksiazka_uzytkownik`
--

LOCK TABLES `ksiazka_uzytkownik` WRITE;
/*!40000 ALTER TABLE `ksiazka_uzytkownik` DISABLE KEYS */;
/*!40000 ALTER TABLE `ksiazka_uzytkownik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownik`
--

DROP TABLE IF EXISTS `uzytkownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uzytkownik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(30) DEFAULT 'Jan',
  `nazwisko` varchar(30) DEFAULT 'Kowalski',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownik`
--

LOCK TABLES `uzytkownik` WRITE;
/*!40000 ALTER TABLE `uzytkownik` DISABLE KEYS */;
INSERT INTO `uzytkownik` VALUES (1,'Jan','Kowalski'),(2,'Lukasz','Nowak'),(3,'Ewa','Konieczna'),(4,'Adam','Nowak'),(5,'Agnieszka','Konieczna');
/*!40000 ALTER TABLE `uzytkownik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zakupy`
--

DROP TABLE IF EXISTS `zakupy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakupy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_zakupu` datetime NOT NULL,
  `id_uzytkownika` int(11) NOT NULL,
  `rabat` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `fk_zakupy_id_uzytkownika` (`id_uzytkownika`),
  CONSTRAINT `fk_zakupy_id_uzytkownika` FOREIGN KEY (`id_uzytkownika`) REFERENCES `uzytkownik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakupy`
--

LOCK TABLES `zakupy` WRITE;
/*!40000 ALTER TABLE `zakupy` DISABLE KEYS */;
/*!40000 ALTER TABLE `zakupy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zakupy_ksiazka`
--

DROP TABLE IF EXISTS `zakupy_ksiazka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakupy_ksiazka` (
  `id_ksiazki` int(11) DEFAULT NULL,
  `id_zakupy` int(11) DEFAULT NULL,
  KEY `fk_id_ksiazki_zakupy_ksiazka` (`id_ksiazki`),
  KEY `fk_id_zakupy_zakupy_ksiazka` (`id_zakupy`),
  CONSTRAINT `fk_id_ksiazki_zakupy_ksiazka` FOREIGN KEY (`id_ksiazki`) REFERENCES `ksiazka` (`id`),
  CONSTRAINT `fk_id_zakupy_zakupy_ksiazka` FOREIGN KEY (`id_zakupy`) REFERENCES `zakupy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakupy_ksiazka`
--

LOCK TABLES `zakupy_ksiazka` WRITE;
/*!40000 ALTER TABLE `zakupy_ksiazka` DISABLE KEYS */;
/*!40000 ALTER TABLE `zakupy_ksiazka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ksiegarnia'
--

--
-- Dumping routines for database 'ksiegarnia'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-15 15:21:53
