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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='업로드 파일 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (38,'1화_바다.jpg','9fe04400-c179-4a8a-aa03-4d190e19214a.jpg','9fe04400-c179-4a8a-aa03-4d190e19214a.jpg',110192,1,1),(41,'cat.jpg','d40fd2cb-4572-4cec-a6f4-456044146999.jpg','d40fd2cb-4572-4cec-a6f4-456044146999.jpg',81951,1,1),(42,'tree.jpg','68fb1aaf-1b8f-4c1a-9599-ef4ed892f6f6.jpg','68fb1aaf-1b8f-4c1a-9599-ef4ed892f6f6.jpg',60856,1,1),(43,'car.png','d8de465f-9881-4087-a2df-da3a05478c4e.png','d8de465f-9881-4087-a2df-da3a05478c4e.png',101270,1,2),(44,'egov.jpg','9453816a-8d34-4fbd-a66b-1d5b8a0163a6.jpg','9453816a-8d34-4fbd-a66b-1d5b8a0163a6.jpg',16765,0,2),(45,'180829-8-2000-din-busan-hotel.jpg.thumb.768.768.jpg','6d2b354a-b787-4056-97cd-57456f8161bd.jpg','6d2b354a-b787-4056-97cd-57456f8161bd.jpg',65225,0,3),(46,'house.jpg','c9bbfed7-dbd0-4a4b-aa6a-1e79339a9fcf.jpg','c9bbfed7-dbd0-4a4b-aa6a-1e79339a9fcf.jpg',116509,0,3),(47,'pets.jpg','2ebd3bfe-c7ea-45ec-a7f6-239eb4a00325.jpg','2ebd3bfe-c7ea-45ec-a7f6-239eb4a00325.jpg',120915,2,4),(50,'student.png','0abc18ff-7b8a-4e29-a344-cea9c05b17e1.png','0abc18ff-7b8a-4e29-a344-cea9c05b17e1.png',97360,1,7),(53,'catPray.jpg','05deaa82-8f0f-48fe-a693-2c7d185698ef.jpg','05deaa82-8f0f-48fe-a693-2c7d185698ef.jpg',190369,1,8),(54,'plz.jpg','a51195d6-27d9-443a-a2a9-16abc3f41db5.jpg','a51195d6-27d9-443a-a2a9-16abc3f41db5.jpg',25716,1,9),(59,'cat_Thunder.jpg','bfe46966-d51e-4cd9-8fcd-e935b0eefed9.jpg','bfe46966-d51e-4cd9-8fcd-e935b0eefed9.jpg',91101,14,12),(61,'Lion.jpg','6849a502-a303-4a00-ba81-8b88f3914e53.jpg','6849a502-a303-4a00-ba81-8b88f3914e53.jpg',314509,6,13),(62,'deer.jpg','b498c6d2-31d2-4d62-a26e-b8d2263d5770.jpg','b498c6d2-31d2-4d62-a26e-b8d2263d5770.jpg',25776,2,13),(63,'dumpling.jpg','5de821c2-c72a-4675-89da-eb996ff9dd66.jpg','THUMB_5de821c2-c72a-4675-89da-eb996ff9dd66.jpg',111629,1,14),(64,'dumpling2.jpg','8caf31b1-0faa-4207-9392-6711353b0572.jpg','THUMB_8caf31b1-0faa-4207-9392-6711353b0572.jpg',222208,0,14),(65,'cake.jpg','cfeeb74b-1b15-48a9-980e-d21d5796d91b.jpg','THUMB_cfeeb74b-1b15-48a9-980e-d21d5796d91b.jpg',511597,2,15),(66,'house.jpg','f3836e99-68d6-4b3d-b9e0-2da1cd54d88e.jpg','THUMB_f3836e99-68d6-4b3d-b9e0-2da1cd54d88e.jpg',116509,0,16),(67,'tree.jpg','700a2dcd-ab8d-43a2-a830-d3c321e7ec3c.jpg','THUMB_700a2dcd-ab8d-43a2-a830-d3c321e7ec3c.jpg',60856,0,16),(68,'baby.jpg','24678a23-c7a9-4cfa-ba4e-db4972d80333.jpg','THUMB_24678a23-c7a9-4cfa-ba4e-db4972d80333.jpg',75333,1,6),(69,'bee2.jpg','0d3be433-b760-44e5-82e5-97ddd9634ca2.jpg','THUMB_0d3be433-b760-44e5-82e5-97ddd9634ca2.jpg',87692,0,17),(70,'bee.jpg','b7812b44-67f5-475b-931a-59f3f74aeaad.jpg','THUMB_b7812b44-67f5-475b-931a-59f3f74aeaad.jpg',73469,0,17),(71,'ONG-Togo.jpg','9eec6909-d9cc-4387-9d84-47a84815d675.jpg','THUMB_9eec6909-d9cc-4387-9d84-47a84815d675.jpg',52108,0,18),(72,'Check.png','de5f1aa2-3408-4d37-a16b-79d4c5fe6f71.png','THUMB_de5f1aa2-3408-4d37-a16b-79d4c5fe6f71.png',37105,1,19),(74,'stock_Photo.jpg','6a7313aa-0e85-4881-be19-b6d683c46bcf.jpg','THUMB_6a7313aa-0e85-4881-be19-b6d683c46bcf.jpg',120001,1,20),(79,'kakao_characters.jpg','452f5be9-7fee-4131-9e97-759d3519c4bd.jpg','THUMB_452f5be9-7fee-4131-9e97-759d3519c4bd.jpg',69121,2,22),(80,'kakao2.jpg','5376e77a-d489-4822-a1e7-ce73fb517945.jpg','THUMB_5376e77a-d489-4822-a1e7-ce73fb517945.jpg',27738,1,22),(81,'friends.jpg','41210149-b64e-4b78-853d-2693d240f802.jpg','THUMB_41210149-b64e-4b78-853d-2693d240f802.jpg',114759,3,22),(82,'Kakao.png','7b4a7552-4d5a-4623-a887-cfb1c193b1d4.png','THUMB_7b4a7552-4d5a-4623-a887-cfb1c193b1d4.png',123760,2,22),(83,'people.jpg','1acc2e1b-66bb-4f72-ad24-5a675ddb2cc8.jpg','THUMB_1acc2e1b-66bb-4f72-ad24-5a675ddb2cc8.jpg',65870,1,23),(84,'human.jpg','db8c6f55-4100-4692-8d87-1bdea859e79c.jpg','THUMB_db8c6f55-4100-4692-8d87-1bdea859e79c.jpg',42960,1,23),(85,'kangwon.jpg','a13cde97-f182-4053-a6da-707844e7fda0.jpg','THUMB_a13cde97-f182-4053-a6da-707844e7fda0.jpg',23174,3,24),(86,'dodream.png','79e9d82a-2a7f-4600-825d-d0e1173b7782.png','THUMB_79e9d82a-2a7f-4600-825d-d0e1173b7782.png',138337,3,25),(87,'neo.jpg','97392cc1-c477-42ce-a3e6-f451138d8868.jpg','THUMB_97392cc1-c477-42ce-a3e6-f451138d8868.jpg',248568,1,26),(88,'ryan_3d.png','586b99a7-cf8c-431f-a59f-c4becf7ab90d.png','THUMB_586b99a7-cf8c-431f-a59f-c4becf7ab90d.png',13667,1,27),(89,'kakao2.jpg','2b132bbd-55b1-4932-8383-a6831c33384a.jpg','THUMB_2b132bbd-55b1-4932-8383-a6831c33384a.jpg',27738,3,28),(90,'color.png','3f4b5d55-824e-42a3-af09-d7bcae594ee4.png','THUMB_3f4b5d55-824e-42a3-af09-d7bcae594ee4.png',173529,0,20),(92,'cat.png','1167db48-f6b9-467f-a187-404f192d3be8.png','THUMB_1167db48-f6b9-467f-a187-404f192d3be8.png',82807,1,30),(93,'pig.jpg','4f9607f4-ca96-4bbd-9446-ea09bf60fc73.jpg','THUMB_4f9607f4-ca96-4bbd-9446-ea09bf60fc73.jpg',6546,1,30),(94,'dog.jpg','dcfda80d-f385-401d-be18-3cbc16c5a919.jpg','THUMB_dcfda80d-f385-401d-be18-3cbc16c5a919.jpg',381579,1,30),(95,'몰랑이.png','1027d92d-4d4c-4776-a2cc-df4bf68edbaf.png','THUMB_1027d92d-4d4c-4776-a2cc-df4bf68edbaf.png',37527,1,31),(101,'베니고마.jpg','79e5049c-1ca2-4c59-8dc0-d46d9ab7cc18.jpg','THUMB_79e5049c-1ca2-4c59-8dc0-d46d9ab7cc18.jpg',23445,1,32),(102,'cute.jpg','8d1313e8-60b7-4a8f-9f16-951aa28eebe2.jpg','THUMB_8d1313e8-60b7-4a8f-9f16-951aa28eebe2.jpg',17243,0,32),(106,'코닉세그.jpg','20441a03-b4ce-4ac3-8cbd-54a9f4ae2812.jpg','THUMB_20441a03-b4ce-4ac3-8cbd-54a9f4ae2812.jpg',78572,3,33);
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
INSERT INTO `gallery` VALUES (1,'태그 전부 수정','태그 전부를 수정합니다\r\n로 수정합니다.','2020-09-15',84,'가을,바다,사람','wck'),(2,'테스트 작성글','갤러리 테스트 글을 작성합니다 ^0^','2020-09-15',10,'테스트,이미지','wck'),(3,'건물사진','건물사진입니다\r\n\r\n레스토랑이랑 집입니다.','2020-09-15',10,'건물,음식,레스토랑','wck'),(4,'애완동물','pets','2020-09-15',12,'동물,고양이,강아지, 펫','wck'),(6,'아기','아기사진입니다\r\n\r\n귀엽죠?','2020-09-15',37,'아기,사람,귀여움,웃음','wck'),(7,'학생이미지','학생아이콘을 추가해봤어요\r\n\r\n잘 사용하시길 바랍니다 ^^','2020-09-15',13,'학생,아이콘,야나,두','wck'),(8,'제발!!!','ㅈㅂㅈㅂ!!!','2020-09-16',14,'기도,동물,웃긴사진,고양이','wck'),(9,'제발!!','하느님 제발!!','2020-09-16',24,'웃긴사진,카툰,웃음','wck'),(12,'고양이썬더','고양이썬더','2020-09-16',7,'웃긴사진,동물,고양이','wck'),(13,'동물사진','사자\r\n\r\n사슴','2020-09-16',47,'동물,사자,사슴,맹수','wck'),(14,'만두','만두사진이에요\r\n\r\n맛있어보여요','2020-09-17',5,'음식,만두,저녁','wck'),(15,'케이크','케이크사진입니다.','2020-09-17',6,'음식,생일,케이크','wck'),(16,'나무','나무사진','2020-09-17',2,'식물,숲','wck'),(17,'꿀벌','귀여운 꿀벌 \r\n\r\n:D','2020-09-17',11,'동물,곤충,벌','wck'),(18,'ONG','오엔지 로고입니다\r\n\r\n로고이미지를 업로드 해봅시다','2020-09-17',7,'로고,LOGO,썸네일,컬러','wck'),(19,'체크 이미지','업로드해봅니다\r\n\r\n하하하\r\n\r\n길게 글을 늘여써서 검색이 정상적인지 확인합시다.','2020-09-17',10,'이미지,체크,초록,컬러','wck'),(20,'컬러테스트','여러가지 색상을 담은 이미지입니다.\r\n\r\n화려한 느낌을 줍니다','2020-09-17',23,'컬러,테스트화면,추가','wck'),(22,'카카오','캐릭터 이미지\r\n\r\n\r\n라이언과 카카오 프렌즈','2020-09-18',15,'카카오,캐릭터,라이언,프렌즈','user'),(23,'사람의 행동','사람 이미지\r\n\r\n2장입니다.','2020-09-18',3,'사람,실사,캐릭터','user'),(24,'강원도 캐릭터입니다.','호랑이랑 곰?\r\n\r\n인거같아요 \r\n\r\n귀엽습니다.','2020-09-18',28,'호랑이,곰,동물,캐릭터','user'),(25,'두드림','두드림 대표캐릭터\r\n\r\n\'두두\' 입니다.','2020-09-18',16,'두두,캐릭터,두드림','user'),(26,'동물','동물','2020-09-18',4,'동물','user'),(27,'동물','라이언도 동물이지않을까','2020-09-18',1,'동물,카카오,라이언','user'),(28,'이얏호','10:02분 동물 태그글 하나더 작성하기!','2020-09-18',5,'동물,오전,캐릭터','user'),(30,'귀여운 동물 캐릭터','그리기쉽고 귀여운 캐릭터 이미지에요\r\n\r\n따라 그려봅시다 :D','2020-09-18',6,'동물,캐릭터,고양이,돼지,개','wck'),(31,'몰랑이','몰랑이 동글동글','2020-09-18',8,'몰랑이,동글동글,캐릭터','wck'),(32,'베니고마','베니고마라는 캐릭터에요','2020-09-18',11,'베니고마,캐릭터,귀여움,물개','wck'),(33,'슈퍼카','자동차 이미지입니다.','2020-09-18',19,'슈퍼카,람보르기니,코닉세그','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='태그관련 정보 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (21,'바다',6,'2020-09-15',1),(28,'가을',6,'2020-09-15',1),(29,'사람',6,'2020-09-15',1),(30,'테스트',3,'2020-09-15',2),(31,'이미지',3,'2020-09-15',2),(32,'건물',6,'2020-09-15',3),(34,'음식',6,'2020-09-15',3),(35,'레스토랑',6,'2020-09-15',3),(36,'동물',8,'2020-09-15',4),(37,'고양이',8,'2020-09-15',4),(38,'강아지',8,'2020-09-15',4),(39,'펫',8,'2020-09-15',4),(42,'아기',16,'2020-09-15',6),(43,'사람',16,'2020-09-15',6),(44,'귀여움',16,'2020-09-15',6),(45,'학생',6,'2020-09-15',7),(46,'아이콘',6,'2020-09-15',7),(47,'기도',9,'2020-09-16',8),(48,'동물',9,'2020-09-16',8),(49,'웃긴사진',9,'2020-09-16',8),(50,'웃긴사진',22,'2020-09-16',9),(51,'카툰',22,'2020-09-16',9),(59,'웃긴사진',6,'2020-09-16',12),(60,'동물',6,'2020-09-16',12),(61,'고양이',6,'2020-09-16',12),(62,'동물',42,'2020-09-16',13),(64,'사자',42,'2020-09-16',13),(65,'사슴',42,'2020-09-16',13),(66,'야',6,'2020-09-16',7),(68,'야나',6,'2020-09-16',7),(69,'두',6,'2020-09-16',7),(70,'맹수',39,'2020-09-17',13),(71,'고양이',4,'2020-09-17',8),(72,'웃음',3,'2020-09-17',9),(73,'웃음',13,'2020-09-17',6),(75,'음식',5,'2020-09-17',14),(76,'만두',5,'2020-09-17',14),(77,'저녁',5,'2020-09-17',14),(78,'음식',6,'2020-09-17',15),(79,'생일',6,'2020-09-17',15),(80,'케이크',6,'2020-09-17',15),(81,'식물',2,'2020-09-17',16),(82,'숲',2,'2020-09-17',16),(83,'동물',11,'2020-09-17',17),(84,'곤충',11,'2020-09-17',17),(85,'벌',11,'2020-09-17',17),(86,'로고',7,'2020-09-17',18),(87,'LOGO',7,'2020-09-17',18),(88,'썸네일',7,'2020-09-17',18),(89,'이미지',10,'2020-09-17',19),(90,'체크',10,'2020-09-17',19),(91,'초록',10,'2020-09-17',19),(92,'컬러',23,'2020-09-17',20),(93,'테스트화면',23,'2020-09-17',20),(95,'컬러',6,'2020-09-17',19),(96,'컬러',3,'2020-09-17',18),(99,'카카오',15,'2020-09-18',22),(100,'캐릭터',15,'2020-09-18',22),(101,'라이언',15,'2020-09-18',22),(102,'프렌즈',11,'2020-09-18',22),(103,'사람',3,'2020-09-18',23),(104,'실사',3,'2020-09-18',23),(105,'캐릭터',3,'2020-09-18',23),(106,'호랑이',28,'2020-09-18',24),(107,'곰',28,'2020-09-18',24),(108,'동물',28,'2020-09-18',24),(109,'캐릭터',28,'2020-09-18',24),(110,'두두',16,'2020-09-18',25),(111,'캐릭터',16,'2020-09-18',25),(112,'두드림',16,'2020-09-18',25),(113,'동물',4,'2020-09-18',26),(114,'동물',1,'2020-09-18',27),(115,'카카오',1,'2020-09-18',27),(116,'라이언',1,'2020-09-18',27),(117,'동물',5,'2020-09-18',28),(118,'오전',5,'2020-09-18',28),(119,'캐릭터',5,'2020-09-18',28),(121,'추가',1,'2020-09-18',20),(125,'동물',6,'2020-09-18',30),(126,'캐릭터',6,'2020-09-18',30),(127,'고양이',6,'2020-09-18',30),(128,'돼지',6,'2020-09-18',30),(129,'개',6,'2020-09-18',30),(130,'몰랑이',8,'2020-09-18',31),(131,'동글동글',8,'2020-09-18',31),(132,'캐릭터',8,'2020-09-18',31),(139,'베니고마',11,'2020-09-18',32),(140,'캐릭터',11,'2020-09-18',32),(141,'귀여움',11,'2020-09-18',32),(142,'물개',11,'2020-09-18',32),(143,'슈퍼카',19,'2020-09-18',33),(144,'람보르기니',19,'2020-09-18',33),(146,'코닉세그',16,'2020-09-18',33);
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
INSERT INTO `user` VALUES ('user','1234','사용자'),('wck','1234','우치경');
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

-- Dump completed on 2020-09-18 15:53:07
