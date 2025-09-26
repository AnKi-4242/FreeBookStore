-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: freebookstore
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_ID` int NOT NULL AUTO_INCREMENT,
  `street` varchar(100) NOT NULL,
  `homenumber` varchar(10) NOT NULL,
  `postcode` int NOT NULL,
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`address_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Reitgasse','8',35037,'Marburg'),(2,'Langstraße','19',79098,'Freiburg im Breisgau'),(3,'Bergweg','60b',20095,'Hamburg'),(4,'Gartenstraße','16',85354,'Freising'),(5,'Gartenstraße','40',85354,'Freising'),(6,'Lindenstraße','23',50667,'Köln'),(7,'Lindenstraße','23',51105,'Köln'),(8,'Rosenweg','14',30159,'Hannover'),(9,'Am Markt','2',1067,'Dresden'),(10,'Hauptstraße','73',48143,'Münster'),(11,'Hasenweg','90 a',48143,'Münster'),(12,'Anger','20',99084,'Erfurt'),(13,'Löhrringer Straße','15',56070,'Koblenz'),(14,'Ammergasse','9',72070,'Tübingen'),(15,'Holstenstraße','47',24103,'Kiel');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_ID` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  PRIMARY KEY (`author_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Fitzek','Sebastian'),(2,'Kinsella','Sophie'),(3,'Tolkien','John Ronald Reuel'),(4,'Ruff','Matt'),(5,'Poznanski','Ursula'),(6,'Strobel','Arno'),(7,'Isayama','Hajime'),(8,'Ustinov','Peter'),(9,'McFarlane','Mhairi'),(10,'Ende','Michael'),(11,'Doyle','Arthur Conan'),(12,'Orwell','George'),(13,'Enders','Giulia'),(14,'Zusack','Markus'),(15,'Austen','Jane');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_book`
--

DROP TABLE IF EXISTS `author_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_book` (
  `author_ID` int NOT NULL,
  `book_ID` int NOT NULL,
  PRIMARY KEY (`author_ID`,`book_ID`),
  KEY `fk_book_id` (`book_ID`),
  CONSTRAINT `fk_author_id` FOREIGN KEY (`author_ID`) REFERENCES `author` (`author_ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_book_id` FOREIGN KEY (`book_ID`) REFERENCES `book` (`book_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_book`
--

LOCK TABLES `author_book` WRITE;
/*!40000 ALTER TABLE `author_book` DISABLE KEYS */;
INSERT INTO `author_book` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(5,6),(6,6),(7,7),(7,8),(8,9),(9,10),(10,11),(11,12),(11,13),(13,15),(14,16),(15,17),(3,18);
/*!40000 ALTER TABLE `author_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `available`
--

DROP TABLE IF EXISTS `available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `available` (
  `available_ID` int NOT NULL AUTO_INCREMENT,
  `state` enum('verfügbar','reserviert','verliehen') NOT NULL,
  `available_from` date NOT NULL,
  `available_until` date NOT NULL,
  PRIMARY KEY (`available_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available`
--

LOCK TABLES `available` WRITE;
/*!40000 ALTER TABLE `available` DISABLE KEYS */;
INSERT INTO `available` VALUES (1,'verfügbar','2025-09-01','2025-12-31'),(2,'verfügbar','2025-09-25','2025-12-01'),(3,'reserviert','2025-09-20','2025-09-23'),(4,'verliehen','2025-08-01','2025-10-15'),(5,'verfügbar','2025-08-10','2025-08-31'),(6,'verfügbar','2025-09-10','2025-09-28'),(7,'reserviert','2025-09-24','2025-09-27'),(8,'verfügbar','2025-09-10','2025-09-28'),(9,'verliehen','2025-09-01','2025-10-31'),(10,'verfügbar','2025-10-15','2025-10-31'),(11,'reserviert','2025-09-15','2025-09-18'),(12,'verfügbar','2025-09-01','2025-09-08');
/*!40000 ALTER TABLE `available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_ID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `release_date` date NOT NULL,
  `language_b` varchar(50) NOT NULL,
  `pages` int DEFAULT NULL,
  PRIMARY KEY (`book_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Passagier 23','Droemer HC','9783426199190','2014-10-30','deutsch',432),(2,'Sag\'s nicht weiter, Liebling!','Goldmann Verlag','9783442456321','2004-02-01','deutsch',384),(3,'Der Herr der Ringe','Klett-Cotta','9783608952124','1987-02-01','deutsch',NULL),(4,'Bad Monkeys','Deutscher Taschenbuch Verlag','9783423211796','2009-11-01','deutsch',272),(5,'Erebos','Loewe Verlag','9783785569573','2010-01-07','deutsch',485),(6,'Fremd','Rowohlt Taschenbuch Verlag','9783499270918','2016-08-26','deutsch',416),(7,'Attack on Titan 1','Carlsen Manga','9783551742339','2014-03-18','deutsch',192),(8,'Attack on Titan 2','Carlsen Manga','9783551742346','2014-05-01','deutsch',192),(9,'Der Alte Mann und Mr. Smith','Econ','9783430192781','1991-01-01','deutsch',320),(10,'Wir in drei Worten','Knaur TB','9783426514535','2013-10-01','deutsch',496),(11,'Die unendliche Geschichte','Thienemann Verlag','9783522128001','1979-01-01','deutsch',428),(12,'Die Abenteuer des Sherlock Holmes','Insel Verlag','9783458350170','2007-11-26','deutsch',432),(13,'Eine Studie in Scharlachrot','Nikol','9783868206272','2022-01-14','deutsch',208),(14,'1984','Heyne Verlag','9783453164215','2002-08-01','deutsch',400),(15,'Darm mit Charme','Ullstein Hardcover','9783550081842','2017-04-07','deutsch',304),(16,'Die Bücherdiebin','Blanvalet','9783442373956','2009-09-07','deutsch',588),(17,'Stolz und Vorurteil','Fischer Taschenbuch Verlag','9783596222056','2012-01-24','deutsch',352),(18,'Der Herr der Ringe','Klett-Cotta','9783608980806','2021-10-20','deutsch',1300);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_genre`
--

DROP TABLE IF EXISTS `book_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_genre` (
  `book_ID` int NOT NULL,
  `genre_ID` int NOT NULL,
  PRIMARY KEY (`book_ID`,`genre_ID`),
  KEY `fk_bookgenre_genreid` (`genre_ID`),
  CONSTRAINT `fk_bookgenre_genreid` FOREIGN KEY (`genre_ID`) REFERENCES `genre` (`genre_ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_bookgenre_id` FOREIGN KEY (`book_ID`) REFERENCES `book` (`book_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_genre`
--

LOCK TABLES `book_genre` WRITE;
/*!40000 ALTER TABLE `book_genre` DISABLE KEYS */;
INSERT INTO `book_genre` VALUES (1,1),(4,1),(6,1),(7,2),(8,2),(1,3),(4,3),(5,3),(6,3),(3,4),(9,4),(11,4),(4,5),(14,5),(12,6),(13,6),(12,9),(13,9),(7,10),(8,10),(14,11),(15,12),(17,13),(9,14),(16,14),(2,15),(10,15),(15,16),(5,17);
/*!40000 ALTER TABLE `book_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conflict`
--

DROP TABLE IF EXISTS `conflict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conflict` (
  `conflict_ID` int NOT NULL AUTO_INCREMENT,
  `loan_ID` int DEFAULT NULL,
  `opponent_ID` int DEFAULT NULL,
  `reported_by_ID` int DEFAULT NULL,
  `report_time` timestamp NOT NULL,
  `state` enum('offen','geklärt') NOT NULL,
  PRIMARY KEY (`conflict_ID`),
  KEY `fk_loanconflict_id` (`loan_ID`),
  KEY `fk_opponent_id` (`opponent_ID`),
  KEY `fk_reported_by_id` (`reported_by_ID`),
  CONSTRAINT `fk_loanconflict_id` FOREIGN KEY (`loan_ID`) REFERENCES `loan` (`loan_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_opponent_id` FOREIGN KEY (`opponent_ID`) REFERENCES `user` (`user_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_reported_by_id` FOREIGN KEY (`reported_by_ID`) REFERENCES `user` (`user_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conflict`
--

LOCK TABLES `conflict` WRITE;
/*!40000 ALTER TABLE `conflict` DISABLE KEYS */;
INSERT INTO `conflict` VALUES (1,1,2,1,'2025-09-02 08:00:00','offen'),(2,NULL,3,2,'2025-09-03 09:00:00','geklärt'),(3,3,NULL,3,'2025-09-04 10:00:00','offen'),(4,NULL,5,4,'2025-09-05 11:00:00','geklärt'),(5,5,NULL,5,'2025-09-06 12:00:00','offen'),(6,NULL,7,6,'2025-09-07 13:00:00','geklärt'),(7,7,NULL,7,'2025-09-08 14:00:00','offen'),(8,NULL,9,8,'2025-09-09 15:00:00','geklärt'),(9,9,NULL,9,'2025-09-10 16:00:00','offen'),(10,NULL,11,10,'2025-09-11 17:00:00','geklärt'),(11,11,NULL,11,'2025-09-12 18:00:00','offen'),(12,12,NULL,12,'2025-09-13 19:00:00','geklärt');
/*!40000 ALTER TABLE `conflict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_ID` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`genre_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Psychothriller'),(2,'Actionthriller'),(3,'Thriller allgemein'),(4,'Fantasy'),(5,'Science Fiction'),(6,'Detektivgeschichte'),(7,'Regionalkrimi'),(8,'Historischer Krimi'),(9,'Krimi allgemein'),(10,'Manga'),(11,'Dystopie'),(12,'Fachbuch'),(13,'Historiendrama'),(14,'Drama allgemein'),(15,'Romantic Comedy'),(16,'Ratgeber'),(17,'Young Adult');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_ID` int NOT NULL AUTO_INCREMENT,
  `request_ID` int NOT NULL,
  `loan_start` date NOT NULL,
  `loan_end` date NOT NULL,
  `state` enum('laufend','beendet') NOT NULL,
  PRIMARY KEY (`loan_ID`),
  KEY `fk_request_id` (`request_ID`),
  CONSTRAINT `fk_request_id` FOREIGN KEY (`request_ID`) REFERENCES `request` (`request_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,1,'2025-09-01','2025-09-15','beendet'),(2,2,'2025-09-03','2025-09-17','laufend'),(3,3,'2025-09-05','2025-09-19','beendet'),(4,4,'2025-09-02','2025-09-16','laufend'),(5,5,'2025-09-04','2025-09-18','beendet'),(6,6,'2025-09-06','2025-09-20','laufend'),(7,7,'2025-09-07','2025-09-21','beendet'),(8,8,'2025-09-08','2025-09-22','laufend'),(9,9,'2025-09-09','2025-09-23','beendet'),(10,10,'2025-09-10','2025-09-24','laufend'),(11,11,'2025-09-11','2025-09-25','beendet'),(12,12,'2025-09-12','2025-09-26','laufend');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_ID` int NOT NULL AUTO_INCREMENT,
  `street` varchar(100) DEFAULT NULL,
  `homenumber` varchar(10) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `postcode` int NOT NULL,
  `city` varchar(50) NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  PRIMARY KEY (`location_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Universitätsstraße','10',NULL,35037,'Marburg',50.810000,8.770000),(2,NULL,NULL,'Stadtbibliothek Freiburg',79098,'Freiburg',47.995900,7.852200),(3,NULL,NULL,'Englischer Garten, Nähe See',80538,'München',48.150000,11.590000),(4,'Bahnhofstraße','3',NULL,50667,'Köln',50.941300,6.958300),(5,'Am Markt','1','Treffpunkt Brunnen',1067,'Dresden',51.050400,13.737300),(6,NULL,NULL,'Hauptbahnhof Hamburg, Ditsch-Stand',20095,'Hamburg',53.552600,10.006700),(7,'Lindenstraße','23',NULL,51105,'Köln',50.922000,7.000500),(8,NULL,NULL,'Uni-Bibliothek Tübingen',72070,'Tübingen',48.521600,9.057600),(9,'Gartenstraße','16',NULL,85354,'Freising',48.399600,11.748600),(10,'Holstenstraße',NULL,'Bushaltestelle',24103,'Kiel',54.323300,10.122800),(11,NULL,NULL,'Café Extrablatt Münster',48143,'Münster',51.962400,7.625700),(12,'Ammergasse','9',NULL,72070,'Tübingen',48.520000,9.055000);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `message_ID` int NOT NULL AUTO_INCREMENT,
  `sender_ID` int DEFAULT NULL,
  `receiver_ID` int DEFAULT NULL,
  `time_sent` timestamp NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`message_ID`),
  KEY `fk_sender_id` (`sender_ID`),
  KEY `fk_receiver_id` (`receiver_ID`),
  CONSTRAINT `fk_receiver_id` FOREIGN KEY (`receiver_ID`) REFERENCES `user` (`user_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_sender_id` FOREIGN KEY (`sender_ID`) REFERENCES `user` (`user_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,2,'2025-09-01 08:00:00','Hallo, hast du das Buch schon zurückgegeben?'),(2,2,3,'2025-09-01 09:00:00','Ja, morgen bringe ich es vorbei.'),(3,3,4,'2025-09-01 10:00:00','Super, danke!'),(4,4,5,'2025-09-01 11:00:00','Kannst du mir dein Exemplar leihen?'),(5,5,6,'2025-09-01 12:00:00','Klar, ich bringe es mit.'),(6,6,7,'2025-09-01 13:00:00','Danke!'),(7,7,8,'2025-09-01 14:00:00','Wann ist Abholung?'),(8,8,9,'2025-09-01 15:00:00','Morgen Nachmittag.'),(9,9,10,'2025-09-01 16:00:00','Perfekt!'),(10,10,11,'2025-09-01 17:00:00','Bis morgen.'),(11,11,12,'2025-09-01 18:00:00','Alles klar.'),(12,12,1,'2025-09-01 19:00:00','Danke für die Info.');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `photo_ID` int NOT NULL AUTO_INCREMENT,
  `user_book_ID` int DEFAULT NULL,
  `loan_ID` int DEFAULT NULL,
  `conflict_ID` int DEFAULT NULL,
  `created_by_ID` int NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`photo_ID`),
  KEY `loan_ID` (`loan_ID`),
  KEY `created_by_ID` (`created_by_ID`),
  KEY `fk_user_userbook_id` (`user_book_ID`),
  KEY `fk_conflict_id` (`conflict_ID`),
  CONSTRAINT `fk_conflict_id` FOREIGN KEY (`conflict_ID`) REFERENCES `conflict` (`conflict_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_user_userbook_id` FOREIGN KEY (`user_book_ID`) REFERENCES `user_book` (`user_book_ID`) ON DELETE SET NULL,
  CONSTRAINT `photo_ibfk_2` FOREIGN KEY (`loan_ID`) REFERENCES `loan` (`loan_ID`),
  CONSTRAINT `photo_ibfk_4` FOREIGN KEY (`created_by_ID`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,1,1,NULL,1,'2025-09-01 08:00:00'),(2,2,2,NULL,2,'2025-09-01 09:00:00'),(3,3,3,NULL,3,'2025-09-01 10:00:00'),(4,4,4,NULL,4,'2025-09-01 11:00:00'),(5,5,5,NULL,5,'2025-09-01 12:00:00'),(6,6,6,NULL,6,'2025-09-01 13:00:00'),(7,7,7,NULL,7,'2025-09-01 14:00:00'),(8,8,8,NULL,8,'2025-09-01 15:00:00'),(9,9,9,NULL,9,'2025-09-01 16:00:00'),(10,10,10,NULL,10,'2025-09-01 17:00:00'),(11,11,11,NULL,11,'2025-09-01 18:00:00'),(12,12,12,NULL,12,'2025-09-01 19:00:00');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `request_ID` int NOT NULL AUTO_INCREMENT,
  `user_book_loc_ID` int NOT NULL,
  `requested_by_ID` int NOT NULL,
  `state` enum('offen','abgelehnt','angenommen') NOT NULL,
  PRIMARY KEY (`request_ID`),
  KEY `requested_by_ID` (`requested_by_ID`),
  KEY `fk_user_book_loc_id` (`user_book_loc_ID`),
  CONSTRAINT `fk_user_book_loc_id` FOREIGN KEY (`user_book_loc_ID`) REFERENCES `user_book_location` (`user_book_loc_ID`) ON DELETE CASCADE,
  CONSTRAINT `request_ibfk_2` FOREIGN KEY (`requested_by_ID`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,1,2,'offen'),(2,2,3,'angenommen'),(3,3,1,'offen'),(4,4,5,'offen'),(5,5,6,'angenommen'),(6,6,7,'offen'),(7,7,8,'offen'),(8,8,9,'abgelehnt'),(9,9,10,'offen'),(10,10,11,'angenommen'),(11,11,12,'offen'),(12,12,1,'abgelehnt'),(13,13,12,'offen'),(14,14,12,'offen'),(15,15,9,'angenommen'),(16,16,7,'angenommen');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_ID` int NOT NULL AUTO_INCREMENT,
  `reviewer_ID` int NOT NULL,
  `reviewed_user_ID` int NOT NULL,
  `loan_ID` int DEFAULT NULL,
  `friendly_contact` tinyint(1) NOT NULL,
  `reliability` tinyint(1) DEFAULT NULL,
  `condition_as_described` tinyint(1) DEFAULT NULL,
  `review_total` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`review_ID`),
  KEY `reviewer_ID` (`reviewer_ID`),
  KEY `reviewed_user_ID` (`reviewed_user_ID`),
  KEY `fk_loan_id` (`loan_ID`),
  CONSTRAINT `fk_loan_id` FOREIGN KEY (`loan_ID`) REFERENCES `loan` (`loan_ID`) ON DELETE SET NULL,
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`reviewer_ID`) REFERENCES `user` (`user_ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`reviewed_user_ID`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,2,1,5,5,5,5.0),(2,2,3,2,4,5,4,4.0),(3,3,4,3,5,4,5,5.0),(4,4,5,4,3,4,3,3.0),(5,5,6,5,5,5,4,5.0),(6,6,7,6,4,4,5,4.0),(7,7,8,7,5,5,5,5.0),(8,8,9,8,4,5,4,4.0),(9,9,10,9,5,4,5,5.0),(10,10,11,10,3,4,3,3.0),(11,11,12,11,4,4,4,4.0),(12,12,1,12,5,5,5,5.0);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_ID` int NOT NULL AUTO_INCREMENT,
  `address_ID` int NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `password_hash` varchar(64) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `about_me` text,
  PRIMARY KEY (`user_ID`),
  KEY `address_ID` (`address_ID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`address_ID`) REFERENCES `address` (`address_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'BuchFan88','Müller','Lena','hash1','lena.mueller@example.com','Liebt Thriller und Fantasy'),(2,2,'Leseratte99','Schmidt','Max','hash2','max.schmidt@example.com','Sammelt historische Romane'),(3,3,'PageTurner','Fischer','Anna','hash3','anna.fischer@example.com','Genießt Mangas und Sci-Fi'),(4,4,'BookWorm','Weber','Jonas','hash4','jonas.weber@example.com','Liest gerne Krimis und Fachbücher'),(5,5,'NovelAddict','Becker','Sophie','hash5','sophie.becker@example.com','Fantasy und Young Adult-Fan'),(6,6,'ReadLover','Schneider','Tim','hash6','tim.schneider@example.com','Thriller und RomCom'),(7,7,'StorySeeker','Hoffmann','Laura','hash7','laura.hoffmann@example.com','Historische Dramen und Regionalkrimis'),(8,8,'Bibliophile','Richter','Paul','hash8','paul.richter@example.com','Science Fiction und Dystopien'),(9,9,'BookNerd','Klein','Marie','hash9','marie.klein@example.com','Alles rund um Fantasy'),(10,10,'LitLover','Wolf','Niklas','hash10','niklas.wolf@example.com','RomCom und Drama allgemein'),(11,11,'NovelSeeker','Neumann','Lea','hash11','lea.neumann@example.com','Psychothriller und Thriller allgemein'),(12,12,'PageHunter','Schulz','Felix','hash12','felix.schulz@example.com','Sachbücher und Ratgeber'),(13,6,'Tolkienator','Schneider','Diana','hash13','diditolki@example.com','Ich liebe alles.');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_book`
--

DROP TABLE IF EXISTS `user_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_book` (
  `user_book_ID` int NOT NULL AUTO_INCREMENT,
  `user_ID` int NOT NULL,
  `book_ID` int NOT NULL,
  `condition_book` varchar(100) NOT NULL,
  `description_book` text NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_book_ID`),
  KEY `fk_user_id` (`user_ID`),
  KEY `fk_userbook_bookid` (`book_ID`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE,
  CONSTRAINT `fk_userbook_bookid` FOREIGN KEY (`book_ID`) REFERENCES `book` (`book_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_book`
--

LOCK TABLES `user_book` WRITE;
/*!40000 ALTER TABLE `user_book` DISABLE KEYS */;
INSERT INTO `user_book` VALUES (1,1,1,'gut','Toller Thriller','selten ausgeliehen'),(2,1,5,'gut','Poznanskis Erstling, super',NULL),(3,2,2,'in Ordnung','RomCom',NULL),(4,3,4,'neu','Taschenbuch',NULL),(5,4,3,'gebraucht','Klassiker','bitte gut drauf aufpassen'),(6,5,7,'gut','Der erste Band','nichts für Kinder'),(7,5,8,'wie neu','Der zweite Band','nichts für Kinder'),(8,6,1,'wie neu','Spannend!','kleiner Fleck auf Seite 20'),(9,7,7,'wie neu','Action-Manga, brutal',NULL),(10,8,11,'gebraucht','Toller Klassiker','Vorsichtig behandeln'),(11,9,14,'wie neu','Beklemmend, aber faszinierend','Beachtet auch meine anderen Bücher!'),(12,9,10,'gebraucht','Süße RomCom','Beachtet auch meine anderen Bücher!'),(13,10,9,'gebraucht','Interessante Fantasy',NULL),(14,11,4,'gut','Verrückt, aber gut',NULL),(15,12,12,'gut','Der beste Detektiv bei der Arbeit',NULL),(16,13,15,'okay','Hat mir das Leben gerettet','Der Zeitraum ist flexibel :)');
/*!40000 ALTER TABLE `user_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_book_location`
--

DROP TABLE IF EXISTS `user_book_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_book_location` (
  `user_book_loc_ID` int NOT NULL AUTO_INCREMENT,
  `user_book_ID` int NOT NULL,
  `location_ID` int DEFAULT NULL,
  `available_ID` int DEFAULT NULL,
  PRIMARY KEY (`user_book_loc_ID`),
  KEY `fk_user_bookloc_id` (`user_book_ID`),
  KEY `fk_location_id` (`location_ID`),
  KEY `fk_available_id` (`available_ID`),
  CONSTRAINT `fk_available_id` FOREIGN KEY (`available_ID`) REFERENCES `available` (`available_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_location_id` FOREIGN KEY (`location_ID`) REFERENCES `location` (`location_ID`) ON DELETE SET NULL,
  CONSTRAINT `fk_user_bookloc_id` FOREIGN KEY (`user_book_ID`) REFERENCES `user_book` (`user_book_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_book_location`
--

LOCK TABLES `user_book_location` WRITE;
/*!40000 ALTER TABLE `user_book_location` DISABLE KEYS */;
INSERT INTO `user_book_location` VALUES (1,1,1,2),(2,2,1,1),(3,3,2,3),(4,4,6,4),(5,5,9,5),(6,6,9,5),(7,7,9,5),(8,8,4,6),(9,9,7,10),(10,10,3,11),(11,11,5,9),(12,12,5,1),(13,13,4,2),(14,14,11,12),(15,15,5,3),(16,16,8,8);
/*!40000 ALTER TABLE `user_book_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlist_ID` int NOT NULL AUTO_INCREMENT,
  `saved_by_ID` int NOT NULL,
  `name_wishlist` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`wishlist_ID`),
  KEY `saved_by_ID` (`saved_by_ID`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`saved_by_ID`) REFERENCES `user` (`user_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (13,1,'Thriller-Favoriten'),(14,2,'Fantasy-Abenteuer'),(15,3,'Sommerromane'),(16,4,'Manga-Sammlung'),(17,5,'Historische Romane'),(18,6,NULL),(19,7,'Ratgeber & Self-Help'),(20,8,'Science-Fiction Hits'),(21,9,'Detektivgeschichten'),(22,10,'Psychothriller'),(23,11,'Drama allgemein'),(24,12,NULL);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_user`
--

DROP TABLE IF EXISTS `wishlist_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_user` (
  `wishlist_ID` int NOT NULL,
  `user_book_ID` int NOT NULL,
  PRIMARY KEY (`wishlist_ID`,`user_book_ID`),
  KEY `user_book_ID` (`user_book_ID`),
  CONSTRAINT `wishlist_user_ibfk_1` FOREIGN KEY (`wishlist_ID`) REFERENCES `wishlist` (`wishlist_ID`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_user_ibfk_2` FOREIGN KEY (`user_book_ID`) REFERENCES `user_book` (`user_book_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_user`
--

LOCK TABLES `wishlist_user` WRITE;
/*!40000 ALTER TABLE `wishlist_user` DISABLE KEYS */;
INSERT INTO `wishlist_user` VALUES (13,1),(14,2),(15,3),(16,4),(17,5),(18,6),(19,7),(20,8),(21,9),(22,10),(23,11),(24,12);
/*!40000 ALTER TABLE `wishlist_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-26  9:14:24
