-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Batting Statistics`
--

DROP TABLE IF EXISTS `Batting Statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Batting Statistics` (
  `Player ID` int NOT NULL,
  `Position` int NOT NULL,
  `Runs scored` int NOT NULL,
  `Highest Score` int NOT NULL,
  `Batting average` int NOT NULL,
  `100s` int NOT NULL,
  `Strike rate` float NOT NULL,
  `4s` int NOT NULL,
  `6s` int NOT NULL,
  `Squad ID` int NOT NULL,
  PRIMARY KEY (`Player ID`),
  KEY `Squad ID` (`Squad ID`),
  CONSTRAINT `Batting Statistics_ibfk_1` FOREIGN KEY (`Player ID`) REFERENCES `Statistics` (`Player ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Batting Statistics_ibfk_2` FOREIGN KEY (`Squad ID`) REFERENCES `Squads` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Batting Statistics`
--

LOCK TABLES `Batting Statistics` WRITE;
/*!40000 ALTER TABLE `Batting Statistics` DISABLE KEYS */;
INSERT INTO `Batting Statistics` VALUES (1,1,648,140,81,5,98.33,67,14,1),(2,2,647,166,72,3,89.36,66,8,2),(3,3,606,124,87,2,96.03,60,2,8),(4,4,578,148,83,2,74.96,50,3,4),(5,5,556,107,62,2,89.53,48,2,3),(6,6,532,111,48,2,92.84,67,11,3),(7,7,507,153,51,2,102.01,50,2,2),(8,8,474,101,68,1,87.77,38,11,5),(9,9,465,89,66,0,93.18,51,12,3),(10,10,443,153,63,1,115.36,38,2,3),(11,11,443,82,55,0,94.05,36,4,1),(12,12,387,100,65,1,89.58,33,2,7),(13,13,379,85,38,0,85.94,46,2,2),(14,14,375,85,63,0,104.16,26,22,2),(15,15,371,148,41,1,111.07,30,2,3),(16,16,367,102,52,1,92.67,33,10,8),(17,17,367,118,52,1,100.27,31,5,9),(18,18,361,111,45,1,77.46,29,2,1),(19,19,350,82,39,0,75.26,30,1,4),(20,20,316,89,35,0,88.26,31,5,2),(21,21,312,103,35,1,122.83,22,8,3),(22,22,311,95,62,0,90.4,14,10,7),(23,23,305,100,38,1,76.25,31,1,5),(24,24,305,68,38,0,86.89,34,4,7);
/*!40000 ALTER TABLE `Batting Statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bowling Statistics`
--

DROP TABLE IF EXISTS `Bowling Statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bowling Statistics` (
  `Player ID` int NOT NULL,
  `Position` int NOT NULL,
  `Overs` float NOT NULL,
  `Maidens` int NOT NULL,
  `Wickets` int NOT NULL,
  `Economy` float NOT NULL,
  `Best performance` varchar(30) NOT NULL,
  `Bowling average` float NOT NULL,
  `Strike rate` float NOT NULL,
  `5 wicket hauls` int NOT NULL,
  `Squad ID` int NOT NULL,
  PRIMARY KEY (`Player ID`),
  KEY `Squad ID` (`Squad ID`),
  CONSTRAINT `Bowling Statistics_ibfk_1` FOREIGN KEY (`Player ID`) REFERENCES `Statistics` (`Player ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Bowling Statistics_ibfk_2` FOREIGN KEY (`Squad ID`) REFERENCES `Squads` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bowling Statistics`
--

LOCK TABLES `Bowling Statistics` WRITE;
/*!40000 ALTER TABLE `Bowling Statistics` DISABLE KEYS */;
INSERT INTO `Bowling Statistics` VALUES (25,1,92.2,5,27,5.43,'0.192307692',18.59,20.5,2,2),(26,2,83.4,3,21,4.88,'0.108108108',19.47,23.9,0,4),(27,3,100.5,8,20,4.57,'0.111111111',23.05,30.2,0,3),(28,4,72.1,2,20,6.7,'0.084745762',24.2,21.6,2,8),(29,5,84,9,18,4.41,'0.072727272',20.61,28,0,1),(30,6,89.4,2,18,5.16,'0.166666666',25.72,29.8,0,3),(31,7,73,5,17,4.9,'0.166666666',21.05,25.7,1,5),(32,8,99,4,17,4.83,'0.133333333',28.17,34.9,0,4),(33,9,47.1,3,16,4.96,'0.171428571',14.62,17.6,1,5),(34,10,85,6,16,5.24,'0.150000000',27.87,31.8,0,3),(35,11,54.3,2,15,5.35,'0.161290322',19.46,21.8,1,4),(36,12,35.1,2,14,5.48,'0.072463768',13.78,15,1,1),(37,13,80.2,5,14,4.87,'0.085106382',28,34.4,0,4),(38,14,86.1,6,14,4.95,'0.090909090',30.5,36.9,0,2),(39,15,63.4,5,13,5.35,'0.230769230',26.23,29.3,0,7),(40,16,61.4,4,13,6.04,'0.093023255',28.69,28.4,0,6),(41,17,58,2,13,7.18,'0.041666666',32.07,26.7,0,8),(42,18,67,2,12,5.85,'0.071428571',32.66,33.5,0,9),(43,19,74,0,12,5.97,'0.078431372',36.83,37,0,1),(44,20,56,0,11,4.85,'0.071428571',24.72,30.5,0,3),(45,21,61.5,2,11,5.43,'0.111111111',30.54,33.7,0,7),(46,22,76,0,11,4.92,'0.137931034',34,41.4,0,7),(47,23,78,4,11,5.08,'0.053571428',36.09,42.5,0,7),(48,24,66.4,1,11,6,'0.065217391',36.36,36.3,0,5),(49,25,92,0,11,5.71,'0.055555555',47.81,50.1,0,3),(50,26,51.4,1,10,5.2,'0.069767441',26.9,31,0,1),(51,27,72.4,0,10,4.61,'0.133333333',33.5,43.6,0,10),(52,28,79,1,10,5.65,'0.050000000',44.7,47.4,0,1);
/*!40000 ALTER TABLE `Bowling Statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equal_Points`
--

DROP TABLE IF EXISTS `Equal_Points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Equal_Points` (
  `Team A` varchar(25) NOT NULL,
  `Team B` varchar(25) NOT NULL,
  `Points` int NOT NULL,
  PRIMARY KEY (`Team A`,`Team B`),
  KEY `Team B` (`Team B`),
  CONSTRAINT `Equal_Points_ibfk_1` FOREIGN KEY (`Team B`) REFERENCES `Points Table` (`Team Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Equal_Points_ibfk_2` FOREIGN KEY (`Team A`) REFERENCES `Points Table` (`Team Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equal_Points`
--

LOCK TABLES `Equal_Points` WRITE;
/*!40000 ALTER TABLE `Equal_Points` DISABLE KEYS */;
INSERT INTO `Equal_Points` VALUES ('New Zealand','Pakistan',11),('South Africa','Bangladesh',7);
/*!40000 ALTER TABLE `Equal_Points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fixtures`
--

DROP TABLE IF EXISTS `Fixtures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fixtures` (
  `Match ID` int NOT NULL AUTO_INCREMENT,
  `Team 1` varchar(25) NOT NULL,
  `Team 2` varchar(25) NOT NULL,
  `Venue` varchar(50) NOT NULL,
  `Date & Time` varchar(50) NOT NULL,
  `Ground Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Match ID`),
  KEY `Ground Name` (`Ground Name`),
  CONSTRAINT `Fixtures_ibfk_1` FOREIGN KEY (`Ground Name`) REFERENCES `Grounds` (`Ground Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fixtures`
--

LOCK TABLES `Fixtures` WRITE;
/*!40000 ALTER TABLE `Fixtures` DISABLE KEYS */;
INSERT INTO `Fixtures` VALUES (1,'England','South Africa','London','May 30 2019','The Oval'),(2,'Pakistan','West Indies','Nottingham','May 31 2019','Trent Bridge'),(3,'Sri Lanka','New Zealand','Cardiff','June 1 2019','Cardiff Wales Stadium'),(4,'Afghanistan','Australia','Bristol','June 1 2019','Bristol County Ground'),(5,'Bangladesh','South Africa','London','June 2 2019','The Oval'),(6,'Pakistan','England','Nottingham','June 3 2019','Trent Bridge'),(7,'Sri Lanka','Afghanistan','Cardiff','June 4 2019','Cardiff Wales Stadium'),(8,'South Africa','India','Southampton','June 5 2019','Rose Bowl'),(9,'Bangladesh','New Zealand','London','June 5 2019','The Oval'),(10,'Australia','West Indies','Nottingham','June 6 2019','Trent Bridge'),(11,'Pakiatan','Sri Lanka','Bristol','June 7 2019','Bristol County Ground'),(12,'England','Bangladesh','Cardiff','June 8 2019','Cardiff Wales Stadium'),(13,'Afghanistan','New Zealand','Taunton','June 8 2019','County Ground'),(14,'India','Australia','London','June 9 2019','The Oval'),(15,'South Africa','West Indies','Southampton','June 10 2019','Rose Bowl'),(16,'Bangladesh','Sri Lanka','Bristol','June 11 2019','Bristol County Ground'),(17,'Australia','Pakistan','Taunton','June 12 2019','County Ground'),(18,'India','New Zealand','Nottingham','June 13 2019','Trent Bridge'),(19,'West Indies','England','Southampton','June 14 2019','Rose Bowl'),(20,'Australia','Sri Lanka','London','June 15 2019','The Oval'),(21,'Afghanistan','South Africa','Cardiff','June 15 2019','Cardiff Wales Stadium'),(22,'India','Pakistan','Manchester','June 16 2019','Old Trafford'),(23,'West Indies','Bangladesh','Taunton','June 17 2019','County Ground'),(24,'England','Afghanistan','Manchester','June 18 2019','Old Trafford'),(25,'South Africa','New Zealand','Birmingham','June 19 2019','Edgbaston'),(26,'Australia','Bangladesh','Nottingham','June 20 2019','Trent Bridge'),(27,'Sri Lanka','England','Leeds','June 21 2019','Yorkshire'),(28,'India','Afghanistan','Southampton','June 22 2019','Rose Bowl'),(29,'New Zealand','West Indies','Manchester','June 22 2019','Old Trafford'),(30,'Pakistan','South Africa','London','June 23 2019','Lord\'s'),(31,'Bangladesh','Afghanistan','Southampton','June 24 2019','Rose Bowl'),(32,'Australia','England','London','June 25 2019','Lord\'s'),(33,'New Zealand','Pakistan','Birmingham','June 26 2019','Edgbaston'),(34,'India','West Indies','Manchester','June 27 2019','Old Trafford'),(35,'Sri Lanka','South Africa','Chester-le-Street','June 28 2019','Riverside Ground'),(36,'Afghanistan','Pakistan','Leeds','June 29 2019','Yorkshire'),(37,'Australia','New Zealand','London','June 29 2019','Lord\'s'),(38,'England','India','Birmingham','June 30 2019','Edgbaston'),(39,'Sri Lanka','West Indies','Chester-le-Street','July 1 2019','Riverside Ground'),(40,'India','Bangladesh','Birmingham','July 2 2019','Edgbaston'),(41,'England','New Zealand','Chester-le-Street','July 3 2019','Riverside Ground'),(42,'West Indies','Afghanistan','Leeds','July 4 2019','Yorkshire'),(43,'Pakistan','Bangladesh','London','July 5 2019','Lord\'s'),(44,'Sri Lanka','India','Leeds','July 6 2019','Yorkshire'),(45,'South Africa','Australia','Manchester','July 6 2019','Old Trafford'),(46,'New Zealand','India','Manchester','July 9 2019','Old Trafford'),(47,'Australia','England','Birmingham','July 11 2019','Edgbaston'),(48,'New Zealand','England','London','July 14 2019','Lord\'s');
/*!40000 ALTER TABLE `Fixtures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gallery`
--

DROP TABLE IF EXISTS `Gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gallery` (
  `Match ID` int NOT NULL,
  `Photos` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`Match ID`),
  CONSTRAINT `Gallery_ibfk_1` FOREIGN KEY (`Match ID`) REFERENCES `Fixtures` (`Match ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gallery`
--

LOCK TABLES `Gallery` WRITE;
/*!40000 ALTER TABLE `Gallery` DISABLE KEYS */;
INSERT INTO `Gallery` VALUES (8,'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201906/indvsabroadcast.jpeg?d5M_EL8slrwTmxkCCR8B9tJ7rhXczUFN&size=770:433'),(10,'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201906/AUSvWI06062019.jpeg?PWGNYRiFuWsxYuPuE0KlMS58jLba6IVR&size=770:433'),(22,'https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2019/06/16/Pictures/icc-cricket-world-cup-india-v-pakistan_4b220bbc-9063-11e9-bf7d-e03ff1c1f16f.jpg'),(34,'https://img.jagranjosh.com/imported/images/E/Others/India-vs-West-Indies-wicket.webp'),(38,'https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2019/07/01/Pictures/icc-cricket-world-cup-england-v-india_f89fa6b0-9bd4-11e9-8ce4-a310e1a81ef5.jpg'),(43,'https://www.pinkvilla.com/files/styles/contentpreview/public/gettyimages-1158031595-612x612.jpg?itok=2h46Dznh'),(44,'https://english.cdn.zeenews.com/sites/default/files/2019/07/06/801629-d-zynzuwsaanhav.jpg'),(46,'https://bsmedia.business-standard.com/_media/bs/img/article/2019-07/10/full/1562761521-6301.jpg'),(47,'https://img1.hscicdn.com/image/upload/f_auto/lsci/db/PICTURES/CMS/292000/292089.4.jpg'),(48,'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201907/2019-07-14T191203Z_1194229943_.png?pY3OGyLd0XQcRlY.7MT.0lvMhAnieN3n&size=770:433');
/*!40000 ALTER TABLE `Gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ground_Matches`
--

DROP TABLE IF EXISTS `Ground_Matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ground_Matches` (
  `Ground Name` varchar(50) NOT NULL,
  `Match ID` int NOT NULL,
  PRIMARY KEY (`Ground Name`,`Match ID`),
  CONSTRAINT `Ground_Matches_ibfk_1` FOREIGN KEY (`Ground Name`) REFERENCES `Grounds` (`Ground Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ground_Matches`
--

LOCK TABLES `Ground_Matches` WRITE;
/*!40000 ALTER TABLE `Ground_Matches` DISABLE KEYS */;
INSERT INTO `Ground_Matches` VALUES ('Bristol County Ground',4),('Bristol County Ground',11),('Bristol County Ground',16),('Cardiff Wales Stadium',3),('Cardiff Wales Stadium',7),('Cardiff Wales Stadium',12),('Cardiff Wales Stadium',21),('County Ground',13),('County Ground',17),('County Ground',23),('Edgbaston',25),('Edgbaston',33),('Edgbaston',38),('Edgbaston',40),('Edgbaston',47),('Lord\'s',30),('Lord\'s',32),('Lord\'s',37),('Lord\'s',43),('Lord\'s',48),('Old Trafford',22),('Old Trafford',24),('Old Trafford',29),('Old Trafford',34),('Old Trafford',45),('Old Trafford',46),('Riverside Ground',35),('Riverside Ground',39),('Riverside Ground',41),('Rose Bowl',8),('Rose Bowl',15),('Rose Bowl',19),('Rose Bowl',28),('Rose Bowl',31),('The Oval',1),('The Oval',5),('The Oval',9),('The Oval',14),('The Oval',20),('Trent Bridge',2),('Trent Bridge',6),('Trent Bridge',10),('Trent Bridge',18),('Trent Bridge',26),('Yorkshire',27),('Yorkshire',36),('Yorkshire',42),('Yorkshire',44);
/*!40000 ALTER TABLE `Ground_Matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grounds`
--

DROP TABLE IF EXISTS `Grounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Grounds` (
  `Ground Name` varchar(50) NOT NULL,
  `Country` varchar(25) NOT NULL,
  `City` varchar(25) NOT NULL,
  PRIMARY KEY (`Ground Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grounds`
--

LOCK TABLES `Grounds` WRITE;
/*!40000 ALTER TABLE `Grounds` DISABLE KEYS */;
INSERT INTO `Grounds` VALUES ('Bristol County Ground','England','Bristol'),('Cardiff Wales Stadium','England','Cardiff'),('County Ground','England','Taunton'),('Edgbaston','England','Birmingham'),('Lord\'s','England','London'),('Old Trafford','England','Manchester'),('Riverside Ground','England','Chester-Le-Street'),('Rose Bowl','England','Southampton'),('The Oval','England','London'),('Trent Bridge','England','Nottingham'),('Yorkshire','England','Leeds');
/*!40000 ALTER TABLE `Grounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Matches`
--

DROP TABLE IF EXISTS `Matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Matches` (
  `Match ID` int NOT NULL,
  `Ground Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Match ID`,`Ground Name`),
  KEY `Ground Name` (`Ground Name`),
  CONSTRAINT `Matches_ibfk_1` FOREIGN KEY (`Ground Name`) REFERENCES `Grounds` (`Ground Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Matches_ibfk_2` FOREIGN KEY (`Match ID`) REFERENCES `Fixtures` (`Match ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Matches_ibfk_3` FOREIGN KEY (`Match ID`) REFERENCES `Results` (`Match ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Matches_ibfk_4` FOREIGN KEY (`Match ID`) REFERENCES `Gallery` (`Match ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matches`
--

LOCK TABLES `Matches` WRITE;
/*!40000 ALTER TABLE `Matches` DISABLE KEYS */;
INSERT INTO `Matches` VALUES (4,'Bristol County Ground'),(11,'Bristol County Ground'),(16,'Bristol County Ground'),(3,'Cardiff Wales Stadium'),(7,'Cardiff Wales Stadium'),(12,'Cardiff Wales Stadium'),(21,'Cardiff Wales Stadium'),(13,'County Ground'),(17,'County Ground'),(23,'County Ground'),(25,'Edgbaston'),(33,'Edgbaston'),(38,'Edgbaston'),(40,'Edgbaston'),(47,'Edgbaston'),(30,'Lord\'s'),(32,'Lord\'s'),(37,'Lord\'s'),(43,'Lord\'s'),(48,'Lord\'s'),(22,'Old Trafford'),(24,'Old Trafford'),(29,'Old Trafford'),(34,'Old Trafford'),(45,'Old Trafford'),(46,'Old Trafford'),(35,'Riverside Ground'),(39,'Riverside Ground'),(41,'Riverside Ground'),(8,'Rose Bowl'),(15,'Rose Bowl'),(19,'Rose Bowl'),(28,'Rose Bowl'),(31,'Rose Bowl'),(1,'The Oval'),(5,'The Oval'),(9,'The Oval'),(14,'The Oval'),(20,'The Oval'),(2,'Trent Bridge'),(6,'Trent Bridge'),(10,'Trent Bridge'),(18,'Trent Bridge'),(26,'Trent Bridge'),(27,'Yorkshire'),(36,'Yorkshire'),(42,'Yorkshire'),(44,'Yorkshire');
/*!40000 ALTER TABLE `Matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Points Table`
--

DROP TABLE IF EXISTS `Points Table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Points Table` (
  `Team Name` varchar(25) NOT NULL,
  `Position` int NOT NULL,
  `Matches Played` int NOT NULL,
  `Matches Won` int NOT NULL,
  `Matches Lost` int NOT NULL,
  `Matches Tied` int NOT NULL,
  `Matches Abandoned` int NOT NULL,
  `Net Run Rate` float NOT NULL,
  `Points` int NOT NULL,
  `Squad ID` int NOT NULL,
  PRIMARY KEY (`Team Name`),
  UNIQUE KEY `Position` (`Position`),
  KEY `Squad ID` (`Squad ID`),
  CONSTRAINT `Points Table_ibfk_1` FOREIGN KEY (`Squad ID`) REFERENCES `Squads` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Points Table`
--

LOCK TABLES `Points Table` WRITE;
/*!40000 ALTER TABLE `Points Table` DISABLE KEYS */;
INSERT INTO `Points Table` VALUES ('Afghanistan',10,9,0,9,0,0,-1.322,0,10),('Australia',2,9,7,2,0,0,0.868,14,2),('Bangladesh',8,9,3,5,0,1,-0.41,7,8),('England',3,9,6,3,0,0,1.152,12,3),('India',1,9,7,1,0,1,0.809,15,1),('New Zealand',4,9,5,3,0,1,0.175,11,4),('Pakistan',5,9,5,3,0,1,-0.43,11,5),('South Africa',7,9,3,5,0,1,-0.03,7,7),('Sri Lanka',6,9,3,4,0,2,-0.919,8,6),('West Indies',9,9,2,6,0,1,-0.225,5,9);
/*!40000 ALTER TABLE `Points Table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Results`
--

DROP TABLE IF EXISTS `Results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Results` (
  `Match ID` int NOT NULL,
  `Team 1 Score` varchar(50) DEFAULT NULL,
  `Team 2 Score` varchar(50) DEFAULT NULL,
  `Winner` varchar(25) DEFAULT NULL,
  `Win margin` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Match ID`),
  CONSTRAINT `Results_ibfk_1` FOREIGN KEY (`Match ID`) REFERENCES `Fixtures` (`Match ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Results`
--

LOCK TABLES `Results` WRITE;
/*!40000 ALTER TABLE `Results` DISABLE KEYS */;
INSERT INTO `Results` VALUES (1,'311/8','207/10','England','104 runs'),(2,'105','108/3','West Indies','7 wickets'),(3,'136/10','137/0','New Zealand','10 wickets'),(4,'207/10','209/3','Australia','7 wickets'),(5,'330/6','309/8','Bangladesh','21 runs'),(6,'348/8','334/9','Pakistan','14 runs'),(7,'201/10','152/10','Sri Lanka','34 runs (DL)'),(8,'227/9','230/4','India','6 wickets'),(9,'244/10','248/8','New Zealand','2 wickets'),(10,'288/10','273/9','Australia','15 runs'),(11,NULL,NULL,NULL,NULL),(12,'386/6','280/10','England','106 runs'),(13,'172/10','173/3','New Zealand','7 wickets'),(14,'352/5','316/10','India','36 runs'),(15,NULL,NULL,NULL,NULL),(16,NULL,NULL,NULL,NULL),(17,'307/10','266/10','AUstralia','41 runs'),(18,NULL,NULL,NULL,NULL),(19,'212/10','213/2','England','8 wickets'),(20,'334/7','247','Australia','87 runs'),(21,'125/10','131/1','South Africa','9 wickets'),(22,'336/5','212/6 (40 overs)','India','89 runs (D/L)'),(23,'321/8','322/3','Bangladesh','7 wickets'),(24,'397/6','247/8','England','150 runs'),(25,'241/6','245/6','New Zealand','4 wickets'),(26,'381/6','333/8','Australia','48 runs'),(27,'232/9','212/10','Sri Lanka','20 runs'),(28,'224/8','213/10','India','11 runs'),(29,'291/8','286/10','New Zealand','5 runs'),(30,'308/7','259/9','Pakistan','49 runs'),(31,'262/7','200/10','Bangladesh','62 runs'),(32,'285/7','221/10','Australia','64 runs'),(33,'237/6','241/4','Pakistan','4 wickets'),(34,'268/7','143/10','India','125 runs'),(35,'203/10','206/1','South Africa','9 wickets'),(36,'227/9','230/7','Pakistan','3 runs'),(37,'243/9','157/10','Australia','86 runs'),(38,'337/7','306/5','England','31 runs'),(39,'338/6','315/9','Sri Lanka','23 runs'),(40,'314/9','286/10','India','28 runs'),(41,'305/8','186/10','England','119 runs'),(42,'311/6','288/10','West Indies','23 runs'),(43,'315/9','221/10','Pakistan','94 runs'),(44,'264/7','265/3','India','7 wickets'),(45,'325/6','315/10','South Africa','10 runs'),(46,'239/8','221/10','New Zealand','18 runs'),(47,'223/10','226/2','England','8 wickets'),(48,'241/8','241/10','England','England won on boundary count');
/*!40000 ALTER TABLE `Results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Squad_Member_Role`
--

DROP TABLE IF EXISTS `Squad_Member_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Squad_Member_Role` (
  `Squad ID` int NOT NULL,
  `Player ID` int NOT NULL,
  `Role` varchar(25) NOT NULL,
  PRIMARY KEY (`Squad ID`,`Player ID`,`Role`),
  KEY `Player ID` (`Player ID`),
  CONSTRAINT `Squad_Member_Role_ibfk_1` FOREIGN KEY (`Squad ID`) REFERENCES `Squad_Members` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Squad_Member_Role_ibfk_2` FOREIGN KEY (`Player ID`) REFERENCES `Squad_Members` (`Player ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Squad_Member_Role`
--

LOCK TABLES `Squad_Member_Role` WRITE;
/*!40000 ALTER TABLE `Squad_Member_Role` DISABLE KEYS */;
INSERT INTO `Squad_Member_Role` VALUES (1,1,'Batsman'),(2,2,'Batsman'),(8,3,'Batsman'),(8,3,'Bowler'),(4,4,'Batsman'),(3,5,'Batsman'),(3,6,'Batsman'),(3,6,'Wicket-Keeper'),(2,7,'Batsman'),(5,8,'Batsman'),(3,9,'Batsman'),(3,9,'Bowler'),(3,10,'Batsman'),(1,11,'Batsman'),(7,12,'Batsman'),(2,13,'Batsman'),(2,14,'Batsman'),(2,14,'Wicket-Keeper'),(3,15,'Batsman'),(8,16,'Batsman'),(8,16,'Wicket-Keeper'),(9,17,'Batsman'),(9,17,'Wicket-Keeper'),(1,18,'Batsman'),(1,18,'Wicket-Keeper'),(4,19,'Batsman'),(2,20,'Batsman'),(3,21,'Batsman'),(3,21,'Wicket-Keeper'),(7,22,'Batsman'),(5,23,'Batsman'),(7,24,'Batsman'),(7,24,'Wicket-Keeper'),(2,25,'Bowler'),(4,26,'Bowler'),(3,27,'Bowler'),(8,28,'Bowler'),(1,29,'Bowler'),(3,30,'Bowler'),(5,31,'Bowler'),(4,32,'Bowler'),(5,33,'Bowler'),(3,34,'Batsman'),(3,34,'Bowler'),(4,35,'Batsman'),(4,35,'Bowler'),(1,36,'Bowler'),(4,37,'Bowler'),(2,38,'Bowler'),(7,39,'Batsman'),(7,39,'Bowler'),(6,40,'Bowler'),(8,41,'Batsman'),(8,41,'Bowler'),(9,42,'Bowler'),(1,43,'Bowler'),(3,44,'Bowler'),(7,45,'Batsman'),(7,45,'Bowler'),(7,46,'Bowler'),(7,47,'Bowler'),(5,48,'Bowler'),(3,49,'Bowler'),(1,50,'Bowler'),(10,51,'Batsman'),(10,51,'Bowler'),(1,52,'Batsman'),(1,52,'Bowler');
/*!40000 ALTER TABLE `Squad_Member_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Squad_Members`
--

DROP TABLE IF EXISTS `Squad_Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Squad_Members` (
  `Squad ID` int NOT NULL,
  `Player ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Squad ID`,`Player ID`),
  UNIQUE KEY `Player ID` (`Player ID`),
  CONSTRAINT `Squad_Members_ibfk_1` FOREIGN KEY (`Squad ID`) REFERENCES `Squads` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Squad_Members`
--

LOCK TABLES `Squad_Members` WRITE;
/*!40000 ALTER TABLE `Squad_Members` DISABLE KEYS */;
INSERT INTO `Squad_Members` VALUES (1,1,'RG Sharma'),(1,11,'V Kohli'),(1,18,'KL Rahul'),(1,29,'JJ Bumrah'),(1,36,'Mohammed Shami'),(1,43,'YS Chahal'),(1,50,'B Kumar'),(1,52,'HH Pandya'),(2,2,'DA Warner'),(2,7,'AJ Finch'),(2,13,'SPD Smith'),(2,14,'AT Carey'),(2,20,'UT Khawaja'),(2,25,'MA Starc'),(2,38,'PJ Cummins'),(3,5,'JE Root'),(3,6,'JM Bairstow'),(3,9,'BA Stokes'),(3,10,'JJ Roy'),(3,15,'EJG Morgan'),(3,21,'JC Buttler'),(3,27,'JC Archer'),(3,30,'MA Wood'),(3,34,'CR Woakes'),(3,44,'LE Plunkett'),(3,49,'AU Rashid'),(4,4,'KS Williamson'),(4,19,'LRPL Taylor'),(4,26,'LH Ferguson'),(4,32,'TA Boult'),(4,35,'JDS Neesham'),(4,37,'MJ Henry'),(5,8,'Babar Azam'),(5,23,'Imam-ul-Haq'),(5,31,'Mohammad Amir'),(5,33,'Shaheen Shah Afridi'),(5,48,'Wahab Riaz'),(6,40,'SL Malinga'),(7,12,'F du Plessis'),(7,22,'HE van der Dussen'),(7,24,'Q de Kock'),(7,39,'CH Morris'),(7,45,'AL Phehlukwayo'),(7,46,'Imran Tahir'),(7,47,'K Rabada'),(8,3,'Shakib Al Hasan'),(8,16,'Mushfiqur Rahim'),(8,28,'Mustafizur Rahman'),(8,41,'Mohammad Saifuddin'),(9,17,'N Pooran'),(9,42,'SS Cottrell'),(10,51,'Mohammad Nabi');
/*!40000 ALTER TABLE `Squad_Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Squads`
--

DROP TABLE IF EXISTS `Squads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Squads` (
  `Squad ID` int NOT NULL AUTO_INCREMENT,
  `Squad Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Squad ID`),
  UNIQUE KEY `Squad Name` (`Squad Name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Squads`
--

LOCK TABLES `Squads` WRITE;
/*!40000 ALTER TABLE `Squads` DISABLE KEYS */;
INSERT INTO `Squads` VALUES (10,'Afghanistan'),(2,'Australia'),(8,'Bangladesh'),(3,'England'),(1,'India'),(4,'New Zealand'),(5,'Pakistan'),(7,'South Africa'),(6,'Sri Lanka'),(9,'West Indies');
/*!40000 ALTER TABLE `Squads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Squads_Statistics`
--

DROP TABLE IF EXISTS `Squads_Statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Squads_Statistics` (
  `Squad ID` int NOT NULL,
  `Player ID` int NOT NULL,
  PRIMARY KEY (`Squad ID`,`Player ID`),
  KEY `Player ID` (`Player ID`),
  CONSTRAINT `Squads_Statistics_ibfk_1` FOREIGN KEY (`Squad ID`) REFERENCES `Squads` (`Squad ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Squads_Statistics_ibfk_2` FOREIGN KEY (`Player ID`) REFERENCES `Bowling Statistics` (`Player ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Squads_Statistics_ibfk_3` FOREIGN KEY (`Player ID`) REFERENCES `Batting Statistics` (`Player ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Squads_Statistics`
--

LOCK TABLES `Squads_Statistics` WRITE;
/*!40000 ALTER TABLE `Squads_Statistics` DISABLE KEYS */;
INSERT INTO `Squads_Statistics` VALUES (1,1),(2,2),(8,3),(4,4),(3,5),(3,6),(2,7),(5,8),(3,9),(3,10),(1,11),(7,12),(2,13),(2,14),(3,15),(8,16),(9,17),(1,18),(4,19),(2,20),(3,21),(7,22),(5,23),(7,24),(2,25),(4,26),(3,27),(8,28),(1,29),(3,30),(5,31),(4,32),(5,33),(3,34),(4,35),(1,36),(4,37),(2,38),(7,39),(6,40),(8,41),(9,42),(1,43),(3,44),(7,45),(7,46),(7,47),(5,48),(3,49),(1,50),(10,51),(1,52);
/*!40000 ALTER TABLE `Squads_Statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Statistics`
--

DROP TABLE IF EXISTS `Statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Statistics` (
  `Player ID` int NOT NULL,
  `Player Name` varchar(30) NOT NULL,
  `Matches Played` int NOT NULL,
  PRIMARY KEY (`Player ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Statistics`
--

LOCK TABLES `Statistics` WRITE;
/*!40000 ALTER TABLE `Statistics` DISABLE KEYS */;
INSERT INTO `Statistics` VALUES (1,'RG Sharma',9),(2,'DA Warner',10),(3,'Shakib Al Hasan',8),(4,'KS Williamson',10),(5,'Joe Root',11),(6,'JM Bairstow',11),(7,'AJ Finch',10),(8,'Babar Azam',8),(9,'BA Stokes',11),(10,'JJ Roy',8),(11,'V Kohli',9),(12,'F du Plessis',9),(13,'SPD Smith',10),(14,'AT Carey',10),(15,'EJG Morgan',11),(16,'Mushifiqur Rahim',8),(17,'N Pooran',9),(18,'KL Rahul',9),(19,'LRPL Taylor',10),(20,'UT Khawaja',9),(21,'JC Buttler',11),(22,'HE van der Dussen',9),(23,'Imam-ul-Haq',8),(24,'Q de kock',9),(25,'MA Starc',10),(26,'LH Ferguson',9),(27,'JC Archer',11),(28,'Mustafizur Rahman',8),(29,'JJ Bumrah',9),(30,'MA Wood',10),(31,'Mohammad Amir',8),(32,'TA Boult',10),(33,'Shaheen Shah Afridi',5),(34,'CR Woakes',11),(35,'JDS Neesham',10),(36,'Mohammed Shami',4),(37,'MJ Henry',9),(38,'PJ Cummins',10),(39,'CH Morris',8),(40,'SL Malinga',7),(41,'Mohammad Saifuddin',7),(42,'SS Cottrell',9),(43,'YS Chahal',8),(44,'LE Plunkett',7),(45,'AL Phehlukwayo',9),(46,'Imran Tahir',9),(47,'K Rabada',8),(48,'Wahab Riaz',8),(49,'AU Rashid',11),(50,'B Kumar',6),(51,'Mohammad Nabi',9),(52,'HH Pandya',9);
/*!40000 ALTER TABLE `Statistics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-26 23:13:35
