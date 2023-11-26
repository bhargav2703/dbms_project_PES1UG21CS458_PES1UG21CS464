-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: taxi_management
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `cabs`
--

DROP TABLE IF EXISTS `cabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabs` (
  `vehicle_number` int NOT NULL,
  `registration_number` varchar(255) NOT NULL,
  `seating_capacity` int NOT NULL,
  `model` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `driverID` int NOT NULL,
  PRIMARY KEY (`vehicle_number`),
  UNIQUE KEY `vehicle_number` (`vehicle_number`),
  UNIQUE KEY `registration_number` (`registration_number`),
  UNIQUE KEY `vehicle_number_2` (`vehicle_number`),
  UNIQUE KEY `vehicle_number_3` (`vehicle_number`),
  UNIQUE KEY `vehicle_number_4` (`vehicle_number`),
  KEY `fk_cabs_drivers` (`driverID`),
  CONSTRAINT `fk_cabs_drivers` FOREIGN KEY (`driverID`) REFERENCES `drivers` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabs`
--

LOCK TABLES `cabs` WRITE;
/*!40000 ALTER TABLE `cabs` DISABLE KEYS */;
INSERT INTO `cabs` VALUES (1234,'ka1234',4,'tata','hatchback','Not Available',696420479),(1236,'ka1245',4,'hyu','hatchback','Not Available',762332143),(12336,'ka1265',4,'hyu','hatchback','Not Available',659491379);
/*!40000 ALTER TABLE `cabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int DEFAULT NULL,
  `DOB` date NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `name` (`name`,`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=971524507 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (637626974,'srini','8837@1.com',998274776,'2023-11-23','srivatsa','$pbkdf2-sha256$29000$WWstRaiVEkKI0VprjVGKcQ$yLjtueZOoh2HR9Rq8jsxfG7crEsC1fOyzX7WrlIPYRI');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `driver_id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `license_number` varchar(255) NOT NULL,
  `rating_score` int NOT NULL,
  `avg_rating` decimal(10,2) NOT NULL DEFAULT '4.00',
  PRIMARY KEY (`driver_id`),
  UNIQUE KEY `license_number` (`license_number`),
  CONSTRAINT `check_phone_length` CHECK ((length(`phone`) <= 10)),
  CONSTRAINT `drivers_chk_1` CHECK (((`rating_score` >= 0) and (`rating_score` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=999317053 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (659491379,'9917800991','bhargav','1234','2023-11-24','81234',0,1.00),(696420479,'9982766741','iiue','euue','2023-11-23','ii823',0,1.50),(762332143,'9917800991','bhargav','1234','2023-11-24','1234',0,3.00);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `place_name` varchar(255) NOT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`place_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('Bangalore Palace',12.998500,77.592300),('Bannerghatta National Park',12.800000,77.577000),('Commercial Street',12.981600,77.609000),('Cubbon Park',12.971598,77.594562),('ISKCON Temple Bangalore',13.010400,77.551700),('Lalbagh Botanical Garden',12.950743,77.584777),('Nandi Hills',13.370100,77.683500),('UB City',12.971700,77.595400),('Vidhana Soudha',12.979400,77.591200),('Wonderla Bangalore',12.836600,77.401000);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_table`
--

DROP TABLE IF EXISTS `my_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_table` (
  `time_inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int DEFAULT NULL,
  PRIMARY KEY (`time_inserted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_table`
--

LOCK TABLES `my_table` WRITE;
/*!40000 ALTER TABLE `my_table` DISABLE KEYS */;
INSERT INTO `my_table` VALUES ('2023-11-23 09:32:30',637626974),('2023-11-23 09:32:31',637626974),('2023-11-23 09:42:35',637626974),('2023-11-23 10:15:05',637626974),('2023-11-23 10:15:58',637626974),('2023-11-23 10:25:19',637626974),('2023-11-23 10:26:09',637626974),('2023-11-23 10:27:53',637626974),('2023-11-23 10:29:19',637626974),('2023-11-23 10:30:47',637626974),('2023-11-23 10:31:50',637626974),('2023-11-23 10:33:56',637626974),('2023-11-23 10:50:03',637626974),('2023-11-23 10:54:53',637626974),('2023-11-23 10:59:24',637626974),('2023-11-23 11:01:52',637626974),('2023-11-23 11:02:54',637626974),('2023-11-23 11:09:34',637626974),('2023-11-24 04:28:27',637626974),('2023-11-24 04:28:49',637626974),('2023-11-24 04:33:17',637626974),('2023-11-24 04:51:03',637626974),('2023-11-24 05:55:03',637626974),('2023-11-26 16:12:19',637626974);
/*!40000 ALTER TABLE `my_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `customer_id` int NOT NULL,
  `driver_id` int NOT NULL,
  `booking_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`),
  KEY `driver_id` (`driver_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`userID`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`driver_id`),
  CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`booking_id`) REFERENCES `rides` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (44,'UPI',40.00,637626974,696420479,17),(45,'UPI',40.00,637626974,696420479,17),(46,'UPI',50.00,637626974,696420479,16),(47,'UPI',55.00,637626974,762332143,19),(48,'UPI',55.00,637626974,762332143,19),(49,'UPI',55.00,637626974,762332143,19),(50,'UPI',40.00,637626974,762332143,21);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rides`
--

DROP TABLE IF EXISTS `rides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rides` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `pickup_location` varchar(255) NOT NULL,
  `drop_location` varchar(255) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `rating` int NOT NULL,
  `distance` int NOT NULL,
  `customer_Id` int NOT NULL,
  `driver_ID` int NOT NULL,
  `status` enum('in transit','not in transit') NOT NULL DEFAULT 'not in transit',
  PRIMARY KEY (`booking_id`),
  KEY `fk_cabs_customers` (`customer_Id`),
  KEY `fk_cabs_customers1` (`driver_ID`),
  CONSTRAINT `fk_cabs_customers` FOREIGN KEY (`customer_Id`) REFERENCES `customer` (`userID`),
  CONSTRAINT `fk_cabs_customers1` FOREIGN KEY (`driver_ID`) REFERENCES `drivers` (`driver_id`),
  CONSTRAINT `drop_location` CHECK (((`drop_location` in (_utf8mb4'Lalbagh Botanical Garden',_utf8mb4'Cubbon Park',_utf8mb4'Bangalore Palace',_utf8mb4'Vidhana Soudha',_utf8mb4'UB City Mall',_utf8mb4'ISKCON Temple Bangalore',_utf8mb4'Tipu Sultan\'s Summer Palace',_utf8mb4'Commercial Street',_utf8mb4'Nandi Hills',_utf8mb4'Wonderla Amusement Park')) and (`drop_location` <> `pickup_location`))),
  CONSTRAINT `pickup_location` CHECK ((`pickup_location` in (_utf8mb4'Lalbagh Botanical Garden',_utf8mb4'Cubbon Park',_utf8mb4'Bangalore Palace',_utf8mb4'Vidhana Soudha',_utf8mb4'UB City Mall',_utf8mb4'ISKCON Temple Bangalore',_utf8mb4'Tipu Sultan\'s Summer Palace',_utf8mb4'Commercial Street',_utf8mb4'Nandi Hills',_utf8mb4'Wonderla Amusement Park'))),
  CONSTRAINT `valid_drop_location` CHECK ((`drop_location` in (_utf8mb4'Lalbagh Botanical Garden',_utf8mb4'Cubbon Park',_utf8mb4'Bangalore Palace',_utf8mb4'Vidhana Soudha',_utf8mb4'UB City Mall',_utf8mb4'ISKCON Temple Bangalore',_utf8mb4'Tipu Sultan\'s Summer Palace',_utf8mb4'Commercial Street',_utf8mb4'Nandi Hills',_utf8mb4'Wonderla Amusement Park'))),
  CONSTRAINT `valid_pickup_location` CHECK ((`pickup_location` in (_utf8mb4'Lalbagh Botanical Garden',_utf8mb4'Cubbon Park',_utf8mb4'Bangalore Palace',_utf8mb4'Vidhana Soudha',_utf8mb4'UB City Mall',_utf8mb4'ISKCON Temple Bangalore',_utf8mb4'Tipu Sultan\'s Summer Palace',_utf8mb4'Commercial Street',_utf8mb4'Nandi Hills',_utf8mb4'Wonderla Amusement Park')))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rides`
--

LOCK TABLES `rides` WRITE;
/*!40000 ALTER TABLE `rides` DISABLE KEYS */;
INSERT INTO `rides` VALUES (14,'Bangalore Palace','Lalbagh Botanical Garden','2023-11-23 14:13:51','2023-11-24 00:58:34',3,5,637626974,696420479,'not in transit'),(16,'Lalbagh Botanical Garden','Bangalore Palace','2023-11-23 14:33:24','2023-11-24 01:18:07',3,5,637626974,696420479,'not in transit'),(17,'Lalbagh Botanical Garden','Cubbon Park','2023-11-23 14:53:24','2023-11-23 19:59:23',3,3,637626974,696420479,'not in transit'),(18,'Lalbagh Botanical Garden','Vidhana Soudha','2023-11-23 15:12:55','2023-11-23 21:44:19',1,3,637626974,696420479,'not in transit'),(19,'ISKCON Temple Bangalore','Cubbon Park','2023-11-24 11:37:03','2023-11-25 00:17:45',5,6,637626974,762332143,'not in transit'),(20,'Lalbagh Botanical Garden','Cubbon Park','2023-11-24 11:47:41','2023-11-24 16:53:40',1,3,637626974,659491379,'not in transit'),(21,'Lalbagh Botanical Garden','Cubbon Park','2023-11-24 11:49:01','2023-11-24 16:55:00',3,3,637626974,762332143,'not in transit'),(22,'Bangalore Palace','Lalbagh Botanical Garden','2023-11-26 21:42:52','2023-11-27 08:27:35',1,5,637626974,762332143,'not in transit');
/*!40000 ALTER TABLE `rides` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `calculate_avg_rating` AFTER INSERT ON `rides` FOR EACH ROW BEGIN
    DECLARE total_rating INT;
    DECLARE total_rides INT;

    SELECT SUM(rating), COUNT(*) INTO total_rating, total_rides
    FROM rides
    WHERE driver_id = NEW.driver_id AND rating IS NOT NULL;

    IF total_rides > 0 THEN
        UPDATE drivers
        SET avg_rating = total_rating / total_rides
        WHERE driver_id = NEW.driver_id;
    ELSE
        UPDATE drivers
        SET avg_rating = 0
        WHERE driver_id = NEW.driver_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'taxi_management'
--

--
-- Dumping routines for database 'taxi_management'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_distance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_distance`(
    start_location_name VARCHAR(255), 
    end_location_name VARCHAR(255)
) RETURNS double
    DETERMINISTIC
BEGIN
  DECLARE start_lat DOUBLE;
  DECLARE start_lng DOUBLE;
  DECLARE end_lat DOUBLE;
  DECLARE end_lng DOUBLE;

  DECLARE earth_radius DOUBLE;
  DECLARE delta_lat DOUBLE;
  DECLARE delta_lng DOUBLE;
  DECLARE a DOUBLE;
  DECLARE c DOUBLE;
  DECLARE distance DOUBLE;

  SET earth_radius = 6371.0710;

  -- Extract latitude and longitude values from start_location
  SELECT latitude, longitude
  INTO start_lat, start_lng
  FROM locations
  WHERE place_name = start_location_name;

  -- Extract latitude and longitude values from end_location
  SELECT latitude, longitude
  INTO end_lat, end_lng
  FROM locations
  WHERE place_name = end_location_name;

  SET delta_lat = RADIANS(end_lat) - RADIANS(start_lat);
  SET delta_lng = RADIANS(end_lng) - RADIANS(start_lng);

  SET a = SIN(delta_lat / 2) * SIN(delta_lat / 2) +
        COS(RADIANS(start_lat)) * COS(RADIANS(end_lat)) *
        SIN(delta_lng / 2) * SIN(delta_lng / 2);
  SET c = 2 * ATAN2(SQRT(a), SQRT(1 - a));
  SET distance = earth_radius * c;

  RETURN distance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getRandomRegistrationNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getRandomRegistrationNumber`(cabType VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE random_reg_number VARCHAR(255);

    SELECT registration_number
    INTO random_reg_number
    FROM cabs
    WHERE type = cabType AND status = 'Available'
    ORDER BY RAND()
    LIMIT 1;

    RETURN random_reg_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcessRidePayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcessRidePayment`(
    IN p_booking_id INT
)
BEGIN
    DECLARE p_distance int;
    DECLARE p_base_fare FLOAT DEFAULT 20;
    DECLARE p_rate_per_km FLOAT DEFAULT 5;
    DECLARE p_additional_charges FLOAT DEFAULT 5;
    DECLARE p_payment_type VARCHAR(255) DEFAULT 'UPI';
    DECLARE p_customer_id INT;
    DECLARE p_driver_id INT;
    DECLARE p_total_bill FLOAT;

    SELECT
        distance,
        customer_id,
        driver_id
    INTO
        p_distance,
        p_customer_id,
        p_driver_id
        
    FROM rides
    WHERE booking_id = p_booking_id;
    IF FOUND_ROWS() > 0 THEN
        SET p_total_bill = p_base_fare + (p_distance * p_rate_per_km) + p_additional_charges;
        INSERT INTO payments (booking_id, payment_type, amount, customer_id, driver_id)
        VALUES (p_booking_id, p_payment_type, p_total_bill, p_customer_id, p_driver_id);
    
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-26 21:54:57
