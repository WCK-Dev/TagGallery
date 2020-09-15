-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: gallery
-- ------------------------------------------------------
-- Server version	8.0.18

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
  `f_seq` int(11) NOT NULL AUTO_INCREMENT,
  `f_originname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `f_uploadname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `f_thumbname` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `f_fsize` int(11) NOT NULL DEFAULT '0',
  `f_downcnt` int(11) NOT NULL DEFAULT '0',
  `g_seq` int(11) NOT NULL,
  PRIMARY KEY (`f_seq`),
  KEY `FK_g_seq` (`g_seq`),
  CONSTRAINT `FK_g_seq` FOREIGN KEY (`g_seq`) REFERENCES `gallery` (`g_seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='업로드 파일 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (38,'1화_바다.jpg','9fe04400-c179-4a8a-aa03-4d190e19214a.jpg','9fe04400-c179-4a8a-aa03-4d190e19214a.jpg',110192,0,1),(41,'cat.jpg','d40fd2cb-4572-4cec-a6f4-456044146999.jpg',NULL,81951,0,1),(42,'tree.jpg','68fb1aaf-1b8f-4c1a-9599-ef4ed892f6f6.jpg',NULL,60856,0,1),(43,'car.png','d8de465f-9881-4087-a2df-da3a05478c4e.png','d8de465f-9881-4087-a2df-da3a05478c4e.png',101270,0,2),(44,'egov.jpg','9453816a-8d34-4fbd-a66b-1d5b8a0163a6.jpg',NULL,16765,0,2),(45,'180829-8-2000-din-busan-hotel.jpg.thumb.768.768.jpg','6d2b354a-b787-4056-97cd-57456f8161bd.jpg','6d2b354a-b787-4056-97cd-57456f8161bd.jpg',65225,0,3),(46,'house.jpg','c9bbfed7-dbd0-4a4b-aa6a-1e79339a9fcf.jpg',NULL,116509,0,3),(47,'pets.jpg','2ebd3bfe-c7ea-45ec-a7f6-239eb4a00325.jpg','2ebd3bfe-c7ea-45ec-a7f6-239eb4a00325.jpg',120915,0,4),(48,'can.jpg','9819ad5a-38e2-44ac-8f5f-3918af8b8227.jpg','9819ad5a-38e2-44ac-8f5f-3918af8b8227.jpg',54537,0,5),(49,'baby.jpg','39db7fef-837a-4264-81d5-9739262eaf04.jpg','39db7fef-837a-4264-81d5-9739262eaf04.jpg',75333,0,6),(50,'student.png','0abc18ff-7b8a-4e29-a344-cea9c05b17e1.png','0abc18ff-7b8a-4e29-a344-cea9c05b17e1.png',97360,0,7);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `g_seq` int(11) NOT NULL,
  `g_title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `g_content` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `g_regdate` date NOT NULL,
  `g_readcnt` int(11) NOT NULL DEFAULT '0',
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
INSERT INTO `gallery` VALUES (1,'태그 전부 수정','태그 전부를 수정합니다\r\n로 수정합니다.','2020-09-15',73,'가을,바다,사람','wck'),(2,'테스트 작성글','갤러리 테스트 글을 작성합니다 ^0^','2020-09-15',5,'테스트,이미지','wck'),(3,'건물사진','건물사진입니다\r\n\r\n레스토랑이랑 집입니다.','2020-09-15',2,'건물,웃음,음식,레스토랑','wck'),(4,'애완동물','pets','2020-09-15',2,'동물,고양이,강아지, 펫','wck'),(5,'통조림','통조림 사진\r\n\r\n:D','2020-09-15',1,'통조림,깡통','wck'),(6,'아기','아기사진입니다\r\n\r\n귀엽죠?','2020-09-15',5,'아기,사람,귀여움','wck'),(7,'학생이미지','학생아이콘을 추가해봤어요\r\n\r\n잘 사용하시길 바랍니다 ^^','2020-09-15',1,'학생,아이콘','wck');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `t_seq` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(100) NOT NULL DEFAULT '',
  `t_usecnt` int(11) NOT NULL DEFAULT '0',
  `t_regdate` date NOT NULL,
  `g_seq` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`t_seq`),
  KEY `FK_tag_gseq` (`g_seq`),
  CONSTRAINT `FK_tag_gseq` FOREIGN KEY (`g_seq`) REFERENCES `gallery` (`g_seq`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='태그관련 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (21,'바다',0,'2020-09-15',1),(28,'가을',0,'2020-09-15',1),(29,'사람',0,'2020-09-15',1),(30,'테스트',0,'2020-09-15',2),(31,'이미지',0,'2020-09-15',2),(32,'건물',0,'2020-09-15',3),(33,'웃음',0,'2020-09-15',3),(34,'음식',0,'2020-09-15',3),(35,'레스토랑',0,'2020-09-15',3),(36,'동물',0,'2020-09-15',4),(37,'고양이',0,'2020-09-15',4),(38,'강아지',0,'2020-09-15',4),(39,'펫',0,'2020-09-15',4),(40,'통조림',0,'2020-09-15',5),(41,'깡통',0,'2020-09-15',5),(42,'아기',0,'2020-09-15',6),(43,'사람',0,'2020-09-15',6),(44,'귀여움',0,'2020-09-15',6),(45,'학생',0,'2020-09-15',7),(46,'아이콘',0,'2020-09-15',7);
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

-- Dump completed on 2020-09-15 23:29:21
