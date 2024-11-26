-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: project3
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
-- Table structure for table `st_college`
--

DROP TABLE IF EXISTS `st_college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_college` (
  `ID` bigint NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `PHONE_NO` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `MODIFIED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_college`
--

LOCK TABLES `st_college` WRITE;
/*!40000 ALTER TABLE `st_college` DISABLE KEYS */;
INSERT INTO `st_college` VALUES (5,'RML Maheshwari','Chhatribag','Indore','MP','9876543457','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:01:23','2022-09-18 15:01:23'),(6,'SHM Degree College','Ulhashnagar','Thane','M.H.','8578306487','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:02:14','2022-09-18 15:02:14'),(7,'Sage','Mahu','Indore','M.p.','7400901629','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:02:52','2022-09-18 15:02:52'),(8,'IIT Kharangpur','Kharagpur','Kharagpur','West Bengal','9617073519','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:03:34','2022-09-18 15:03:34'),(9,'Jawaharlal Nehru University','New Delhi','Delhi','New Delhi','7678565454','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:04:45','2022-09-18 15:04:45'),(10,'Govt.Holkar Science','Ab road Bhawarkua Square','Indore','Madya pradesh','7678565454','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:05:33','2022-09-18 15:05:33'),(11,'Dr.A.P.J. Abdul Kalam University','Indore Bypass rd.','Indore','Madya pradesh','7400901629','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:06:08','2022-09-18 15:06:08'),(12,'Shri Aurobindo institute of Medical seciences','Sanwer Road','Indore','Madya pradesh','9876543457','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:06:57','2022-09-18 15:06:57'),(13,'Malwa institute of Technology','Bypass road pragati vihar','Indore','Madya pradesh','9876543457','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:07:43','2022-09-18 15:07:43'),(14,'Astral college','Kailod Kartal Indore bypass road','Indore','Madya pradesh','7400901629','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:08:38','2022-09-18 15:08:38'),(15,'DY Patil  University','Nerul','New Mumbai','M.H.','7400901629','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:09:15','2022-09-18 15:09:15'),(16,'Bherulal Patidar Govt College','MHOW','MHOW','MP','9731232345','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:09:50','2022-09-18 15:09:50'),(17,'MIST','MHOW','Bhopal','MP','9898989898','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:10:41','2022-09-18 15:10:41'),(18,'Soft Vision','MHOW','Bhopal','MP','9898989998','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:11:23','2022-09-18 15:11:23'),(19,'Accropolis','Starlit Tower, 301, Yeshwant Niwas Rd, Lantern Square, New Palasia, Indore, Madhya Pradesh 452003','Indore','MP','9383873738','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:12:12','2022-09-18 15:12:12'),(20,'sardar patel college of indore','gouri nagar','Rau','bihar','9876543456','sourabhrajput061737@gmail.com','sourabhrajput061737@gmail.com','2023-03-19 19:33:29','2023-03-19 19:33:29');
/*!40000 ALTER TABLE `st_college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_course`
--

DROP TABLE IF EXISTS `st_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_course` (
  `ID` bigint NOT NULL,
  `COURSE_NAME` varchar(255) DEFAULT NULL,
  `DURATION` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `MODIFIED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_course`
--

LOCK TABLES `st_course` WRITE;
/*!40000 ALTER TABLE `st_course` DISABLE KEYS */;
INSERT INTO `st_course` VALUES (1,'BBA','3 Year','Bachelor of Business Administration','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:14:39','2022-09-18 15:14:39'),(2,'BSW','3 Year','Bachelor of Social Work','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:15:11','2022-09-18 15:15:11'),(3,'BBS','3 Year','Bachelor of Business Studies','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:15:32','2022-09-18 15:15:32'),(4,'BPharma','3 Year','Bachelor of Pharmacy','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:15:56','2022-09-18 15:15:56'),(5,'CA','3 Year','Chartered Accountancy','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:16:11','2022-09-18 15:16:11'),(6,'CS','3 Year','Company Secretary','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:16:28','2022-09-18 15:16:28'),(7,'MBA','2 Year','Master Of Business Administration','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:16:45','2022-09-18 15:16:45'),(8,'masterof arts','3 Year','arts','sourabhrajput061737@gmail.com','sourabhrajput061737@gmail.com','2023-03-19 19:34:32','2023-03-19 19:34:32');
/*!40000 ALTER TABLE `st_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_faculty`
--

DROP TABLE IF EXISTS `st_faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_faculty` (
  `ID` bigint NOT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `QUALIFICATION` varchar(255) DEFAULT NULL,
  `COLLEGE_NAME` varchar(255) DEFAULT NULL,
  `COURSE_NAME` varchar(255) DEFAULT NULL,
  `GENDER` varchar(255) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `COLLEGEID` bigint DEFAULT NULL,
  `EMAILID` varchar(255) DEFAULT NULL,
  `MOBILENO` varchar(255) DEFAULT NULL,
  `COURSEID` bigint DEFAULT NULL,
  `SUBJECTID` bigint DEFAULT NULL,
  `SUBJECTNAME` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `MODIFIED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_faculty`
--

LOCK TABLES `st_faculty` WRITE;
/*!40000 ALTER TABLE `st_faculty` DISABLE KEYS */;
INSERT INTO `st_faculty` VALUES (1,'Kratika','Shiriwastav','MBA','Malwa institute of Technology','BPharma','Female','2021-01-09 00:00:00',13,'Kratika@gmail.com','8393988003',4,7,'Java','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:23:02','2022-09-18 15:23:02'),(2,'Mohan','Dangi','BCA','Dr.A.P.J. Abdul Kalam University','BBA','Female','2021-04-09 00:00:00',11,'mohan@gmail.com','9090000006',1,3,'Accounts','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:24:23','2022-09-18 15:24:23'),(3,'Namrata','Sharma','MBA','IIT Kharangpur','BPharma','Female','2019-02-03 00:00:00',8,'Namrata@gmail.com','9383888332',4,5,'Sales','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:26:14','2022-09-18 15:26:14'),(4,'Ghanshyam','Jain','MBA','Shri Aurobindo institute of Medical seciences','BPharma','Male','2021-01-09 00:00:00',12,'ghansyam@gmail.com','9827212334',4,4,'Costing','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:28:09','2022-09-18 15:28:09'),(5,'sumit','Rajput','bschistory','SHM Degree College','BSW','Male','2023-09-03 00:00:00',6,'sourabh8765@gmail.com','9876567890',2,1,'HTML','sourabhrajput061737@gmail.com','sourabhrajput061737@gmail.com','2023-03-19 19:36:41','2023-03-19 19:36:41');
/*!40000 ALTER TABLE `st_faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_marksheet`
--

DROP TABLE IF EXISTS `st_marksheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_marksheet` (
  `ID` bigint NOT NULL,
  `ROLL_NO` varchar(255) DEFAULT NULL,
  `STUDENT_ID` bigint DEFAULT NULL,
  `CHEMISTRY` int DEFAULT NULL,
  `MATHS` int DEFAULT NULL,
  `PHYSICS` int DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `MODIFIED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_marksheet`
--

LOCK TABLES `st_marksheet` WRITE;
/*!40000 ALTER TABLE `st_marksheet` DISABLE KEYS */;
INSERT INTO `st_marksheet` VALUES (2,'DX101',6,90,98,89,'Abhishek Ishware','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:11:38','2022-09-18 16:11:38'),(4,'DX102',12,78,78,90,'Anamika Mirja','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:12:38','2022-09-18 16:12:38'),(5,'DX103',4,76,67,90,'Ashwin Tiwari','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:13:13','2022-09-18 16:13:13'),(7,'DX105',13,98,97,90,'Gagan Kori','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:13:51','2022-09-18 16:13:51'),(8,'DX106',20,32,45,45,'Hardik Pandya','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:14:15','2022-09-18 16:14:15'),(9,'DX107',23,76,79,78,'Hardik Sharma','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:15:01','2022-09-18 16:15:01'),(10,'DX108',16,76,90,70,'Mahesh Goyal','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:18:35','2022-09-18 16:18:35'),(11,'DX109',21,90,90,67,'Mahesh Sharma','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:18:45','2022-09-18 16:18:45'),(12,'DX110',15,78,99,89,'Manoj Desai','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:18:56','2022-09-18 16:18:56'),(13,'DX111',17,75,70,76,'Neha Sharma','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:19:18','2022-09-18 16:19:18'),(14,'DX112',2,67,70,63,'Rohit Yadav','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 16:19:33','2022-09-18 16:19:33'),(15,'DX113',2,66,55,77,'Rohit Yadav','sourabhrajput061737@gmail.com','sourabhrajput061737@gmail.com','2023-03-19 19:32:41','2023-03-19 19:32:41');
/*!40000 ALTER TABLE `st_marksheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_role`
--

DROP TABLE IF EXISTS `st_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_role` (
  `ID` bigint NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `MODIFIED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_role`
--

LOCK TABLES `st_role` WRITE;
/*!40000 ALTER TABLE `st_role` DISABLE KEYS */;
INSERT INTO `st_role` VALUES (1,'Admin','Admin','Gupta.vipin02@gmail.com','Gupta.vipin02@gmail.com','2022-05-18 15:06:44','2022-05-18 15:06:44'),(2,'Student','Student','Gupta.vipin02@gmail.com','Gupta.vipin02@gmail.com','2022-05-18 15:06:44','2022-05-18 15:06:44'),(3,'Faculty','Faculty','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:30:04','2022-09-18 15:30:04'),(4,'College','College','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:30:23','2022-09-18 15:30:23');
/*!40000 ALTER TABLE `st_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_student`
--

DROP TABLE IF EXISTS `st_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_student` (
  `ID` bigint NOT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `COLLEGE_NAME` varchar(255) DEFAULT NULL,
  `Date_of_Birth` datetime DEFAULT NULL,
  `COLLEGE_ID` bigint DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `MOBILE_NO` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `MODIFIED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_student`
--

LOCK TABLES `st_student` WRITE;
/*!40000 ALTER TABLE `st_student` DISABLE KEYS */;
INSERT INTO `st_student` VALUES (2,'Rohit','Yadav','Astral college','1996-08-04 00:00:00',14,'rohit@gmail.com','9009002022','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:33:28','2022-09-18 15:33:28'),(3,'Rohit','Mourya','Accropolis','1996-11-06 00:00:00',19,'rohitmourya@gmail.com','7509178235','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:34:29','2022-09-18 15:34:29'),(4,'Ashwin','Tiwari','Bherulal Patidar Govt College','1998-02-03 00:00:00',16,'ashwin@gmail.com','9008766987','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:35:20','2022-09-18 15:35:20'),(5,'Himanshu','Ishware','Bherulal Patidar Govt College','1998-04-12 00:00:00',16,'himanshu@gmail.com','9003887479','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:36:19','2022-09-18 15:36:19'),(6,'Abhishek','Ishware','Bherulal Patidar Govt College','1998-04-09 00:00:00',16,'abhishek@gmail.com','9003776256','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:37:18','2022-09-18 15:37:18'),(7,'Ayush','Dashore','Accropolis','1996-12-03 00:00:00',19,'ayush@gmail.com','9037736786','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:38:50','2022-09-18 15:38:50'),(8,'Sheetal','Jagtap','DY Patil  University','1992-05-02 00:00:00',15,'sheetal@gmail.com','9348767437','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:40:36','2022-09-18 15:40:36'),(9,'Komal','Verma','Dr.A.P.J. Abdul Kalam University','1992-07-04 00:00:00',11,'komal@gmail.com','9667346661','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:41:23','2022-09-18 15:41:23'),(10,'Sheetal','Verma','Dr.A.P.J. Abdul Kalam University','1996-12-09 00:00:00',11,'sheetu@gmail.com','9376256562','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:42:31','2022-09-18 15:42:31'),(11,'Shweta','Sethia','Malwa institute of Technology','1997-02-02 00:00:00',13,'shweta@gmail.com','7876675657','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:43:38','2022-09-18 15:43:38'),(12,'Anamika','Mirja','IIT Kharangpur','1996-12-06 00:00:00',8,'amamika@gmail.com','9808797887','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:44:30','2022-09-18 15:44:30'),(13,'Gagan','Kori','IIT Kharangpur','1997-06-09 00:00:00',8,'gagan@gmail.com','8373566363','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:45:18','2022-09-18 15:45:18'),(14,'Lalit','Kewat','Jawaharlal Nehru University','1997-01-09 00:00:00',9,'lalit@gmail.com','9003223893','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:46:14','2022-09-18 15:46:14'),(15,'Manoj','Desai','Jawaharlal Nehru University','1997-10-06 00:00:00',9,'manoj@gmail.com','9009009001','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:47:03','2022-09-18 15:47:03'),(16,'Mahesh','Goyal','DY Patil  University','1996-07-07 00:00:00',15,'mahesh@gmail.com','8881823873','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:47:54','2022-09-18 15:47:54'),(17,'Neha','Sharma','Sage','1996-09-05 00:00:00',7,'neha@gmail.com','9873897348','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:49:18','2022-09-18 15:49:18'),(18,'Sachin','Sharma','SHM Degree College','1996-08-06 00:00:00',6,'sachin@gmail.com','9348793403','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:50:01','2022-09-18 15:50:01'),(19,'Veena','Yadav','SHM Degree College','1998-12-12 00:00:00',6,'veena@gmail.com','9484876745','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:50:53','2022-09-18 15:50:53'),(20,'Hardik','Pandya','Sage','1995-02-02 00:00:00',7,'hardik@gmail.com','8736673456','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:51:44','2022-09-18 15:51:44'),(21,'Mahesh','Sharma','SHM Degree College','1996-03-09 00:00:00',6,'mahesh1334@gmail.com','9898985555','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:52:59','2022-09-18 15:52:59'),(22,'Sachin','Kushwah','Shri Aurobindo institute of Medical seciences','1994-07-01 00:00:00',12,'sachin144@gmail.com','9873897343','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:53:44','2022-09-18 15:53:44'),(23,'Hardik','Sharma','MIST','1992-03-09 00:00:00',17,'hardik132@gmail.com','8333333322','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-18 15:55:37','2022-09-18 15:55:37'),(24,'sumit','sharma','Govt.Holkar Science','1983-12-03 00:00:00',10,'sourabh65432q@gmail.com','9876567890','sourabhrajput061737@gmail.com','sourabhrajput061737@gmail.com','2023-03-19 19:35:24','2023-03-19 19:35:24');
/*!40000 ALTER TABLE `st_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_subject`
--

DROP TABLE IF EXISTS `st_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_subject` (
  `ID` bigint NOT NULL,
  `SUBJECT_ID` bigint DEFAULT NULL,
  `COURSE_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COURSE_ID` bigint DEFAULT NULL,
  `SUBJECT_NAME` varchar(255) DEFAULT NULL,
  `CREATEDBY` varchar(255) DEFAULT NULL,
  `MODIFIEDBY` varchar(255) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_subject`
--

LOCK TABLES `st_subject` WRITE;
/*!40000 ALTER TABLE `st_subject` DISABLE KEYS */;
INSERT INTO `st_subject` VALUES (1,0,'BCA','Development of web pages',1,'HTML','gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-05-19 12:13:46','2022-05-19 12:13:46'),(2,0,'BCA','Programming Language',1,'C Language','gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-05-19 12:15:12','2022-05-19 12:15:12'),(3,0,'BCOM','Accounts',3,'Accounts','gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-05-19 12:15:52','2022-05-19 12:15:52'),(4,0,'BCOM','Costing',3,'Costing','gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-05-19 12:16:39','2022-05-19 12:16:39'),(5,0,'BBA','Sales',2,'Sales','gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-05-19 12:17:08','2022-05-19 12:17:08'),(6,0,'BBA','Marketing',2,'Marketing','gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-05-19 12:17:27','2022-05-19 12:17:27'),(7,0,'MCA','Java',5,'Java','gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-05-19 12:19:13','2022-05-19 12:19:13'),(8,0,'BPharma','maths',4,'master of maths','sourabhrajput061737@gmail.com','sourabhrajput061737@gmail.com','2023-03-19 19:37:24','2023-03-19 19:37:24');
/*!40000 ALTER TABLE `st_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_timetable`
--

DROP TABLE IF EXISTS `st_timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_timetable` (
  `ID` bigint NOT NULL,
  `SUBJECT_ID` bigint DEFAULT NULL,
  `COURSE_NAME` varchar(255) DEFAULT NULL,
  `EXAM_DATE` datetime DEFAULT NULL,
  `SUBJECT_NAME` varchar(255) DEFAULT NULL,
  `SEMESTER` varchar(255) DEFAULT NULL,
  `EXAM_TIME` varchar(255) DEFAULT NULL,
  `COURSE_ID` bigint DEFAULT NULL,
  `CREATEDBY` varchar(255) DEFAULT NULL,
  `MODIFIEDBY` varchar(255) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_timetable`
--

LOCK TABLES `st_timetable` WRITE;
/*!40000 ALTER TABLE `st_timetable` DISABLE KEYS */;
INSERT INTO `st_timetable` VALUES (1,6,'BBA','2022-06-16 00:00:00','Marketing','1 semester','12:00PM to 3:00PM',6,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-14 16:44:16','2022-06-14 16:44:16'),(3,3,'BCOM','2022-06-22 00:00:00','Accounts','4 semester','08:00 AM to 11:00 AM',3,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-17 12:41:06','2022-06-17 12:41:06'),(4,1,'MBA','2022-06-22 00:00:00','HTML','4 semester','08:00 AM to 11:00 AM',4,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-14 16:45:06','2022-06-14 16:45:06'),(5,7,'MCA','2022-06-15 00:00:00','Java','6 semester','3:00PM to 6:00PM',5,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-14 16:45:24','2022-06-14 16:45:24'),(9,3,'BBA','2023-06-23 00:00:00','Accounts','1 semester','3:00PM to 6:00PM',6,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-14 16:46:23','2022-06-14 16:46:23'),(10,3,'BBA','2023-06-15 00:00:00','Accounts','1 semester','08:00 AM to 11:00 AM',6,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-14 16:46:39','2022-06-14 16:46:39'),(11,3,'BBA','2023-06-21 00:00:00','Accounts','1 semester','12:00PM to 3:00PM',6,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-14 16:46:57','2022-06-14 16:46:57'),(12,1,'BCA','2022-06-29 00:00:00','HTML','3 semester','3:00PM to 6:00PM',1,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-13 13:32:51','2022-06-13 13:32:51'),(13,3,'BCOM','2022-06-16 00:00:00','Accounts','4 semester','12:00PM to 3:00PM',3,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-15 12:46:28','2022-06-15 12:46:28'),(14,4,'MBA','2022-06-29 00:00:00','Costing','9 semester','3:00PM to 6:00PM',4,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-15 12:47:09','2022-06-15 12:47:09'),(15,1,'BCA','2022-06-21 00:00:00','HTML','7 semester','08:00 AM to 11:00 AM',1,'gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-06-15 12:47:50','2022-06-15 12:47:50');
/*!40000 ALTER TABLE `st_timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_user`
--

DROP TABLE IF EXISTS `st_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `st_user` (
  `ID` bigint NOT NULL,
  `FIRST_NAME` varchar(255) DEFAULT NULL,
  `LAST_NAME` varchar(255) DEFAULT NULL,
  `GENDER` varchar(255) DEFAULT NULL,
  `ROLE_ID` bigint DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `MOBILE_NO` varchar(255) DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `MODIFIED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_user`
--

LOCK TABLES `st_user` WRITE;
/*!40000 ALTER TABLE `st_user` DISABLE KEYS */;
INSERT INTO `st_user` VALUES (1,'Sourabh','Rajput','Male',1,'1991-02-12 00:00:00','9899776555','sourabhrajput061737@gmail.com','Sourabh@123','rajputsourabh737@gmail.com','rajputsourabh737@gmail.com','2022-09-16 14:23:33','2022-09-16 14:23:33'),(2,'Dheeraj','Haryani','Male',1,'1998-07-06 00:00:00','9340129049','dharyani2001@gmail.com','Dheeraj@07','gupta.vipin02@gmail.com','gupta.vipin02@gmail.com','2022-08-03 00:19:00','2022-08-03 00:19:00'),(3,'Bhagyshri','Saxena','Female',2,'1998-02-06 00:00:00','7477290606','bhagyshrisaxena97@gmail.com','Bhagya@7824','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-08-03 16:47:42','2022-08-03 16:47:42'),(4,'Sanket','Jain','Male',2,'1999-04-09 00:00:00','7974044637','sanketjain8269@gmail.com','Sanket@123','dharyani2001@gmail.com','dharyani2001@gmail.com','2022-09-16 14:33:20','2022-09-16 14:33:20'),(5,'sumit','Meena','Male',2,'1994-11-03 00:00:00','9876545678','sumit@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(6,'sumit','mukati','Male',2,'1994-11-03 00:00:00','9876545678','sumit1@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(7,'manish','mukati','Male',2,'1994-11-03 00:00:00','9876545678','mainsh@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(8,'manish','pratap','Male',2,'1994-11-03 00:00:00','9876545678','mainsh1@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(9,'manish','sharma','Male',2,'1994-11-03 00:00:00','9876545678','mainsh12@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(10,'sumit','sharma','Male',2,'1994-11-03 00:00:00','9876545678','mainsh122@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(11,'sumit','mukati','Male',2,'1994-11-03 00:00:00','9876545678','mainsh1223@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(12,'adarsh','mukati','Male',2,'1994-11-03 00:00:00','9876545678','adsrsh@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(13,'adarsh','sharma','Male',2,'1994-11-03 00:00:00','9876545678','adsrsh12@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(14,'namam','sharma','Male',2,'1994-11-03 00:00:00','9876545678','adsrsh122@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(15,'ashu','sharma','Male',2,'1994-11-03 00:00:00','9876545678','ashu@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(16,'aniruddh','patel','Male',2,'1994-11-03 00:00:00','9876545678','anu1@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(17,'aniruddh','sharma','Male',2,'1994-11-03 00:00:00','9876545678','annushamrma@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(18,'kartik','sharma','Male',2,'1994-11-03 00:00:00','9876545678','kartik@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(19,'neeraj','rathore','Male',2,'1994-11-03 00:00:00','9876545645','neeraj@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(20,'pallavi','rathore','Female',2,'1994-11-03 00:00:00','9876545645','pallavi@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(21,'pallavi','patel','Female',2,'1994-11-03 00:00:00','9876545645','pallavi11@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(22,'nivedita','gupta','Female',2,'1994-11-03 00:00:00','9876545645','nivedita@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(23,'tanu','gupta','Female',2,'1994-11-03 00:00:00','9876545645','tanu@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(24,'parnjal','gupta','Female',2,'1994-11-03 00:00:00','9876545645','tanu12@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(25,'shivani','patel','Female',2,'1994-11-03 00:00:00','9876545645','shivanimail@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(26,'anshu','patel','Female',2,'1994-11-03 00:00:00','9876545645','shivanimail111@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(27,'saloni','patel','Female',2,'1994-11-03 00:00:00','9876545645','saloni@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(28,'sakshi','thakur','Female',2,'1994-11-03 00:00:00','9876545645','saloni13@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(29,'suhani','rajput','Female',2,'1994-11-03 00:00:00','9876545645','sakshu@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(30,'palak','rajput','Female',2,'1994-11-03 00:00:00','9876545645','sakshu9876@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(31,'bharti','rajput','Female',2,'1994-11-03 00:00:00','9876545645','sakshu9456876@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(32,'pooja','rajput','Female',2,'1994-11-03 00:00:00','9876545645','pooja@gmail.com','Sumit@123',NULL,NULL,NULL,NULL),(33,'Naman','mukati','Male',2,'1990-12-12 00:00:00','9876545678','mainsh123@gmail.com','Naman@123','sourabhrajput061737@gmail.com','sourabhrajput061737@gmail.com','2023-03-19 19:31:32','2023-03-19 19:31:32'),(34,'satyendra','rajput','Male',2,'1996-07-03 00:00:00','9876567898','sourabh9876@gmail.com','Sourabh@123',NULL,NULL,NULL,NULL),(35,'adarsh','pratap','Male',2,'1995-10-03 00:00:00','9876545678','mainsh7891@gmail.com','Sourabh@123',NULL,NULL,NULL,NULL),(36,'Naman','pratap','Male',2,'1993-05-03 00:00:00','9876543456','mainsh789187@gmail.com','Naman@123',NULL,NULL,NULL,NULL),(37,'harsh','mukati','Male',2,'2001-09-03 00:00:00','9876567876','harsh@gmail.com','Harsh@1234',NULL,NULL,NULL,NULL),(38,'Rani','Rajput','Female',3,'1995-12-12 00:00:00','9876549876','rani@gmail.com','Rani@123','sourabhrajput061737@gmail.com','sourabhrajput061737@gmail.com','2023-03-19 19:52:21','2023-03-19 19:52:21'),(39,'abhishek','verma','Male',3,'1996-08-12 00:00:00','9876567890','sourabh123444@gmail.com','Abhi@123','sourabhrajput061737@gmail.com','sourabhrajput061737@gmail.com','2023-03-20 11:53:55','2023-03-20 11:53:55'),(40,'Rohit','Rajput','Male',2,'1984-04-03 00:00:00','9876567890','mainsh7895341@gmail.com','Rohit@123',NULL,NULL,NULL,NULL),(41,'qas','sa','Male',2,'1981-06-03 00:00:00','9876545678','sourabhrajputdfghj@gmail.com','Sourabh@123',NULL,NULL,NULL,NULL),(42,'sdfsrg','sfgr','Male',2,'1991-08-03 00:00:00','9669635650','mainsh787591@gmail.com','Sourabh@123',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `st_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-29 14:21:51
