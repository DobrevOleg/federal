-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: federal
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `idclient` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `adress` varchar(200) NOT NULL,
  `contactdata` varchar(200) NOT NULL,
  `idtypeclient` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idclient`),
  KEY `idtypecli_idx` (`idtypeclient`),
  CONSTRAINT `idtypecli` FOREIGN KEY (`idtypeclient`) REFERENCES `typeclient` (`idtypeclient`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'УКРТЕЛЕКОМ','улиця Катерининская, 37',' 048 786 9911',1),(2,'УКРПОШТА',' улица Ефимова, 2',' 0482 641 723',1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contract` (
  `idcontract` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `note` mediumtext,
  `idclient` int(10) unsigned NOT NULL,
  `idemployee` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcontract`),
  KEY `client_idx` (`idclient`),
  KEY `employee_idx` (`idemployee`),
  CONSTRAINT `client` FOREIGN KEY (`idclient`) REFERENCES `client` (`idclient`),
  CONSTRAINT `employee` FOREIGN KEY (`idemployee`) REFERENCES `employee` (`idemployee`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,76516646,'Договор на установку видео наблюдения',1,2);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duty`
--

DROP TABLE IF EXISTS `duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `duty` (
  `idduty` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `salary` float unsigned NOT NULL,
  `duties` longtext NOT NULL,
  PRIMARY KEY (`idduty`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duty`
--

LOCK TABLES `duty` WRITE;
/*!40000 ALTER TABLE `duty` DISABLE KEYS */;
INSERT INTO `duty` VALUES (1,'Охранник',6000,'Обязаность охранять територию, дежурить, ехать на выезды'),(2,'Секретарь',8000,'Обязаность заполнять бумаги, отвечать на звонки, контролировать финансы');
/*!40000 ALTER TABLE `duty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `idemployee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `patrynomin` varchar(45) NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `adress` mediumtext NOT NULL,
  `typeuser` int(10) unsigned NOT NULL,
  `typeduty` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idemployee`),
  KEY `duty_idx` (`typeduty`),
  KEY `typeuser_idx` (`typeuser`),
  CONSTRAINT `duty` FOREIGN KEY (`typeduty`) REFERENCES `duty` (`idduty`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `typeuser` FOREIGN KEY (`typeuser`) REFERENCES `typeuser` (`idtypeuser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Антон','Лошан','Сергеевич',34,'Маршала Говорова 8, кв. 10',1,1),(2,'Лариса','Нравова','Анатолиевна',28,'Большая Арнаутская 1, кв. 4',3,2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipage`
--

DROP TABLE IF EXISTS `equipage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `equipage` (
  `idequipage` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goal` mediumtext NOT NULL,
  `date` date NOT NULL,
  `idfilial` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idequipage`),
  KEY `idFil_idx` (`idfilial`),
  CONSTRAINT `idFil` FOREIGN KEY (`idfilial`) REFERENCES `filial` (`idfilial`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipage`
--

LOCK TABLES `equipage` WRITE;
/*!40000 ALTER TABLE `equipage` DISABLE KEYS */;
INSERT INTO `equipage` VALUES (1,'Установка оборудования','2019-02-10',1);
/*!40000 ALTER TABLE `equipage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipageemployee`
--

DROP TABLE IF EXISTS `equipageemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `equipageemployee` (
  `idequipageemployee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idequ` int(10) unsigned NOT NULL,
  `idemploy` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idequipageemployee`),
  KEY `idequ_idx` (`idequ`),
  KEY `idemp_idx` (`idemploy`),
  CONSTRAINT `idemp` FOREIGN KEY (`idemploy`) REFERENCES `employee` (`idemployee`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idequ` FOREIGN KEY (`idequ`) REFERENCES `equipage` (`idequipage`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipageemployee`
--

LOCK TABLES `equipageemployee` WRITE;
/*!40000 ALTER TABLE `equipageemployee` DISABLE KEYS */;
INSERT INTO `equipageemployee` VALUES (2,1,1);
/*!40000 ALTER TABLE `equipageemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipagevehicle`
--

DROP TABLE IF EXISTS `equipagevehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `equipagevehicle` (
  `idequipagevehicle` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idvehicle` int(10) unsigned NOT NULL,
  `ideq` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idequipagevehicle`),
  KEY `idv_idx` (`idvehicle`),
  KEY `ideq_idx` (`ideq`),
  CONSTRAINT `ideq` FOREIGN KEY (`ideq`) REFERENCES `equipage` (`idequipage`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idv` FOREIGN KEY (`idvehicle`) REFERENCES `vehicle` (`idvehicle`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipagevehicle`
--

LOCK TABLES `equipagevehicle` WRITE;
/*!40000 ALTER TABLE `equipagevehicle` DISABLE KEYS */;
INSERT INTO `equipagevehicle` VALUES (1,1,1);
/*!40000 ALTER TABLE `equipagevehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `equipment` (
  `idequipment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `number` int(10) unsigned NOT NULL,
  `note` mediumtext,
  `idfilial` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idequipment`),
  KEY `filial_idx` (`idfilial`),
  CONSTRAINT `filial` FOREIGN KEY (`idfilial`) REFERENCES `filial` (`idfilial`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Рация',10,'Радиус действия 2 км',1),(2,'Рация',15,'Радиус действия 2 км',2),(3,'Камера сред.',20,'Для внутреннего наблюдения',2);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filial`
--

DROP TABLE IF EXISTS `filial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `filial` (
  `idfilial` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(10) unsigned NOT NULL,
  `adress` mediumtext NOT NULL,
  PRIMARY KEY (`idfilial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filial`
--

LOCK TABLES `filial` WRITE;
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` VALUES (1,3,'город Одесса, улица Генерала Бочарова 49-А'),(2,7,'город Одесса, улица Болгарская 7');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeclient`
--

DROP TABLE IF EXISTS `typeclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `typeclient` (
  `idtypeclient` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`idtypeclient`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeclient`
--

LOCK TABLES `typeclient` WRITE;
/*!40000 ALTER TABLE `typeclient` DISABLE KEYS */;
INSERT INTO `typeclient` VALUES (1,'Юридическое лицо'),(2,'Физическое лицо');
/*!40000 ALTER TABLE `typeclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeuser`
--

DROP TABLE IF EXISTS `typeuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `typeuser` (
  `idtypeuser` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `authority` longtext NOT NULL,
  PRIMARY KEY (`idtypeuser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeuser`
--

LOCK TABLES `typeuser` WRITE;
/*!40000 ALTER TABLE `typeuser` DISABLE KEYS */;
INSERT INTO `typeuser` VALUES (1,'Сотрудник','Имеет возможность добавлять выезд, редактировать дежурство и просматривать оборудование и транспорт'),(2,'Администратор ','Имеет доступ ко всем запросам и всем данным'),(3,'Секретарь  ','Имеет возможность добавлять новые договора, транспорт, оборудование, также может просматривать все данные из базы данных'),(4,'Отдел кадров','Имеет возможность удалять и добавлять новых сотрудников, клиентов, типы должностей и типы клиентов');
/*!40000 ALTER TABLE `typeuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehicle` (
  `idvehicle` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(20) NOT NULL,
  `title` varchar(45) NOT NULL,
  `datebuy` date NOT NULL,
  `dateinsurance` date DEFAULT NULL,
  `tetminsurance` float DEFAULT NULL,
  `idfilial` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idvehicle`),
  KEY `idF_idx` (`idfilial`),
  CONSTRAINT `idF` FOREIGN KEY (`idfilial`) REFERENCES `filial` (`idfilial`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,'ВН 2546 АМ','Renault Master груз. 2014','2016-04-19','2016-05-19',3,1),(2,'ВН 5963 ХВ','Volkswagen Caddy груз. Basis 2018','2018-09-24','2018-09-30',1,1);
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vigil`
--

DROP TABLE IF EXISTS `vigil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vigil` (
  `idvigil` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `note` longtext,
  PRIMARY KEY (`idvigil`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vigil`
--

LOCK TABLES `vigil` WRITE;
/*!40000 ALTER TABLE `vigil` DISABLE KEYS */;
INSERT INTO `vigil` VALUES (1,'2019-02-04',NULL),(2,'2019-02-05',NULL),(3,'2019-02-06',NULL);
/*!40000 ALTER TABLE `vigil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vigilemployee`
--

DROP TABLE IF EXISTS `vigilemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vigilemployee` (
  `idvigilemployee` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idvigil` int(10) unsigned NOT NULL,
  `idemployee` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idvigilemployee`),
  KEY `vigil_idx` (`idvigil`),
  KEY `emp_idx` (`idemployee`),
  CONSTRAINT `emp` FOREIGN KEY (`idemployee`) REFERENCES `employee` (`idemployee`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vigil` FOREIGN KEY (`idvigil`) REFERENCES `vigil` (`idvigil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vigilemployee`
--

LOCK TABLES `vigilemployee` WRITE;
/*!40000 ALTER TABLE `vigilemployee` DISABLE KEYS */;
INSERT INTO `vigilemployee` VALUES (1,1,1),(2,2,1);
/*!40000 ALTER TABLE `vigilemployee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-20 15:31:33
