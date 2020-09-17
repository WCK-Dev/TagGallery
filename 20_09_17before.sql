-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: gallery
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `f_seq` int NOT NULL AUTO_INCREMENT,
  `f_originname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `f_uploadname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `f_thumbname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `f_fsize` int NOT NULL DEFAULT '0',
  `f_downcnt` int NOT NULL DEFAULT '0',
  `g_seq` int NOT NULL,
  PRIMARY KEY (`f_seq`),
  KEY `FK_g_seq` (`g_seq`),
  CONSTRAINT `FK_g_seq` FOREIGN KEY (`g_seq`) REFERENCES `gallery` (`g_seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='업로드 파일 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (38,'1화_바다.jpg','9fe04400-c179-4a8a-aa03-4d190e19214a.jpg','9fe04400-c179-4a8a-aa03-4d190e19214a.jpg',110192,1,1),(41,'cat.jpg','d40fd2cb-4572-4cec-a6f4-456044146999.jpg','d40fd2cb-4572-4cec-a6f4-456044146999.jpg',81951,1,1),(42,'tree.jpg','68fb1aaf-1b8f-4c1a-9599-ef4ed892f6f6.jpg','68fb1aaf-1b8f-4c1a-9599-ef4ed892f6f6.jpg',60856,1,1),(43,'car.png','d8de465f-9881-4087-a2df-da3a05478c4e.png','d8de465f-9881-4087-a2df-da3a05478c4e.png',101270,0,2),(44,'egov.jpg','9453816a-8d34-4fbd-a66b-1d5b8a0163a6.jpg','9453816a-8d34-4fbd-a66b-1d5b8a0163a6.jpg',16765,0,2),(45,'180829-8-2000-din-busan-hotel.jpg.thumb.768.768.jpg','6d2b354a-b787-4056-97cd-57456f8161bd.jpg','6d2b354a-b787-4056-97cd-57456f8161bd.jpg',65225,0,3),(46,'house.jpg','c9bbfed7-dbd0-4a4b-aa6a-1e79339a9fcf.jpg','c9bbfed7-dbd0-4a4b-aa6a-1e79339a9fcf.jpg',116509,0,3),(47,'pets.jpg','2ebd3bfe-c7ea-45ec-a7f6-239eb4a00325.jpg','2ebd3bfe-c7ea-45ec-a7f6-239eb4a00325.jpg',120915,1,4),(48,'can.jpg','9819ad5a-38e2-44ac-8f5f-3918af8b8227.jpg','9819ad5a-38e2-44ac-8f5f-3918af8b8227.jpg',54537,0,5),(50,'student.png','0abc18ff-7b8a-4e29-a344-cea9c05b17e1.png','0abc18ff-7b8a-4e29-a344-cea9c05b17e1.png',97360,1,7),(51,'baby.jpg','db3d2e5b-0c7b-42da-9dbb-1459518ba488.jpg','db3d2e5b-0c7b-42da-9dbb-1459518ba488.jpg',43438,1,6),(53,'catPray.jpg','05deaa82-8f0f-48fe-a693-2c7d185698ef.jpg','05deaa82-8f0f-48fe-a693-2c7d185698ef.jpg',190369,1,8),(54,'plz.jpg','a51195d6-27d9-443a-a2a9-16abc3f41db5.jpg','a51195d6-27d9-443a-a2a9-16abc3f41db5.jpg',25716,0,9),(56,'orca.jpg','865923c9-670f-4570-9b52-c53a82d4d756.jpg','865923c9-670f-4570-9b52-c53a82d4d756.jpg',101889,0,10),(57,'fish.jpg','8abd142c-0c82-42f7-8cc9-a1fc19758cd7.jpg','8abd142c-0c82-42f7-8cc9-a1fc19758cd7.jpg',4933212,0,10),(58,'Squirrel.jpg','48b1cf6e-400a-41d6-abe9-d111b0279c62.jpg','48b1cf6e-400a-41d6-abe9-d111b0279c62.jpg',48158,0,11),(59,'cat_Thunder.jpg','bfe46966-d51e-4cd9-8fcd-e935b0eefed9.jpg','bfe46966-d51e-4cd9-8fcd-e935b0eefed9.jpg',91101,0,12),(61,'Lion.jpg','6849a502-a303-4a00-ba81-8b88f3914e53.jpg','6849a502-a303-4a00-ba81-8b88f3914e53.jpg',314509,2,13),(62,'deer.jpg','b498c6d2-31d2-4d62-a26e-b8d2263d5770.jpg','b498c6d2-31d2-4d62-a26e-b8d2263d5770.jpg',25776,0,13);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `g_seq` int NOT NULL,
  `g_title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `g_content` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `g_regdate` date NOT NULL,
  `g_readcnt` int NOT NULL DEFAULT '0',
  `g_tag` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `g_writer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`g_seq`),
  KEY `FK_g_writer_u_id` (`g_writer`),
  CONSTRAINT `FK_g_writer_u_id` FOREIGN KEY (`g_writer`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='갤러리 게시글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,'태그 전부 수정','태그 전부를 수정합니다\r\n로 수정합니다.','2020-09-15',79,'가을,바다,사람','wck'),(2,'테스트 작성글','갤러리 테스트 글을 작성합니다 ^0^','2020-09-15',7,'테스트,이미지','wck'),(3,'건물사진','건물사진입니다\r\n\r\n레스토랑이랑 집입니다.','2020-09-15',8,'건물,음식,레스토랑','wck'),(4,'애완동물','pets','2020-09-15',6,'동물,고양이,강아지, 펫','wck'),(5,'통조림','통조림 사진\r\n\r\n:D','2020-09-15',2,'통조림,깡통','wck'),(6,'아기','아기사진입니다\r\n\r\n귀엽죠?','2020-09-15',26,'아기,사람,귀여움,웃음','wck'),(7,'학생이미지','학생아이콘을 추가해봤어요\r\n\r\n잘 사용하시길 바랍니다 ^^','2020-09-15',12,'학생,아이콘,야나,두','wck'),(8,'제발!!!','ㅈㅂㅈㅂ!!!','2020-09-16',12,'기도,동물,웃긴사진,고양이','wck'),(9,'제발!!','하느님 제발!!','2020-09-16',22,'웃긴사진,카툰,웃음','wck'),(10,'오르카, 생선','이미지 두개에요\r\n\r\n물고기 :D','2020-09-16',17,'바다,동물,범고래,물고기','wck'),(11,'람쥐썬더!!','ㄹㅈㅆㄷ','2020-09-16',1,'웃긴사진,동물,다람쥐','wck'),(12,'고양이썬더','고양이썬더','2020-09-16',2,'웃긴사진,동물,고양이','wck'),(13,'동물사진','사자\r\n\r\n사슴','2020-09-16',37,'동물,사자,사슴,맹수','wck');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `t_seq` int NOT NULL AUTO_INCREMENT,
  `t_name` varchar(100) NOT NULL DEFAULT '',
  `t_readcnt` int NOT NULL DEFAULT '0',
  `t_regdate` date NOT NULL,
  `g_seq` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`t_seq`),
  KEY `FK_tag_gseq` (`g_seq`),
  CONSTRAINT `FK_tag_gseq` FOREIGN KEY (`g_seq`) REFERENCES `gallery` (`g_seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='태그관련 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (21,'바다',1,'2020-09-15',1),(28,'가을',1,'2020-09-15',1),(29,'사람',1,'2020-09-15',1),(30,'테스트',0,'2020-09-15',2),(31,'이미지',0,'2020-09-15',2),(32,'건물',4,'2020-09-15',3),(34,'음식',4,'2020-09-15',3),(35,'레스토랑',4,'2020-09-15',3),(36,'동물',2,'2020-09-15',4),(37,'고양이',2,'2020-09-15',4),(38,'강아지',2,'2020-09-15',4),(39,'펫',2,'2020-09-15',4),(40,'통조림',0,'2020-09-15',5),(41,'깡통',0,'2020-09-15',5),(42,'아기',5,'2020-09-15',6),(43,'사람',5,'2020-09-15',6),(44,'귀여움',5,'2020-09-15',6),(45,'학생',5,'2020-09-15',7),(46,'아이콘',5,'2020-09-15',7),(47,'기도',7,'2020-09-16',8),(48,'동물',7,'2020-09-16',8),(49,'웃긴사진',7,'2020-09-16',8),(50,'웃긴사진',20,'2020-09-16',9),(51,'카툰',20,'2020-09-16',9),(52,'바다',9,'2020-09-16',10),(53,'동물',9,'2020-09-16',10),(54,'범고래',9,'2020-09-16',10),(55,'물고기',9,'2020-09-16',10),(56,'웃긴사진',0,'2020-09-16',11),(57,'동물',0,'2020-09-16',11),(58,'다람쥐',0,'2020-09-16',11),(59,'웃긴사진',1,'2020-09-16',12),(60,'동물',1,'2020-09-16',12),(61,'고양이',1,'2020-09-16',12),(62,'동물',32,'2020-09-16',13),(64,'사자',32,'2020-09-16',13),(65,'사슴',32,'2020-09-16',13),(66,'야',5,'2020-09-16',7),(68,'야나',5,'2020-09-16',7),(69,'두',5,'2020-09-16',7),(70,'맹수',29,'2020-09-17',13),(71,'고양이',2,'2020-09-17',8),(72,'웃음',1,'2020-09-17',9),(73,'웃음',2,'2020-09-17',6);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `u_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `u_pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `u_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('wck','1234','우치경');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-17 15:31:13
