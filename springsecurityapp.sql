-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: securityapp
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `account_transactions`
--

DROP TABLE IF EXISTS `account_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_transactions` (
  `transaction_id` varchar(255) NOT NULL,
  `account_number` bigint DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `transaction_dt` datetime(6) DEFAULT NULL,
  `transaction_summary` varchar(255) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `transaction_amt` int DEFAULT NULL,
  `closing_balance` int DEFAULT NULL,
  `create_dt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_transactions`
--

LOCK TABLES `account_transactions` WRITE;
/*!40000 ALTER TABLE `account_transactions` DISABLE KEYS */;
INSERT INTO `account_transactions` VALUES ('424d9f96-49a0-11ec-829e-d615dc6cbbad',186576453434,1,'2021-11-13 00:00:00.000000','Coffee Shop','Withdrawal',30,34500,'20211113'),('43d3ce09-49a0-11ec-829e-d615dc6cbbad',186576453434,1,'2021-11-14 00:00:00.000000','Uber','Withdrawal',100,34400,'20211114'),('451fe431-49a0-11ec-829e-d615dc6cbbad',186576453434,1,'2021-11-15 00:00:00.000000','Self Deposit','Deposit',500,34900,'20211115'),('465d34f6-49a0-11ec-829e-d615dc6cbbad',186576453434,1,'2021-11-16 00:00:00.000000','Ebay','Withdrawal',600,34300,'20211116'),('48a84ba1-49a0-11ec-829e-d615dc6cbbad',186576453434,1,'2021-11-18 00:00:00.000000','OnlineTransfer','Deposit',700,35000,'20211118'),('4a159d1c-49a0-11ec-829e-d615dc6cbbad',186576453434,1,'2021-11-19 00:00:00.000000','Amazon.com','Withdrawal',100,34900,'20211119');
/*!40000 ALTER TABLE `account_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `customer_id` int DEFAULT NULL,
  `account_number` bigint NOT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `branch_address` varchar(255) DEFAULT NULL,
  `create_dt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,186576453434,'Savings','123 Main Street, New York','2021-11-20');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,1,'WRITE'),(2,1,'READ');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `amount_used` int DEFAULT NULL,
  `available_amount` int DEFAULT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `create_dt` datetime(6) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `total_limit` int DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,500,9500,'4565XXXX4656','Credit','2021-11-20 00:00:00.000000',1,10000),(2,600,6900,'3455XXXX8673','Credit','2021-11-20 00:00:00.000000',1,7500),(3,4000,16000,'2359XXXX9346','Credit','2021-11-20 00:00:00.000000',1,20000);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `contact_id` varchar(255) NOT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `create_dt` datetime(6) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES ('SR656741351','david.s.fountaine@gmail.com','Nguyen Duc Manh','2021-11-20 02:31:32.840000','12345','12345'),('SR9564010','david.s.fountaine@gmail.com','Nguyen Duc Manh','2021-11-21 01:52:28.607000','12345','12345');
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` varchar(45) NOT NULL,
  `create_dt` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'ducmanhktqs96@gmail.com','$2a$12$/ZNvj9hccUcHNRjcDBLBx.8v/JQIVGtb8zY.EG9GGjiKtHGAUha7C','admin','2021-11-20 10:06:41','0327998425','Manh');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `loan_number` int NOT NULL AUTO_INCREMENT,
  `amount_paid` int DEFAULT NULL,
  `create_dt` varchar(255) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `loan_type` varchar(255) DEFAULT NULL,
  `outstanding_amount` int DEFAULT NULL,
  `start_dt` datetime(6) DEFAULT NULL,
  `total_loan` int DEFAULT NULL,
  PRIMARY KEY (`loan_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,50000,'2020-10-13',1,'Home',150000,'2020-10-13 00:00:00.000000',200000),(2,10000,'2020-06-06',1,'Vehicle',30000,'2020-06-06 00:00:00.000000',40000),(3,10000,'2018-02-14',1,'Home',40000,'2018-02-14 00:00:00.000000',50000),(4,3500,'2018-02-14',1,'Personal',6500,'2018-02-14 00:00:00.000000',10000);
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_details`
--

DROP TABLE IF EXISTS `notice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice_details` (
  `notice_id` int NOT NULL AUTO_INCREMENT,
  `create_dt` datetime(6) DEFAULT NULL,
  `notic_beg_dt` datetime(6) DEFAULT NULL,
  `notic_end_dt` datetime(6) DEFAULT NULL,
  `notice_details` varchar(255) DEFAULT NULL,
  `notice_summary` varchar(255) DEFAULT NULL,
  `update_dt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_details`
--

LOCK TABLES `notice_details` WRITE;
/*!40000 ALTER TABLE `notice_details` DISABLE KEYS */;
INSERT INTO `notice_details` VALUES (1,'2021-11-20 00:00:00.000000','2020-10-14 00:00:00.000000','2020-11-30 00:00:00.000000','Home loan interest rates are reduced as per the goverment guidelines. The updated rates will be effective immediately','Home Loan Interest rates reduced',NULL),(2,'2021-11-20 00:00:00.000000','2020-10-14 00:00:00.000000','2020-12-05 00:00:00.000000','Customers who will opt for Internet banking while opening a saving account will get a $50 amazon voucher','Net Banking Offers',NULL),(3,'2021-11-20 00:00:00.000000','2020-10-14 00:00:00.000000','2020-12-01 00:00:00.000000','The mobile application of the EazyBank will be down from 2AM-5AM on 12/05/2020 due to maintenance activities','Mobile App Downtime',NULL),(4,'2021-11-20 00:00:00.000000','2020-10-14 00:00:00.000000','2020-12-08 00:00:00.000000','There will be a e-auction on 12/08/2020 on the Bank website for all the stubborn arrears.Interested parties can participate in the e-auction','E Auction notice',NULL),(5,'2021-11-20 00:00:00.000000','2020-10-14 00:00:00.000000','2020-11-28 00:00:00.000000','Millennia Credit Cards are launched for the premium customers of EazyBank. With these cards, you will get 5% cashback for each purchase','Launch of Millennia Cards',NULL),(6,'2021-11-20 00:00:00.000000','2020-10-14 00:00:00.000000','2020-12-31 00:00:00.000000','EazyBank launched an insurance policy which will cover COVID-19 expenses. Please reach out to the branch for more details','COVID-19 Insurance',NULL);
/*!40000 ALTER TABLE `notice_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'manh','manh',1),(2,'ninh','ninh',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21 16:27:03
