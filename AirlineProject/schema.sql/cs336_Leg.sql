-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: cs336project2017summer.cdbdnh5z4lat.us-west-2.rds.amazonaws.com    Database: cs336
-- ------------------------------------------------------
-- Server version	5.6.35-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Leg`
--

DROP TABLE IF EXISTS `Leg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Leg` (
  `Departure_Date_Time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Res_No` char(8) NOT NULL DEFAULT '',
  `Airline_ID` char(2) DEFAULT NULL,
  `Flight_Number` char(4) DEFAULT NULL,
  `From_Airport_ID` char(3) DEFAULT NULL,
  `To_Airport_ID` char(3) DEFAULT NULL,
  PRIMARY KEY (`Departure_Date_Time`,`Res_No`),
  KEY `Res_No` (`Res_No`),
  KEY `From_Airport_ID` (`From_Airport_ID`),
  KEY `To_Airport_ID` (`To_Airport_ID`),
  KEY `Leg_ibfk_2_idx` (`Airline_ID`,`Flight_Number`),
  CONSTRAINT `Leg_ibfk_1` FOREIGN KEY (`Res_No`) REFERENCES `Reservation` (`Res_No`),
  CONSTRAINT `Leg_ibfk_2` FOREIGN KEY (`Airline_ID`, `Flight_Number`) REFERENCES `Flight` (`Airline_ID`, `Flight_No`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Leg_ibfk_3` FOREIGN KEY (`From_Airport_ID`) REFERENCES `Airport` (`Airport_ID`),
  CONSTRAINT `Leg_ibfk_4` FOREIGN KEY (`To_Airport_ID`) REFERENCES `Airport` (`Airport_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-10 22:07:41
