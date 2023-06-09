-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: puppy_pet
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Dog'),(2,'Cat'),(3,'Fish'),(4,'Bird');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerId` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('a','haiyt131211@gmail.com',_binary '','Đỗ Danh Hải','$2a$10$LJQNh.uFN9qAyOWdM4bF3.xSpmapLIBLtRFjt4mSMhVQscyKoLjKG','0'),('admin','admin@gmail.com',_binary '','Admin','$2a$10$1iPiIh9Mw/8jFkmrTzVhs.CrY8rBMn1hWHVSw2NPn92hRTK4kYwHu','1'),('hai123','haiyt1312@gmail.com',_binary '','Đỗ Danh Hải','$2a$10$BsU9bJjMgLRDpgnlAh28i.eZpiJ5mjaa5xt1ku8ulo3wVJa82ynHK','0'),('khuong123','khuong123@gmail.com',_binary '','Trần Văn Khương','$2a$10$C02d04gyTPpDYIgNCuL/IuczMcA4SULkNQ27SWHdQVmiWRcs7sZd2','0'),('luong123','luong123@gmail.com',_binary '','Dương Bá Lương','$2a$10$OUBXvD5q5m5.jolTes5iZOPnnN8ckL./nk6do7bAPBVy4wVcEEn/K','0'),('thao123','thao123@gmail.com',_binary '','Nguyễn Phương Thảo','$2a$10$2ZJy/CvIYbkyCHCccdupxOjyBdCUz.wWAAK8r.RW30BeIwOEp0GZK','0');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `orderDetailId` int NOT NULL AUTO_INCREMENT,
  `discount` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`orderDetailId`),
  KEY `FK3ohml2o6a85wh1nn65snnaind` (`orderId`),
  KEY `FK5pie1uapfd704usnm2loi3tex` (`productId`),
  CONSTRAINT `FK3ohml2o6a85wh1nn65snnaind` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `FK5pie1uapfd704usnm2loi3tex` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,NULL,120000,3,'Đã Thanh Toán',324000,1,2),(2,NULL,120000,1,'Đang Chờ Xử Lý',108000,1,3),(3,NULL,180000,1,'Đang Chờ Xử Lý',162000,1,4),(4,NULL,45000,1,'Đang Chờ Xử Lý',45000,1,44),(5,NULL,120000,1,'Đang Chờ Xử Lý',108000,2,2),(6,NULL,100000,1,'Đang Chờ Xử Lý',95000,2,6),(7,NULL,140000,1,'Đang Chờ Xử Lý',126000,2,9),(8,NULL,600000,1,'Đang Chờ Xử Lý',570000,3,19),(9,NULL,450000,1,'Đang Chờ Xử Lý',427500,3,22),(10,NULL,400000,1,'Đang Chờ Xử Lý',380000,3,28),(11,NULL,250000,1,'Đang Chờ Xử Lý',225000,4,34),(12,NULL,290000,1,'Đang Chờ Xử Lý',261000,4,35),(15,10,120000,1,'Đang Chờ Xử Lý',108000,6,3);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK1bpj2iini89gbon333nm7tvht` (`customerId`),
  CONSTRAINT `FK1bpj2iini89gbon333nm7tvht` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Hà Nội','<3','2023-02-03','0912345678','Đỗ Danh Hải',639000,'hai123'),(2,'QN','ok','2023-02-03','0888888888','Nguyễn Phương Thảo',329000,'thao123'),(3,'Yên Bái','ok','2023-02-03','0988888899','Trần Văn Khương',1377500,'khuong123'),(4,'Thái Nguyên','<3','2023-02-03','0912345678','Dương Bá Lương',738000,'luong123'),(5,'Thái Nguyên','<3','2023-02-03','0888888888','Dương Bá Lương',285000,'luong123'),(6,'Hà Nội','ok','2023-02-06','0888888888','Đỗ Danh Hải',108000,'hai123');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `enteredDate` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  `supplierId` int DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FKej2ob3ifydf846t2a2tntna4e` (`categoryId`),
  KEY `FKs2xbxi7wmu948op6qiho9yr8d` (`supplierId`),
  CONSTRAINT `FKej2ob3ifydf846t2a2tntna4e` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`),
  CONSTRAINT `FKs2xbxi7wmu948op6qiho9yr8d` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Thức ăn cho chó con cỡ nhỏ ROYAL CANIN Mini Puppy dành cho các giống chó con dưới 10 tháng tuổi.',10,'2023-02-02','thuc-an-cho-cho-con-co-nho-royal-canin-mini-puppy1-400x400.webp','Thức ăn cho chó con cỡ nhỏ ROYAL CANIN',200000,100,1,1),(2,'Thức ăn cho mèo con ROYAL CANIN Kitten dành riêng cho mèo con dưới 12 tháng tuổi.',10,'2023-02-02','thuc-an-cho-meo-con-royal-canin-kitten-400x400.webp','Thức ăn cho mèo con ROYAL CANIN',120000,50,2,1),(3,'Thức ăn cho mèo trưởng thành ROYAL CANIN Indoor 27 dành cho tất cả giống mèo sống trong nhà trên 12 tháng (Royal Canin Adult 1 tuổi).',10,'2023-02-02','thuc-an-cho-meo-truong-thanh-royal-canin-indoor-27-400x400.webp','Thức ăn cho mèo trưởng thành ROYAL CANIN',120000,50,2,1),(4,'Thức ăn cho chó Poodle con ROYAL CANIN Poodle Puppy dành riêng cho tất cả các giống chó Teacup, Tiny Poodle, Toy Poodle, Standard Poodle dưới 10 tháng tuổi.',10,'2023-02-02','thuc-an-cho-cho-poodle-con-royal-canin-poodle-puppy1-400x400.webp','Thức ăn cho chó Poodle con ROYAL CANIN',180000,100,1,1),(5,'Thức ăn cho mèo con và mèo mẹ ROYAL CANIN Mother & Babycat dành cho mèo con đang cai sữa (1 – 4 tháng), mèo mẹ đang mang thai và cho con bú. ',10,'2023-02-02','thuc-an-cho-meo-con-va-meo-me-royal-canin-mother-babycat-400x400.webp','Thức ăn cho mèo con và mèo mẹ ROYAL CANIN',150000,50,2,1),(6,'Thức ăn cho mèo trưởng thành ROYAL CANIN Regular Fit 32 dành cho tất cả các giống mèo trưởng thành từ 12 tháng tuổi trở lên.',5,'2023-02-02','thuc-an-cho-meo-truong-thanh-royal-canin-regular-fit-321-400x400.webp','Thức ăn cho mèo trưởng thành ROYAL CANIN',100000,100,2,1),(7,'Thức ăn cho chó Poodle trưởng thành ROYAL CANIN Poodle Adult dành riêng cho tất cả các giống chó Teacup, Tiny Poodle, Toy Poodle, Standard Poodle từ 10 tháng tuổi trở lên.',10,'2023-02-02','thuc-an-cho-cho-poodle-truong-thanh-royal-canin-poodle-adult1-400x400.webp','Thức ăn cho chó Poodle trưởng thành ROYAL CANIN',150000,100,1,1),(8,'Thức ăn cho mèo tiêu hóa búi lông ROYAL CANIN Hairball Care dành cho mèo từ 12 tháng tuổi trở lên. ',5,'2023-02-02','thuc-an-cho-meo-tieu-hoa-bui-long-royal-canin-hairball-care1-400x400.webp','Thức ăn cho mèo tiêu hóa búi lông ROYAL CANIN',100000,100,2,1),(9,'Thức ăn cho mèo Anh lông ngắn  ROYAL CANIN British Shorthair Adult dành cho những chú mèo ALN trên 12 tháng tuổi.',10,'2023-02-02','thuc-an-cho-meo-anh-long-ngan-truong-thanh-royal-canin-british-shorthair-adult1-400x400.webp','Thức ăn cho mèo Anh lông ngắn ROYAL CANIN',140000,50,2,1),(10,'Thức ăn cho chó ROYAL CANIN Mini Adult từ 10 tháng tuổi trở lên. ',10,'2023-02-02','thuc-an-cho-cho-truong-thanh-co-nho-royal-canin-mini-adult1-400x400.webp','Thức ăn cho chó trưởng thành cỡ nhỏ ROYAL CANIN',180000,50,1,1),(11,'Thức ăn cho chó trưởng thành cỡ lớn ROYAL CANIN Maxi Adult từ 15 tháng tuổi trở lên.',10,'2023-02-02','thuc-an-cho-cho-truong-thanh-royal-canin-maxi-adult1-400x400.webp','Thức ăn cho chó trưởng thành cỡ lớn ROYAL CANIN',160000,50,1,1),(12,'Thức ăn cho mèo dưỡng đẹp lông ROYAL CANIN Hair & Skin cho tất cả giống mèo trưởng thành từ 12 tháng tuổi trở lên.',10,'2023-02-02','thuc-an-cho-meo-duong-dep-long-royal-canin-hair-skin1-400x400.webp','Thức ăn cho mèo dưỡng đẹp lông ROYAL CANIN',150000,55,2,1),(13,'Thức ăn cho chó trưởng thành cỡ vừa ROYAL CANIN Medium Adult dành cho những chú chó trưởng thành 12 tháng tuổi trở lên. ',10,'2023-02-02','thuc-an-cho-cho-truong-thanh-royal-canin-medium-adult1-400x400.webp','Thức ăn cho chó trưởng thành cỡ vừa ROYAL CANIN',160000,66,1,1),(14,'Thức ăn cho mèo Anh lông ngắn con ROYAL CANIN British Shorthair Kitten dành cho mèo ALN dưới 12 tháng tuổi.',10,'2023-02-02','thuc-an-cho-meo-anh-long-ngan-con-royal-canin-british-shorthair-kitten1-400x400.webp','Thức ăn cho mèo Anh lông ngắn con ROYAL CANIN',150000,77,2,1),(15,'Thức ăn cho chó con cỡ lớn ROYAL CANIN Maxi Puppy dưới 15 tháng tuổi. ',5,'2023-02-02','thuc-an-cho-cho-con-royal-canin-maxi-puppy1-400x400.webp','Thức ăn cho chó con cỡ lớn ROYAL CANIN',200000,33,1,1),(16,'Thức ăn cho chó con cỡ vừa ROYAL CANIN Medium Puppy dành cho chó con dưới 12 tháng tuổi.',5,'2023-02-02','thuc-an-cho-cho-con-royal-canin-medium-puppy1-400x400.webp','Thức ăn cho chó con cỡ vừa ROYAL CANIN',200000,55,1,1),(17,'Thức ăn cho chó mẹ và chó con cỡ nhỏ ROYAL CANIN Mini Starter Mother & Babydog dành riêng cho chó mẹ mang thai từ 42 ngày, đang cho con bú và chó con mới cai sữa.',10,'2023-02-02','thuc-an-cho-cho-me-va-cho-con-co-nho-royal-canin-mini-starter-mother-babydog1-400x400.webp','Thức ăn cho chó mẹ và chó con cỡ nhỏ ROYAL CANIN',250000,100,1,1),(18,'Thức ăn cho chó Chihuahua con ROYAL CANIN Chihuahua Puppy dành cho những chú chó dưới 8 tháng tuổi được chế tạo với công thức đặc biệt, phù hợp với hàm răng nhỏ.',5,'2023-02-02','thuc-an-cho-cho-con-royal-canin-chihuahua-puppy-400x400.webp','Thức ăn cho chó Chihuahua con ROYAL CANIN',200000,40,1,1),(19,'Thức ăn cho chó con PURINA PRO PLAN Small & Mini Puppy (Dry Dog Food) vị thịt gà nguyên chất giúp cân bằng và hoàn chỉnh cho các giống chó nhỏ',5,'2023-02-02','thuc-an-cho-cho-nho-purina-pro-plan-small-mini-puppy-400x400.jpg','Thức ăn cho chó con PURINA PRO PLAN',600000,20,1,2),(20,'Thức ăn cho chó trưởng thành PURINA PRO PLAN Small & Mini Adult (Dry Dog Food) vị thịt gà nguyên chất dành cho các giống chó nhỏ – mini có trọng lượng khi trưởng thành dưới 10kg.',10,'2023-02-02','thuc-an-cho-cho-truong-thanh-purina-pro-plan-small-mini-adult-400x400.jpg','Thức ăn cho chó trưởng thành PURINA PRO PLAN',500000,50,1,2),(21,'Thức ăn cho chó con PURINA PRO PLAN Large Puppy (Dry Dog Food) với công thức hoàn chỉnh phù hợp với các giống chó con dưới 12 tháng tuổi.',5,'2023-02-02','thuc-an-cho-cho-con-purina-pro-plan-large-puppy-400x400.jpg','Thức ăn cho chó con PURINA PRO PLAN',450000,50,1,2),(22,'Thức ăn cho chó đẹp lông PURINA PRO PLAN Small & Mini Fussy Beauty phù hợp với các giống chó nhỏ và mini có trọng lượng dưới 10kg và trên 12 tháng tuổi.',5,'2023-02-02','thuc-an-cho-cho-dep-long-purina-pro-plan-fussy-beauty-adult-400x400.jpg','Thức ăn cho chó đẹp lông PURINA PRO PLAN',450000,50,1,2),(23,'Phù hợp với các giống chó nhỏ và mini có trọng lượng dưới 10kg và trưởng thành từ 12 tháng tuổi trở lên.',5,'2023-02-02','thuc-an-cho-cho-purina-pro-plan-small-mini-sensitive-skin-coat-400x400.jpg','Thức ăn cho chó PURINA PRO PLAN',500000,55,1,2),(24,'Thức ăn cho chó da nhạy cảm PURINA PRO PLAN  phù hợp với các giống chó vừa và lớn có trọng lượng trên 10kg và trưởng thành từ 12 tháng tuổi trở lên.',5,'2023-02-02','thuc-an-cho-cho-da-nhay-cam-purina-pro-plan-sensitive-skin-coat-400x400.jpg','Thức ăn cho chó da nhạy cảm PURINA PRO PLAN',500000,55,1,2),(25,' Sản phẩm sử dụng phù hợp với tất cả các giống chó trưởng thành từ 12 tháng tuổi trở lên.',10,'2023-02-02','thuc-an-cho-cho-purina-pro-plan-all-size-adult-sensitive-skin-stomach-400x400.jpg','Thức ăn cho chó PURINA PRO PLAN',550000,60,1,2),(26,'Thức ăn cho chó trưởng thành PURINA PRO PLAN Medium Adult (Dry Dog Food) hoàn chỉnh vị thịt gà nguyên chất cho chó trưởng thành từ 12 tháng tuổi trở lên.',10,'2023-02-02','thuc-an-cho-cho-truong-thanh-purina-pro-plan-medium-adult-400x400.jpg','Thức ăn cho chó trưởng thành PURINA PRO PLAN',400000,40,1,2),(27,'Thức ăn cho chó con PURINA PRO PLAN Medium Puppy (Dry Dog Food) hoàn chỉnh vị thịt gà nguyên chất cho chó con dưới 12 tháng tuổi. ',10,'2023-02-02','thuc-an-cho-cho-con-purina-pro-plan-medium-puppy-400x400.jpg','Thức ăn cho chó con PURINA PRO PLAN',460000,20,1,2),(28,'Thức ăn cho chó trưởng thành PURINA PRO PLAN với công thức hoàn chỉnh phù hợp với các giống chó trưởng thành từ 12 tháng tuổi trở lên. ',5,'2023-02-02','thuc-an-cho-cho-con-purina-pro-plan-large-adult-400x400.jpg','Thức ăn cho chó trưởng thành PURINA PRO PLAN',400000,30,1,2),(29,'Pate cho mèo mẹ và mèo con CATIDEA  dành cho tất cả các giống mèo, mèo mẹ đang mang thai, đang cho con bú và mèo con.',0,'2023-02-02','pate-cho-meo-me-va-meo-con-catidea-mother-baby-cat-400x400.webp','Pate cho mèo mẹ và mèo con CATIDEA',30000,40,2,3),(30,'Pate cho mèo vị cá ngừ và tôm CATIDEA dành cho tất cả các giống mèo.',0,'2023-02-02','pate-cho-meo-vi-ca-ngu-va-tom-catidea-fairy-chef-gavy-pouch-tuna-white-meat-shrimp-400x400.webp','Pate cho mèo vị cá ngừ và tôm CATIDEA',20000,30,2,3),(31,'Pate cho mèo vị thịt gà và bí ngô CATIDEA dành cho tất cả các giống mèo.',0,'2023-02-02','pate-cho-meo-vi-thit-ga-va-bi-ngo-catidea-fairy-chef-gavy-pouch-chicken-pumpkin-400x400.webp','Pate cho mèo vị thịt gà và bí ngô CATIDEA',20000,30,2,3),(32,'Thức ăn cho mèo Anh lông ngắn CATIDEA Fairy Chef British Shorthair phù hợp với mèo con từ 4 tháng tuổi trở lên.',10,'2023-02-02','thuc-an-cho-meo-anh-long-ngan-catidea-fairy-chef-british-shorthair-400x400.webp','Thức ăn cho mèo Anh lông ngắn CATIDEA',300000,60,2,3),(33,'Pate cho mèo vị thịt gà và phô mai CATIDEA  dành cho tất cả các giống mèo.',0,'2023-02-02','pate-cho-meo-vi-thit-ga-va-pho-mai-catidea-fairy-chef-gavy-pouch-chicken-chesse-400x400.webp','Pate cho mèo vị thịt gà và phô mai CATIDEA',20000,30,2,3),(34,'Thức ăn cho mèo trưởng thành CATIDEA dành cho tất cả các giống mèo từ 1 đến 7 tuổi.',10,'2023-02-02','thuc-an-cho-meo-truong-thanh-catidea-fairy-chef-adult-nutrition-400x400.webp','Thức ăn cho mèo trưởng thành CATIDEA',250000,100,2,3),(35,'Thức ăn cho mèo mẹ và mèo con CATIDEA Fairy Chef Mother & Baby, dành cho mèo con từ 1 đến 12 tháng tuổi. Thích hợp cho cả mèo cái mang thai và đang cho con bú.',10,'2023-02-02','thuc-an-cho-meo-me-va-meo-con-catidea-fairy-chef-mother-baby-400x400.webp','Thức ăn cho mèo mẹ và mèo con CATIDEA ',290000,30,2,3),(36,'Thức ăn cho mèo CATIDEA Grain Free Natural Nutrition dành cho các giống mèo và các giai đoạn tuổi của chúng. ',10,'2023-02-02','thuc-an-cho-meo-grain-free-natural-nutrition-400x400.webp','Thức ăn cho mèo CATIDEA',280000,56,2,3),(37,'Pate cho mèo vị cá ngừ sốt xoài CATIDEA  dành cho tất cả các giống mèo.',0,'2023-02-02','pate-cho-meo-vi-ca-ngu-sot-xoai-catidea-fairy-chef-gavy-pouch-tuna-white-meat-mango-400x400.webp','Pate cho mèo vị cá ngừ sốt xoài CATIDEA',20000,30,2,3),(38,'Pate cho mèo vị thịt trộn CATIDEA Variety Of Meat dành cho tất cả các giống mèo, thích hợp cho mèo ở mọi lứa tuổi.',0,'2023-02-02','pate-cho-meo-vi-thit-tron-catidea-variety-meat-400x400.webp','Pate cho mèo vị thịt trộn CATIDEA',60000,50,2,3),(39,'Thức ăn cho mèo mọi lứa tuổi CATIDEA Basic Meat Freeze Dried dành cho tất cả các giống mèo ở mọi lứa tuổi.',10,'2023-02-02','thuc-an-cho-meo-catidea-basic-meat-freeze-dried-400x400.webp','Thức ăn cho mèo mọi lứa tuổi CATIDEA',500000,50,2,3),(40,'Thức ăn cho mèo mọi lứa tuổi CATIDEA Basic Meat All Age thích hợp cho tất cả các giống mèo ở mọi lứa tuổi.',5,'2023-02-02','thuc-an-cho-meo-moi-lua-tuoi-catidea-basic-meat-all-age-400x400.webp','Thức ăn cho mèo mọi lứa tuổi CATIDEA',500000,40,2,3),(41,'\r\nSúp thưởng cho mèo vị thịt gà sốt phô mai CATIDEA Fairy Chef Sachet Chicken & Chesse dành cho tất cả các giống mèo.',0,'2023-02-02','sup-thuong-cho-meo-vi-thit-ga-sot-pho-mai-catidea-fairy-chef-sachet-chicken-chesse-400x400.webp',' Súp thưởng cho mèo vị thịt gà sốt phô mai CATIDEA',20000,30,2,3),(42,'Thức ăn cho mèo mẹ và mèo con CATIDEA Basic Meat Kittens thích hợp với các giống mèo con từ 1 đến 12 tháng tuổi.',0,'2023-02-02','thuc-an-cho-meo-me-va-meo-con-catidea-basic-meat-kitten-400x400.webp','Thức ăn cho mèo mẹ và mèo con CATIDEA',555000,20,2,3),(43,'Súp thưởng cho mèo vị thịt gà sốt táo CATIDEA Fairy Chef Sachet Chicken & Apple dành cho tất cả các giống mèo.',0,'2023-02-02','sup-thuong-cho-meo-vi-thit-ga-sot-tao-catidea-fairy-chef-sachet-chicken-apple-400x400.webp','Súp thưởng cho mèo vị thịt gà sốt táo CATIDEA',45000,30,2,3),(44,'\r\nSúp thưởng cho mèo vị cá ngừ sốt bí ngô CATIDEA Fairy Chef Sachet Tuna & Pumpkin dành cho tất cả các giống mèo.',0,'2023-02-02','sup-thuong-cho-meo-vi-ca-ngu-sot-bi-ngo-catidea-fairy-chef-sachet-tuna-pumpkin-400x400.webp','Súp thưởng cho mèo vị cá ngừ sốt bí ngô CATIDEA',45000,30,2,3),(45,'Giúp chim mau căng lửa, thi đấu bền bỉ, ổn định, khoẻ mạnh, tăng cường thể lực. Cám không nóng, không chất kích thích, cung cấp đầy đủ dinh dưỡng và Vitamin.',0,'2023-02-02','01-choe-canglua.jpg','Cám chích choè',70000,50,4,4),(46,'Giúp chim mau căng lửa, thi đấu bền bỉ, ổn định, khoẻ mạnh, tăng cường thể lực. Cám không nóng, không chất kích thích, cung cấp đầy đủ dinh dưỡng và Vitamin.',0,'2023-02-02','03-mao-canglua.jpg','Cám chào mào',60000,30,4,4),(47,'Giúp chim mau căng lửa, thi đấu bền bỉ, ổn định, khoẻ mạnh, tăng cường thể lực. Cám không nóng, không chất kích thích, cung cấp đầy đủ dinh dưỡng và Vitamin.',0,'2023-02-02','vanhKhuyen-cangLua.jpg','Cám vành khuyên',50000,30,4,4),(48,'Giúp chim mau căng lửa, thi đấu bền bỉ, ổn định, khoẻ mạnh, tăng cường thể lực. Cám không nóng, không chất kích thích, cung cấp đầy đủ dinh dưỡng và Vitamin.',0,'2023-02-02','05-mi-canglua.jpg','Cám hoạ mi ',50000,30,4,4),(49,'Dùng chung cho các loài chim, chim ăn côn trùng, hạt, trái cây, …',0,'2023-02-02','07-tonghop.jpg','Cám tổng hợp',40000,50,4,4),(50,'Thay thế mồi tươi, sử dụng cho các loài chim cảnh.',0,'2023-02-02','hatConTrung.jpg','Hạt côn trùng sấy',60000,30,4,4),(51,'Thay thế mồi tươi, sử dụng cho các loài chim cảnh.',0,'2023-02-02','hat-cao-cao.jpg','Hạt cào cào sấy',45000,30,4,4),(52,'Trái cây mát không nóng, sử dụng quanh năm, cung cấp đầy đủ dinh dưỡng và các vitamin thiết yếu.',0,'2023-02-02','traiCayTongHop.jpg','Trái cây tổng hợp',40000,30,4,4),(53,'TROPICAL SUPERVIT MINI GRANULAT là thức ăn cho cá dạng hạt mini đa thành phần với beta-glucan được nhập khẩu nguyên hộp từ Ba Lan, Liên minh Châu Âu. ',5,'2023-02-02','senaquatic-vn-1.jpg','Thức Ăn Tropical Supervit Mini Granulat',200000,20,3,5),(54,'TROPICAL VITALITY & COLOR đảm bảo sức sống và tăng cường màu sắc cho cá cảnh được nhập khẩu nguyên hộp từ Ba Lan, Liên minh Châu Âu.',5,'2023-02-02','senaquatic-vn-5.webp','Thức Ăn Tropical Vitality & Color Flakes',300000,20,3,5),(55,'TROPICAL SUPERVIT TAB B là dòng thức ăn đa thành phần có beta-glucan nhập khẩu nguyên hộp từ Ba Lan, Liên minh Châu Âu.',10,'2023-02-02','senaquatic-vn-5.webp','Thức Ăn Tropical Supervit Tab B',290000,30,3,5),(56,'TROPICAL SUPERVIT TAB A là viên kết dính đa thành phần với beta-glucan nhập khẩu nguyên hộp từ Ba Lan, Liên minh Châu Âu.',10,'2023-02-02','91wmlsihhjl-ac-sl1500.webp','Thức Ăn Tropical Supervit Tab A',370000,15,3,5),(57,'TROPICAL NANOVIT GRANULAT là dòng thức ăn chìm chậm đa dưỡng chất cho cá nhỏ và cá con được nhập khẩu nguyên hộp từ Ba Lan, Liên minh Châu Âu.',10,'2023-02-02','172216.webp','Thức Ăn Tropical Nanovit Granulat',270000,15,3,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcotftqap7by5m4ibph3ss3xvo` (`customerId`),
  CONSTRAINT `FKcotftqap7by5m4ibph3ss3xvo` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN','admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'royalcanin@gmail.com','ROYAL CANIN','0988888888'),(2,'purinaproplan@gmail.com','PURINA PRO PLAN','0898989898'),(3,'catidea@gmail.com','CATIDEA','0866666688'),(4,'phuvinh@gmail.com','PHÚ VINH','0968986666'),(5,'senaquatic@gmail.com','SEN AQUATIC','0966889988');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-06 15:34:59
