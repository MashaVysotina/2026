-- MySQL dump 10.13  Distrib 8.4.7, for Win64 (x86_64)
--
-- Host: localhost    Database: beauty_salon
-- ------------------------------------------------------
-- Server version	8.4.7

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `master_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `appointment_date` datetime NOT NULL,
  `status` enum('запланировано','выполнено','отменено') COLLATE utf8mb4_unicode_ci DEFAULT 'запланировано',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `master_id` (`master_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`master_id`) REFERENCES `users` (`id`),
  CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,2,1,'2025-12-02 11:00:00','выполнено','Все прошло отлично'),(2,1,2,2,'2025-12-03 13:00:00','запланировано',NULL),(3,7,2,7,'2025-12-02 12:00:00','запланировано','ывфыф'),(4,7,2,6,'2025-12-02 14:00:00','запланировано','фыыффы');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_to_service`
--

DROP TABLE IF EXISTS `master_to_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_to_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `master_id` int NOT NULL,
  `service_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `master_id` (`master_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `master_to_service_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `users` (`id`),
  CONSTRAINT `master_to_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_to_service`
--

LOCK TABLES `master_to_service` WRITE;
/*!40000 ALTER TABLE `master_to_service` DISABLE KEYS */;
INSERT INTO `master_to_service` VALUES (1,2,1),(2,2,3),(3,2,6),(4,2,7),(5,4,2),(6,4,5),(7,4,4),(8,4,10),(9,5,1),(10,5,3),(11,5,4),(12,5,6),(13,6,1),(14,6,2),(15,6,3),(16,6,4),(17,6,5),(18,6,6),(19,6,7),(20,6,8),(21,6,9),(22,6,10);
/*!40000 ALTER TABLE `master_to_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int DEFAULT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('наличные','картой','перевод') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'2025-12-01 08:02:46',1200.00,'картой'),(2,3,'2025-12-01 10:02:51',2000.00,'картой');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `master_id` int DEFAULT NULL,
  `service_id` int DEFAULT NULL,
  `appointment_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `review_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `master_id` (`master_id`),
  KEY `service_id` (`service_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`master_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  CONSTRAINT `reviews_ibfk_4` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,2,1,1,5,'Очень довольна обслуживанием и качеством!','2025-12-01 08:02:46'),(2,1,2,2,2,5,'Педикюр получился идеальным, все очень аккуратно и комфортно.','2025-12-01 09:06:44'),(3,1,2,3,NULL,5,'Маникюр с гель-лаком держится уже третью неделю без сколов.','2025-12-01 09:06:44'),(4,1,2,4,NULL,4,'SPA-уход очень расслабляет, кожа стала мягкой и увлажненной.','2025-12-01 09:06:44'),(5,1,2,5,NULL,5,'Коррекция прошла быстро, форма ногтей теперь идеальная.','2025-12-01 09:06:44'),(6,1,2,6,NULL,5,'Сняли старое покрытие очень бережно, ногти не повредились.','2025-12-01 09:06:44'),(7,1,2,7,NULL,5,'Дизайн получился именно таким, как я хотела — нежный и стильный.','2025-12-01 09:06:44'),(8,1,2,8,NULL,4,'Укрепление заметно увеличило стойкость маникюра, очень довольна.','2025-12-01 09:06:44'),(9,1,2,9,NULL,5,'Комбинированный педикюр — ноги как после отпуска, спасибо мастеру.','2025-12-01 09:06:44'),(10,1,2,10,NULL,5,'Комплекс маникюр + педикюр сэкономил время и подарил много удовольствия.','2025-12-01 09:06:44'),(11,1,2,1,NULL,4,'Классический маникюр аккуратный, но в следующий раз хочу попробовать дизайн.','2025-12-01 09:06:44');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `duration_minutes` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Маникюр классический','Обработка ногтей и кутикулы',1200.00,60),(2,'Педикюр с покрытием','Педикюр с гель-лаком',1800.00,90),(3,'Маникюр с гель-лаком','Маникюр с выравниванием ногтевой пластины и стойким гель-лаком.',1500.00,75),(4,'SPA-уход для рук','Пилинг, маска и массаж рук для глубокого увлажнения кожи.',1300.00,45),(5,'Коррекция нарощенных ногтей','Коррекция длины и формы нарощенных ногтей.',1700.00,90),(6,'Снятие покрытия','Аккуратное снятие гель-лака или другого покрытия без повреждения ногтей.',500.00,30),(7,'Комбинированный педикюр','Уход за стопами и пальцами комбинированной техникой.',2000.00,90),(8,'Дизайн ногтей','Минималистичный дизайн, стразы, роспись и акценты на отдельных ногтях.',300.00,20),(9,'Укрепление ногтей','Укрепление базой или гелем для дополнительной стойкости маникюра.',1400.00,70),(10,'Комплекс: маникюр + педикюр','Комплексная процедура для рук и ног в одном визите.',2800.00,150);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Клиент','Мастер','Администратор') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Анна Иванова','+79001234567','anna@mail.ru','hashpass1','Клиент','2025-12-01 08:02:45'),(2,'Мария Петрова','+79007654321','maria@mail.ru','hashpass2','Мастер','2025-12-01 08:02:45'),(3,'Админ Салона','+79009998877','admin@salon.ru','hashadmin','Администратор','2025-12-01 08:02:45'),(4,'Ольга Смирнова','+79001112233','olga.master@mail.ru','hashpass3','Мастер','2025-12-01 09:35:50'),(5,'Екатерина Соколова','+79002223344','ekaterina.master@mail.ru','hashpass4','Мастер','2025-12-01 09:35:50'),(6,'Наталья Кузнецова','+79003334455','natalia.master@mail.ru','hashpass5','Мастер','2025-12-01 09:35:50'),(7,'Влада','+79998887776','vlada@gmail.com','guest','Клиент','2025-12-01 09:55:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_schedule`
--

DROP TABLE IF EXISTS `work_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `master_id` int DEFAULT NULL,
  `work_day` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master_id` (`master_id`),
  CONSTRAINT `work_schedule_ibfk_1` FOREIGN KEY (`master_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_schedule`
--

LOCK TABLES `work_schedule` WRITE;
/*!40000 ALTER TABLE `work_schedule` DISABLE KEYS */;
INSERT INTO `work_schedule` VALUES (1,2,'2025-12-02','10:00:00','18:00:00'),(2,2,'2025-12-03','12:00:00','20:00:00'),(3,4,'2025-12-02','09:00:00','17:00:00'),(4,4,'2025-12-04','11:00:00','19:00:00'),(5,5,'2025-12-03','10:00:00','18:00:00'),(6,5,'2025-12-05','12:00:00','20:00:00'),(7,6,'2025-12-02','12:00:00','20:00:00'),(8,6,'2025-12-03','09:00:00','17:00:00'),(9,6,'2025-12-04','10:00:00','18:00:00');
/*!40000 ALTER TABLE `work_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'beauty_salon'
--

--
-- Dumping routines for database 'beauty_salon'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-12 17:00:56
