-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: books
-- ------------------------------------------------------
-- Server version	5.5.41-log

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (14,'zzzzzzzz','2015-09-23 18:01:22','2015-09-23 18:01:22'),(15,'ender','2015-09-23 18:07:30','2015-09-23 18:07:30'),(16,'asdfasdf','2015-09-23 18:07:36','2015-09-23 18:07:36'),(17,'ceddy','2015-09-23 18:07:45','2015-09-23 18:07:45'),(18,'JK','2015-09-24 08:06:51','2015-09-24 08:06:51'),(19,'JK','2015-09-24 08:10:36','2015-09-24 08:10:36'),(20,'JK','2015-09-24 08:14:55','2015-09-24 08:14:55'),(21,'JK','2015-09-24 08:34:54','2015-09-24 08:34:54'),(22,'YAP','2015-09-24 10:23:26','2015-09-24 10:23:26'),(23,'SSBM','2015-09-24 12:05:15','2015-09-24 12:05:15'),(24,'Paolini','2015-11-22 21:07:36','2015-11-22 21:07:36');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `authors_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_books_authors_idx` (`authors_id`),
  CONSTRAINT `fk_books_authors` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (13,'zzzzzzzzzz','2015-09-23 18:01:22','2015-09-23 18:01:22',14),(14,'ENDER','2015-09-23 18:07:31','2015-09-23 18:07:31',15),(15,'adfadf','2015-09-23 18:07:36','2015-09-23 18:07:36',16),(16,'ceddy','2015-09-23 18:07:45','2015-09-23 18:07:45',17),(17,'Harry Potter','2015-09-24 08:06:51','2015-09-24 08:06:51',18),(18,'Harry Potter2','2015-09-24 08:10:36','2015-09-24 08:10:36',19),(19,'Harry Potter2','2015-09-24 08:14:55','2015-09-24 08:14:55',20),(20,'Harry Potter2','2015-09-24 08:34:54','2015-09-24 08:34:54',21),(21,'Kite Runner','2015-09-24 10:23:26','2015-09-24 10:23:26',22),(22,'Mango','2015-09-24 12:05:15','2015-09-24 12:05:15',23),(23,'Eragon','2015-11-22 21:07:36','2015-11-22 21:07:36',24);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reviews` varchar(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_users1_idx` (`users_id`),
  KEY `fk_reviews_books1_idx` (`books_id`),
  CONSTRAINT `fk_reviews_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (2,'zzzzzzzzz',1,'2015-09-23 18:01:22','2015-09-23 18:01:22',2,13),(3,'adf',3,'2015-09-23 18:07:31','2015-09-23 18:07:31',2,14),(4,'asdfasdf',3,'2015-09-23 18:07:36','2015-09-23 18:07:36',2,15),(5,'gooooooooooooood',5,'2015-09-23 18:07:46','2015-09-23 18:07:46',2,16),(6,'GOOD',4,'2015-09-24 08:06:51','2015-09-24 08:06:51',3,17),(7,'GOODg',4,'2015-09-24 08:10:36','2015-09-24 08:10:36',3,18),(8,'GOODg',4,'2015-09-24 08:14:55','2015-09-24 08:14:55',3,19),(9,'GOODg',4,'2015-09-24 08:34:54','2015-09-24 08:34:54',3,20),(10,'asdf',1,'2015-09-24 08:40:35','2015-09-24 08:40:35',3,20),(11,'asdf',1,'2015-09-24 08:40:48','2015-09-24 08:40:48',3,20),(12,'asdddddddddddddd',3,'2015-09-24 08:40:54','2015-09-24 08:40:54',3,20),(13,'GOOOD STUFF',1,'2015-09-24 10:23:26','2015-09-24 10:23:26',4,21),(14,'NOPE',1,'2015-09-24 10:23:50','2015-09-24 10:23:50',4,20),(15,'NOPE',1,'2015-09-24 10:24:02','2015-09-24 10:24:02',4,17),(16,'WHAT?',1,'2015-09-24 10:24:12','2015-09-24 10:24:12',4,13),(18,'GOD',5,'2015-09-24 12:05:15','2015-09-24 12:05:15',5,22),(19,'YUZp',1,'2015-09-24 12:05:31','2015-09-24 12:05:31',5,14),(20,'YEEEEEEEEEEEEEEEEEE',1,'2015-09-24 12:05:49','2015-09-24 12:05:49',5,21),(21,'werqwerrwerre',3,'2015-09-24 12:08:51','2015-09-24 12:08:51',5,13),(22,'Great book, bad movie...',3,'2015-11-22 21:07:37','2015-11-22 21:07:37',7,23),(23,'I liked the movie',5,'2015-11-22 21:41:22','2015-11-22 21:41:22',7,23);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Alex','Sung','Alex@Jo.com','$2a$12$NphtnaNbfDfwWLE735At8.YHekX97le8eIo5rNmY.HJuJ2J/3NPPW','2015-09-23 14:47:50','2015-09-23 14:47:50'),(3,'Yo','chain','chain@smokers.com','$2a$12$2JNpqpO95fBWFCBpfV2qm.w2b88xRS21UpZE2PltHZFfqq.lAj29y','2015-09-24 08:06:25','2015-09-24 08:06:25'),(4,'WOOOOOOOOOO','yeaaaaaaap','ye@ap.com','$2a$12$KS6I2EpHKlczF.agFZKRT.S82wetCO2DBQRM2oHJLGwGIqVEk0Ysu','2015-09-24 10:22:21','2015-09-24 10:22:21'),(5,'Cedric','sky','cedricbjjo@hotmail.com','$2a$12$YJAXTukg1sLXOzan.JF0O.mxB2bWRr8o14CZ4q/c/4slUCIXZKntK','2015-09-24 12:04:56','2015-09-24 12:04:56'),(6,'Cedric','Mango','Cedricbjjo@hotmail.com','$2b$12$kj4Hu5KXEPJqSgsQV6ncteZ0EkdBHCV/caVqBrNAqda6DfSEHz9B2','2015-11-22 21:03:59','2015-11-22 21:03:59'),(7,'Cedric','chain','asd@asdf.com','$2b$12$j8kBYBC9ugmpi/weUOgM4uzq9a.5b3lP6zQDQH5NiZsv5Y1s6A93K','2015-11-22 21:05:36','2015-11-22 21:05:36'),(8,'Cedric Jo','ced','cedricbjjo@hotmail.com','$2b$12$senY2AKcPrB.svR3MyB/8e4FH.gE/uMHRvsW1f89WLj.04atmMsYm','2015-12-08 22:04:34','2015-12-08 22:04:34'),(9,'Cedric Jo','123','ceddy@hotmail.com','$2b$12$JqRkHHTvk5vAHjbf6J8zRuuQEt1PWX61i2q/q7g6tGrTmdx0aKgTy','2015-12-08 22:04:49','2015-12-08 22:04:49');
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

-- Dump completed on 2015-12-11 13:40:03
