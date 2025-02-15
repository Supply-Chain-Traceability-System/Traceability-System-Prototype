-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: bladex_boot
-- ------------------------------------------------------
-- Server version	5.7.21-1ubuntu1

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
-- Table structure for table `ACT_APP_APPDEF`
--

DROP TABLE IF EXISTS `ACT_APP_APPDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_APP_APPDEF` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_IDX_APP_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE,
  KEY `ACT_IDX_APP_DEF_DPLY` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_APP_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_APPDEF`
--

LOCK TABLES `ACT_APP_APPDEF` WRITE;
/*!40000 ALTER TABLE `ACT_APP_APPDEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_APP_APPDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_APP_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DATABASECHANGELOG`
--

LOCK TABLES `ACT_APP_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_APP_DATABASECHANGELOG` VALUES ('1','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2019-08-01 03:08:02',1,'EXECUTED','8:496fc778bdf2ab13f2e1926d0e63e0a2','createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...','',NULL,'3.6.3',NULL,NULL,'4628882015'),('2','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2019-08-01 03:08:02',2,'EXECUTED','8:ccea9ebfb6c1f8367ca4dd473fcbb7db','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT','',NULL,'3.6.3',NULL,NULL,'4628882015'),('3','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2019-08-01 03:08:02',3,'EXECUTED','8:f1f8aff320aade831944ebad24355f3d','createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF','',NULL,'3.6.3',NULL,NULL,'4628882015');
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_APP_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_APP_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_APP_DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_APP_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_APP_DEPLOYMENT` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DEPLOYMENT`
--

LOCK TABLES `ACT_APP_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_APP_DEPLOYMENT_RESOURCE`
--

DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_APP_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_APP_RSRC_DPL` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_APP_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_APP_DEPLOYMENT_RESOURCE`
--

LOCK TABLES `ACT_APP_DEPLOYMENT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_APP_DEPLOYMENT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_CASEDEF`
--

DROP TABLE IF EXISTS `ACT_CMMN_CASEDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_CASEDEF` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_IDX_CASE_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE,
  KEY `ACT_IDX_CASE_DEF_DPLY` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CASE_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_CMMN_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_CASEDEF`
--

LOCK TABLES `ACT_CMMN_CASEDEF` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_CASEDEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_CASEDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_CMMN_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_DATABASECHANGELOG`
--

LOCK TABLES `ACT_CMMN_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_CMMN_DATABASECHANGELOG` VALUES ('1','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2019-08-01 03:07:59',1,'EXECUTED','8:8b4b922d90b05ff27483abefc9597aa6','createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...','',NULL,'3.6.3',NULL,NULL,'4628878437'),('2','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2019-08-01 03:07:59',2,'EXECUTED','8:65e39b3d385706bb261cbeffe7533cbe','addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST','',NULL,'3.6.3',NULL,NULL,'4628878437'),('3','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2019-08-01 03:08:00',3,'EXECUTED','8:c01f6e802b49436b4489040da3012359','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...','',NULL,'3.6.3',NULL,NULL,'4628878437'),('4','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2019-08-01 03:08:00',4,'EXECUTED','8:e40d29cb79345b7fb5afd38a7f0ba8fc','createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST','',NULL,'3.6.3',NULL,NULL,'4628878437'),('5','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2019-08-01 03:08:01',5,'EXECUTED','8:70349de472f87368dcdec971a10311a0','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...','',NULL,'3.6.3',NULL,NULL,'4628878437'),('6','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2019-08-01 03:08:01',6,'EXECUTED','8:10e82e26a7fee94c32a92099c059c18c','createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF','',NULL,'3.6.3',NULL,NULL,'4628878437'),('7','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2019-08-01 03:08:01',7,'EXECUTED','8:530bc81a1e30618ccf4a2da1f7c6c043','renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...','',NULL,'3.6.3',NULL,NULL,'4628878437');
/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_CMMN_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_CMMN_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_CMMN_DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_CMMN_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_DEPLOYMENT` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_DEPLOYMENT`
--

LOCK TABLES `ACT_CMMN_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_DEPLOYMENT_RESOURCE`
--

DROP TABLE IF EXISTS `ACT_CMMN_DEPLOYMENT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  `GENERATED_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_CMMN_RSRC_DPL` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CMMN_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_CMMN_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_DEPLOYMENT_RESOURCE`
--

LOCK TABLES `ACT_CMMN_DEPLOYMENT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_DEPLOYMENT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_DEPLOYMENT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_HI_CASE_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_HI_CASE_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_HI_CASE_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PARENT_ID_` varchar(255) DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_HI_CASE_INST`
--

LOCK TABLES `ACT_CMMN_HI_CASE_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_HI_CASE_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_HI_CASE_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_HI_MIL_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_HI_MIL_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_HI_MIL_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) NOT NULL,
  `CASE_DEF_ID_` varchar(255) NOT NULL,
  `ELEMENT_ID_` varchar(255) NOT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_HI_MIL_INST`
--

LOCK TABLES `ACT_CMMN_HI_MIL_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_HI_MIL_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_HI_MIL_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_HI_PLAN_ITEM_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_HI_PLAN_ITEM_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_HI_PLAN_ITEM_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_HI_PLAN_ITEM_INST`
--

LOCK TABLES `ACT_CMMN_HI_PLAN_ITEM_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_HI_PLAN_ITEM_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_HI_PLAN_ITEM_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_RU_CASE_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_RU_CASE_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_RU_CASE_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `PARENT_ID_` varchar(255) DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `LOCK_TIME_` datetime(3) DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_CASE_INST_CASE_DEF` (`CASE_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_CASE_INST_PARENT` (`PARENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CASE_INST_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_RU_CASE_INST`
--

LOCK TABLES `ACT_CMMN_RU_CASE_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_RU_CASE_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_RU_CASE_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_RU_MIL_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_RU_MIL_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_RU_MIL_INST` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) NOT NULL,
  `CASE_DEF_ID_` varchar(255) NOT NULL,
  `ELEMENT_ID_` varchar(255) NOT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_MIL_CASE_DEF` (`CASE_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_MIL_CASE_INST` (`CASE_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MIL_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_MIL_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_RU_MIL_INST`
--

LOCK TABLES `ACT_CMMN_RU_MIL_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_RU_MIL_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_RU_MIL_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_RU_PLAN_ITEM_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_RU_PLAN_ITEM_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_RU_PLAN_ITEM_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int(11) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_PLAN_ITEM_CASE_DEF` (`CASE_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_PLAN_ITEM_CASE_INST` (`CASE_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_PLAN_ITEM_STAGE_INST` (`STAGE_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_RU_PLAN_ITEM_INST`
--

LOCK TABLES `ACT_CMMN_RU_PLAN_ITEM_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_RU_PLAN_ITEM_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_RU_PLAN_ITEM_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CMMN_RU_SENTRY_PART_INST`
--

DROP TABLE IF EXISTS `ACT_CMMN_RU_SENTRY_PART_INST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CMMN_RU_SENTRY_PART_INST` (
  `ID_` varchar(255) NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) DEFAULT NULL,
  `ON_PART_ID_` varchar(255) DEFAULT NULL,
  `IF_PART_ID_` varchar(255) DEFAULT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_SENTRY_CASE_DEF` (`CASE_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_SENTRY_CASE_INST` (`CASE_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_SENTRY_PLAN_ITEM` (`PLAN_ITEM_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SENTRY_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`),
  CONSTRAINT `ACT_FK_SENTRY_PLAN_ITEM` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `ACT_CMMN_RU_PLAN_ITEM_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CMMN_RU_SENTRY_PART_INST`
--

LOCK TABLES `ACT_CMMN_RU_SENTRY_PART_INST` WRITE;
/*!40000 ALTER TABLE `ACT_CMMN_RU_SENTRY_PART_INST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CMMN_RU_SENTRY_PART_INST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CO_CONTENT_ITEM`
--

DROP TABLE IF EXISTS `ACT_CO_CONTENT_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CO_CONTENT_ITEM` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) NOT NULL,
  `MIME_TYPE_` varchar(255) DEFAULT NULL,
  `TASK_ID_` varchar(255) DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) DEFAULT NULL,
  `FIELD_` varchar(400) DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) DEFAULT NULL,
  `CONTENT_SIZE_` bigint(20) DEFAULT '0',
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `idx_contitem_taskid` (`TASK_ID_`) USING BTREE,
  KEY `idx_contitem_procid` (`PROC_INST_ID_`) USING BTREE,
  KEY `idx_contitem_scope` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CO_CONTENT_ITEM`
--

LOCK TABLES `ACT_CO_CONTENT_ITEM` WRITE;
/*!40000 ALTER TABLE `ACT_CO_CONTENT_ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_CO_CONTENT_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CO_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_CO_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CO_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CO_DATABASECHANGELOG`
--

LOCK TABLES `ACT_CO_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_CO_DATABASECHANGELOG` VALUES ('1','activiti','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2019-08-01 03:07:58',1,'EXECUTED','8:7644d7165cfe799200a2abdd3419e8b6','createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM','',NULL,'3.6.3',NULL,NULL,'4628877941'),('2','flowable','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2019-08-01 03:07:58',2,'EXECUTED','8:fe7b11ac7dbbf9c43006b23bbab60bab','addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM','',NULL,'3.6.3',NULL,NULL,'4628877941');
/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_CO_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_CO_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_CO_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_CO_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_CO_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_CO_DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_CO_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DE_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_DE_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DE_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DE_DATABASECHANGELOG`
--

LOCK TABLES `ACT_DE_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_DE_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_DE_DATABASECHANGELOG` VALUES ('1','flowable','META-INF/liquibase/flowable-modeler-app-db-changelog.xml','2019-08-01 03:08:43',1,'EXECUTED','8:e70d1d9d3899a734296b2514ccc71501','createTable tableName=ACT_DE_MODEL; createIndex indexName=idx_proc_mod_created, tableName=ACT_DE_MODEL; createTable tableName=ACT_DE_MODEL_HISTORY; createIndex indexName=idx_proc_mod_history_proc, tableName=ACT_DE_MODEL_HISTORY; createTable tableN...','',NULL,'3.6.3',NULL,NULL,'4628923400'),('3','flowable','META-INF/liquibase/flowable-modeler-app-db-changelog.xml','2019-08-01 03:08:43',2,'EXECUTED','8:3a9143bef2e45f2316231cc1369138b6','addColumn tableName=ACT_DE_MODEL; addColumn tableName=ACT_DE_MODEL_HISTORY','',NULL,'3.6.3',NULL,NULL,'4628923400');
/*!40000 ALTER TABLE `ACT_DE_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DE_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_DE_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DE_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DE_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_DE_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_DE_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_DE_DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_DE_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DE_MODEL`
--

DROP TABLE IF EXISTS `ACT_DE_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DE_MODEL` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `model_editor_json` longtext,
  `thumbnail` longblob,
  `model_type` int(11) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_proc_mod_created` (`created_by`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DE_MODEL`
--

LOCK TABLES `ACT_DE_MODEL` WRITE;
/*!40000 ALTER TABLE `ACT_DE_MODEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DE_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DE_MODEL_HISTORY`
--

DROP TABLE IF EXISTS `ACT_DE_MODEL_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DE_MODEL_HISTORY` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `removal_date` datetime(6) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `model_editor_json` longtext,
  `model_id` varchar(255) NOT NULL,
  `model_type` int(11) DEFAULT NULL,
  `tenant_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_proc_mod_history_proc` (`model_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DE_MODEL_HISTORY`
--

LOCK TABLES `ACT_DE_MODEL_HISTORY` WRITE;
/*!40000 ALTER TABLE `ACT_DE_MODEL_HISTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DE_MODEL_HISTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DE_MODEL_RELATION`
--

DROP TABLE IF EXISTS `ACT_DE_MODEL_RELATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DE_MODEL_RELATION` (
  `id` varchar(255) NOT NULL,
  `parent_model_id` varchar(255) DEFAULT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_relation_parent` (`parent_model_id`) USING BTREE,
  KEY `fk_relation_child` (`model_id`) USING BTREE,
  CONSTRAINT `fk_relation_child` FOREIGN KEY (`model_id`) REFERENCES `ACT_DE_MODEL` (`id`),
  CONSTRAINT `fk_relation_parent` FOREIGN KEY (`parent_model_id`) REFERENCES `ACT_DE_MODEL` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DE_MODEL_RELATION`
--

LOCK TABLES `ACT_DE_MODEL_RELATION` WRITE;
/*!40000 ALTER TABLE `ACT_DE_MODEL_RELATION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DE_MODEL_RELATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_DMN_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DMN_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_DATABASECHANGELOG`
--

LOCK TABLES `ACT_DMN_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_DMN_DATABASECHANGELOG` VALUES ('1','activiti','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2019-08-01 03:07:57',1,'EXECUTED','8:c8701f1c71018b55029f450b2e9a10a1','createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE','',NULL,'3.6.3',NULL,NULL,'4628876950'),('2','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2019-08-01 03:07:57',2,'EXECUTED','8:47f94b27feb7df8a30d4e338c7bd5fb8','createTable tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'3.6.3',NULL,NULL,'4628876950'),('3','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2019-08-01 03:07:57',3,'EXECUTED','8:ac17eae89fbdccb6e08daf3c7797b579','addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'3.6.3',NULL,NULL,'4628876950'),('4','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2019-08-01 03:07:57',4,'EXECUTED','8:f73aabc4529e7292c2942073d1cff6f9','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE','',NULL,'3.6.3',NULL,NULL,'4628876950'),('5','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2019-08-01 03:07:57',5,'EXECUTED','8:3e03528582dd4eeb4eb41f9b9539140d','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'3.6.3',NULL,NULL,'4628876950'),('6','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2019-08-01 03:07:57',6,'EXECUTED','8:646c6a061e0b6e8a62e69844ff96abb0','createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE','',NULL,'3.6.3',NULL,NULL,'4628876950');
/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_DMN_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DMN_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_DMN_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_DMN_DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_DMN_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_DECISION_TABLE`
--

DROP TABLE IF EXISTS `ACT_DMN_DECISION_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DMN_DECISION_TABLE` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_IDX_DEC_TBL_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_DECISION_TABLE`
--

LOCK TABLES `ACT_DMN_DECISION_TABLE` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DECISION_TABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DMN_DECISION_TABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_DMN_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DMN_DEPLOYMENT` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_DEPLOYMENT`
--

LOCK TABLES `ACT_DMN_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DMN_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_DEPLOYMENT_RESOURCE`
--

DROP TABLE IF EXISTS `ACT_DMN_DEPLOYMENT_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DMN_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_DEPLOYMENT_RESOURCE`
--

LOCK TABLES `ACT_DMN_DEPLOYMENT_RESOURCE` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_DEPLOYMENT_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DMN_DEPLOYMENT_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_DMN_HI_DECISION_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_DMN_HI_DECISION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_DMN_HI_DECISION_EXECUTION` (
  `ID_` varchar(255) NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) DEFAULT NULL,
  `FAILED_` bit(1) DEFAULT b'0',
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `EXECUTION_JSON_` longtext,
  `SCOPE_TYPE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_DMN_HI_DECISION_EXECUTION`
--

LOCK TABLES `ACT_DMN_HI_DECISION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_DMN_HI_DECISION_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_DMN_HI_DECISION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_EVT_LOG`
--

DROP TABLE IF EXISTS `ACT_EVT_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_EVT_LOG`
--

LOCK TABLES `ACT_EVT_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_EVT_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_EVT_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_FO_DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `ACT_FO_DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_FO_DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_FO_DATABASECHANGELOG`
--

LOCK TABLES `ACT_FO_DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `ACT_FO_DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `ACT_FO_DATABASECHANGELOG` VALUES ('1','activiti','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2019-08-01 03:07:57',1,'EXECUTED','8:033ebf9380889aed7c453927ecc3250d','createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE','',NULL,'3.6.3',NULL,NULL,'4628877478'),('2','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2019-08-01 03:07:57',2,'EXECUTED','8:986365ceb40445ce3b27a8e6b40f159b','addColumn tableName=ACT_FO_FORM_INSTANCE','',NULL,'3.6.3',NULL,NULL,'4628877478'),('3','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2019-08-01 03:07:57',3,'EXECUTED','8:abf482518ceb09830ef674e52c06bf15','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION','',NULL,'3.6.3',NULL,NULL,'4628877478'),('4','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2019-08-01 03:07:57',4,'EXECUTED','8:2087829f22a4b2298dbf530681c74854','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE','',NULL,'3.6.3',NULL,NULL,'4628877478'),('5','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2019-08-01 03:07:57',5,'EXECUTED','8:b4be732b89e5ca028bdd520c6ad4d446','createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION','',NULL,'3.6.3',NULL,NULL,'4628877478');
/*!40000 ALTER TABLE `ACT_FO_DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_FO_DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `ACT_FO_DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_FO_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_FO_DATABASECHANGELOGLOCK`
--

LOCK TABLES `ACT_FO_DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `ACT_FO_DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `ACT_FO_DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `ACT_FO_DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_FO_FORM_DEFINITION`
--

DROP TABLE IF EXISTS `ACT_FO_FORM_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_FO_FORM_DEFINITION` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_IDX_FORM_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_FO_FORM_DEFINITION`
--

LOCK TABLES `ACT_FO_FORM_DEFINITION` WRITE;
/*!40000 ALTER TABLE `ACT_FO_FORM_DEFINITION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_FO_FORM_DEFINITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_FO_FORM_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_FO_FORM_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_FO_FORM_DEPLOYMENT` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_FO_FORM_DEPLOYMENT`
--

LOCK TABLES `ACT_FO_FORM_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_FO_FORM_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_FO_FORM_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_FO_FORM_INSTANCE`
--

DROP TABLE IF EXISTS `ACT_FO_FORM_INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_FO_FORM_INSTANCE` (
  `ID_` varchar(255) NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) NOT NULL,
  `TASK_ID_` varchar(255) DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_FO_FORM_INSTANCE`
--

LOCK TABLES `ACT_FO_FORM_INSTANCE` WRITE;
/*!40000 ALTER TABLE `ACT_FO_FORM_INSTANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_FO_FORM_INSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_FO_FORM_RESOURCE`
--

DROP TABLE IF EXISTS `ACT_FO_FORM_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_FO_FORM_RESOURCE` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_FO_FORM_RESOURCE`
--

LOCK TABLES `ACT_FO_FORM_RESOURCE` WRITE;
/*!40000 ALTER TABLE `ACT_FO_FORM_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_FO_FORM_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_BYTEARRAY`
--

DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_BYTEARRAY`
--

LOCK TABLES `ACT_GE_BYTEARRAY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_GE_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_GE_PROPERTY`
--

DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_GE_PROPERTY`
--

LOCK TABLES `ACT_GE_PROPERTY` WRITE;
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` DISABLE KEYS */;
INSERT INTO `ACT_GE_PROPERTY` VALUES ('cfg.execution-related-entities-count','true',1),('cfg.task-related-entities-count','true',1),('common.schema.version','6.5.0.1',1),('entitylink.schema.version','6.5.0.1',1),('eventsubscription.schema.version','6.5.0.1',1),('identitylink.schema.version','6.5.0.1',1),('job.schema.version','6.5.0.1',1),('next.dbid','1',1),('schema.history','create(6.5.0.1)',1),('schema.version','6.5.0.1',1),('task.schema.version','6.5.0.1',1),('variable.schema.version','6.5.0.1',1);
/*!40000 ALTER TABLE `ACT_GE_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ACTINST`
--

DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ACTINST`
--

LOCK TABLES `ACT_HI_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ATTACHMENT`
--

DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ATTACHMENT`
--

LOCK TABLES `ACT_HI_ATTACHMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ATTACHMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_COMMENT`
--

DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_COMMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_COMMENT`
--

LOCK TABLES `ACT_HI_COMMENT` WRITE;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_DETAIL`
--

DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`) USING BTREE,
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_DETAIL`
--

LOCK TABLES `ACT_HI_DETAIL` WRITE;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_DETAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_ENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_ENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_ENTITYLINK`
--

LOCK TABLES `ACT_HI_ENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_ENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_ENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_IDENTITYLINK`
--

LOCK TABLES `ACT_HI_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_PROCINST`
--

DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_PROCINST`
--

LOCK TABLES `ACT_HI_PROCINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_PROCINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TASKINST`
--

DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_TASKINST`
--

LOCK TABLES `ACT_HI_TASKINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_TASKINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_TSK_LOG`
--

DROP TABLE IF EXISTS `ACT_HI_TSK_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_TSK_LOG` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_TSK_LOG`
--

LOCK TABLES `ACT_HI_TSK_LOG` WRITE;
/*!40000 ALTER TABLE `ACT_HI_TSK_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_TSK_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_HI_VARINST`
--

DROP TABLE IF EXISTS `ACT_HI_VARINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_HI_VARINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`) USING BTREE,
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_HI_VARINST`
--

LOCK TABLES `ACT_HI_VARINST` WRITE;
/*!40000 ALTER TABLE `ACT_HI_VARINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_HI_VARINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_BYTEARRAY`
--

DROP TABLE IF EXISTS `ACT_ID_BYTEARRAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_BYTEARRAY`
--

LOCK TABLES `ACT_ID_BYTEARRAY` WRITE;
/*!40000 ALTER TABLE `ACT_ID_BYTEARRAY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_BYTEARRAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_GROUP`
--

DROP TABLE IF EXISTS `ACT_ID_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_GROUP` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_GROUP`
--

LOCK TABLES `ACT_ID_GROUP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_INFO`
--

DROP TABLE IF EXISTS `ACT_ID_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_INFO`
--

LOCK TABLES `ACT_ID_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_ID_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_MEMBERSHIP`
--

DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_MEMBERSHIP` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`) USING BTREE,
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_MEMBERSHIP`
--

LOCK TABLES `ACT_ID_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_PRIV`
--

DROP TABLE IF EXISTS `ACT_ID_PRIV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_PRIV` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_PRIV`
--

LOCK TABLES `ACT_ID_PRIV` WRITE;
/*!40000 ALTER TABLE `ACT_ID_PRIV` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_PRIV` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_PRIV_MAPPING`
--

DROP TABLE IF EXISTS `ACT_ID_PRIV_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_PRIV_MAPPING` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`) USING BTREE,
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`) USING BTREE,
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `ACT_ID_PRIV` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_PRIV_MAPPING`
--

LOCK TABLES `ACT_ID_PRIV_MAPPING` WRITE;
/*!40000 ALTER TABLE `ACT_ID_PRIV_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_PRIV_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_PROPERTY`
--

DROP TABLE IF EXISTS `ACT_ID_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_PROPERTY`
--

LOCK TABLES `ACT_ID_PROPERTY` WRITE;
/*!40000 ALTER TABLE `ACT_ID_PROPERTY` DISABLE KEYS */;
INSERT INTO `ACT_ID_PROPERTY` VALUES ('schema.version','6.5.0.1',1);
/*!40000 ALTER TABLE `ACT_ID_PROPERTY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_TOKEN`
--

DROP TABLE IF EXISTS `ACT_ID_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_TOKEN` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_TOKEN`
--

LOCK TABLES `ACT_ID_TOKEN` WRITE;
/*!40000 ALTER TABLE `ACT_ID_TOKEN` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_TOKEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_ID_USER`
--

DROP TABLE IF EXISTS `ACT_ID_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_ID_USER` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_ID_USER`
--

LOCK TABLES `ACT_ID_USER` WRITE;
/*!40000 ALTER TABLE `ACT_ID_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_ID_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_PROCDEF_INFO`
--

DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_PROCDEF_INFO`
--

LOCK TABLES `ACT_PROCDEF_INFO` WRITE;
/*!40000 ALTER TABLE `ACT_PROCDEF_INFO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_PROCDEF_INFO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_DEPLOYMENT`
--

DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_DEPLOYMENT`
--

LOCK TABLES `ACT_RE_DEPLOYMENT` WRITE;
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_DEPLOYMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_MODEL`
--

DROP TABLE IF EXISTS `ACT_RE_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_MODEL`
--

LOCK TABLES `ACT_RE_MODEL` WRITE;
/*!40000 ALTER TABLE `ACT_RE_MODEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RE_PROCDEF`
--

DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RE_PROCDEF`
--

LOCK TABLES `ACT_RE_PROCDEF` WRITE;
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RE_PROCDEF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_ACTINST`
--

DROP TABLE IF EXISTS `ACT_RU_ACTINST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_ACTINST`
--

LOCK TABLES `ACT_RU_ACTINST` WRITE;
/*!40000 ALTER TABLE `ACT_RU_ACTINST` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_ACTINST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_DEADLETTER_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_DEADLETTER_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_DEADLETTER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`) USING BTREE,
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`) USING BTREE,
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_DEADLETTER_JOB`
--

LOCK TABLES `ACT_RU_DEADLETTER_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_DEADLETTER_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_DEADLETTER_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_ENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_ENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE,
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_ENTITYLINK`
--

LOCK TABLES `ACT_RU_ENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_ENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_ENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EVENT_SUBSCR`
--

DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`) USING BTREE,
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EVENT_SUBSCR`
--

LOCK TABLES `ACT_RU_EVENT_SUBSCR` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EVENT_SUBSCR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_EXECUTION`
--

DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`) USING BTREE,
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`) USING BTREE,
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`) USING BTREE,
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_EXECUTION`
--

LOCK TABLES `ACT_RU_EXECUTION` WRITE;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_HISTORY_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_HISTORY_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_HISTORY_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_HISTORY_JOB`
--

LOCK TABLES `ACT_RU_HISTORY_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_HISTORY_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_HISTORY_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_IDENTITYLINK`
--

DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`) USING BTREE,
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`) USING BTREE,
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_IDENTITYLINK`
--

LOCK TABLES `ACT_RU_IDENTITYLINK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_IDENTITYLINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`) USING BTREE,
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`) USING BTREE,
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_JOB`
--

LOCK TABLES `ACT_RU_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_SUSPENDED_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_SUSPENDED_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_SUSPENDED_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`) USING BTREE,
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`) USING BTREE,
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_SUSPENDED_JOB`
--

LOCK TABLES `ACT_RU_SUSPENDED_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_SUSPENDED_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_SUSPENDED_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TASK`
--

DROP TABLE IF EXISTS `ACT_RU_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`) USING BTREE,
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TASK`
--

LOCK TABLES `ACT_RU_TASK` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TASK` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_TASK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_TIMER_JOB`
--

DROP TABLE IF EXISTS `ACT_RU_TIMER_JOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_TIMER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`) USING BTREE,
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`) USING BTREE,
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`) USING BTREE,
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_TIMER_JOB`
--

LOCK TABLES `ACT_RU_TIMER_JOB` WRITE;
/*!40000 ALTER TABLE `ACT_RU_TIMER_JOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_TIMER_JOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ACT_RU_VARIABLE`
--

DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`) USING BTREE,
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`) USING BTREE,
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`) USING BTREE,
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`) USING BTREE,
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACT_RU_VARIABLE`
--

LOCK TABLES `ACT_RU_VARIABLE` WRITE;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACT_RU_VARIABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_attach`
--

DROP TABLE IF EXISTS `blade_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_attach` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `link` varchar(1000) DEFAULT NULL COMMENT '附件地址',
  `domain` varchar(500) DEFAULT NULL COMMENT '附件域名',
  `name` varchar(500) DEFAULT NULL COMMENT '附件名称',
  `original_name` varchar(500) DEFAULT NULL COMMENT '附件原名',
  `extension` varchar(12) DEFAULT NULL COMMENT '附件拓展名',
  `attach_size` bigint(64) DEFAULT NULL COMMENT '附件大小',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_attach`
--

LOCK TABLES `blade_attach` WRITE;
/*!40000 ALTER TABLE `blade_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_client`
--

DROP TABLE IF EXISTS `blade_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_client` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `client_id` varchar(48) NOT NULL COMMENT '客户端id',
  `client_secret` varchar(256) NOT NULL COMMENT '客户端密钥',
  `resource_ids` varchar(256) DEFAULT NULL COMMENT '资源集合',
  `scope` varchar(256) NOT NULL COMMENT '授权范围',
  `authorized_grant_types` varchar(256) NOT NULL COMMENT '授权类型',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL COMMENT '回调地址',
  `authorities` varchar(256) DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) NOT NULL COMMENT '令牌过期秒数',
  `refresh_token_validity` int(11) NOT NULL COMMENT '刷新令牌过期秒数',
  `additional_information` varchar(4096) DEFAULT NULL COMMENT '附加说明',
  `autoapprove` varchar(256) DEFAULT NULL COMMENT '自动授权',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NOT NULL COMMENT '状态',
  `is_deleted` int(2) NOT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户端表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_client`
--

LOCK TABLES `blade_client` WRITE;
/*!40000 ALTER TABLE `blade_client` DISABLE KEYS */;
INSERT INTO `blade_client` VALUES (1123598811738675201,'sword','sword_secret',NULL,'all','refresh_token,password,authorization_code,captcha,social','http://localhost:8888',NULL,3600,604800,NULL,NULL,1123598815738675201,1123598813738675201,'2019-03-24 10:40:55',1123598815738675201,'2019-03-24 10:40:59',1,0),(1123598811738675202,'saber','saber_secret',NULL,'all','refresh_token,password,authorization_code,captcha,social','http://localhost:8080',NULL,3600,604800,NULL,NULL,1123598815738675201,1123598813738675201,'2019-03-24 10:42:29',1123598815738675201,'2019-03-24 10:42:32',1,0);
/*!40000 ALTER TABLE `blade_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_code`
--

DROP TABLE IF EXISTS `blade_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_code` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `datasource_id` bigint(64) DEFAULT NULL COMMENT '数据源主键',
  `service_name` varchar(64) DEFAULT NULL COMMENT '服务名称',
  `code_name` varchar(64) DEFAULT NULL COMMENT '模块名称',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名',
  `table_prefix` varchar(64) DEFAULT NULL COMMENT '表前缀',
  `pk_name` varchar(32) DEFAULT NULL COMMENT '主键名',
  `package_name` varchar(500) DEFAULT NULL COMMENT '后端包名',
  `base_mode` int(2) DEFAULT NULL COMMENT '基础业务模式',
  `wrap_mode` int(2) DEFAULT NULL COMMENT '包装器模式',
  `api_path` varchar(2000) DEFAULT NULL COMMENT '后端路径',
  `web_path` varchar(2000) DEFAULT NULL COMMENT '前端路径',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_code`
--

LOCK TABLES `blade_code` WRITE;
/*!40000 ALTER TABLE `blade_code` DISABLE KEYS */;
INSERT INTO `blade_code` VALUES (1123598812738675201,1161483357481541634,'blade-demo','通知公告','blade_notice','blade_','id','org.springblade.desktop',1,1,'D:\\Develop\\WorkSpace\\Git\\SpringBlade\\blade-ops\\blade-develop','D:\\Develop\\WorkSpace\\Git\\Sword',0);
/*!40000 ALTER TABLE `blade_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_datasource`
--

DROP TABLE IF EXISTS `blade_datasource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_datasource` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `driver_class` varchar(100) DEFAULT NULL COMMENT '驱动类',
  `url` varchar(500) DEFAULT NULL COMMENT '连接地址',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据源配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_datasource`
--

LOCK TABLES `blade_datasource` WRITE;
/*!40000 ALTER TABLE `blade_datasource` DISABLE KEYS */;
INSERT INTO `blade_datasource` VALUES (1161483357481541634,'mysql','com.mysql.cj.jdbc.Driver','jdbc:mysql://localhost:3306/bladex?useSSL=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&serverTimezone=GMT%2B8&nullCatalogMeansCurrent=true&allowPublicKeyRetrieval=true','root','root','mysql',1123598821738675201,1123598813738675201,'2020-08-08 12:20:06',1123598821738675201,'2020-08-08 12:20:06',1,0),(1161483504353484802,'postgresql','org.postgresql.Driver','jdbc:postgresql://127.0.0.1:5432/bladex','postgres','123456','postgresql',1123598821738675201,1123598813738675201,'2020-08-08 12:20:02',1123598821738675201,'2020-08-08 12:20:02',1,0),(1161483594023510018,'oracle','oracle.jdbc.OracleDriver','jdbc:oracle:thin:@127.0.0.1:1521:orcl','BLADEX','BLADEX','oracle',1123598821738675201,1123598813738675201,'2020-08-08 12:20:03',1123598821738675201,'2020-08-08 12:20:03',1,0),(1161483594023510020,'sqlserver','com.microsoft.sqlserver.jdbc.SQLServerDriver','jdbc:sqlserver://127.0.0.1:1433;DatabaseName=bladex','bladex','bladex','sqlserver',1123598821738675201,1123598813738675201,'2020-08-08 12:20:03',1123598821738675201,'2020-08-08 12:20:03',1,0);
/*!40000 ALTER TABLE `blade_datasource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_dept`
--

DROP TABLE IF EXISTS `blade_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_dept` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `ancestors` varchar(2000) DEFAULT NULL COMMENT '祖级列表',
  `dept_category` int(2) DEFAULT NULL COMMENT '部门类型',
  `dept_name` varchar(45) DEFAULT NULL COMMENT '部门名',
  `full_name` varchar(45) DEFAULT NULL COMMENT '部门全称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_dept`
--

LOCK TABLES `blade_dept` WRITE;
/*!40000 ALTER TABLE `blade_dept` DISABLE KEYS */;
INSERT INTO `blade_dept` VALUES (1123598813738675201,'000000',0,'0',1,'刀锋科技','江苏刀锋科技有限公司',1,NULL,0),(1123598813738675202,'000000',1123598813738675201,'0,1123598813738675201',1,'常州刀锋','常州刀锋科技有限公司',1,NULL,0),(1123598813738675203,'000000',1123598813738675201,'0,1123598813738675201',1,'苏州刀锋','苏州刀锋科技有限公司',1,NULL,0);
/*!40000 ALTER TABLE `blade_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_dict`
--

DROP TABLE IF EXISTS `blade_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_dict` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `code` varchar(255) DEFAULT NULL COMMENT '字典码',
  `dict_key` varchar(255) DEFAULT NULL COMMENT '字典值',
  `dict_value` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '字典备注',
  `is_sealed` int(2) DEFAULT '0' COMMENT '是否已封存',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_dict`
--

LOCK TABLES `blade_dict` WRITE;
/*!40000 ALTER TABLE `blade_dict` DISABLE KEYS */;
INSERT INTO `blade_dict` VALUES (1123598814738675201,0,'sex','-1','性别',1,NULL,0,0),(1123598814738675202,1123598814738675201,'sex','1','男',1,NULL,0,0),(1123598814738675203,1123598814738675201,'sex','2','女',2,NULL,0,0),(1123598814738675204,0,'notice','-1','通知类型',2,NULL,0,0),(1123598814738675205,1123598814738675204,'notice','1','发布通知',1,NULL,0,0),(1123598814738675206,1123598814738675204,'notice','2','批转通知',2,NULL,0,0),(1123598814738675207,1123598814738675204,'notice','3','转发通知',3,NULL,0,0),(1123598814738675208,1123598814738675204,'notice','4','指示通知',4,NULL,0,0),(1123598814738675209,1123598814738675204,'notice','5','任免通知',5,NULL,0,0),(1123598814738675210,1123598814738675204,'notice','6','事务通知',6,NULL,0,0),(1123598814738675211,0,'menu_category','-1','菜单类型',3,NULL,0,0),(1123598814738675212,1123598814738675211,'menu_category','1','菜单',1,NULL,0,0),(1123598814738675213,1123598814738675211,'menu_category','2','按钮',2,NULL,0,0),(1123598814738675214,0,'button_func','-1','按钮功能',4,NULL,0,0),(1123598814738675215,1123598814738675214,'button_func','1','工具栏',1,NULL,0,0),(1123598814738675216,1123598814738675214,'button_func','2','操作栏',2,NULL,0,0),(1123598814738675217,1123598814738675214,'button_func','3','工具操作栏',3,NULL,0,0),(1123598814738675218,0,'yes_no','-1','是否',5,NULL,0,0),(1123598814738675219,1123598814738675218,'yes_no','1','否',1,NULL,0,0),(1123598814738675220,1123598814738675218,'yes_no','2','是',2,NULL,0,0),(1123598814738675221,0,'flow','-1','流程类型',5,NULL,0,0),(1123598814738675222,1123598814738675221,'flow','1','请假流程',1,'leave',0,0),(1123598814738675223,1123598814738675221,'flow','2','报销流程',2,'expense',0,0),(1123598814738675227,0,'org_category','-1','机构类型',7,NULL,0,0),(1123598814738675228,1123598814738675227,'org_category','1','公司',1,NULL,0,0),(1123598814738675229,1123598814738675227,'org_category','2','部门',2,NULL,0,0),(1123598814738675230,1123598814738675227,'org_category','3','小组',3,NULL,0,0),(1123598814738675231,0,'data_scope_type','-1','数据权限',8,NULL,0,0),(1123598814738675232,1123598814738675231,'data_scope_type','1','全部可见',1,NULL,0,0),(1123598814738675233,1123598814738675231,'data_scope_type','2','本人可见',2,NULL,0,0),(1123598814738675234,1123598814738675231,'data_scope_type','3','所在机构可见',3,NULL,0,0),(1123598814738675235,1123598814738675231,'data_scope_type','4','所在机构及子级可见',4,NULL,0,0),(1123598814738675236,1123598814738675231,'data_scope_type','5','自定义',5,NULL,0,0),(1123598814738675237,0,'api_scope_type','-1','接口权限',10,NULL,0,0),(1123598814738675238,1123598814738675237,'api_scope_type','1','系统接口',1,NULL,0,0),(1123598814738675239,1123598814738675237,'api_scope_type','2','业务接口',2,NULL,0,0),(1123598814738675240,0,'scope_category','-1','权限类型',10,NULL,0,0),(1123598814738675241,1123598814738675240,'scope_category','1','数据权限',1,NULL,0,0),(1123598814738675242,1123598814738675240,'scope_category','2','接口权限',2,NULL,0,0),(1123598814738676224,0,'oss','-1','对象存储类型',6,NULL,0,0),(1123598814738676225,1123598814738676224,'oss','1','minio',1,NULL,0,0),(1123598814738676226,1123598814738676224,'oss','2','七牛云',2,NULL,0,0),(1123598814738676227,1123598814738676224,'oss','3','阿里云',3,NULL,0,0),(1123598814738676228,1123598814738676224,'oss','4','腾讯云',4,NULL,0,0),(1123598814738677220,0,'sms','-1','短信服务类型',11,NULL,0,0),(1123598814738677221,1123598814738677220,'sms','1','云片',1,NULL,0,0),(1123598814738677222,1123598814738677220,'sms','2','七牛云',2,NULL,0,0),(1123598814738677223,1123598814738677220,'sms','3','阿里云',3,NULL,0,0),(1123598814738677224,1123598814738677220,'sms','4','腾讯云',4,NULL,0,0),(1123598814738777220,0,'post_category','-1','岗位类型',12,NULL,0,0),(1123598814738777221,1123598814738777220,'post_category','1','高层',1,NULL,0,0),(1123598814738777222,1123598814738777220,'post_category','2','中层',2,NULL,0,0),(1123598814738777223,1123598814738777220,'post_category','3','基层',3,NULL,0,0),(1123598814738777224,1123598814738777220,'post_category','4','其他',4,NULL,0,0),(1123598814738777230,0,'region','-1','行政区划',13,NULL,0,0),(1123598814738777231,1123598814738777230,'region','0','国家',0,NULL,0,0),(1123598814738777232,1123598814738777230,'region','1','省份/直辖市',1,NULL,0,0),(1123598814738777233,1123598814738777230,'region','2','地市',2,NULL,0,0),(1123598814738777234,1123598814738777230,'region','3','区县',3,NULL,0,0),(1123598814738777235,1123598814738777230,'region','4','乡镇',4,NULL,0,0),(1123598814738777236,1123598814738777230,'region','5','村委',5,NULL,0,0),(1123598814738778200,0,'user_type','-1','用户平台',14,NULL,0,0),(1123598814738778201,1123598814738778200,'user_type','1','WEB',1,NULL,0,0),(1123598814738778202,1123598814738778200,'user_type','2','APP',2,NULL,0,0),(1123598814738778203,1123598814738778200,'user_type','3','OTHER',3,NULL,0,0);
/*!40000 ALTER TABLE `blade_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_dict_biz`
--

DROP TABLE IF EXISTS `blade_dict_biz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_dict_biz` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT NULL COMMENT '租户ID',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `code` varchar(255) DEFAULT NULL COMMENT '字典码',
  `dict_key` varchar(255) DEFAULT NULL COMMENT '字典值',
  `dict_value` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '字典备注',
  `is_sealed` int(2) DEFAULT '0' COMMENT '是否已封存',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='业务字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_dict_biz`
--

LOCK TABLES `blade_dict_biz` WRITE;
/*!40000 ALTER TABLE `blade_dict_biz` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_dict_biz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_log_api`
--

DROP TABLE IF EXISTS `blade_log_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_log_api` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '服务器环境',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `params` text COMMENT '操作提交的数据',
  `time` varchar(64) DEFAULT NULL COMMENT '执行时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接口日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_log_api`
--

LOCK TABLES `blade_log_api` WRITE;
/*!40000 ALTER TABLE `blade_log_api` DISABLE KEYS */;
INSERT INTO `blade_log_api` VALUES (1402094952049561602,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=admin&password=21232f297a57a5a743894a0e4a801fc3&grant_type=captcha&scope=all&type=account','207','','2021-06-08 10:47:41'),(1402107560869777409,'000000','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&refresh_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE2MjM3MjUyNjAsIm5iZiI6MTYyMzEyMDQ2MH0.3G1u7Q7-g0SsmaYui_cZw0t1lf0WmkvCudpyo21L2UhD-Wqeu69neZB5qWuu55b_bf-Na2VDCBMzsZW_O-bPhg&grant_type=refresh_token&scope=all','53','admin','2021-06-08 11:37:47'),(1402144034449281026,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&refresh_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE2MjM3MjgyNjcsIm5iZiI6MTYyMzEyMzQ2N30.k5kFIoanZoRAHALvThKWLRhik4KfMb8ygIZI1-V3ZQeCtYHpk74leV3pKfeHNbRa6rsUnT2cbG7td5aQ5ejw6A&grant_type=refresh_token&scope=all','35','','2021-06-08 14:02:43'),(1402156657370746882,'000000','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&refresh_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE2MjM3MzY5NjMsIm5iZiI6MTYyMzEzMjE2M30.fpgsueHUQqHXZC3RSCocEXHAkryJ-XJP2vDEViuM_d31I5_xDHhrmN5_oPQjwFnBymC8F_4jh0ZBiVNvHG6I3g&grant_type=refresh_token&scope=all','23','admin','2021-06-08 14:52:53'),(1402169325699846145,'000000','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&refresh_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE2MjM3Mzk5NzIsIm5iZiI6MTYyMzEzNTE3Mn0.VkJYYXjhhKlQ01HPbcAW2-gX6dYUJ7KdP38GQhtXv6oj2DWYW-UhG42MH9LLmGp8hiFrNoFep2oqfhlI6-XuXQ&grant_type=refresh_token&scope=all','745','admin','2021-06-08 15:43:13'),(1402181940115243009,'000000','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&refresh_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE2MjM3NDI5OTIsIm5iZiI6MTYyMzEzODE5Mn0.mgPxY11YlFIJYMM3SpL0xHQ_O4t5SFzFH6EBR3eCZOlqPeNKnnNpmvi4cZgFgreq5XmRgM7mLLHPaKmnaGX0vw&grant_type=refresh_token&scope=all','100','admin','2021-06-08 16:33:20'),(1402188482440953857,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user1&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','16','','2021-06-08 16:59:20'),(1402188516611948546,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user1&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','8','','2021-06-08 16:59:28'),(1402188534576152578,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','40','','2021-06-08 16:59:33'),(1402191354901659649,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=admin&password=21232f297a57a5a743894a0e4a801fc3&grant_type=captcha&scope=all&type=account','18','','2021-06-08 17:10:45'),(1402201560549261314,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','19','','2021-06-08 17:51:18'),(1402201742103904258,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=admin&password=21232f297a57a5a743894a0e4a801fc3&grant_type=captcha&scope=all&type=account','16','','2021-06-08 17:52:02'),(1402203001401737218,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','16','','2021-06-08 17:57:02'),(1402205319916519426,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=admin&password=21232f297a57a5a743894a0e4a801fc3&grant_type=captcha&scope=all&type=account','15','','2021-06-08 18:06:15'),(1402208443418902530,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','16','','2021-06-08 18:18:39'),(1402208563015286786,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=admin&password=21232f297a57a5a743894a0e4a801fc3&grant_type=captcha&scope=all&type=account','15','','2021-06-08 18:19:08'),(1402208835917676546,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','15','','2021-06-08 18:20:13'),(1402209019326201857,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','19','','2021-06-08 18:20:57'),(1402209070572208130,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=admin&password=21232f297a57a5a743894a0e4a801fc3&grant_type=captcha&scope=all&type=account','18','','2021-06-08 18:21:09'),(1402209257797550082,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','15','','2021-06-08 18:21:54'),(1402209322360471553,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','18','','2021-06-08 18:22:09'),(1402209821121937409,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=admin&password=21232f297a57a5a743894a0e4a801fc3&grant_type=captcha&scope=all&type=account','14','','2021-06-08 18:24:08'),(1402210065251401730,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=admin&password=21232f297a57a5a743894a0e4a801fc3&grant_type=captcha&scope=all&type=account','19','','2021-06-08 18:25:06'),(1402210134641967106,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','15','','2021-06-08 18:25:23'),(1402210201553698818,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=admin&password=21232f297a57a5a743894a0e4a801fc3&grant_type=captcha&scope=all&type=account','16','','2021-06-08 18:25:39'),(1402211202494988290,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','13','','2021-06-08 18:29:37'),(1402211285932277762,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=admin&password=21232f297a57a5a743894a0e4a801fc3&grant_type=captcha&scope=all&type=account','20','','2021-06-08 18:29:57'),(1402215029285683202,'','blade-api','pc','192.168.28.104:8081','dev','1','登录用户验证','POST','/blade-auth/oauth/token','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','127.0.0.1','org.springblade.modules.auth.endpoint.BladeTokenEndPoint','token','tenantId=000000&username=user&password=96e79218965eb72c92a549dd5a330112&grant_type=captcha&scope=all&type=account','16','','2021-06-08 18:44:50');
/*!40000 ALTER TABLE `blade_log_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_log_error`
--

DROP TABLE IF EXISTS `blade_log_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_log_error` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '系统环境',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `stack_trace` text COMMENT '堆栈',
  `exception_name` varchar(255) DEFAULT NULL COMMENT '异常名',
  `message` text COMMENT '异常信息',
  `line_number` int(11) DEFAULT NULL COMMENT '错误行数',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `file_name` varchar(1000) DEFAULT NULL COMMENT '文件名',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `params` text COMMENT '操作提交的数据',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='错误日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_log_error`
--

LOCK TABLES `blade_log_error` WRITE;
/*!40000 ALTER TABLE `blade_log_error` DISABLE KEYS */;
INSERT INTO `blade_log_error` VALUES (1402095146342305794,'000000','blade-api','pc','192.168.28.104:8081','dev','POST','/blade-system/baseinfo/submit','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36','org.springframework.beans.factory.BeanCreationException: Error creating bean with name \'bcosSDK\' defined in class path resource [applicationContext.xml]: Bean instantiation via constructor failed; nested exception is org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.fisco.bcos.sdk.BcosSDK]: Constructor threw exception; nested exception is org.fisco.bcos.sdk.BcosSDKException: create BcosSDK failed, error info: init channel network error:  Failed to connect to all the nodes! errorMessage: \nconnect to 127.0.0.1:20200 failed\nconnect to 127.0.0.1:20201 failed\n\n[System Information]:\n[Java Version] : 1.8.0_252\n[OS Name] : Linux\n[OS Arch] : amd64\n[OS Version] : 5.3.0-62-generic\n[Vendor Name] : Private Build\n[Vendor URL] : http://java.oracle.com/\n[JVM Version] : 25.252-b09\n[JVM Name] : OpenJDK 64-Bit Server VM\n[JVM Vendor] : Private Build\n[JAVA Library Path] : /usr/java/packages/lib/amd64:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib\n[JDK Disabled NamedCurves] : null\n[JDK DisableNative Option] : false\n[Support secp256k1] : true\n[Support secp256r1] : true\n\n	at org.springframework.beans.factory.support.ConstructorResolver.instantiate(ConstructorResolver.java:314)\n	at org.springframework.beans.factory.support.ConstructorResolver.autowireConstructor(ConstructorResolver.java:295)\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.autowireConstructor(AbstractAutowireCapableBeanFactory.java:1356)\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBeanInstance(AbstractAutowireCapableBeanFactory.java:1203)\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:556)\n	at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:516)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:324)\n	at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:234)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:322)\n	at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:202)\n	at org.springframework.beans.factory.support.DefaultListableBeanFactory.preInstantiateSingletons(DefaultListableBeanFactory.java:897)\n	at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:879)\n	at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:551)\n	at org.springframework.context.support.ClassPathXmlApplicationContext.<init>(ClassPathXmlApplicationContext.java:144)\n	at org.springframework.context.support.ClassPathXmlApplicationContext.<init>(ClassPathXmlApplicationContext.java:85)\n	at org.springblade.modules.trace.contract.TraceContract.initialize(TraceContract.java:32)\n	at org.springblade.modules.trace.controller.BaseInfoController.submit(BaseInfoController.java:95)\n	at org.springblade.modules.trace.controller.BaseInfoController$$FastClassBySpringCGLIB$$c3d631b0.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:771)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\n	at org.springblade.core.log.aspect.RequestLogAspect.aroundApi(RequestLogAspect.java:112)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:95)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:749)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:691)\n	at org.springblade.modules.trace.controller.BaseInfoController$$EnhancerBySpringCGLIB$$f9922802.submit(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:105)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:878)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:792)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:517)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:584)\n	at io.undertow.servlet.handlers.ServletHandler.handleRequest(ServletHandler.java:74)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:129)\n	at org.springblade.core.log.filter.LogTraceFilter.doFilter(LogTraceFilter.java:39)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springblade.core.boot.request.BladeRequestFilter.doFilter(BladeRequestFilter.java:58)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\n	at io.undertow.servlet.core.ManagedFilter.doFilter(ManagedFilter.java:61)\n	at io.undertow.servlet.handlers.FilterHandler$FilterChainImpl.doFilter(FilterHandler.java:131)\n	at io.undertow.servlet.handlers.FilterHandler.handleRequest(FilterHandler.java:84)\n	at io.undertow.servlet.handlers.security.ServletSecurityRoleHandler.handleRequest(ServletSecurityRoleHandler.java:62)\n	at io.undertow.servlet.handlers.ServletChain$1.handleRequest(ServletChain.java:68)\n	at io.undertow.servlet.handlers.ServletDispatchingHandler.handleRequest(ServletDispatchingHandler.java:36)\n	at io.undertow.servlet.handlers.RedirectDirHandler.handleRequest(RedirectDirHandler.java:68)\n	at io.undertow.servlet.handlers.security.SSLInformationAssociationHandler.handleRequest(SSLInformationAssociationHandler.java:111)\n	at io.undertow.servlet.handlers.security.ServletAuthenticationCallHandler.handleRequest(ServletAuthenticationCallHandler.java:57)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.security.handlers.AbstractConfidentialityHandler.handleRequest(AbstractConfidentialityHandler.java:46)\n	at io.undertow.servlet.handlers.security.ServletConfidentialityConstraintHandler.handleRequest(ServletConfidentialityConstraintHandler.java:64)\n	at io.undertow.security.handlers.AuthenticationMechanismsHandler.handleRequest(AuthenticationMechanismsHandler.java:60)\n	at io.undertow.servlet.handlers.security.CachedAuthenticatedSessionHandler.handleRequest(CachedAuthenticatedSessionHandler.java:77)\n	at io.undertow.security.handlers.AbstractSecurityContextAssociationHandler.handleRequest(AbstractSecurityContextAssociationHandler.java:43)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.server.handlers.PredicateHandler.handleRequest(PredicateHandler.java:43)\n	at io.undertow.servlet.handlers.ServletInitialHandler.handleFirstRequest(ServletInitialHandler.java:269)\n	at io.undertow.servlet.handlers.ServletInitialHandler.access$100(ServletInitialHandler.java:78)\n	at io.undertow.servlet.handlers.ServletInitialHandler$2.call(ServletInitialHandler.java:133)\n	at io.undertow.servlet.handlers.ServletInitialHandler$2.call(ServletInitialHandler.java:130)\n	at io.undertow.servlet.core.ServletRequestContextThreadSetupAction$1.call(ServletRequestContextThreadSetupAction.java:48)\n	at io.undertow.servlet.core.ContextClassLoaderSetupAction$1.call(ContextClassLoaderSetupAction.java:43)\n	at io.undertow.servlet.handlers.ServletInitialHandler.dispatchRequest(ServletInitialHandler.java:249)\n	at io.undertow.servlet.handlers.ServletInitialHandler.access$000(ServletInitialHandler.java:78)\n	at io.undertow.servlet.handlers.ServletInitialHandler$1.handleRequest(ServletInitialHandler.java:99)\n	at io.undertow.server.Connectors.executeRootHandler(Connectors.java:376)\n	at io.undertow.server.HttpServerExchange$1.run(HttpServerExchange.java:830)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at java.lang.Thread.run(Thread.java:748)\nCaused by: org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.fisco.bcos.sdk.BcosSDK]: Constructor threw exception; nested exception is org.fisco.bcos.sdk.BcosSDKException: create BcosSDK failed, error info: init channel network error:  Failed to connect to all the nodes! errorMessage: \nconnect to 127.0.0.1:20200 failed\nconnect to 127.0.0.1:20201 failed\n\n[System Information]:\n[Java Version] : 1.8.0_252\n[OS Name] : Linux\n[OS Arch] : amd64\n[OS Version] : 5.3.0-62-generic\n[Vendor Name] : Private Build\n[Vendor URL] : http://java.oracle.com/\n[JVM Version] : 25.252-b09\n[JVM Name] : OpenJDK 64-Bit Server VM\n[JVM Vendor] : Private Build\n[JAVA Library Path] : /usr/java/packages/lib/amd64:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib\n[JDK Disabled NamedCurves] : null\n[JDK DisableNative Option] : false\n[Support secp256k1] : true\n[Support secp256r1] : true\n\n	at org.springframework.beans.BeanUtils.instantiateClass(BeanUtils.java:217)\n	at org.springframework.beans.factory.support.SimpleInstantiationStrategy.instantiate(SimpleInstantiationStrategy.java:117)\n	at org.springframework.beans.factory.support.ConstructorResolver.instantiate(ConstructorResolver.java:310)\n	... 106 more\nCaused by: org.fisco.bcos.sdk.BcosSDKException: create BcosSDK failed, error info: init channel network error:  Failed to connect to all the nodes! errorMessage: \nconnect to 127.0.0.1:20200 failed\nconnect to 127.0.0.1:20201 failed\n\n[System Information]:\n[Java Version] : 1.8.0_252\n[OS Name] : Linux\n[OS Arch] : amd64\n[OS Version] : 5.3.0-62-generic\n[Vendor Name] : Private Build\n[Vendor URL] : http://java.oracle.com/\n[JVM Version] : 25.252-b09\n[JVM Name] : OpenJDK 64-Bit Server VM\n[JVM Vendor] : Private Build\n[JAVA Library Path] : /usr/java/packages/lib/amd64:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib\n[JDK Disabled NamedCurves] : null\n[JDK DisableNative Option] : false\n[Support secp256k1] : true\n[Support secp256r1] : true\n\n	at org.fisco.bcos.sdk.BcosSDK.<init>(BcosSDK.java:108)\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)\n	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)\n	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)\n	at org.springframework.beans.BeanUtils.instantiateClass(BeanUtils.java:204)\n	... 108 more\nCaused by: io.netty.channel.ChannelException: init channel network error:  Failed to connect to all the nodes! errorMessage: \nconnect to 127.0.0.1:20200 failed\nconnect to 127.0.0.1:20201 failed\n\n[System Information]:\n[Java Version] : 1.8.0_252\n[OS Name] : Linux\n[OS Arch] : amd64\n[OS Version] : 5.3.0-62-generic\n[Vendor Name] : Private Build\n[Vendor URL] : http://java.oracle.com/\n[JVM Version] : 25.252-b09\n[JVM Name] : OpenJDK 64-Bit Server VM\n[JVM Vendor] : Private Build\n[JAVA Library Path] : /usr/java/packages/lib/amd64:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib\n[JDK Disabled NamedCurves] : null\n[JDK DisableNative Option] : false\n[Support secp256k1] : true\n[Support secp256r1] : true\n\n	at org.fisco.bcos.sdk.channel.ChannelImp.start(ChannelImp.java:96)\n	at org.fisco.bcos.sdk.BcosSDK.<init>(BcosSDK.java:75)\n	... 113 more\nCaused by: org.fisco.bcos.sdk.network.NetworkException:  Failed to connect to all the nodes! errorMessage: \nconnect to 127.0.0.1:20200 failed\nconnect to 127.0.0.1:20201 failed\n\n[System Information]:\n[Java Version] : 1.8.0_252\n[OS Name] : Linux\n[OS Arch] : amd64\n[OS Version] : 5.3.0-62-generic\n[Vendor Name] : Private Build\n[Vendor URL] : http://java.oracle.com/\n[JVM Version] : 25.252-b09\n[JVM Name] : OpenJDK 64-Bit Server VM\n[JVM Vendor] : Private Build\n[JAVA Library Path] : /usr/java/packages/lib/amd64:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib\n[JDK Disabled NamedCurves] : null\n[JDK DisableNative Option] : false\n[Support secp256k1] : true\n[Support secp256r1] : true\n\n	at org.fisco.bcos.sdk.network.ConnectionManager.startConnect(ConnectionManager.java:139)\n	at org.fisco.bcos.sdk.network.NetworkImp.start(NetworkImp.java:160)\n	at org.fisco.bcos.sdk.channel.ChannelImp.start(ChannelImp.java:89)\n	... 114 more\n','org.springframework.beans.factory.BeanCreationException','Error creating bean with name \'bcosSDK\' defined in class path resource [applicationContext.xml]: Bean instantiation via constructor failed; nested exception is org.springframework.beans.BeanInstantiationException: Failed to instantiate [org.fisco.bcos.sdk.BcosSDK]: Constructor threw exception; nested exception is org.fisco.bcos.sdk.BcosSDKException: create BcosSDK failed, error info: init channel network error:  Failed to connect to all the nodes! errorMessage: \nconnect to 127.0.0.1:20200 failed\nconnect to 127.0.0.1:20201 failed\n\n[System Information]:\n[Java Version] : 1.8.0_252\n[OS Name] : Linux\n[OS Arch] : amd64\n[OS Version] : 5.3.0-62-generic\n[Vendor Name] : Private Build\n[Vendor URL] : http://java.oracle.com/\n[JVM Version] : 25.252-b09\n[JVM Name] : OpenJDK 64-Bit Server VM\n[JVM Vendor] : Private Build\n[JAVA Library Path] : /usr/java/packages/lib/amd64:/usr/lib/x86_64-linux-gnu/jni:/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu:/usr/lib/jni:/lib:/usr/lib\n[JDK Disabled NamedCurves] : null\n[JDK DisableNative Option] : false\n[Support secp256k1] : true\n[Support secp256r1] : true\n',314,'127.0.0.1','org.springframework.beans.factory.support.ConstructorResolver','ConstructorResolver.java','instantiate','{\"code\":\"1234\",\"name\":\"sda\",\"enName\":\"sds\",\"typeName\":\"fd\",\"shuName\":\"ds\",\"zhongName\":\"sd\",\"resType\":\"sd\",\"des\":\"sd\",\"useStr\":\"sd\",\"resDes\":\"\",\"collectId\":\"sd\",\"caijiId\":\"sd\",\"yinzhongId\":\"sd\",\"collectDept\":\"ds\",\"collectTime\":\"sd\",\"country\":\"sd\",\"province\":\"sd\",\"address\":\"sd\",\"env\":\"ds\",\"envType\":\"ds\"}','admin','2021-06-08 10:48:27');
/*!40000 ALTER TABLE `blade_log_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_log_usual`
--

DROP TABLE IF EXISTS `blade_log_usual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_log_usual` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '系统环境',
  `log_level` varchar(10) DEFAULT NULL COMMENT '日志级别',
  `log_id` varchar(100) DEFAULT NULL COMMENT '日志业务id',
  `log_data` text COMMENT '日志数据',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `params` text COMMENT '操作提交的数据',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通用日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_log_usual`
--

LOCK TABLES `blade_log_usual` WRITE;
/*!40000 ALTER TABLE `blade_log_usual` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_log_usual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_menu`
--

DROP TABLE IF EXISTS `blade_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_menu` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级菜单',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `alias` varchar(255) DEFAULT NULL COMMENT '菜单别名',
  `path` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `source` varchar(255) DEFAULT NULL COMMENT '菜单资源',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  `category` int(2) DEFAULT NULL COMMENT '菜单类型',
  `action` int(2) DEFAULT '0' COMMENT '操作按钮类型',
  `is_open` int(2) DEFAULT '1' COMMENT '是否打开新页面',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_menu`
--

LOCK TABLES `blade_menu` WRITE;
/*!40000 ALTER TABLE `blade_menu` DISABLE KEYS */;
INSERT INTO `blade_menu` VALUES (1123598815738675201,0,'desk','工作台','menu','/desk','iconfont iconicon_airplay',1,1,0,1,NULL,0),(1123598815738675202,1123598815738675201,'notice','通知公告','menu','/desk/notice','iconfont iconicon_sms',1,1,0,1,NULL,0),(1123598815738675203,0,'system','系统管理','menu','/system','iconfont iconicon_setting',99,1,0,1,NULL,0),(1123598815738675204,1123598815738675203,'user','用户管理','menu','/system/user','iconfont iconicon_principal',1,1,0,1,NULL,0),(1123598815738675205,1123598815738675203,'dept','机构管理','menu','/system/dept','iconfont iconicon_group',2,1,0,1,NULL,0),(1123598815738675206,1123598815738675203,'dict','系统字典','menu','/system/dict','iconfont iconicon_addresslist',4,1,0,1,NULL,0),(1123598815738675207,1123598815738675203,'menu','菜单管理','menu','/system/menu','iconfont iconicon_subordinate',6,1,0,1,NULL,0),(1123598815738675208,1123598815738675203,'topmenu','顶部菜单','menu','/system/topmenu','iconfont icon-canshu',7,1,0,1,NULL,0),(1123598815738675209,1123598815738675203,'param','参数管理','menu','/system/param','iconfont iconicon_community_line',8,1,0,1,NULL,0),(1123598815738675217,0,'tool','研发工具','menu','/tool','iconfont icon-wxbgongju',4,1,0,1,NULL,0),(1123598815738675218,1123598815738675217,'code','代码生成','menu','/tool/code','iconfont iconicon_savememo',1,1,0,1,NULL,0),(1123598815738675219,1123598815738675202,'notice_add','新增','add','/desk/notice/add','plus',1,2,1,1,NULL,0),(1123598815738675220,1123598815738675202,'notice_edit','修改','edit','/desk/notice/edit','form',2,2,2,1,NULL,0),(1123598815738675221,1123598815738675202,'notice_delete','删除','delete','/api/blade-desk/notice/remove','delete',3,2,3,1,NULL,0),(1123598815738675222,1123598815738675202,'notice_view','查看','view','/desk/notice/view','file-text',4,2,2,1,NULL,0),(1123598815738675223,1123598815738675204,'user_add','新增','add','/system/user/add','plus',1,2,1,1,NULL,0),(1123598815738675224,1123598815738675204,'user_edit','修改','edit','/system/user/edit','form',2,2,2,1,NULL,0),(1123598815738675225,1123598815738675204,'user_delete','删除','delete','/api/blade-user/remove','delete',3,2,3,1,NULL,0),(1123598815738675226,1123598815738675204,'user_role','角色配置','role',NULL,'user-add',4,2,1,1,NULL,0),(1123598815738675227,1123598815738675204,'user_reset','密码重置','reset-password','/api/blade-user/reset-password','retweet',5,2,1,1,NULL,0),(1123598815738675228,1123598815738675204,'user_view','查看','view','/system/user/view','file-text',6,2,2,1,NULL,0),(1123598815738675229,1123598815738675205,'dept_add','新增','add','/system/dept/add','plus',1,2,1,1,NULL,0),(1123598815738675230,1123598815738675205,'dept_edit','修改','edit','/system/dept/edit','form',2,2,2,1,NULL,0),(1123598815738675231,1123598815738675205,'dept_delete','删除','delete','/api/blade-system/dept/remove','delete',3,2,3,1,NULL,0),(1123598815738675232,1123598815738675205,'dept_view','查看','view','/system/dept/view','file-text',4,2,2,1,NULL,0),(1123598815738675233,1123598815738675206,'dict_add','新增','add','/system/dict/add','plus',1,2,1,1,NULL,0),(1123598815738675234,1123598815738675206,'dict_edit','修改','edit','/system/dict/edit','form',2,2,2,1,NULL,0),(1123598815738675235,1123598815738675206,'dict_delete','删除','delete','/api/blade-system/dict/remove','delete',3,2,3,1,NULL,0),(1123598815738675236,1123598815738675206,'dict_view','查看','view','/system/dict/view','file-text',4,2,2,1,NULL,0),(1123598815738675237,1123598815738675207,'menu_add','新增','add','/system/menu/add','plus',1,2,1,1,NULL,0),(1123598815738675238,1123598815738675207,'menu_edit','修改','edit','/system/menu/edit','form',2,2,2,1,NULL,0),(1123598815738675239,1123598815738675207,'menu_delete','删除','delete','/api/blade-system/menu/remove','delete',3,2,3,1,NULL,0),(1123598815738675240,1123598815738675207,'menu_view','查看','view','/system/menu/view','file-text',4,2,2,1,NULL,0),(1123598815738675241,1123598815738675308,'role_add','新增','add','/authority/role/add','plus',1,2,1,1,NULL,0),(1123598815738675242,1123598815738675308,'role_edit','修改','edit','/authority/role/edit','form',2,2,2,1,NULL,0),(1123598815738675243,1123598815738675308,'role_delete','删除','delete','/api/blade-system/role/remove','delete',3,2,3,1,NULL,0),(1123598815738675244,1123598815738675308,'role_view','查看','view','/authority/role/view','file-text',4,2,2,1,NULL,0),(1123598815738675245,1123598815738675209,'param_add','新增','add','/system/param/add','plus',1,2,1,1,NULL,0),(1123598815738675246,1123598815738675209,'param_edit','修改','edit','/system/param/edit','form',2,2,2,1,NULL,0),(1123598815738675247,1123598815738675209,'param_delete','删除','delete','/api/blade-system/param/remove','delete',3,2,3,1,NULL,0),(1123598815738675248,1123598815738675209,'param_view','查看','view','/system/param/view','file-text',4,2,2,1,NULL,0),(1123598815738675249,1123598815738675214,'log_usual_view','查看','view','/monitor/log/usual/view','file-text',4,2,2,1,NULL,0),(1123598815738675250,1123598815738675215,'log_api_view','查看','view','/monitor/log/api/view','file-text',4,2,2,1,NULL,0),(1123598815738675251,1123598815738675216,'log_error_view','查看','view','/monitor/log/error/view','file-text',4,2,2,1,NULL,0),(1123598815738675252,1123598815738675218,'code_add','新增','add','/tool/code/add','plus',1,2,1,1,NULL,0),(1123598815738675253,1123598815738675218,'code_edit','修改','edit','/tool/code/edit','form',2,2,2,1,NULL,0),(1123598815738675254,1123598815738675218,'code_delete','删除','delete','/api/blade-system/code/remove','delete',3,2,3,1,NULL,0),(1123598815738675255,1123598815738675218,'code_view','查看','view','/tool/code/view','file-text',4,2,2,1,NULL,0),(1123598815738675256,1123598815738675203,'tenant','租户管理','menu','/system/tenant','iconfont icon-quanxian',9,1,0,1,NULL,0),(1123598815738675257,1123598815738675256,'tenant_add','新增','add','/system/tenant/add','plus',1,2,1,1,NULL,0),(1123598815738675258,1123598815738675256,'tenant_edit','修改','edit','/system/tenant/edit','form',2,2,2,1,NULL,0),(1123598815738675259,1123598815738675256,'tenant_delete','删除','delete','/api/blade-system/tenant/remove','delete',3,2,3,1,NULL,0),(1123598815738675260,1123598815738675256,'tenant_view','查看','view','/system/tenant/view','file-text',4,2,2,1,NULL,0),(1123598815738675261,1123598815738675203,'client','应用管理','menu','/system/client','iconfont iconicon_mobilephone',10,1,0,1,NULL,0),(1123598815738675262,1123598815738675261,'client_add','新增','add','/system/client/add','plus',1,2,1,1,NULL,0),(1123598815738675263,1123598815738675261,'client_edit','修改','edit','/system/client/edit','form',2,2,2,1,NULL,0),(1123598815738675264,1123598815738675261,'client_delete','删除','delete','/api/blade-system/client/remove','delete',3,2,3,1,NULL,0),(1123598815738675265,1123598815738675261,'client_view','查看','view','/system/client/view','file-text',4,2,2,1,NULL,0),(1123598815738675266,0,'flow','流程管理','menu','/flow','iconfont iconicon_send',5,1,0,1,'',0),(1123598815738675267,1123598815738675266,'flow_model','模型管理','menu','/flow/model','iconfont iconicon_discovery',1,1,0,1,'',0),(1123598815738675268,1123598815738675267,'flow_model_create','创建','create','','plus',1,2,1,1,NULL,0),(1123598815738675269,1123598815738675267,'flow_model_update','编辑','update','','form',2,2,2,1,NULL,0),(1123598815738675270,1123598815738675267,'flow_model_deploy','部署','deploy','','cloud-upload',3,2,2,1,NULL,0),(1123598815738675271,1123598815738675267,'flow_model_download','下载','download','','download',4,2,2,1,NULL,0),(1123598815738675272,1123598815738675267,'flow_model_delete','删除','delete','/api/blade-flow/model/remove','delete',5,2,3,1,NULL,0),(1123598815738675273,1123598815738675266,'flow_deploy','流程部署','menu','/flow/deploy','iconfont iconicon_cspace',2,1,0,1,'',0),(1123598815738675274,1123598815738675266,'flow_manager','流程管理','menu','/flow/manager','iconfont iconicon_cloud_history',3,1,0,1,'',0),(1123598815738675275,1123598815738675274,'flow_manager_state','变更状态','state','','plus',1,2,2,1,NULL,0),(1123598815738675276,1123598815738675274,'flow_manager_image','流程图','image','','image',2,2,2,1,NULL,0),(1123598815738675277,1123598815738675274,'flow_manager_remove','删除','remove','','delete',3,2,3,1,NULL,0),(1123598815738675278,1123598815738675266,'flow_follow','流程跟踪','menu','/flow/follow','iconfont iconicon_GPS',4,1,0,1,'',0),(1123598815738675279,1123598815738675278,'flow_follow_delete','删除','remove','','remove',1,2,2,1,NULL,0),(1123598815738675280,0,'work','我的事务','menu','/work','iconfont iconicon_notice',2,1,0,1,'',0),(1123598815738675281,1123598815738675280,'work_start','发起事务','menu','/work/start','iconfont iconicon_compile',1,1,0,1,'',0),(1123598815738675282,1123598815738675281,'work_start_flow','发起','flow','','flow',1,2,2,1,NULL,0),(1123598815738675283,1123598815738675281,'work_start_image','流程图','image','','image',2,2,2,1,NULL,0),(1123598815738675284,1123598815738675280,'work_claim','待签事务','menu','/work/claim','iconfont iconicon_ding',2,1,0,1,'',0),(1123598815738675285,1123598815738675284,'work_claim_sign','签收','sign','','sign',1,2,2,1,NULL,0),(1123598815738675286,1123598815738675284,'work_claim_detail','详情','detail','','detail',2,2,2,1,NULL,0),(1123598815738675287,1123598815738675284,'work_claim_follow','跟踪','follow','','follow',3,2,2,1,NULL,0),(1123598815738675288,1123598815738675280,'work_todo','待办事务','menu','/work/todo','iconfont iconicon_savememo',2,1,0,1,'',0),(1123598815738675289,1123598815738675288,'work_todo_handle','办理','handle','','handle',1,2,2,1,NULL,0),(1123598815738675290,1123598815738675288,'work_todo_detail','详情','detail','','detail',2,2,2,1,NULL,0),(1123598815738675291,1123598815738675288,'work_todo_follow','跟踪','follow','','follow',3,2,2,1,NULL,0),(1123598815738675292,1123598815738675280,'work_send','已发事务','menu','/work/send','iconfont iconicon_doc',3,1,0,1,'',0),(1123598815738675293,1123598815738675292,'work_send_detail','详情','detail','','detail',1,2,2,1,NULL,0),(1123598815738675294,1123598815738675292,'work_send_follow','跟踪','follow','','follow',2,2,2,1,NULL,0),(1123598815738675295,1123598815738675280,'work_done','办结事务','menu','/work/done','iconfont iconicon_dispose',4,1,0,1,'',0),(1123598815738675296,1123598815738675295,'work_done_detail','详情','detail','','detail',1,2,2,1,NULL,0),(1123598815738675297,1123598815738675295,'work_done_follow','跟踪','follow','','follow',2,2,2,1,NULL,0),(1123598815738675298,0,'resource','资源管理','menu','/resource','iconfont iconicon_coinpurse_line',6,1,0,1,'',0),(1123598815738675299,1123598815738675298,'oss','异常数据管理','menu','/resource/oss','iconfont iconicon_subordinate',1,1,0,1,'',0),(1123598815738675301,1123598815738675299,'oss_add','新增','add','/resource/oss/add','plus',1,2,1,1,NULL,0),(1123598815738675302,1123598815738675299,'oss_edit','修改','edit','/resource/oss/edit','form',2,2,2,1,NULL,0),(1123598815738675303,1123598815738675299,'oss_delete','删除','delete','/api/blade-resource/oss/remove','delete',3,2,3,1,NULL,0),(1123598815738675304,1123598815738675299,'oss_view','查看','view','/resource/oss/view','file-text',4,2,2,1,NULL,0),(1123598815738675305,1123598815738675299,'oss_enable','启用','enable','/api/blade-resource/oss/enable','key',5,2,2,1,NULL,0),(1123598815738675307,0,'authority','权限管理','menu','/authority','iconfont icon-bofangqi-suoping',98,1,0,1,'',0),(1123598815738675308,1123598815738675307,'role','角色管理','menu','/authority/role','iconfont iconicon_boss',1,1,0,1,NULL,0),(1123598815738675309,1123598815738675307,'data_scope','数据权限','menu','/authority/datascope','iconfont icon-shujuzhanshi2',2,1,0,1,'',0),(1123598815738675310,1123598815738675309,'data_scope_setting','权限配置','setting',NULL,'setting',1,2,2,1,NULL,0),(1123598815738675311,1123598815738675307,'api_scope','接口权限','menu','/authority/apiscope','iconfont icon-iconset0216',3,1,0,1,'',0),(1123598815738675312,1123598815738675311,'api_scope_setting','权限配置','setting',NULL,'setting',1,2,2,1,NULL,0),(1123598815738675313,1123598815738675208,'topmenu_add','新增','add','/system/topmenu/add','plus',1,2,1,1,NULL,0),(1123598815738675314,1123598815738675208,'topmenu_edit','修改','edit','/system/topmenu/edit','form',2,2,2,1,NULL,0),(1123598815738675315,1123598815738675208,'topmenu_delete','删除','delete','/api/blade-system/topmenu/remove','delete',3,2,3,1,NULL,0),(1123598815738675316,1123598815738675208,'topmenu_view','查看','view','/system/topmenu/view','file-text',4,2,2,1,NULL,0),(1123598815738675317,1123598815738675208,'topmenu_setting','菜单配置','setting',NULL,'setting',5,2,1,1,NULL,0),(1161272593873321991,1123598815738675217,'datasource','数据源管理','menu','/tool/datasource','iconfont icon-caidanguanli',2,1,0,1,NULL,0),(1161272593873321992,1161272593873321991,'datasource_add','新增','add','/tool/datasource/add','plus',1,2,1,1,NULL,0),(1161272593873321993,1161272593873321991,'datasource_edit','修改','edit','/tool/datasource/edit','form',2,2,2,1,NULL,0),(1161272593873321994,1161272593873321991,'datasource_delete','删除','delete','/api/blade-develop/datasource/remove','delete',3,2,3,1,NULL,0),(1161272593873321995,1161272593873321991,'datasource_view','查看','view','/tool/datasource/view','file-text',4,2,2,1,NULL,0),(1164733121140551682,1123598815738675217,'form','表单设计','form','https://form.avuejs.com/','iconfont iconicon_compile',3,1,0,1,'',0),(1164733349637844993,1123598815738675217,'crud','表格设计','crud','https://crud.avuejs.com/','iconfont iconicon_work',4,1,0,1,'',0),(1164733379658963251,1123598815738675203,'dictbiz','业务字典','menu','/system/dictbiz','iconfont iconicon_study',5,1,0,1,'',0),(1164733379658963252,1164733379658963251,'dictbiz_add','新增','add','/system/dictbiz/add','plus',1,2,1,1,'',0),(1164733379658963253,1164733379658963251,'dictbiz_edit','修改','edit','/system/dictbiz/edit','form',2,2,2,1,'',0),(1164733379658963254,1164733379658963251,'dictbiz_delete','删除','delete','/api/blade-system/dict-biz/remove','delete',3,2,3,1,'',0),(1164733379658963255,1164733379658963251,'dictbiz_view','查看','view','/system/dictbiz/view','file-text',4,2,2,1,'',0),(1164733389658962252,1164733389658962251,'sms_add','新增','add','/resource/sms/add','plus',1,2,1,1,NULL,0),(1164733389658962253,1164733389658962251,'sms_edit','修改','edit','/resource/sms/edit','form',2,2,2,1,NULL,0),(1164733389658962254,1164733389658962251,'sms_delete','删除','delete','/api/blade-resource/sms/remove','delete',3,2,3,1,NULL,0),(1164733389658962255,1164733389658962251,'sms_view','查看','view','/resource/sms/view','file-text',4,2,2,1,NULL,0),(1164733389658962256,1164733389658962251,'sms_enable','启用','enable','/api/blade-resource/sms/enable','key',5,2,2,1,NULL,0),(1164733389668962251,1123598815738675203,'post','岗位管理','menu','/system/post','iconfont iconicon_message',3,1,0,1,NULL,0),(1164733389668962252,1164733389668962251,'post_add','新增','add','/system/post/add','plus',1,2,1,1,NULL,0),(1164733389668962253,1164733389668962251,'post_edit','修改','edit','/system/post/edit','form',2,2,2,1,NULL,0),(1164733389668962254,1164733389668962251,'post_delete','删除','delete','/api/blade-system/post/remove','delete',3,2,3,1,NULL,0),(1164733389668962255,1164733389668962251,'post_view','查看','view','/system/post/view','file-text',4,2,2,1,NULL,0),(1164733399668962201,0,'base','溯源查询','menu','/base','iconfont iconicon_affiliations_li',97,1,0,1,'',0),(1164733399668962202,1164733399668962201,'region','一键查询','menu','/base/region','iconfont icon-iframe',1,1,0,1,'',0),(1164733399668962203,1164733399668962202,'region_add','新增下级','add','','',1,2,1,1,NULL,0),(1164733399668962204,1164733399668962202,'region_delete','删除','delete','/api/blade-system/region/remove','',2,2,2,1,NULL,0),(1164733399668962205,1164733399668962202,'region_import','导入','import','','',3,2,3,1,NULL,0),(1164733399668962206,1164733399668962202,'region_export','导出','export','','',4,2,2,1,NULL,0),(1164733399668962207,1164733399668962202,'region_debug','调试','debug','','',5,2,2,1,NULL,0),(1164733399669962202,1164733399669962201,'attach_upload','上传','upload','/resource/attach/upload','',1,2,1,1,NULL,0),(1164733399669962203,1164733399669962201,'attach_download','下载','download','/resource/attach/download','',2,2,2,1,NULL,0),(1164733399669962204,1164733399669962201,'attach_delete','删除','delete','/api/blade-resource/attach/remove','',3,2,3,1,NULL,0),(1402034392285335553,1402212180929642497,'baseinfo','产品生产信息','baseinfo','/trace/baseinfo','iconfont iconicon_work',100,1,0,1,'',0),(1402095758068961282,1402212180929642497,'traffic','产品运输信息','traffic','/trace/traffic','iconfont iconicon_send',101,1,0,1,'',0),(1402095957529088001,1402212180929642497,'store','产品仓储信息','store','/trace/store','iconfont iconicon_study',102,1,0,1,'',0),(1402200670446649346,1402034392285335553,'baseinfo_add','新增','add','/trace/baseinfo/add','iconfont iconicon_task_done',105,2,0,1,'',0),(1402200938043244545,1402034392285335553,'baseinfo_edit','修改','edit','/trace/baseinfo/edit','iconfont iconicon_voipphone',106,2,0,1,'',0),(1402201184970309634,1402034392285335553,'baseinfo_remove','删除','remove','/trace/baseinfo/remove','iconfont iconicon_safety',107,2,0,1,'',0),(1402201408950337537,1402034392285335553,'baseinfo_view','查看','view','/trace/baseinfo/view','iconfont iconicon_task_done',108,2,0,1,'',0),(1402212180929642497,0,'trace','信息录入','trace','/trace','iconfont iconicon_compile',110,1,0,1,'',0);
/*!40000 ALTER TABLE `blade_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_notice`
--

DROP TABLE IF EXISTS `blade_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_notice` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `category` int(11) DEFAULT NULL COMMENT '类型',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_notice`
--

LOCK TABLES `blade_notice` WRITE;
/*!40000 ALTER TABLE `blade_notice` DISABLE KEYS */;
INSERT INTO `blade_notice` VALUES (1123598818738675223,'000000','测试公告',3,'2018-12-31 20:03:31','222',1123598821738675201,1123598813738675201,'2018-12-05 20:03:31',1123598821738675201,'2018-12-28 11:10:51',1,0),(1123598818738675224,'000000','测试公告2',1,'2018-12-05 20:03:31','333',1123598821738675201,1123598813738675201,'2018-12-28 10:32:26',1123598821738675201,'2018-12-28 11:10:34',1,0),(1123598818738675225,'000000','测试公告3',6,'2018-12-29 00:00:00','11111',1123598821738675201,1123598813738675201,'2018-12-28 11:03:44',1123598821738675201,'2018-12-28 11:10:28',1,0);
/*!40000 ALTER TABLE `blade_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_oss`
--

DROP TABLE IF EXISTS `blade_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_oss` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `category` int(2) DEFAULT NULL COMMENT '分类',
  `oss_code` varchar(32) DEFAULT NULL COMMENT '资源编号',
  `endpoint` varchar(255) DEFAULT NULL COMMENT '资源地址',
  `access_key` varchar(255) DEFAULT NULL COMMENT 'accessKey',
  `secret_key` varchar(255) DEFAULT NULL COMMENT 'secretKey',
  `bucket_name` varchar(255) DEFAULT NULL COMMENT '空间名',
  `app_id` varchar(255) DEFAULT NULL COMMENT '应用ID',
  `region` varchar(255) DEFAULT NULL COMMENT '地域简称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对象存储表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_oss`
--

LOCK TABLES `blade_oss` WRITE;
/*!40000 ALTER TABLE `blade_oss` DISABLE KEYS */;
INSERT INTO `blade_oss` VALUES (1132486733992468482,'000000',1,'6040','23.68,142.23','26.38','0','93852.32','','','',1123598821738675201,1123598813738675201,'2019-05-26 11:20:52',1123598821738675201,'2019-05-27 08:34:55',2,0);
/*!40000 ALTER TABLE `blade_oss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_param`
--

DROP TABLE IF EXISTS `blade_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_param` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `param_name` varchar(255) DEFAULT NULL COMMENT '参数名',
  `param_key` varchar(255) DEFAULT NULL COMMENT '参数键',
  `param_value` varchar(255) DEFAULT NULL COMMENT '参数值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_param`
--

LOCK TABLES `blade_param` WRITE;
/*!40000 ALTER TABLE `blade_param` DISABLE KEYS */;
INSERT INTO `blade_param` VALUES (1123598819738675201,'是否开启注册功能','account.registerUser','true','开启注册',1123598821738675201,1123598813738675201,'2018-12-28 12:19:01',1123598821738675201,'2018-12-28 12:19:01',1,0),(1123598819738675202,'账号初始密码','account.initPassword','123456','初始密码',1123598821738675201,1123598813738675201,'2018-12-28 12:19:01',1123598821738675201,'2018-12-28 12:19:01',1,0),(1238706101399142402,'租户默认管理密码','tenant.default.password','admin',NULL,1123598821738675201,1123598813738675201,'2020-03-14 13:58:43',1123598821738675201,'2020-03-14 13:58:43',1,0),(1238706160295559170,'租户默认账号额度','tenant.default.accountNumber','100',NULL,1123598821738675201,1123598813738675201,'2020-03-14 13:58:57',1123598821738675201,'2020-03-14 13:58:57',1,0),(1238706330076790786,'租户默认菜单集合','tenant.default.menuCode','desk,flow,work,monitor,resource,role,user,dept,post,dictbiz,topmenu',NULL,1123598821738675201,1123598813738675201,'2020-03-14 13:59:38',1123598821738675201,'2020-03-14 13:59:38',1,0);
/*!40000 ALTER TABLE `blade_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_post`
--

DROP TABLE IF EXISTS `blade_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_post` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `category` int(11) DEFAULT NULL COMMENT '岗位类型',
  `post_code` varchar(12) DEFAULT NULL COMMENT '岗位编号',
  `post_name` varchar(64) DEFAULT NULL COMMENT '岗位名称',
  `sort` int(2) DEFAULT NULL COMMENT '岗位排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '岗位描述',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_post`
--

LOCK TABLES `blade_post` WRITE;
/*!40000 ALTER TABLE `blade_post` DISABLE KEYS */;
INSERT INTO `blade_post` VALUES (1123598817738675201,'000000',1,'ceo','首席执行官',1,'总经理',1123598821738675201,1123598813738675201,'2020-04-01 00:00:00',1123598821738675201,'2020-04-01 00:00:00',1,0),(1123598817738675202,'000000',1,'coo','首席运营官',2,'常务总经理',1123598821738675201,1123598813738675201,'2020-04-01 00:00:00',1123598821738675201,'2020-04-01 00:00:00',1,0),(1123598817738675203,'000000',1,'cfo','首席财务官',3,'财务总经理',1123598821738675201,1123598813738675201,'2020-04-01 00:00:00',1123598821738675201,'2020-04-01 00:00:00',1,0),(1123598817738675204,'000000',1,'cto','首席技术官',4,'技术总监',1123598821738675201,1123598813738675201,'2020-04-01 00:00:00',1123598821738675201,'2020-04-01 00:00:00',1,0),(1123598817738675205,'000000',1,'cio','首席信息官',5,'信息总监',1123598821738675201,1123598813738675201,'2020-04-01 00:00:00',1123598821738675201,'2020-04-01 00:00:00',1,0),(1123598817738675206,'000000',2,'pm','技术经理',6,'研发和产品是永远的朋友',1123598821738675201,1123598813738675201,'2020-04-01 00:00:00',1123598821738675201,'2020-04-01 00:00:00',1,0),(1123598817738675207,'000000',2,'hrm','人力经理',7,'人力资源部门工作管理者',1123598821738675201,1123598813738675201,'2020-04-01 00:00:00',1123598821738675201,'2020-04-01 00:00:00',1,0),(1123598817738675208,'000000',3,'staff','普通员工',8,'普通员工',1123598821738675201,1123598813738675201,'2020-04-01 00:00:00',1123598821738675201,'2020-04-01 00:00:00',1,0);
/*!40000 ALTER TABLE `blade_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_process_leave`
--

DROP TABLE IF EXISTS `blade_process_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_process_leave` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `process_definition_id` varchar(64) DEFAULT NULL COMMENT '流程定义主键',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例主键',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `task_user` varchar(255) DEFAULT NULL COMMENT '第一级审批人',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程请假业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_process_leave`
--

LOCK TABLES `blade_process_leave` WRITE;
/*!40000 ALTER TABLE `blade_process_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_process_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_region`
--

DROP TABLE IF EXISTS `blade_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_region` (
  `code` varchar(12) NOT NULL COMMENT '区划编号',
  `parent_code` varchar(12) DEFAULT NULL COMMENT '父区划编号',
  `ancestors` varchar(255) DEFAULT NULL COMMENT '祖区划编号',
  `name` varchar(32) DEFAULT NULL COMMENT '区划名称',
  `province_code` varchar(12) DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) DEFAULT NULL COMMENT '区级名称',
  `town_code` varchar(12) DEFAULT NULL COMMENT '镇级区划编号',
  `town_name` varchar(32) DEFAULT NULL COMMENT '镇级名称',
  `village_code` varchar(12) DEFAULT NULL COMMENT '村级区划编号',
  `village_name` varchar(32) DEFAULT NULL COMMENT '村级名称',
  `region_level` int(2) DEFAULT NULL COMMENT '层级',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='行政区划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_region`
--

LOCK TABLES `blade_region` WRITE;
/*!40000 ALTER TABLE `blade_region` DISABLE KEYS */;
INSERT INTO `blade_region` VALUES ('00','0','0','中华人民共和国','','','','','','','','','','',0,1,''),('11','00','00','北京市','11','北京市','','','','','','','','',1,1,''),('1101','11','00,11','北京市','11','北京市','1101','北京市','','','','','','',2,1,''),('110101','1101','00,11,1101','东城区','11','北京市','1101','北京市','110101','东城区','','','','',3,1,''),('110102','1101','00,11,1101','西城区','11','北京市','1101','北京市','110102','西城区','','','','',3,1,''),('110105','1101','00,11,1101','朝阳区','11','北京市','1101','北京市','110105','朝阳区','','','','',3,1,''),('110106','1101','00,11,1101','丰台区','11','北京市','1101','北京市','110106','丰台区','','','','',3,1,''),('110107','1101','00,11,1101','石景山区','11','北京市','1101','北京市','110107','石景山区','','','','',3,1,''),('110108','1101','00,11,1101','海淀区','11','北京市','1101','北京市','110108','海淀区','','','','',3,1,''),('110109','1101','00,11,1101','门头沟区','11','北京市','1101','北京市','110109','门头沟区','','','','',3,1,''),('110111','1101','00,11,1101','房山区','11','北京市','1101','北京市','110111','房山区','','','','',3,1,''),('110112','1101','00,11,1101','通州区','11','北京市','1101','北京市','110112','通州区','','','','',3,1,''),('110113','1101','00,11,1101','顺义区','11','北京市','1101','北京市','110113','顺义区','','','','',3,1,''),('110114','1101','00,11,1101','昌平区','11','北京市','1101','北京市','110114','昌平区','','','','',3,1,''),('110115','1101','00,11,1101','大兴区','11','北京市','1101','北京市','110115','大兴区','','','','',3,1,''),('110116','1101','00,11,1101','怀柔区','11','北京市','1101','北京市','110116','怀柔区','','','','',3,1,''),('110117','1101','00,11,1101','平谷区','11','北京市','1101','北京市','110117','平谷区','','','','',3,1,''),('110118','1101','00,11,1101','密云区','11','北京市','1101','北京市','110118','密云区','','','','',3,1,''),('110119','1101','00,11,1101','延庆区','11','北京市','1101','北京市','110119','延庆区','','','','',3,1,''),('12','00','00','天津市','12','天津市','','','','','','','','',1,1,''),('1201','12','00,12','天津市','12','天津市','1201','天津市','','','','','','',2,1,''),('120101','1201','00,12,1201','和平区','12','天津市','1201','天津市','120101','和平区','','','','',3,1,''),('120102','1201','00,12,1201','河东区','12','天津市','1201','天津市','120102','河东区','','','','',3,1,''),('120103','1201','00,12,1201','河西区','12','天津市','1201','天津市','120103','河西区','','','','',3,1,''),('120104','1201','00,12,1201','南开区','12','天津市','1201','天津市','120104','南开区','','','','',3,1,''),('120105','1201','00,12,1201','河北区','12','天津市','1201','天津市','120105','河北区','','','','',3,1,''),('120106','1201','00,12,1201','红桥区','12','天津市','1201','天津市','120106','红桥区','','','','',3,1,''),('120110','1201','00,12,1201','东丽区','12','天津市','1201','天津市','120110','东丽区','','','','',3,1,''),('120111','1201','00,12,1201','西青区','12','天津市','1201','天津市','120111','西青区','','','','',3,1,''),('120112','1201','00,12,1201','津南区','12','天津市','1201','天津市','120112','津南区','','','','',3,1,''),('120113','1201','00,12,1201','北辰区','12','天津市','1201','天津市','120113','北辰区','','','','',3,1,''),('120114','1201','00,12,1201','武清区','12','天津市','1201','天津市','120114','武清区','','','','',3,1,''),('120115','1201','00,12,1201','宝坻区','12','天津市','1201','天津市','120115','宝坻区','','','','',3,1,''),('120116','1201','00,12,1201','滨海新区','12','天津市','1201','天津市','120116','滨海新区','','','','',3,1,''),('120117','1201','00,12,1201','宁河区','12','天津市','1201','天津市','120117','宁河区','','','','',3,1,''),('120118','1201','00,12,1201','静海区','12','天津市','1201','天津市','120118','静海区','','','','',3,1,''),('120119','1201','00,12,1201','蓟州区','12','天津市','1201','天津市','120119','蓟州区','','','','',3,1,''),('13','00','00','河北省','13','河北省','','','','','','','','',1,1,''),('1301','13','00,13','石家庄市','13','河北省','1301','石家庄市','','','','','','',2,1,''),('130102','1301','00,13,1301','长安区','13','河北省','1301','石家庄市','130102','长安区','','','','',3,1,''),('130104','1301','00,13,1301','桥西区','13','河北省','1301','石家庄市','130104','桥西区','','','','',3,1,''),('130105','1301','00,13,1301','新华区','13','河北省','1301','石家庄市','130105','新华区','','','','',3,1,''),('130107','1301','00,13,1301','井陉矿区','13','河北省','1301','石家庄市','130107','井陉矿区','','','','',3,1,''),('130108','1301','00,13,1301','裕华区','13','河北省','1301','石家庄市','130108','裕华区','','','','',3,1,''),('130109','1301','00,13,1301','藁城区','13','河北省','1301','石家庄市','130109','藁城区','','','','',3,1,''),('130110','1301','00,13,1301','鹿泉区','13','河北省','1301','石家庄市','130110','鹿泉区','','','','',3,1,''),('130111','1301','00,13,1301','栾城区','13','河北省','1301','石家庄市','130111','栾城区','','','','',3,1,''),('130121','1301','00,13,1301','井陉县','13','河北省','1301','石家庄市','130121','井陉县','','','','',3,1,''),('130123','1301','00,13,1301','正定县','13','河北省','1301','石家庄市','130123','正定县','','','','',3,1,''),('130125','1301','00,13,1301','行唐县','13','河北省','1301','石家庄市','130125','行唐县','','','','',3,1,''),('130126','1301','00,13,1301','灵寿县','13','河北省','1301','石家庄市','130126','灵寿县','','','','',3,1,''),('130127','1301','00,13,1301','高邑县','13','河北省','1301','石家庄市','130127','高邑县','','','','',3,1,''),('130128','1301','00,13,1301','深泽县','13','河北省','1301','石家庄市','130128','深泽县','','','','',3,1,''),('130129','1301','00,13,1301','赞皇县','13','河北省','1301','石家庄市','130129','赞皇县','','','','',3,1,''),('130130','1301','00,13,1301','无极县','13','河北省','1301','石家庄市','130130','无极县','','','','',3,1,''),('130131','1301','00,13,1301','平山县','13','河北省','1301','石家庄市','130131','平山县','','','','',3,1,''),('130132','1301','00,13,1301','元氏县','13','河北省','1301','石家庄市','130132','元氏县','','','','',3,1,''),('130133','1301','00,13,1301','赵县','13','河北省','1301','石家庄市','130133','赵县','','','','',3,1,''),('130181','1301','00,13,1301','辛集市','13','河北省','1301','石家庄市','130181','辛集市','','','','',3,1,''),('130183','1301','00,13,1301','晋州市','13','河北省','1301','石家庄市','130183','晋州市','','','','',3,1,''),('130184','1301','00,13,1301','新乐市','13','河北省','1301','石家庄市','130184','新乐市','','','','',3,1,''),('1302','13','00,13','唐山市','13','河北省','1302','唐山市','','','','','','',2,1,''),('130202','1302','00,13,1302','路南区','13','河北省','1302','唐山市','130202','路南区','','','','',3,1,''),('130203','1302','00,13,1302','路北区','13','河北省','1302','唐山市','130203','路北区','','','','',3,1,''),('130204','1302','00,13,1302','古冶区','13','河北省','1302','唐山市','130204','古冶区','','','','',3,1,''),('130205','1302','00,13,1302','开平区','13','河北省','1302','唐山市','130205','开平区','','','','',3,1,''),('130207','1302','00,13,1302','丰南区','13','河北省','1302','唐山市','130207','丰南区','','','','',3,1,''),('130208','1302','00,13,1302','丰润区','13','河北省','1302','唐山市','130208','丰润区','','','','',3,1,''),('130209','1302','00,13,1302','曹妃甸区','13','河北省','1302','唐山市','130209','曹妃甸区','','','','',3,1,''),('130224','1302','00,13,1302','滦南县','13','河北省','1302','唐山市','130224','滦南县','','','','',3,1,''),('130225','1302','00,13,1302','乐亭县','13','河北省','1302','唐山市','130225','乐亭县','','','','',3,1,''),('130227','1302','00,13,1302','迁西县','13','河北省','1302','唐山市','130227','迁西县','','','','',3,1,''),('130229','1302','00,13,1302','玉田县','13','河北省','1302','唐山市','130229','玉田县','','','','',3,1,''),('130281','1302','00,13,1302','遵化市','13','河北省','1302','唐山市','130281','遵化市','','','','',3,1,''),('130283','1302','00,13,1302','迁安市','13','河北省','1302','唐山市','130283','迁安市','','','','',3,1,''),('130284','1302','00,13,1302','滦州市','13','河北省','1302','唐山市','130284','滦州市','','','','',3,1,''),('1303','13','00,13','秦皇岛市','13','河北省','1303','秦皇岛市','','','','','','',2,1,''),('130302','1303','00,13,1303','海港区','13','河北省','1303','秦皇岛市','130302','海港区','','','','',3,1,''),('130303','1303','00,13,1303','山海关区','13','河北省','1303','秦皇岛市','130303','山海关区','','','','',3,1,''),('130304','1303','00,13,1303','北戴河区','13','河北省','1303','秦皇岛市','130304','北戴河区','','','','',3,1,''),('130306','1303','00,13,1303','抚宁区','13','河北省','1303','秦皇岛市','130306','抚宁区','','','','',3,1,''),('130321','1303','00,13,1303','青龙满族自治县','13','河北省','1303','秦皇岛市','130321','青龙满族自治县','','','','',3,1,''),('130322','1303','00,13,1303','昌黎县','13','河北省','1303','秦皇岛市','130322','昌黎县','','','','',3,1,''),('130324','1303','00,13,1303','卢龙县','13','河北省','1303','秦皇岛市','130324','卢龙县','','','','',3,1,''),('1304','13','00,13','邯郸市','13','河北省','1304','邯郸市','','','','','','',2,1,''),('130402','1304','00,13,1304','邯山区','13','河北省','1304','邯郸市','130402','邯山区','','','','',3,1,''),('130403','1304','00,13,1304','丛台区','13','河北省','1304','邯郸市','130403','丛台区','','','','',3,1,''),('130404','1304','00,13,1304','复兴区','13','河北省','1304','邯郸市','130404','复兴区','','','','',3,1,''),('130406','1304','00,13,1304','峰峰矿区','13','河北省','1304','邯郸市','130406','峰峰矿区','','','','',3,1,''),('130407','1304','00,13,1304','肥乡区','13','河北省','1304','邯郸市','130407','肥乡区','','','','',3,1,''),('130408','1304','00,13,1304','永年区','13','河北省','1304','邯郸市','130408','永年区','','','','',3,1,''),('130423','1304','00,13,1304','临漳县','13','河北省','1304','邯郸市','130423','临漳县','','','','',3,1,''),('130424','1304','00,13,1304','成安县','13','河北省','1304','邯郸市','130424','成安县','','','','',3,1,''),('130425','1304','00,13,1304','大名县','13','河北省','1304','邯郸市','130425','大名县','','','','',3,1,''),('130426','1304','00,13,1304','涉县','13','河北省','1304','邯郸市','130426','涉县','','','','',3,1,''),('130427','1304','00,13,1304','磁县','13','河北省','1304','邯郸市','130427','磁县','','','','',3,1,''),('130430','1304','00,13,1304','邱县','13','河北省','1304','邯郸市','130430','邱县','','','','',3,1,''),('130431','1304','00,13,1304','鸡泽县','13','河北省','1304','邯郸市','130431','鸡泽县','','','','',3,1,''),('130432','1304','00,13,1304','广平县','13','河北省','1304','邯郸市','130432','广平县','','','','',3,1,''),('130433','1304','00,13,1304','馆陶县','13','河北省','1304','邯郸市','130433','馆陶县','','','','',3,1,''),('130434','1304','00,13,1304','魏县','13','河北省','1304','邯郸市','130434','魏县','','','','',3,1,''),('130435','1304','00,13,1304','曲周县','13','河北省','1304','邯郸市','130435','曲周县','','','','',3,1,''),('130481','1304','00,13,1304','武安市','13','河北省','1304','邯郸市','130481','武安市','','','','',3,1,''),('1305','13','00,13','邢台市','13','河北省','1305','邢台市','','','','','','',2,1,''),('130502','1305','00,13,1305','桥东区','13','河北省','1305','邢台市','130502','桥东区','','','','',3,1,''),('130503','1305','00,13,1305','桥西区','13','河北省','1305','邢台市','130503','桥西区','','','','',3,1,''),('130521','1305','00,13,1305','邢台县','13','河北省','1305','邢台市','130521','邢台县','','','','',3,1,''),('130522','1305','00,13,1305','临城县','13','河北省','1305','邢台市','130522','临城县','','','','',3,1,''),('130523','1305','00,13,1305','内丘县','13','河北省','1305','邢台市','130523','内丘县','','','','',3,1,''),('130524','1305','00,13,1305','柏乡县','13','河北省','1305','邢台市','130524','柏乡县','','','','',3,1,''),('130525','1305','00,13,1305','隆尧县','13','河北省','1305','邢台市','130525','隆尧县','','','','',3,1,''),('130526','1305','00,13,1305','任县','13','河北省','1305','邢台市','130526','任县','','','','',3,1,''),('130527','1305','00,13,1305','南和县','13','河北省','1305','邢台市','130527','南和县','','','','',3,1,''),('130528','1305','00,13,1305','宁晋县','13','河北省','1305','邢台市','130528','宁晋县','','','','',3,1,''),('130529','1305','00,13,1305','巨鹿县','13','河北省','1305','邢台市','130529','巨鹿县','','','','',3,1,''),('130530','1305','00,13,1305','新河县','13','河北省','1305','邢台市','130530','新河县','','','','',3,1,''),('130531','1305','00,13,1305','广宗县','13','河北省','1305','邢台市','130531','广宗县','','','','',3,1,''),('130532','1305','00,13,1305','平乡县','13','河北省','1305','邢台市','130532','平乡县','','','','',3,1,''),('130533','1305','00,13,1305','威县','13','河北省','1305','邢台市','130533','威县','','','','',3,1,''),('130534','1305','00,13,1305','清河县','13','河北省','1305','邢台市','130534','清河县','','','','',3,1,''),('130535','1305','00,13,1305','临西县','13','河北省','1305','邢台市','130535','临西县','','','','',3,1,''),('130581','1305','00,13,1305','南宫市','13','河北省','1305','邢台市','130581','南宫市','','','','',3,1,''),('130582','1305','00,13,1305','沙河市','13','河北省','1305','邢台市','130582','沙河市','','','','',3,1,''),('1306','13','00,13','保定市','13','河北省','1306','保定市','','','','','','',2,1,''),('130602','1306','00,13,1306','竞秀区','13','河北省','1306','保定市','130602','竞秀区','','','','',3,1,''),('130606','1306','00,13,1306','莲池区','13','河北省','1306','保定市','130606','莲池区','','','','',3,1,''),('130607','1306','00,13,1306','满城区','13','河北省','1306','保定市','130607','满城区','','','','',3,1,''),('130608','1306','00,13,1306','清苑区','13','河北省','1306','保定市','130608','清苑区','','','','',3,1,''),('130609','1306','00,13,1306','徐水区','13','河北省','1306','保定市','130609','徐水区','','','','',3,1,''),('130623','1306','00,13,1306','涞水县','13','河北省','1306','保定市','130623','涞水县','','','','',3,1,''),('130624','1306','00,13,1306','阜平县','13','河北省','1306','保定市','130624','阜平县','','','','',3,1,''),('130626','1306','00,13,1306','定兴县','13','河北省','1306','保定市','130626','定兴县','','','','',3,1,''),('130627','1306','00,13,1306','唐县','13','河北省','1306','保定市','130627','唐县','','','','',3,1,''),('130628','1306','00,13,1306','高阳县','13','河北省','1306','保定市','130628','高阳县','','','','',3,1,''),('130629','1306','00,13,1306','容城县','13','河北省','1306','保定市','130629','容城县','','','','',3,1,''),('130630','1306','00,13,1306','涞源县','13','河北省','1306','保定市','130630','涞源县','','','','',3,1,''),('130631','1306','00,13,1306','望都县','13','河北省','1306','保定市','130631','望都县','','','','',3,1,''),('130632','1306','00,13,1306','安新县','13','河北省','1306','保定市','130632','安新县','','','','',3,1,''),('130633','1306','00,13,1306','易县','13','河北省','1306','保定市','130633','易县','','','','',3,1,''),('130634','1306','00,13,1306','曲阳县','13','河北省','1306','保定市','130634','曲阳县','','','','',3,1,''),('130635','1306','00,13,1306','蠡县','13','河北省','1306','保定市','130635','蠡县','','','','',3,1,''),('130636','1306','00,13,1306','顺平县','13','河北省','1306','保定市','130636','顺平县','','','','',3,1,''),('130637','1306','00,13,1306','博野县','13','河北省','1306','保定市','130637','博野县','','','','',3,1,''),('130638','1306','00,13,1306','雄县','13','河北省','1306','保定市','130638','雄县','','','','',3,1,''),('130681','1306','00,13,1306','涿州市','13','河北省','1306','保定市','130681','涿州市','','','','',3,1,''),('130682','1306','00,13,1306','定州市','13','河北省','1306','保定市','130682','定州市','','','','',3,1,''),('130683','1306','00,13,1306','安国市','13','河北省','1306','保定市','130683','安国市','','','','',3,1,''),('130684','1306','00,13,1306','高碑店市','13','河北省','1306','保定市','130684','高碑店市','','','','',3,1,''),('1307','13','00,13','张家口市','13','河北省','1307','张家口市','','','','','','',2,1,''),('130702','1307','00,13,1307','桥东区','13','河北省','1307','张家口市','130702','桥东区','','','','',3,1,''),('130703','1307','00,13,1307','桥西区','13','河北省','1307','张家口市','130703','桥西区','','','','',3,1,''),('130705','1307','00,13,1307','宣化区','13','河北省','1307','张家口市','130705','宣化区','','','','',3,1,''),('130706','1307','00,13,1307','下花园区','13','河北省','1307','张家口市','130706','下花园区','','','','',3,1,''),('130708','1307','00,13,1307','万全区','13','河北省','1307','张家口市','130708','万全区','','','','',3,1,''),('130709','1307','00,13,1307','崇礼区','13','河北省','1307','张家口市','130709','崇礼区','','','','',3,1,''),('130722','1307','00,13,1307','张北县','13','河北省','1307','张家口市','130722','张北县','','','','',3,1,''),('130723','1307','00,13,1307','康保县','13','河北省','1307','张家口市','130723','康保县','','','','',3,1,''),('130724','1307','00,13,1307','沽源县','13','河北省','1307','张家口市','130724','沽源县','','','','',3,1,''),('130725','1307','00,13,1307','尚义县','13','河北省','1307','张家口市','130725','尚义县','','','','',3,1,''),('130726','1307','00,13,1307','蔚县','13','河北省','1307','张家口市','130726','蔚县','','','','',3,1,''),('130727','1307','00,13,1307','阳原县','13','河北省','1307','张家口市','130727','阳原县','','','','',3,1,''),('130728','1307','00,13,1307','怀安县','13','河北省','1307','张家口市','130728','怀安县','','','','',3,1,''),('130730','1307','00,13,1307','怀来县','13','河北省','1307','张家口市','130730','怀来县','','','','',3,1,''),('130731','1307','00,13,1307','涿鹿县','13','河北省','1307','张家口市','130731','涿鹿县','','','','',3,1,''),('130732','1307','00,13,1307','赤城县','13','河北省','1307','张家口市','130732','赤城县','','','','',3,1,''),('1308','13','00,13','承德市','13','河北省','1308','承德市','','','','','','',2,1,''),('130802','1308','00,13,1308','双桥区','13','河北省','1308','承德市','130802','双桥区','','','','',3,1,''),('130803','1308','00,13,1308','双滦区','13','河北省','1308','承德市','130803','双滦区','','','','',3,1,''),('130804','1308','00,13,1308','鹰手营子矿区','13','河北省','1308','承德市','130804','鹰手营子矿区','','','','',3,1,''),('130821','1308','00,13,1308','承德县','13','河北省','1308','承德市','130821','承德县','','','','',3,1,''),('130822','1308','00,13,1308','兴隆县','13','河北省','1308','承德市','130822','兴隆县','','','','',3,1,''),('130824','1308','00,13,1308','滦平县','13','河北省','1308','承德市','130824','滦平县','','','','',3,1,''),('130825','1308','00,13,1308','隆化县','13','河北省','1308','承德市','130825','隆化县','','','','',3,1,''),('130826','1308','00,13,1308','丰宁满族自治县','13','河北省','1308','承德市','130826','丰宁满族自治县','','','','',3,1,''),('130827','1308','00,13,1308','宽城满族自治县','13','河北省','1308','承德市','130827','宽城满族自治县','','','','',3,1,''),('130828','1308','00,13,1308','围场满族蒙古族自治县','13','河北省','1308','承德市','130828','围场满族蒙古族自治县','','','','',3,1,''),('130881','1308','00,13,1308','平泉市','13','河北省','1308','承德市','130881','平泉市','','','','',3,1,''),('1309','13','00,13','沧州市','13','河北省','1309','沧州市','','','','','','',2,1,''),('130902','1309','00,13,1309','新华区','13','河北省','1309','沧州市','130902','新华区','','','','',3,1,''),('130903','1309','00,13,1309','运河区','13','河北省','1309','沧州市','130903','运河区','','','','',3,1,''),('130921','1309','00,13,1309','沧县','13','河北省','1309','沧州市','130921','沧县','','','','',3,1,''),('130922','1309','00,13,1309','青县','13','河北省','1309','沧州市','130922','青县','','','','',3,1,''),('130923','1309','00,13,1309','东光县','13','河北省','1309','沧州市','130923','东光县','','','','',3,1,''),('130924','1309','00,13,1309','海兴县','13','河北省','1309','沧州市','130924','海兴县','','','','',3,1,''),('130925','1309','00,13,1309','盐山县','13','河北省','1309','沧州市','130925','盐山县','','','','',3,1,''),('130926','1309','00,13,1309','肃宁县','13','河北省','1309','沧州市','130926','肃宁县','','','','',3,1,''),('130927','1309','00,13,1309','南皮县','13','河北省','1309','沧州市','130927','南皮县','','','','',3,1,''),('130928','1309','00,13,1309','吴桥县','13','河北省','1309','沧州市','130928','吴桥县','','','','',3,1,''),('130929','1309','00,13,1309','献县','13','河北省','1309','沧州市','130929','献县','','','','',3,1,''),('130930','1309','00,13,1309','孟村回族自治县','13','河北省','1309','沧州市','130930','孟村回族自治县','','','','',3,1,''),('130981','1309','00,13,1309','泊头市','13','河北省','1309','沧州市','130981','泊头市','','','','',3,1,''),('130982','1309','00,13,1309','任丘市','13','河北省','1309','沧州市','130982','任丘市','','','','',3,1,''),('130983','1309','00,13,1309','黄骅市','13','河北省','1309','沧州市','130983','黄骅市','','','','',3,1,''),('130984','1309','00,13,1309','河间市','13','河北省','1309','沧州市','130984','河间市','','','','',3,1,''),('1310','13','00,13','廊坊市','13','河北省','1310','廊坊市','','','','','','',2,1,''),('131002','1310','00,13,1310','安次区','13','河北省','1310','廊坊市','131002','安次区','','','','',3,1,''),('131003','1310','00,13,1310','广阳区','13','河北省','1310','廊坊市','131003','广阳区','','','','',3,1,''),('131022','1310','00,13,1310','固安县','13','河北省','1310','廊坊市','131022','固安县','','','','',3,1,''),('131023','1310','00,13,1310','永清县','13','河北省','1310','廊坊市','131023','永清县','','','','',3,1,''),('131024','1310','00,13,1310','香河县','13','河北省','1310','廊坊市','131024','香河县','','','','',3,1,''),('131025','1310','00,13,1310','大城县','13','河北省','1310','廊坊市','131025','大城县','','','','',3,1,''),('131026','1310','00,13,1310','文安县','13','河北省','1310','廊坊市','131026','文安县','','','','',3,1,''),('131028','1310','00,13,1310','大厂回族自治县','13','河北省','1310','廊坊市','131028','大厂回族自治县','','','','',3,1,''),('131081','1310','00,13,1310','霸州市','13','河北省','1310','廊坊市','131081','霸州市','','','','',3,1,''),('131082','1310','00,13,1310','三河市','13','河北省','1310','廊坊市','131082','三河市','','','','',3,1,''),('1311','13','00,13','衡水市','13','河北省','1311','衡水市','','','','','','',2,1,''),('131102','1311','00,13,1311','桃城区','13','河北省','1311','衡水市','131102','桃城区','','','','',3,1,''),('131103','1311','00,13,1311','冀州区','13','河北省','1311','衡水市','131103','冀州区','','','','',3,1,''),('131121','1311','00,13,1311','枣强县','13','河北省','1311','衡水市','131121','枣强县','','','','',3,1,''),('131122','1311','00,13,1311','武邑县','13','河北省','1311','衡水市','131122','武邑县','','','','',3,1,''),('131123','1311','00,13,1311','武强县','13','河北省','1311','衡水市','131123','武强县','','','','',3,1,''),('131124','1311','00,13,1311','饶阳县','13','河北省','1311','衡水市','131124','饶阳县','','','','',3,1,''),('131125','1311','00,13,1311','安平县','13','河北省','1311','衡水市','131125','安平县','','','','',3,1,''),('131126','1311','00,13,1311','故城县','13','河北省','1311','衡水市','131126','故城县','','','','',3,1,''),('131127','1311','00,13,1311','景县','13','河北省','1311','衡水市','131127','景县','','','','',3,1,''),('131128','1311','00,13,1311','阜城县','13','河北省','1311','衡水市','131128','阜城县','','','','',3,1,''),('131182','1311','00,13,1311','深州市','13','河北省','1311','衡水市','131182','深州市','','','','',3,1,''),('14','00','00','山西省','14','山西省','','','','','','','','',1,1,''),('1401','14','00,14','太原市','14','山西省','1401','太原市','','','','','','',2,1,''),('140105','1401','00,14,1401','小店区','14','山西省','1401','太原市','140105','小店区','','','','',3,1,''),('140106','1401','00,14,1401','迎泽区','14','山西省','1401','太原市','140106','迎泽区','','','','',3,1,''),('140107','1401','00,14,1401','杏花岭区','14','山西省','1401','太原市','140107','杏花岭区','','','','',3,1,''),('140108','1401','00,14,1401','尖草坪区','14','山西省','1401','太原市','140108','尖草坪区','','','','',3,1,''),('140109','1401','00,14,1401','万柏林区','14','山西省','1401','太原市','140109','万柏林区','','','','',3,1,''),('140110','1401','00,14,1401','晋源区','14','山西省','1401','太原市','140110','晋源区','','','','',3,1,''),('140121','1401','00,14,1401','清徐县','14','山西省','1401','太原市','140121','清徐县','','','','',3,1,''),('140122','1401','00,14,1401','阳曲县','14','山西省','1401','太原市','140122','阳曲县','','','','',3,1,''),('140123','1401','00,14,1401','娄烦县','14','山西省','1401','太原市','140123','娄烦县','','','','',3,1,''),('140181','1401','00,14,1401','古交市','14','山西省','1401','太原市','140181','古交市','','','','',3,1,''),('1402','14','00,14','大同市','14','山西省','1402','大同市','','','','','','',2,1,''),('140212','1402','00,14,1402','新荣区','14','山西省','1402','大同市','140212','新荣区','','','','',3,1,''),('140213','1402','00,14,1402','平城区','14','山西省','1402','大同市','140213','平城区','','','','',3,1,''),('140214','1402','00,14,1402','云冈区','14','山西省','1402','大同市','140214','云冈区','','','','',3,1,''),('140215','1402','00,14,1402','云州区','14','山西省','1402','大同市','140215','云州区','','','','',3,1,''),('140221','1402','00,14,1402','阳高县','14','山西省','1402','大同市','140221','阳高县','','','','',3,1,''),('140222','1402','00,14,1402','天镇县','14','山西省','1402','大同市','140222','天镇县','','','','',3,1,''),('140223','1402','00,14,1402','广灵县','14','山西省','1402','大同市','140223','广灵县','','','','',3,1,''),('140224','1402','00,14,1402','灵丘县','14','山西省','1402','大同市','140224','灵丘县','','','','',3,1,''),('140225','1402','00,14,1402','浑源县','14','山西省','1402','大同市','140225','浑源县','','','','',3,1,''),('140226','1402','00,14,1402','左云县','14','山西省','1402','大同市','140226','左云县','','','','',3,1,''),('1403','14','00,14','阳泉市','14','山西省','1403','阳泉市','','','','','','',2,1,''),('140302','1403','00,14,1403','城区','14','山西省','1403','阳泉市','140302','城区','','','','',3,1,''),('140303','1403','00,14,1403','矿区','14','山西省','1403','阳泉市','140303','矿区','','','','',3,1,''),('140311','1403','00,14,1403','郊区','14','山西省','1403','阳泉市','140311','郊区','','','','',3,1,''),('140321','1403','00,14,1403','平定县','14','山西省','1403','阳泉市','140321','平定县','','','','',3,1,''),('140322','1403','00,14,1403','盂县','14','山西省','1403','阳泉市','140322','盂县','','','','',3,1,''),('1404','14','00,14','长治市','14','山西省','1404','长治市','','','','','','',2,1,''),('140403','1404','00,14,1404','潞州区','14','山西省','1404','长治市','140403','潞州区','','','','',3,1,''),('140404','1404','00,14,1404','上党区','14','山西省','1404','长治市','140404','上党区','','','','',3,1,''),('140405','1404','00,14,1404','屯留区','14','山西省','1404','长治市','140405','屯留区','','','','',3,1,''),('140406','1404','00,14,1404','潞城区','14','山西省','1404','长治市','140406','潞城区','','','','',3,1,''),('140423','1404','00,14,1404','襄垣县','14','山西省','1404','长治市','140423','襄垣县','','','','',3,1,''),('140425','1404','00,14,1404','平顺县','14','山西省','1404','长治市','140425','平顺县','','','','',3,1,''),('140426','1404','00,14,1404','黎城县','14','山西省','1404','长治市','140426','黎城县','','','','',3,1,''),('140427','1404','00,14,1404','壶关县','14','山西省','1404','长治市','140427','壶关县','','','','',3,1,''),('140428','1404','00,14,1404','长子县','14','山西省','1404','长治市','140428','长子县','','','','',3,1,''),('140429','1404','00,14,1404','武乡县','14','山西省','1404','长治市','140429','武乡县','','','','',3,1,''),('140430','1404','00,14,1404','沁县','14','山西省','1404','长治市','140430','沁县','','','','',3,1,''),('140431','1404','00,14,1404','沁源县','14','山西省','1404','长治市','140431','沁源县','','','','',3,1,''),('1405','14','00,14','晋城市','14','山西省','1405','晋城市','','','','','','',2,1,''),('140502','1405','00,14,1405','城区','14','山西省','1405','晋城市','140502','城区','','','','',3,1,''),('140521','1405','00,14,1405','沁水县','14','山西省','1405','晋城市','140521','沁水县','','','','',3,1,''),('140522','1405','00,14,1405','阳城县','14','山西省','1405','晋城市','140522','阳城县','','','','',3,1,''),('140524','1405','00,14,1405','陵川县','14','山西省','1405','晋城市','140524','陵川县','','','','',3,1,''),('140525','1405','00,14,1405','泽州县','14','山西省','1405','晋城市','140525','泽州县','','','','',3,1,''),('140581','1405','00,14,1405','高平市','14','山西省','1405','晋城市','140581','高平市','','','','',3,1,''),('1406','14','00,14','朔州市','14','山西省','1406','朔州市','','','','','','',2,1,''),('140602','1406','00,14,1406','朔城区','14','山西省','1406','朔州市','140602','朔城区','','','','',3,1,''),('140603','1406','00,14,1406','平鲁区','14','山西省','1406','朔州市','140603','平鲁区','','','','',3,1,''),('140621','1406','00,14,1406','山阴县','14','山西省','1406','朔州市','140621','山阴县','','','','',3,1,''),('140622','1406','00,14,1406','应县','14','山西省','1406','朔州市','140622','应县','','','','',3,1,''),('140623','1406','00,14,1406','右玉县','14','山西省','1406','朔州市','140623','右玉县','','','','',3,1,''),('140681','1406','00,14,1406','怀仁市','14','山西省','1406','朔州市','140681','怀仁市','','','','',3,1,''),('1407','14','00,14','晋中市','14','山西省','1407','晋中市','','','','','','',2,1,''),('140702','1407','00,14,1407','榆次区','14','山西省','1407','晋中市','140702','榆次区','','','','',3,1,''),('140703','1407','00,14,1407','太谷区','14','山西省','1407','晋中市','140703','太谷区','','','','',3,1,''),('140721','1407','00,14,1407','榆社县','14','山西省','1407','晋中市','140721','榆社县','','','','',3,1,''),('140722','1407','00,14,1407','左权县','14','山西省','1407','晋中市','140722','左权县','','','','',3,1,''),('140723','1407','00,14,1407','和顺县','14','山西省','1407','晋中市','140723','和顺县','','','','',3,1,''),('140724','1407','00,14,1407','昔阳县','14','山西省','1407','晋中市','140724','昔阳县','','','','',3,1,''),('140725','1407','00,14,1407','寿阳县','14','山西省','1407','晋中市','140725','寿阳县','','','','',3,1,''),('140727','1407','00,14,1407','祁县','14','山西省','1407','晋中市','140727','祁县','','','','',3,1,''),('140728','1407','00,14,1407','平遥县','14','山西省','1407','晋中市','140728','平遥县','','','','',3,1,''),('140729','1407','00,14,1407','灵石县','14','山西省','1407','晋中市','140729','灵石县','','','','',3,1,''),('140781','1407','00,14,1407','介休市','14','山西省','1407','晋中市','140781','介休市','','','','',3,1,''),('1408','14','00,14','运城市','14','山西省','1408','运城市','','','','','','',2,1,''),('140802','1408','00,14,1408','盐湖区','14','山西省','1408','运城市','140802','盐湖区','','','','',3,1,''),('140821','1408','00,14,1408','临猗县','14','山西省','1408','运城市','140821','临猗县','','','','',3,1,''),('140822','1408','00,14,1408','万荣县','14','山西省','1408','运城市','140822','万荣县','','','','',3,1,''),('140823','1408','00,14,1408','闻喜县','14','山西省','1408','运城市','140823','闻喜县','','','','',3,1,''),('140824','1408','00,14,1408','稷山县','14','山西省','1408','运城市','140824','稷山县','','','','',3,1,''),('140825','1408','00,14,1408','新绛县','14','山西省','1408','运城市','140825','新绛县','','','','',3,1,''),('140826','1408','00,14,1408','绛县','14','山西省','1408','运城市','140826','绛县','','','','',3,1,''),('140827','1408','00,14,1408','垣曲县','14','山西省','1408','运城市','140827','垣曲县','','','','',3,1,''),('140828','1408','00,14,1408','夏县','14','山西省','1408','运城市','140828','夏县','','','','',3,1,''),('140829','1408','00,14,1408','平陆县','14','山西省','1408','运城市','140829','平陆县','','','','',3,1,''),('140830','1408','00,14,1408','芮城县','14','山西省','1408','运城市','140830','芮城县','','','','',3,1,''),('140881','1408','00,14,1408','永济市','14','山西省','1408','运城市','140881','永济市','','','','',3,1,''),('140882','1408','00,14,1408','河津市','14','山西省','1408','运城市','140882','河津市','','','','',3,1,''),('1409','14','00,14','忻州市','14','山西省','1409','忻州市','','','','','','',2,1,''),('140902','1409','00,14,1409','忻府区','14','山西省','1409','忻州市','140902','忻府区','','','','',3,1,''),('140921','1409','00,14,1409','定襄县','14','山西省','1409','忻州市','140921','定襄县','','','','',3,1,''),('140922','1409','00,14,1409','五台县','14','山西省','1409','忻州市','140922','五台县','','','','',3,1,''),('140923','1409','00,14,1409','代县','14','山西省','1409','忻州市','140923','代县','','','','',3,1,''),('140924','1409','00,14,1409','繁峙县','14','山西省','1409','忻州市','140924','繁峙县','','','','',3,1,''),('140925','1409','00,14,1409','宁武县','14','山西省','1409','忻州市','140925','宁武县','','','','',3,1,''),('140926','1409','00,14,1409','静乐县','14','山西省','1409','忻州市','140926','静乐县','','','','',3,1,''),('140927','1409','00,14,1409','神池县','14','山西省','1409','忻州市','140927','神池县','','','','',3,1,''),('140928','1409','00,14,1409','五寨县','14','山西省','1409','忻州市','140928','五寨县','','','','',3,1,''),('140929','1409','00,14,1409','岢岚县','14','山西省','1409','忻州市','140929','岢岚县','','','','',3,1,''),('140930','1409','00,14,1409','河曲县','14','山西省','1409','忻州市','140930','河曲县','','','','',3,1,''),('140931','1409','00,14,1409','保德县','14','山西省','1409','忻州市','140931','保德县','','','','',3,1,''),('140932','1409','00,14,1409','偏关县','14','山西省','1409','忻州市','140932','偏关县','','','','',3,1,''),('140981','1409','00,14,1409','原平市','14','山西省','1409','忻州市','140981','原平市','','','','',3,1,''),('1410','14','00,14','临汾市','14','山西省','1410','临汾市','','','','','','',2,1,''),('141002','1410','00,14,1410','尧都区','14','山西省','1410','临汾市','141002','尧都区','','','','',3,1,''),('141021','1410','00,14,1410','曲沃县','14','山西省','1410','临汾市','141021','曲沃县','','','','',3,1,''),('141022','1410','00,14,1410','翼城县','14','山西省','1410','临汾市','141022','翼城县','','','','',3,1,''),('141023','1410','00,14,1410','襄汾县','14','山西省','1410','临汾市','141023','襄汾县','','','','',3,1,''),('141024','1410','00,14,1410','洪洞县','14','山西省','1410','临汾市','141024','洪洞县','','','','',3,1,''),('141025','1410','00,14,1410','古县','14','山西省','1410','临汾市','141025','古县','','','','',3,1,''),('141026','1410','00,14,1410','安泽县','14','山西省','1410','临汾市','141026','安泽县','','','','',3,1,''),('141027','1410','00,14,1410','浮山县','14','山西省','1410','临汾市','141027','浮山县','','','','',3,1,''),('141028','1410','00,14,1410','吉县','14','山西省','1410','临汾市','141028','吉县','','','','',3,1,''),('141029','1410','00,14,1410','乡宁县','14','山西省','1410','临汾市','141029','乡宁县','','','','',3,1,''),('141030','1410','00,14,1410','大宁县','14','山西省','1410','临汾市','141030','大宁县','','','','',3,1,''),('141031','1410','00,14,1410','隰县','14','山西省','1410','临汾市','141031','隰县','','','','',3,1,''),('141032','1410','00,14,1410','永和县','14','山西省','1410','临汾市','141032','永和县','','','','',3,1,''),('141033','1410','00,14,1410','蒲县','14','山西省','1410','临汾市','141033','蒲县','','','','',3,1,''),('141034','1410','00,14,1410','汾西县','14','山西省','1410','临汾市','141034','汾西县','','','','',3,1,''),('141081','1410','00,14,1410','侯马市','14','山西省','1410','临汾市','141081','侯马市','','','','',3,1,''),('141082','1410','00,14,1410','霍州市','14','山西省','1410','临汾市','141082','霍州市','','','','',3,1,''),('1411','14','00,14','吕梁市','14','山西省','1411','吕梁市','','','','','','',2,1,''),('141102','1411','00,14,1411','离石区','14','山西省','1411','吕梁市','141102','离石区','','','','',3,1,''),('141121','1411','00,14,1411','文水县','14','山西省','1411','吕梁市','141121','文水县','','','','',3,1,''),('141122','1411','00,14,1411','交城县','14','山西省','1411','吕梁市','141122','交城县','','','','',3,1,''),('141123','1411','00,14,1411','兴县','14','山西省','1411','吕梁市','141123','兴县','','','','',3,1,''),('141124','1411','00,14,1411','临县','14','山西省','1411','吕梁市','141124','临县','','','','',3,1,''),('141125','1411','00,14,1411','柳林县','14','山西省','1411','吕梁市','141125','柳林县','','','','',3,1,''),('141126','1411','00,14,1411','石楼县','14','山西省','1411','吕梁市','141126','石楼县','','','','',3,1,''),('141127','1411','00,14,1411','岚县','14','山西省','1411','吕梁市','141127','岚县','','','','',3,1,''),('141128','1411','00,14,1411','方山县','14','山西省','1411','吕梁市','141128','方山县','','','','',3,1,''),('141129','1411','00,14,1411','中阳县','14','山西省','1411','吕梁市','141129','中阳县','','','','',3,1,''),('141130','1411','00,14,1411','交口县','14','山西省','1411','吕梁市','141130','交口县','','','','',3,1,''),('141181','1411','00,14,1411','孝义市','14','山西省','1411','吕梁市','141181','孝义市','','','','',3,1,''),('141182','1411','00,14,1411','汾阳市','14','山西省','1411','吕梁市','141182','汾阳市','','','','',3,1,''),('15','00','00','内蒙古自治区','15','内蒙古自治区','','','','','','','','',1,1,''),('1501','15','00,15','呼和浩特市','15','内蒙古自治区','1501','呼和浩特市','','','','','','',2,1,''),('150102','1501','00,15,1501','新城区','15','内蒙古自治区','1501','呼和浩特市','150102','新城区','','','','',3,1,''),('150103','1501','00,15,1501','回民区','15','内蒙古自治区','1501','呼和浩特市','150103','回民区','','','','',3,1,''),('150104','1501','00,15,1501','玉泉区','15','内蒙古自治区','1501','呼和浩特市','150104','玉泉区','','','','',3,1,''),('150105','1501','00,15,1501','赛罕区','15','内蒙古自治区','1501','呼和浩特市','150105','赛罕区','','','','',3,1,''),('150121','1501','00,15,1501','土默特左旗','15','内蒙古自治区','1501','呼和浩特市','150121','土默特左旗','','','','',3,1,''),('150122','1501','00,15,1501','托克托县','15','内蒙古自治区','1501','呼和浩特市','150122','托克托县','','','','',3,1,''),('150123','1501','00,15,1501','和林格尔县','15','内蒙古自治区','1501','呼和浩特市','150123','和林格尔县','','','','',3,1,''),('150124','1501','00,15,1501','清水河县','15','内蒙古自治区','1501','呼和浩特市','150124','清水河县','','','','',3,1,''),('150125','1501','00,15,1501','武川县','15','内蒙古自治区','1501','呼和浩特市','150125','武川县','','','','',3,1,''),('1502','15','00,15','包头市','15','内蒙古自治区','1502','包头市','','','','','','',2,1,''),('150202','1502','00,15,1502','东河区','15','内蒙古自治区','1502','包头市','150202','东河区','','','','',3,1,''),('150203','1502','00,15,1502','昆都仑区','15','内蒙古自治区','1502','包头市','150203','昆都仑区','','','','',3,1,''),('150204','1502','00,15,1502','青山区','15','内蒙古自治区','1502','包头市','150204','青山区','','','','',3,1,''),('150205','1502','00,15,1502','石拐区','15','内蒙古自治区','1502','包头市','150205','石拐区','','','','',3,1,''),('150206','1502','00,15,1502','白云鄂博矿区','15','内蒙古自治区','1502','包头市','150206','白云鄂博矿区','','','','',3,1,''),('150207','1502','00,15,1502','九原区','15','内蒙古自治区','1502','包头市','150207','九原区','','','','',3,1,''),('150221','1502','00,15,1502','土默特右旗','15','内蒙古自治区','1502','包头市','150221','土默特右旗','','','','',3,1,''),('150222','1502','00,15,1502','固阳县','15','内蒙古自治区','1502','包头市','150222','固阳县','','','','',3,1,''),('150223','1502','00,15,1502','达尔罕茂明安联合旗','15','内蒙古自治区','1502','包头市','150223','达尔罕茂明安联合旗','','','','',3,1,''),('1503','15','00,15','乌海市','15','内蒙古自治区','1503','乌海市','','','','','','',2,1,''),('150302','1503','00,15,1503','海勃湾区','15','内蒙古自治区','1503','乌海市','150302','海勃湾区','','','','',3,1,''),('150303','1503','00,15,1503','海南区','15','内蒙古自治区','1503','乌海市','150303','海南区','','','','',3,1,''),('150304','1503','00,15,1503','乌达区','15','内蒙古自治区','1503','乌海市','150304','乌达区','','','','',3,1,''),('1504','15','00,15','赤峰市','15','内蒙古自治区','1504','赤峰市','','','','','','',2,1,''),('150402','1504','00,15,1504','红山区','15','内蒙古自治区','1504','赤峰市','150402','红山区','','','','',3,1,''),('150403','1504','00,15,1504','元宝山区','15','内蒙古自治区','1504','赤峰市','150403','元宝山区','','','','',3,1,''),('150404','1504','00,15,1504','松山区','15','内蒙古自治区','1504','赤峰市','150404','松山区','','','','',3,1,''),('150421','1504','00,15,1504','阿鲁科尔沁旗','15','内蒙古自治区','1504','赤峰市','150421','阿鲁科尔沁旗','','','','',3,1,''),('150422','1504','00,15,1504','巴林左旗','15','内蒙古自治区','1504','赤峰市','150422','巴林左旗','','','','',3,1,''),('150423','1504','00,15,1504','巴林右旗','15','内蒙古自治区','1504','赤峰市','150423','巴林右旗','','','','',3,1,''),('150424','1504','00,15,1504','林西县','15','内蒙古自治区','1504','赤峰市','150424','林西县','','','','',3,1,''),('150425','1504','00,15,1504','克什克腾旗','15','内蒙古自治区','1504','赤峰市','150425','克什克腾旗','','','','',3,1,''),('150426','1504','00,15,1504','翁牛特旗','15','内蒙古自治区','1504','赤峰市','150426','翁牛特旗','','','','',3,1,''),('150428','1504','00,15,1504','喀喇沁旗','15','内蒙古自治区','1504','赤峰市','150428','喀喇沁旗','','','','',3,1,''),('150429','1504','00,15,1504','宁城县','15','内蒙古自治区','1504','赤峰市','150429','宁城县','','','','',3,1,''),('150430','1504','00,15,1504','敖汉旗','15','内蒙古自治区','1504','赤峰市','150430','敖汉旗','','','','',3,1,''),('1505','15','00,15','通辽市','15','内蒙古自治区','1505','通辽市','','','','','','',2,1,''),('150502','1505','00,15,1505','科尔沁区','15','内蒙古自治区','1505','通辽市','150502','科尔沁区','','','','',3,1,''),('150521','1505','00,15,1505','科尔沁左翼中旗','15','内蒙古自治区','1505','通辽市','150521','科尔沁左翼中旗','','','','',3,1,''),('150522','1505','00,15,1505','科尔沁左翼后旗','15','内蒙古自治区','1505','通辽市','150522','科尔沁左翼后旗','','','','',3,1,''),('150523','1505','00,15,1505','开鲁县','15','内蒙古自治区','1505','通辽市','150523','开鲁县','','','','',3,1,''),('150524','1505','00,15,1505','库伦旗','15','内蒙古自治区','1505','通辽市','150524','库伦旗','','','','',3,1,''),('150525','1505','00,15,1505','奈曼旗','15','内蒙古自治区','1505','通辽市','150525','奈曼旗','','','','',3,1,''),('150526','1505','00,15,1505','扎鲁特旗','15','内蒙古自治区','1505','通辽市','150526','扎鲁特旗','','','','',3,1,''),('150581','1505','00,15,1505','霍林郭勒市','15','内蒙古自治区','1505','通辽市','150581','霍林郭勒市','','','','',3,1,''),('1506','15','00,15','鄂尔多斯市','15','内蒙古自治区','1506','鄂尔多斯市','','','','','','',2,1,''),('150602','1506','00,15,1506','东胜区','15','内蒙古自治区','1506','鄂尔多斯市','150602','东胜区','','','','',3,1,''),('150603','1506','00,15,1506','康巴什区','15','内蒙古自治区','1506','鄂尔多斯市','150603','康巴什区','','','','',3,1,''),('150621','1506','00,15,1506','达拉特旗','15','内蒙古自治区','1506','鄂尔多斯市','150621','达拉特旗','','','','',3,1,''),('150622','1506','00,15,1506','准格尔旗','15','内蒙古自治区','1506','鄂尔多斯市','150622','准格尔旗','','','','',3,1,''),('150623','1506','00,15,1506','鄂托克前旗','15','内蒙古自治区','1506','鄂尔多斯市','150623','鄂托克前旗','','','','',3,1,''),('150624','1506','00,15,1506','鄂托克旗','15','内蒙古自治区','1506','鄂尔多斯市','150624','鄂托克旗','','','','',3,1,''),('150625','1506','00,15,1506','杭锦旗','15','内蒙古自治区','1506','鄂尔多斯市','150625','杭锦旗','','','','',3,1,''),('150626','1506','00,15,1506','乌审旗','15','内蒙古自治区','1506','鄂尔多斯市','150626','乌审旗','','','','',3,1,''),('150627','1506','00,15,1506','伊金霍洛旗','15','内蒙古自治区','1506','鄂尔多斯市','150627','伊金霍洛旗','','','','',3,1,''),('1507','15','00,15','呼伦贝尔市','15','内蒙古自治区','1507','呼伦贝尔市','','','','','','',2,1,''),('150702','1507','00,15,1507','海拉尔区','15','内蒙古自治区','1507','呼伦贝尔市','150702','海拉尔区','','','','',3,1,''),('150703','1507','00,15,1507','扎赉诺尔区','15','内蒙古自治区','1507','呼伦贝尔市','150703','扎赉诺尔区','','','','',3,1,''),('150721','1507','00,15,1507','阿荣旗','15','内蒙古自治区','1507','呼伦贝尔市','150721','阿荣旗','','','','',3,1,''),('150722','1507','00,15,1507','莫力达瓦达斡尔族自治旗','15','内蒙古自治区','1507','呼伦贝尔市','150722','莫力达瓦达斡尔族自治旗','','','','',3,1,''),('150723','1507','00,15,1507','鄂伦春自治旗','15','内蒙古自治区','1507','呼伦贝尔市','150723','鄂伦春自治旗','','','','',3,1,''),('150724','1507','00,15,1507','鄂温克族自治旗','15','内蒙古自治区','1507','呼伦贝尔市','150724','鄂温克族自治旗','','','','',3,1,''),('150725','1507','00,15,1507','陈巴尔虎旗','15','内蒙古自治区','1507','呼伦贝尔市','150725','陈巴尔虎旗','','','','',3,1,''),('150726','1507','00,15,1507','新巴尔虎左旗','15','内蒙古自治区','1507','呼伦贝尔市','150726','新巴尔虎左旗','','','','',3,1,''),('150727','1507','00,15,1507','新巴尔虎右旗','15','内蒙古自治区','1507','呼伦贝尔市','150727','新巴尔虎右旗','','','','',3,1,''),('150781','1507','00,15,1507','满洲里市','15','内蒙古自治区','1507','呼伦贝尔市','150781','满洲里市','','','','',3,1,''),('150782','1507','00,15,1507','牙克石市','15','内蒙古自治区','1507','呼伦贝尔市','150782','牙克石市','','','','',3,1,''),('150783','1507','00,15,1507','扎兰屯市','15','内蒙古自治区','1507','呼伦贝尔市','150783','扎兰屯市','','','','',3,1,''),('150784','1507','00,15,1507','额尔古纳市','15','内蒙古自治区','1507','呼伦贝尔市','150784','额尔古纳市','','','','',3,1,''),('150785','1507','00,15,1507','根河市','15','内蒙古自治区','1507','呼伦贝尔市','150785','根河市','','','','',3,1,''),('1508','15','00,15','巴彦淖尔市','15','内蒙古自治区','1508','巴彦淖尔市','','','','','','',2,1,''),('150802','1508','00,15,1508','临河区','15','内蒙古自治区','1508','巴彦淖尔市','150802','临河区','','','','',3,1,''),('150821','1508','00,15,1508','五原县','15','内蒙古自治区','1508','巴彦淖尔市','150821','五原县','','','','',3,1,''),('150822','1508','00,15,1508','磴口县','15','内蒙古自治区','1508','巴彦淖尔市','150822','磴口县','','','','',3,1,''),('150823','1508','00,15,1508','乌拉特前旗','15','内蒙古自治区','1508','巴彦淖尔市','150823','乌拉特前旗','','','','',3,1,''),('150824','1508','00,15,1508','乌拉特中旗','15','内蒙古自治区','1508','巴彦淖尔市','150824','乌拉特中旗','','','','',3,1,''),('150825','1508','00,15,1508','乌拉特后旗','15','内蒙古自治区','1508','巴彦淖尔市','150825','乌拉特后旗','','','','',3,1,''),('150826','1508','00,15,1508','杭锦后旗','15','内蒙古自治区','1508','巴彦淖尔市','150826','杭锦后旗','','','','',3,1,''),('1509','15','00,15','乌兰察布市','15','内蒙古自治区','1509','乌兰察布市','','','','','','',2,1,''),('150902','1509','00,15,1509','集宁区','15','内蒙古自治区','1509','乌兰察布市','150902','集宁区','','','','',3,1,''),('150921','1509','00,15,1509','卓资县','15','内蒙古自治区','1509','乌兰察布市','150921','卓资县','','','','',3,1,''),('150922','1509','00,15,1509','化德县','15','内蒙古自治区','1509','乌兰察布市','150922','化德县','','','','',3,1,''),('150923','1509','00,15,1509','商都县','15','内蒙古自治区','1509','乌兰察布市','150923','商都县','','','','',3,1,''),('150924','1509','00,15,1509','兴和县','15','内蒙古自治区','1509','乌兰察布市','150924','兴和县','','','','',3,1,''),('150925','1509','00,15,1509','凉城县','15','内蒙古自治区','1509','乌兰察布市','150925','凉城县','','','','',3,1,''),('150926','1509','00,15,1509','察哈尔右翼前旗','15','内蒙古自治区','1509','乌兰察布市','150926','察哈尔右翼前旗','','','','',3,1,''),('150927','1509','00,15,1509','察哈尔右翼中旗','15','内蒙古自治区','1509','乌兰察布市','150927','察哈尔右翼中旗','','','','',3,1,''),('150928','1509','00,15,1509','察哈尔右翼后旗','15','内蒙古自治区','1509','乌兰察布市','150928','察哈尔右翼后旗','','','','',3,1,''),('150929','1509','00,15,1509','四子王旗','15','内蒙古自治区','1509','乌兰察布市','150929','四子王旗','','','','',3,1,''),('150981','1509','00,15,1509','丰镇市','15','内蒙古自治区','1509','乌兰察布市','150981','丰镇市','','','','',3,1,''),('1522','15','00,15','兴安盟','15','内蒙古自治区','1522','兴安盟','','','','','','',2,1,''),('152201','1522','00,15,1522','乌兰浩特市','15','内蒙古自治区','1522','兴安盟','152201','乌兰浩特市','','','','',3,1,''),('152202','1522','00,15,1522','阿尔山市','15','内蒙古自治区','1522','兴安盟','152202','阿尔山市','','','','',3,1,''),('152221','1522','00,15,1522','科尔沁右翼前旗','15','内蒙古自治区','1522','兴安盟','152221','科尔沁右翼前旗','','','','',3,1,''),('152222','1522','00,15,1522','科尔沁右翼中旗','15','内蒙古自治区','1522','兴安盟','152222','科尔沁右翼中旗','','','','',3,1,''),('152223','1522','00,15,1522','扎赉特旗','15','内蒙古自治区','1522','兴安盟','152223','扎赉特旗','','','','',3,1,''),('152224','1522','00,15,1522','突泉县','15','内蒙古自治区','1522','兴安盟','152224','突泉县','','','','',3,1,''),('1525','15','00,15','锡林郭勒盟','15','内蒙古自治区','1525','锡林郭勒盟','','','','','','',2,1,''),('152501','1525','00,15,1525','二连浩特市','15','内蒙古自治区','1525','锡林郭勒盟','152501','二连浩特市','','','','',3,1,''),('152502','1525','00,15,1525','锡林浩特市','15','内蒙古自治区','1525','锡林郭勒盟','152502','锡林浩特市','','','','',3,1,''),('152522','1525','00,15,1525','阿巴嘎旗','15','内蒙古自治区','1525','锡林郭勒盟','152522','阿巴嘎旗','','','','',3,1,''),('152523','1525','00,15,1525','苏尼特左旗','15','内蒙古自治区','1525','锡林郭勒盟','152523','苏尼特左旗','','','','',3,1,''),('152524','1525','00,15,1525','苏尼特右旗','15','内蒙古自治区','1525','锡林郭勒盟','152524','苏尼特右旗','','','','',3,1,''),('152525','1525','00,15,1525','东乌珠穆沁旗','15','内蒙古自治区','1525','锡林郭勒盟','152525','东乌珠穆沁旗','','','','',3,1,''),('152526','1525','00,15,1525','西乌珠穆沁旗','15','内蒙古自治区','1525','锡林郭勒盟','152526','西乌珠穆沁旗','','','','',3,1,''),('152527','1525','00,15,1525','太仆寺旗','15','内蒙古自治区','1525','锡林郭勒盟','152527','太仆寺旗','','','','',3,1,''),('152528','1525','00,15,1525','镶黄旗','15','内蒙古自治区','1525','锡林郭勒盟','152528','镶黄旗','','','','',3,1,''),('152529','1525','00,15,1525','正镶白旗','15','内蒙古自治区','1525','锡林郭勒盟','152529','正镶白旗','','','','',3,1,''),('152530','1525','00,15,1525','正蓝旗','15','内蒙古自治区','1525','锡林郭勒盟','152530','正蓝旗','','','','',3,1,''),('152531','1525','00,15,1525','多伦县','15','内蒙古自治区','1525','锡林郭勒盟','152531','多伦县','','','','',3,1,''),('1529','15','00,15','阿拉善盟','15','内蒙古自治区','1529','阿拉善盟','','','','','','',2,1,''),('152921','1529','00,15,1529','阿拉善左旗','15','内蒙古自治区','1529','阿拉善盟','152921','阿拉善左旗','','','','',3,1,''),('152922','1529','00,15,1529','阿拉善右旗','15','内蒙古自治区','1529','阿拉善盟','152922','阿拉善右旗','','','','',3,1,''),('152923','1529','00,15,1529','额济纳旗','15','内蒙古自治区','1529','阿拉善盟','152923','额济纳旗','','','','',3,1,''),('21','00','00','辽宁省','21','辽宁省','','','','','','','','',1,1,''),('2101','21','00,21','沈阳市','21','辽宁省','2101','沈阳市','','','','','','',2,1,''),('210102','2101','00,21,2101','和平区','21','辽宁省','2101','沈阳市','210102','和平区','','','','',3,1,''),('210103','2101','00,21,2101','沈河区','21','辽宁省','2101','沈阳市','210103','沈河区','','','','',3,1,''),('210104','2101','00,21,2101','大东区','21','辽宁省','2101','沈阳市','210104','大东区','','','','',3,1,''),('210105','2101','00,21,2101','皇姑区','21','辽宁省','2101','沈阳市','210105','皇姑区','','','','',3,1,''),('210106','2101','00,21,2101','铁西区','21','辽宁省','2101','沈阳市','210106','铁西区','','','','',3,1,''),('210111','2101','00,21,2101','苏家屯区','21','辽宁省','2101','沈阳市','210111','苏家屯区','','','','',3,1,''),('210112','2101','00,21,2101','浑南区','21','辽宁省','2101','沈阳市','210112','浑南区','','','','',3,1,''),('210113','2101','00,21,2101','沈北新区','21','辽宁省','2101','沈阳市','210113','沈北新区','','','','',3,1,''),('210114','2101','00,21,2101','于洪区','21','辽宁省','2101','沈阳市','210114','于洪区','','','','',3,1,''),('210115','2101','00,21,2101','辽中区','21','辽宁省','2101','沈阳市','210115','辽中区','','','','',3,1,''),('210123','2101','00,21,2101','康平县','21','辽宁省','2101','沈阳市','210123','康平县','','','','',3,1,''),('210124','2101','00,21,2101','法库县','21','辽宁省','2101','沈阳市','210124','法库县','','','','',3,1,''),('210181','2101','00,21,2101','新民市','21','辽宁省','2101','沈阳市','210181','新民市','','','','',3,1,''),('2102','21','00,21','大连市','21','辽宁省','2102','大连市','','','','','','',2,1,''),('210202','2102','00,21,2102','中山区','21','辽宁省','2102','大连市','210202','中山区','','','','',3,1,''),('210203','2102','00,21,2102','西岗区','21','辽宁省','2102','大连市','210203','西岗区','','','','',3,1,''),('210204','2102','00,21,2102','沙河口区','21','辽宁省','2102','大连市','210204','沙河口区','','','','',3,1,''),('210211','2102','00,21,2102','甘井子区','21','辽宁省','2102','大连市','210211','甘井子区','','','','',3,1,''),('210212','2102','00,21,2102','旅顺口区','21','辽宁省','2102','大连市','210212','旅顺口区','','','','',3,1,''),('210213','2102','00,21,2102','金州区','21','辽宁省','2102','大连市','210213','金州区','','','','',3,1,''),('210214','2102','00,21,2102','普兰店区','21','辽宁省','2102','大连市','210214','普兰店区','','','','',3,1,''),('210224','2102','00,21,2102','长海县','21','辽宁省','2102','大连市','210224','长海县','','','','',3,1,''),('210281','2102','00,21,2102','瓦房店市','21','辽宁省','2102','大连市','210281','瓦房店市','','','','',3,1,''),('210283','2102','00,21,2102','庄河市','21','辽宁省','2102','大连市','210283','庄河市','','','','',3,1,''),('2103','21','00,21','鞍山市','21','辽宁省','2103','鞍山市','','','','','','',2,1,''),('210302','2103','00,21,2103','铁东区','21','辽宁省','2103','鞍山市','210302','铁东区','','','','',3,1,''),('210303','2103','00,21,2103','铁西区','21','辽宁省','2103','鞍山市','210303','铁西区','','','','',3,1,''),('210304','2103','00,21,2103','立山区','21','辽宁省','2103','鞍山市','210304','立山区','','','','',3,1,''),('210311','2103','00,21,2103','千山区','21','辽宁省','2103','鞍山市','210311','千山区','','','','',3,1,''),('210321','2103','00,21,2103','台安县','21','辽宁省','2103','鞍山市','210321','台安县','','','','',3,1,''),('210323','2103','00,21,2103','岫岩满族自治县','21','辽宁省','2103','鞍山市','210323','岫岩满族自治县','','','','',3,1,''),('210381','2103','00,21,2103','海城市','21','辽宁省','2103','鞍山市','210381','海城市','','','','',3,1,''),('2104','21','00,21','抚顺市','21','辽宁省','2104','抚顺市','','','','','','',2,1,''),('210402','2104','00,21,2104','新抚区','21','辽宁省','2104','抚顺市','210402','新抚区','','','','',3,1,''),('210403','2104','00,21,2104','东洲区','21','辽宁省','2104','抚顺市','210403','东洲区','','','','',3,1,''),('210404','2104','00,21,2104','望花区','21','辽宁省','2104','抚顺市','210404','望花区','','','','',3,1,''),('210411','2104','00,21,2104','顺城区','21','辽宁省','2104','抚顺市','210411','顺城区','','','','',3,1,''),('210421','2104','00,21,2104','抚顺县','21','辽宁省','2104','抚顺市','210421','抚顺县','','','','',3,1,''),('210422','2104','00,21,2104','新宾满族自治县','21','辽宁省','2104','抚顺市','210422','新宾满族自治县','','','','',3,1,''),('210423','2104','00,21,2104','清原满族自治县','21','辽宁省','2104','抚顺市','210423','清原满族自治县','','','','',3,1,''),('2105','21','00,21','本溪市','21','辽宁省','2105','本溪市','','','','','','',2,1,''),('210502','2105','00,21,2105','平山区','21','辽宁省','2105','本溪市','210502','平山区','','','','',3,1,''),('210503','2105','00,21,2105','溪湖区','21','辽宁省','2105','本溪市','210503','溪湖区','','','','',3,1,''),('210504','2105','00,21,2105','明山区','21','辽宁省','2105','本溪市','210504','明山区','','','','',3,1,''),('210505','2105','00,21,2105','南芬区','21','辽宁省','2105','本溪市','210505','南芬区','','','','',3,1,''),('210521','2105','00,21,2105','本溪满族自治县','21','辽宁省','2105','本溪市','210521','本溪满族自治县','','','','',3,1,''),('210522','2105','00,21,2105','桓仁满族自治县','21','辽宁省','2105','本溪市','210522','桓仁满族自治县','','','','',3,1,''),('2106','21','00,21','丹东市','21','辽宁省','2106','丹东市','','','','','','',2,1,''),('210602','2106','00,21,2106','元宝区','21','辽宁省','2106','丹东市','210602','元宝区','','','','',3,1,''),('210603','2106','00,21,2106','振兴区','21','辽宁省','2106','丹东市','210603','振兴区','','','','',3,1,''),('210604','2106','00,21,2106','振安区','21','辽宁省','2106','丹东市','210604','振安区','','','','',3,1,''),('210624','2106','00,21,2106','宽甸满族自治县','21','辽宁省','2106','丹东市','210624','宽甸满族自治县','','','','',3,1,''),('210681','2106','00,21,2106','东港市','21','辽宁省','2106','丹东市','210681','东港市','','','','',3,1,''),('210682','2106','00,21,2106','凤城市','21','辽宁省','2106','丹东市','210682','凤城市','','','','',3,1,''),('2107','21','00,21','锦州市','21','辽宁省','2107','锦州市','','','','','','',2,1,''),('210702','2107','00,21,2107','古塔区','21','辽宁省','2107','锦州市','210702','古塔区','','','','',3,1,''),('210703','2107','00,21,2107','凌河区','21','辽宁省','2107','锦州市','210703','凌河区','','','','',3,1,''),('210711','2107','00,21,2107','太和区','21','辽宁省','2107','锦州市','210711','太和区','','','','',3,1,''),('210726','2107','00,21,2107','黑山县','21','辽宁省','2107','锦州市','210726','黑山县','','','','',3,1,''),('210727','2107','00,21,2107','义县','21','辽宁省','2107','锦州市','210727','义县','','','','',3,1,''),('210781','2107','00,21,2107','凌海市','21','辽宁省','2107','锦州市','210781','凌海市','','','','',3,1,''),('210782','2107','00,21,2107','北镇市','21','辽宁省','2107','锦州市','210782','北镇市','','','','',3,1,''),('2108','21','00,21','营口市','21','辽宁省','2108','营口市','','','','','','',2,1,''),('210802','2108','00,21,2108','站前区','21','辽宁省','2108','营口市','210802','站前区','','','','',3,1,''),('210803','2108','00,21,2108','西市区','21','辽宁省','2108','营口市','210803','西市区','','','','',3,1,''),('210804','2108','00,21,2108','鲅鱼圈区','21','辽宁省','2108','营口市','210804','鲅鱼圈区','','','','',3,1,''),('210811','2108','00,21,2108','老边区','21','辽宁省','2108','营口市','210811','老边区','','','','',3,1,''),('210881','2108','00,21,2108','盖州市','21','辽宁省','2108','营口市','210881','盖州市','','','','',3,1,''),('210882','2108','00,21,2108','大石桥市','21','辽宁省','2108','营口市','210882','大石桥市','','','','',3,1,''),('2109','21','00,21','阜新市','21','辽宁省','2109','阜新市','','','','','','',2,1,''),('210902','2109','00,21,2109','海州区','21','辽宁省','2109','阜新市','210902','海州区','','','','',3,1,''),('210903','2109','00,21,2109','新邱区','21','辽宁省','2109','阜新市','210903','新邱区','','','','',3,1,''),('210904','2109','00,21,2109','太平区','21','辽宁省','2109','阜新市','210904','太平区','','','','',3,1,''),('210905','2109','00,21,2109','清河门区','21','辽宁省','2109','阜新市','210905','清河门区','','','','',3,1,''),('210911','2109','00,21,2109','细河区','21','辽宁省','2109','阜新市','210911','细河区','','','','',3,1,''),('210921','2109','00,21,2109','阜新蒙古族自治县','21','辽宁省','2109','阜新市','210921','阜新蒙古族自治县','','','','',3,1,''),('210922','2109','00,21,2109','彰武县','21','辽宁省','2109','阜新市','210922','彰武县','','','','',3,1,''),('2110','21','00,21','辽阳市','21','辽宁省','2110','辽阳市','','','','','','',2,1,''),('211002','2110','00,21,2110','白塔区','21','辽宁省','2110','辽阳市','211002','白塔区','','','','',3,1,''),('211003','2110','00,21,2110','文圣区','21','辽宁省','2110','辽阳市','211003','文圣区','','','','',3,1,''),('211004','2110','00,21,2110','宏伟区','21','辽宁省','2110','辽阳市','211004','宏伟区','','','','',3,1,''),('211005','2110','00,21,2110','弓长岭区','21','辽宁省','2110','辽阳市','211005','弓长岭区','','','','',3,1,''),('211011','2110','00,21,2110','太子河区','21','辽宁省','2110','辽阳市','211011','太子河区','','','','',3,1,''),('211021','2110','00,21,2110','辽阳县','21','辽宁省','2110','辽阳市','211021','辽阳县','','','','',3,1,''),('211081','2110','00,21,2110','灯塔市','21','辽宁省','2110','辽阳市','211081','灯塔市','','','','',3,1,''),('2111','21','00,21','盘锦市','21','辽宁省','2111','盘锦市','','','','','','',2,1,''),('211102','2111','00,21,2111','双台子区','21','辽宁省','2111','盘锦市','211102','双台子区','','','','',3,1,''),('211103','2111','00,21,2111','兴隆台区','21','辽宁省','2111','盘锦市','211103','兴隆台区','','','','',3,1,''),('211104','2111','00,21,2111','大洼区','21','辽宁省','2111','盘锦市','211104','大洼区','','','','',3,1,''),('211122','2111','00,21,2111','盘山县','21','辽宁省','2111','盘锦市','211122','盘山县','','','','',3,1,''),('2112','21','00,21','铁岭市','21','辽宁省','2112','铁岭市','','','','','','',2,1,''),('211202','2112','00,21,2112','银州区','21','辽宁省','2112','铁岭市','211202','银州区','','','','',3,1,''),('211204','2112','00,21,2112','清河区','21','辽宁省','2112','铁岭市','211204','清河区','','','','',3,1,''),('211221','2112','00,21,2112','铁岭县','21','辽宁省','2112','铁岭市','211221','铁岭县','','','','',3,1,''),('211223','2112','00,21,2112','西丰县','21','辽宁省','2112','铁岭市','211223','西丰县','','','','',3,1,''),('211224','2112','00,21,2112','昌图县','21','辽宁省','2112','铁岭市','211224','昌图县','','','','',3,1,''),('211281','2112','00,21,2112','调兵山市','21','辽宁省','2112','铁岭市','211281','调兵山市','','','','',3,1,''),('211282','2112','00,21,2112','开原市','21','辽宁省','2112','铁岭市','211282','开原市','','','','',3,1,''),('2113','21','00,21','朝阳市','21','辽宁省','2113','朝阳市','','','','','','',2,1,''),('211302','2113','00,21,2113','双塔区','21','辽宁省','2113','朝阳市','211302','双塔区','','','','',3,1,''),('211303','2113','00,21,2113','龙城区','21','辽宁省','2113','朝阳市','211303','龙城区','','','','',3,1,''),('211321','2113','00,21,2113','朝阳县','21','辽宁省','2113','朝阳市','211321','朝阳县','','','','',3,1,''),('211322','2113','00,21,2113','建平县','21','辽宁省','2113','朝阳市','211322','建平县','','','','',3,1,''),('211324','2113','00,21,2113','喀喇沁左翼蒙古族自治县','21','辽宁省','2113','朝阳市','211324','喀喇沁左翼蒙古族自治县','','','','',3,1,''),('211381','2113','00,21,2113','北票市','21','辽宁省','2113','朝阳市','211381','北票市','','','','',3,1,''),('211382','2113','00,21,2113','凌源市','21','辽宁省','2113','朝阳市','211382','凌源市','','','','',3,1,''),('2114','21','00,21','葫芦岛市','21','辽宁省','2114','葫芦岛市','','','','','','',2,1,''),('211402','2114','00,21,2114','连山区','21','辽宁省','2114','葫芦岛市','211402','连山区','','','','',3,1,''),('211403','2114','00,21,2114','龙港区','21','辽宁省','2114','葫芦岛市','211403','龙港区','','','','',3,1,''),('211404','2114','00,21,2114','南票区','21','辽宁省','2114','葫芦岛市','211404','南票区','','','','',3,1,''),('211421','2114','00,21,2114','绥中县','21','辽宁省','2114','葫芦岛市','211421','绥中县','','','','',3,1,''),('211422','2114','00,21,2114','建昌县','21','辽宁省','2114','葫芦岛市','211422','建昌县','','','','',3,1,''),('211481','2114','00,21,2114','兴城市','21','辽宁省','2114','葫芦岛市','211481','兴城市','','','','',3,1,''),('22','00','00','吉林省','22','吉林省','','','','','','','','',1,1,''),('2201','22','00,22','长春市','22','吉林省','2201','长春市','','','','','','',2,1,''),('220102','2201','00,22,2201','南关区','22','吉林省','2201','长春市','220102','南关区','','','','',3,1,''),('220103','2201','00,22,2201','宽城区','22','吉林省','2201','长春市','220103','宽城区','','','','',3,1,''),('220104','2201','00,22,2201','朝阳区','22','吉林省','2201','长春市','220104','朝阳区','','','','',3,1,''),('220105','2201','00,22,2201','二道区','22','吉林省','2201','长春市','220105','二道区','','','','',3,1,''),('220106','2201','00,22,2201','绿园区','22','吉林省','2201','长春市','220106','绿园区','','','','',3,1,''),('220112','2201','00,22,2201','双阳区','22','吉林省','2201','长春市','220112','双阳区','','','','',3,1,''),('220113','2201','00,22,2201','九台区','22','吉林省','2201','长春市','220113','九台区','','','','',3,1,''),('220122','2201','00,22,2201','农安县','22','吉林省','2201','长春市','220122','农安县','','','','',3,1,''),('220182','2201','00,22,2201','榆树市','22','吉林省','2201','长春市','220182','榆树市','','','','',3,1,''),('220183','2201','00,22,2201','德惠市','22','吉林省','2201','长春市','220183','德惠市','','','','',3,1,''),('2202','22','00,22','吉林市','22','吉林省','2202','吉林市','','','','','','',2,1,''),('220202','2202','00,22,2202','昌邑区','22','吉林省','2202','吉林市','220202','昌邑区','','','','',3,1,''),('220203','2202','00,22,2202','龙潭区','22','吉林省','2202','吉林市','220203','龙潭区','','','','',3,1,''),('220204','2202','00,22,2202','船营区','22','吉林省','2202','吉林市','220204','船营区','','','','',3,1,''),('220211','2202','00,22,2202','丰满区','22','吉林省','2202','吉林市','220211','丰满区','','','','',3,1,''),('220221','2202','00,22,2202','永吉县','22','吉林省','2202','吉林市','220221','永吉县','','','','',3,1,''),('220281','2202','00,22,2202','蛟河市','22','吉林省','2202','吉林市','220281','蛟河市','','','','',3,1,''),('220282','2202','00,22,2202','桦甸市','22','吉林省','2202','吉林市','220282','桦甸市','','','','',3,1,''),('220283','2202','00,22,2202','舒兰市','22','吉林省','2202','吉林市','220283','舒兰市','','','','',3,1,''),('220284','2202','00,22,2202','磐石市','22','吉林省','2202','吉林市','220284','磐石市','','','','',3,1,''),('2203','22','00,22','四平市','22','吉林省','2203','四平市','','','','','','',2,1,''),('220302','2203','00,22,2203','铁西区','22','吉林省','2203','四平市','220302','铁西区','','','','',3,1,''),('220303','2203','00,22,2203','铁东区','22','吉林省','2203','四平市','220303','铁东区','','','','',3,1,''),('220322','2203','00,22,2203','梨树县','22','吉林省','2203','四平市','220322','梨树县','','','','',3,1,''),('220323','2203','00,22,2203','伊通满族自治县','22','吉林省','2203','四平市','220323','伊通满族自治县','','','','',3,1,''),('220381','2203','00,22,2203','公主岭市','22','吉林省','2203','四平市','220381','公主岭市','','','','',3,1,''),('220382','2203','00,22,2203','双辽市','22','吉林省','2203','四平市','220382','双辽市','','','','',3,1,''),('2204','22','00,22','辽源市','22','吉林省','2204','辽源市','','','','','','',2,1,''),('220402','2204','00,22,2204','龙山区','22','吉林省','2204','辽源市','220402','龙山区','','','','',3,1,''),('220403','2204','00,22,2204','西安区','22','吉林省','2204','辽源市','220403','西安区','','','','',3,1,''),('220421','2204','00,22,2204','东丰县','22','吉林省','2204','辽源市','220421','东丰县','','','','',3,1,''),('220422','2204','00,22,2204','东辽县','22','吉林省','2204','辽源市','220422','东辽县','','','','',3,1,''),('2205','22','00,22','通化市','22','吉林省','2205','通化市','','','','','','',2,1,''),('220502','2205','00,22,2205','东昌区','22','吉林省','2205','通化市','220502','东昌区','','','','',3,1,''),('220503','2205','00,22,2205','二道江区','22','吉林省','2205','通化市','220503','二道江区','','','','',3,1,''),('220521','2205','00,22,2205','通化县','22','吉林省','2205','通化市','220521','通化县','','','','',3,1,''),('220523','2205','00,22,2205','辉南县','22','吉林省','2205','通化市','220523','辉南县','','','','',3,1,''),('220524','2205','00,22,2205','柳河县','22','吉林省','2205','通化市','220524','柳河县','','','','',3,1,''),('220581','2205','00,22,2205','梅河口市','22','吉林省','2205','通化市','220581','梅河口市','','','','',3,1,''),('220582','2205','00,22,2205','集安市','22','吉林省','2205','通化市','220582','集安市','','','','',3,1,''),('2206','22','00,22','白山市','22','吉林省','2206','白山市','','','','','','',2,1,''),('220602','2206','00,22,2206','浑江区','22','吉林省','2206','白山市','220602','浑江区','','','','',3,1,''),('220605','2206','00,22,2206','江源区','22','吉林省','2206','白山市','220605','江源区','','','','',3,1,''),('220621','2206','00,22,2206','抚松县','22','吉林省','2206','白山市','220621','抚松县','','','','',3,1,''),('220622','2206','00,22,2206','靖宇县','22','吉林省','2206','白山市','220622','靖宇县','','','','',3,1,''),('220623','2206','00,22,2206','长白朝鲜族自治县','22','吉林省','2206','白山市','220623','长白朝鲜族自治县','','','','',3,1,''),('220681','2206','00,22,2206','临江市','22','吉林省','2206','白山市','220681','临江市','','','','',3,1,''),('2207','22','00,22','松原市','22','吉林省','2207','松原市','','','','','','',2,1,''),('220702','2207','00,22,2207','宁江区','22','吉林省','2207','松原市','220702','宁江区','','','','',3,1,''),('220721','2207','00,22,2207','前郭尔罗斯蒙古族自治县','22','吉林省','2207','松原市','220721','前郭尔罗斯蒙古族自治县','','','','',3,1,''),('220722','2207','00,22,2207','长岭县','22','吉林省','2207','松原市','220722','长岭县','','','','',3,1,''),('220723','2207','00,22,2207','乾安县','22','吉林省','2207','松原市','220723','乾安县','','','','',3,1,''),('220781','2207','00,22,2207','扶余市','22','吉林省','2207','松原市','220781','扶余市','','','','',3,1,''),('2208','22','00,22','白城市','22','吉林省','2208','白城市','','','','','','',2,1,''),('220802','2208','00,22,2208','洮北区','22','吉林省','2208','白城市','220802','洮北区','','','','',3,1,''),('220821','2208','00,22,2208','镇赉县','22','吉林省','2208','白城市','220821','镇赉县','','','','',3,1,''),('220822','2208','00,22,2208','通榆县','22','吉林省','2208','白城市','220822','通榆县','','','','',3,1,''),('220881','2208','00,22,2208','洮南市','22','吉林省','2208','白城市','220881','洮南市','','','','',3,1,''),('220882','2208','00,22,2208','大安市','22','吉林省','2208','白城市','220882','大安市','','','','',3,1,''),('2224','22','00,22','延边朝鲜族自治州','22','吉林省','2224','延边朝鲜族自治州','','','','','','',2,1,''),('222401','2224','00,22,2224','延吉市','22','吉林省','2224','延边朝鲜族自治州','222401','延吉市','','','','',3,1,''),('222402','2224','00,22,2224','图们市','22','吉林省','2224','延边朝鲜族自治州','222402','图们市','','','','',3,1,''),('222403','2224','00,22,2224','敦化市','22','吉林省','2224','延边朝鲜族自治州','222403','敦化市','','','','',3,1,''),('222404','2224','00,22,2224','珲春市','22','吉林省','2224','延边朝鲜族自治州','222404','珲春市','','','','',3,1,''),('222405','2224','00,22,2224','龙井市','22','吉林省','2224','延边朝鲜族自治州','222405','龙井市','','','','',3,1,''),('222406','2224','00,22,2224','和龙市','22','吉林省','2224','延边朝鲜族自治州','222406','和龙市','','','','',3,1,''),('222424','2224','00,22,2224','汪清县','22','吉林省','2224','延边朝鲜族自治州','222424','汪清县','','','','',3,1,''),('222426','2224','00,22,2224','安图县','22','吉林省','2224','延边朝鲜族自治州','222426','安图县','','','','',3,1,''),('23','00','00','黑龙江省','23','黑龙江省','','','','','','','','',1,1,''),('2301','23','00,23','哈尔滨市','23','黑龙江省','2301','哈尔滨市','','','','','','',2,1,''),('230102','2301','00,23,2301','道里区','23','黑龙江省','2301','哈尔滨市','230102','道里区','','','','',3,1,''),('230103','2301','00,23,2301','南岗区','23','黑龙江省','2301','哈尔滨市','230103','南岗区','','','','',3,1,''),('230104','2301','00,23,2301','道外区','23','黑龙江省','2301','哈尔滨市','230104','道外区','','','','',3,1,''),('230108','2301','00,23,2301','平房区','23','黑龙江省','2301','哈尔滨市','230108','平房区','','','','',3,1,''),('230109','2301','00,23,2301','松北区','23','黑龙江省','2301','哈尔滨市','230109','松北区','','','','',3,1,''),('230110','2301','00,23,2301','香坊区','23','黑龙江省','2301','哈尔滨市','230110','香坊区','','','','',3,1,''),('230111','2301','00,23,2301','呼兰区','23','黑龙江省','2301','哈尔滨市','230111','呼兰区','','','','',3,1,''),('230112','2301','00,23,2301','阿城区','23','黑龙江省','2301','哈尔滨市','230112','阿城区','','','','',3,1,''),('230113','2301','00,23,2301','双城区','23','黑龙江省','2301','哈尔滨市','230113','双城区','','','','',3,1,''),('230123','2301','00,23,2301','依兰县','23','黑龙江省','2301','哈尔滨市','230123','依兰县','','','','',3,1,''),('230124','2301','00,23,2301','方正县','23','黑龙江省','2301','哈尔滨市','230124','方正县','','','','',3,1,''),('230125','2301','00,23,2301','宾县','23','黑龙江省','2301','哈尔滨市','230125','宾县','','','','',3,1,''),('230126','2301','00,23,2301','巴彦县','23','黑龙江省','2301','哈尔滨市','230126','巴彦县','','','','',3,1,''),('230127','2301','00,23,2301','木兰县','23','黑龙江省','2301','哈尔滨市','230127','木兰县','','','','',3,1,''),('230128','2301','00,23,2301','通河县','23','黑龙江省','2301','哈尔滨市','230128','通河县','','','','',3,1,''),('230129','2301','00,23,2301','延寿县','23','黑龙江省','2301','哈尔滨市','230129','延寿县','','','','',3,1,''),('230183','2301','00,23,2301','尚志市','23','黑龙江省','2301','哈尔滨市','230183','尚志市','','','','',3,1,''),('230184','2301','00,23,2301','五常市','23','黑龙江省','2301','哈尔滨市','230184','五常市','','','','',3,1,''),('2302','23','00,23','齐齐哈尔市','23','黑龙江省','2302','齐齐哈尔市','','','','','','',2,1,''),('230202','2302','00,23,2302','龙沙区','23','黑龙江省','2302','齐齐哈尔市','230202','龙沙区','','','','',3,1,''),('230203','2302','00,23,2302','建华区','23','黑龙江省','2302','齐齐哈尔市','230203','建华区','','','','',3,1,''),('230204','2302','00,23,2302','铁锋区','23','黑龙江省','2302','齐齐哈尔市','230204','铁锋区','','','','',3,1,''),('230205','2302','00,23,2302','昂昂溪区','23','黑龙江省','2302','齐齐哈尔市','230205','昂昂溪区','','','','',3,1,''),('230206','2302','00,23,2302','富拉尔基区','23','黑龙江省','2302','齐齐哈尔市','230206','富拉尔基区','','','','',3,1,''),('230207','2302','00,23,2302','碾子山区','23','黑龙江省','2302','齐齐哈尔市','230207','碾子山区','','','','',3,1,''),('230208','2302','00,23,2302','梅里斯达斡尔族区','23','黑龙江省','2302','齐齐哈尔市','230208','梅里斯达斡尔族区','','','','',3,1,''),('230221','2302','00,23,2302','龙江县','23','黑龙江省','2302','齐齐哈尔市','230221','龙江县','','','','',3,1,''),('230223','2302','00,23,2302','依安县','23','黑龙江省','2302','齐齐哈尔市','230223','依安县','','','','',3,1,''),('230224','2302','00,23,2302','泰来县','23','黑龙江省','2302','齐齐哈尔市','230224','泰来县','','','','',3,1,''),('230225','2302','00,23,2302','甘南县','23','黑龙江省','2302','齐齐哈尔市','230225','甘南县','','','','',3,1,''),('230227','2302','00,23,2302','富裕县','23','黑龙江省','2302','齐齐哈尔市','230227','富裕县','','','','',3,1,''),('230229','2302','00,23,2302','克山县','23','黑龙江省','2302','齐齐哈尔市','230229','克山县','','','','',3,1,''),('230230','2302','00,23,2302','克东县','23','黑龙江省','2302','齐齐哈尔市','230230','克东县','','','','',3,1,''),('230231','2302','00,23,2302','拜泉县','23','黑龙江省','2302','齐齐哈尔市','230231','拜泉县','','','','',3,1,''),('230281','2302','00,23,2302','讷河市','23','黑龙江省','2302','齐齐哈尔市','230281','讷河市','','','','',3,1,''),('2303','23','00,23','鸡西市','23','黑龙江省','2303','鸡西市','','','','','','',2,1,''),('230302','2303','00,23,2303','鸡冠区','23','黑龙江省','2303','鸡西市','230302','鸡冠区','','','','',3,1,''),('230303','2303','00,23,2303','恒山区','23','黑龙江省','2303','鸡西市','230303','恒山区','','','','',3,1,''),('230304','2303','00,23,2303','滴道区','23','黑龙江省','2303','鸡西市','230304','滴道区','','','','',3,1,''),('230305','2303','00,23,2303','梨树区','23','黑龙江省','2303','鸡西市','230305','梨树区','','','','',3,1,''),('230306','2303','00,23,2303','城子河区','23','黑龙江省','2303','鸡西市','230306','城子河区','','','','',3,1,''),('230307','2303','00,23,2303','麻山区','23','黑龙江省','2303','鸡西市','230307','麻山区','','','','',3,1,''),('230321','2303','00,23,2303','鸡东县','23','黑龙江省','2303','鸡西市','230321','鸡东县','','','','',3,1,''),('230381','2303','00,23,2303','虎林市','23','黑龙江省','2303','鸡西市','230381','虎林市','','','','',3,1,''),('230382','2303','00,23,2303','密山市','23','黑龙江省','2303','鸡西市','230382','密山市','','','','',3,1,''),('2304','23','00,23','鹤岗市','23','黑龙江省','2304','鹤岗市','','','','','','',2,1,''),('230402','2304','00,23,2304','向阳区','23','黑龙江省','2304','鹤岗市','230402','向阳区','','','','',3,1,''),('230403','2304','00,23,2304','工农区','23','黑龙江省','2304','鹤岗市','230403','工农区','','','','',3,1,''),('230404','2304','00,23,2304','南山区','23','黑龙江省','2304','鹤岗市','230404','南山区','','','','',3,1,''),('230405','2304','00,23,2304','兴安区','23','黑龙江省','2304','鹤岗市','230405','兴安区','','','','',3,1,''),('230406','2304','00,23,2304','东山区','23','黑龙江省','2304','鹤岗市','230406','东山区','','','','',3,1,''),('230407','2304','00,23,2304','兴山区','23','黑龙江省','2304','鹤岗市','230407','兴山区','','','','',3,1,''),('230421','2304','00,23,2304','萝北县','23','黑龙江省','2304','鹤岗市','230421','萝北县','','','','',3,1,''),('230422','2304','00,23,2304','绥滨县','23','黑龙江省','2304','鹤岗市','230422','绥滨县','','','','',3,1,''),('2305','23','00,23','双鸭山市','23','黑龙江省','2305','双鸭山市','','','','','','',2,1,''),('230502','2305','00,23,2305','尖山区','23','黑龙江省','2305','双鸭山市','230502','尖山区','','','','',3,1,''),('230503','2305','00,23,2305','岭东区','23','黑龙江省','2305','双鸭山市','230503','岭东区','','','','',3,1,''),('230505','2305','00,23,2305','四方台区','23','黑龙江省','2305','双鸭山市','230505','四方台区','','','','',3,1,''),('230506','2305','00,23,2305','宝山区','23','黑龙江省','2305','双鸭山市','230506','宝山区','','','','',3,1,''),('230521','2305','00,23,2305','集贤县','23','黑龙江省','2305','双鸭山市','230521','集贤县','','','','',3,1,''),('230522','2305','00,23,2305','友谊县','23','黑龙江省','2305','双鸭山市','230522','友谊县','','','','',3,1,''),('230523','2305','00,23,2305','宝清县','23','黑龙江省','2305','双鸭山市','230523','宝清县','','','','',3,1,''),('230524','2305','00,23,2305','饶河县','23','黑龙江省','2305','双鸭山市','230524','饶河县','','','','',3,1,''),('2306','23','00,23','大庆市','23','黑龙江省','2306','大庆市','','','','','','',2,1,''),('230602','2306','00,23,2306','萨尔图区','23','黑龙江省','2306','大庆市','230602','萨尔图区','','','','',3,1,''),('230603','2306','00,23,2306','龙凤区','23','黑龙江省','2306','大庆市','230603','龙凤区','','','','',3,1,''),('230604','2306','00,23,2306','让胡路区','23','黑龙江省','2306','大庆市','230604','让胡路区','','','','',3,1,''),('230605','2306','00,23,2306','红岗区','23','黑龙江省','2306','大庆市','230605','红岗区','','','','',3,1,''),('230606','2306','00,23,2306','大同区','23','黑龙江省','2306','大庆市','230606','大同区','','','','',3,1,''),('230621','2306','00,23,2306','肇州县','23','黑龙江省','2306','大庆市','230621','肇州县','','','','',3,1,''),('230622','2306','00,23,2306','肇源县','23','黑龙江省','2306','大庆市','230622','肇源县','','','','',3,1,''),('230623','2306','00,23,2306','林甸县','23','黑龙江省','2306','大庆市','230623','林甸县','','','','',3,1,''),('230624','2306','00,23,2306','杜尔伯特蒙古族自治县','23','黑龙江省','2306','大庆市','230624','杜尔伯特蒙古族自治县','','','','',3,1,''),('2307','23','00,23','伊春市','23','黑龙江省','2307','伊春市','','','','','','',2,1,''),('230717','2307','00,23,2307','伊美区','23','黑龙江省','2307','伊春市','230717','伊美区','','','','',3,1,''),('230718','2307','00,23,2307','乌翠区','23','黑龙江省','2307','伊春市','230718','乌翠区','','','','',3,1,''),('230719','2307','00,23,2307','友好区','23','黑龙江省','2307','伊春市','230719','友好区','','','','',3,1,''),('230722','2307','00,23,2307','嘉荫县','23','黑龙江省','2307','伊春市','230722','嘉荫县','','','','',3,1,''),('230723','2307','00,23,2307','汤旺县','23','黑龙江省','2307','伊春市','230723','汤旺县','','','','',3,1,''),('230724','2307','00,23,2307','丰林县','23','黑龙江省','2307','伊春市','230724','丰林县','','','','',3,1,''),('230725','2307','00,23,2307','大箐山县','23','黑龙江省','2307','伊春市','230725','大箐山县','','','','',3,1,''),('230726','2307','00,23,2307','南岔县','23','黑龙江省','2307','伊春市','230726','南岔县','','','','',3,1,''),('230751','2307','00,23,2307','金林区','23','黑龙江省','2307','伊春市','230751','金林区','','','','',3,1,''),('230781','2307','00,23,2307','铁力市','23','黑龙江省','2307','伊春市','230781','铁力市','','','','',3,1,''),('2308','23','00,23','佳木斯市','23','黑龙江省','2308','佳木斯市','','','','','','',2,1,''),('230803','2308','00,23,2308','向阳区','23','黑龙江省','2308','佳木斯市','230803','向阳区','','','','',3,1,''),('230804','2308','00,23,2308','前进区','23','黑龙江省','2308','佳木斯市','230804','前进区','','','','',3,1,''),('230805','2308','00,23,2308','东风区','23','黑龙江省','2308','佳木斯市','230805','东风区','','','','',3,1,''),('230811','2308','00,23,2308','郊区','23','黑龙江省','2308','佳木斯市','230811','郊区','','','','',3,1,''),('230822','2308','00,23,2308','桦南县','23','黑龙江省','2308','佳木斯市','230822','桦南县','','','','',3,1,''),('230826','2308','00,23,2308','桦川县','23','黑龙江省','2308','佳木斯市','230826','桦川县','','','','',3,1,''),('230828','2308','00,23,2308','汤原县','23','黑龙江省','2308','佳木斯市','230828','汤原县','','','','',3,1,''),('230881','2308','00,23,2308','同江市','23','黑龙江省','2308','佳木斯市','230881','同江市','','','','',3,1,''),('230882','2308','00,23,2308','富锦市','23','黑龙江省','2308','佳木斯市','230882','富锦市','','','','',3,1,''),('230883','2308','00,23,2308','抚远市','23','黑龙江省','2308','佳木斯市','230883','抚远市','','','','',3,1,''),('2309','23','00,23','七台河市','23','黑龙江省','2309','七台河市','','','','','','',2,1,''),('230902','2309','00,23,2309','新兴区','23','黑龙江省','2309','七台河市','230902','新兴区','','','','',3,1,''),('230903','2309','00,23,2309','桃山区','23','黑龙江省','2309','七台河市','230903','桃山区','','','','',3,1,''),('230904','2309','00,23,2309','茄子河区','23','黑龙江省','2309','七台河市','230904','茄子河区','','','','',3,1,''),('230921','2309','00,23,2309','勃利县','23','黑龙江省','2309','七台河市','230921','勃利县','','','','',3,1,''),('2310','23','00,23','牡丹江市','23','黑龙江省','2310','牡丹江市','','','','','','',2,1,''),('231002','2310','00,23,2310','东安区','23','黑龙江省','2310','牡丹江市','231002','东安区','','','','',3,1,''),('231003','2310','00,23,2310','阳明区','23','黑龙江省','2310','牡丹江市','231003','阳明区','','','','',3,1,''),('231004','2310','00,23,2310','爱民区','23','黑龙江省','2310','牡丹江市','231004','爱民区','','','','',3,1,''),('231005','2310','00,23,2310','西安区','23','黑龙江省','2310','牡丹江市','231005','西安区','','','','',3,1,''),('231025','2310','00,23,2310','林口县','23','黑龙江省','2310','牡丹江市','231025','林口县','','','','',3,1,''),('231081','2310','00,23,2310','绥芬河市','23','黑龙江省','2310','牡丹江市','231081','绥芬河市','','','','',3,1,''),('231083','2310','00,23,2310','海林市','23','黑龙江省','2310','牡丹江市','231083','海林市','','','','',3,1,''),('231084','2310','00,23,2310','宁安市','23','黑龙江省','2310','牡丹江市','231084','宁安市','','','','',3,1,''),('231085','2310','00,23,2310','穆棱市','23','黑龙江省','2310','牡丹江市','231085','穆棱市','','','','',3,1,''),('231086','2310','00,23,2310','东宁市','23','黑龙江省','2310','牡丹江市','231086','东宁市','','','','',3,1,''),('2311','23','00,23','黑河市','23','黑龙江省','2311','黑河市','','','','','','',2,1,''),('231102','2311','00,23,2311','爱辉区','23','黑龙江省','2311','黑河市','231102','爱辉区','','','','',3,1,''),('231123','2311','00,23,2311','逊克县','23','黑龙江省','2311','黑河市','231123','逊克县','','','','',3,1,''),('231124','2311','00,23,2311','孙吴县','23','黑龙江省','2311','黑河市','231124','孙吴县','','','','',3,1,''),('231181','2311','00,23,2311','北安市','23','黑龙江省','2311','黑河市','231181','北安市','','','','',3,1,''),('231182','2311','00,23,2311','五大连池市','23','黑龙江省','2311','黑河市','231182','五大连池市','','','','',3,1,''),('231183','2311','00,23,2311','嫩江市','23','黑龙江省','2311','黑河市','231183','嫩江市','','','','',3,1,''),('2312','23','00,23','绥化市','23','黑龙江省','2312','绥化市','','','','','','',2,1,''),('231202','2312','00,23,2312','北林区','23','黑龙江省','2312','绥化市','231202','北林区','','','','',3,1,''),('231221','2312','00,23,2312','望奎县','23','黑龙江省','2312','绥化市','231221','望奎县','','','','',3,1,''),('231222','2312','00,23,2312','兰西县','23','黑龙江省','2312','绥化市','231222','兰西县','','','','',3,1,''),('231223','2312','00,23,2312','青冈县','23','黑龙江省','2312','绥化市','231223','青冈县','','','','',3,1,''),('231224','2312','00,23,2312','庆安县','23','黑龙江省','2312','绥化市','231224','庆安县','','','','',3,1,''),('231225','2312','00,23,2312','明水县','23','黑龙江省','2312','绥化市','231225','明水县','','','','',3,1,''),('231226','2312','00,23,2312','绥棱县','23','黑龙江省','2312','绥化市','231226','绥棱县','','','','',3,1,''),('231281','2312','00,23,2312','安达市','23','黑龙江省','2312','绥化市','231281','安达市','','','','',3,1,''),('231282','2312','00,23,2312','肇东市','23','黑龙江省','2312','绥化市','231282','肇东市','','','','',3,1,''),('231283','2312','00,23,2312','海伦市','23','黑龙江省','2312','绥化市','231283','海伦市','','','','',3,1,''),('2327','23','00,23','大兴安岭地区','23','黑龙江省','2327','大兴安岭地区','','','','','','',2,1,''),('232701','2327','00,23,2327','漠河市','23','黑龙江省','2327','大兴安岭地区','232701','漠河市','','','','',3,1,''),('232721','2327','00,23,2327','呼玛县','23','黑龙江省','2327','大兴安岭地区','232721','呼玛县','','','','',3,1,''),('232722','2327','00,23,2327','塔河县','23','黑龙江省','2327','大兴安岭地区','232722','塔河县','','','','',3,1,''),('31','00','00','上海市','31','上海市','','','','','','','','',1,1,''),('3101','31','00,31','上海市','31','上海市','3101','上海市','','','','','','',2,1,''),('310101','3101','00,31,3101','黄浦区','31','上海市','3101','上海市','310101','黄浦区','','','','',3,1,''),('310104','3101','00,31,3101','徐汇区','31','上海市','3101','上海市','310104','徐汇区','','','','',3,1,''),('310105','3101','00,31,3101','长宁区','31','上海市','3101','上海市','310105','长宁区','','','','',3,1,''),('310106','3101','00,31,3101','静安区','31','上海市','3101','上海市','310106','静安区','','','','',3,1,''),('310107','3101','00,31,3101','普陀区','31','上海市','3101','上海市','310107','普陀区','','','','',3,1,''),('310109','3101','00,31,3101','虹口区','31','上海市','3101','上海市','310109','虹口区','','','','',3,1,''),('310110','3101','00,31,3101','杨浦区','31','上海市','3101','上海市','310110','杨浦区','','','','',3,1,''),('310112','3101','00,31,3101','闵行区','31','上海市','3101','上海市','310112','闵行区','','','','',3,1,''),('310113','3101','00,31,3101','宝山区','31','上海市','3101','上海市','310113','宝山区','','','','',3,1,''),('310114','3101','00,31,3101','嘉定区','31','上海市','3101','上海市','310114','嘉定区','','','','',3,1,''),('310115','3101','00,31,3101','浦东新区','31','上海市','3101','上海市','310115','浦东新区','','','','',3,1,''),('310116','3101','00,31,3101','金山区','31','上海市','3101','上海市','310116','金山区','','','','',3,1,''),('310117','3101','00,31,3101','松江区','31','上海市','3101','上海市','310117','松江区','','','','',3,1,''),('310118','3101','00,31,3101','青浦区','31','上海市','3101','上海市','310118','青浦区','','','','',3,1,''),('310120','3101','00,31,3101','奉贤区','31','上海市','3101','上海市','310120','奉贤区','','','','',3,1,''),('310151','3101','00,31,3101','崇明区','31','上海市','3101','上海市','310151','崇明区','','','','',3,1,''),('32','00','00','江苏省','32','江苏省','','','','','','','','',1,1,''),('3201','32','00,32','南京市','32','江苏省','3201','南京市','','','','','','',2,1,''),('320102','3201','00,32,3201','玄武区','32','江苏省','3201','南京市','320102','玄武区','','','','',3,1,''),('320104','3201','00,32,3201','秦淮区','32','江苏省','3201','南京市','320104','秦淮区','','','','',3,1,''),('320105','3201','00,32,3201','建邺区','32','江苏省','3201','南京市','320105','建邺区','','','','',3,1,''),('320106','3201','00,32,3201','鼓楼区','32','江苏省','3201','南京市','320106','鼓楼区','','','','',3,1,''),('320111','3201','00,32,3201','浦口区','32','江苏省','3201','南京市','320111','浦口区','','','','',3,1,''),('320113','3201','00,32,3201','栖霞区','32','江苏省','3201','南京市','320113','栖霞区','','','','',3,1,''),('320114','3201','00,32,3201','雨花台区','32','江苏省','3201','南京市','320114','雨花台区','','','','',3,1,''),('320115','3201','00,32,3201','江宁区','32','江苏省','3201','南京市','320115','江宁区','','','','',3,1,''),('320116','3201','00,32,3201','六合区','32','江苏省','3201','南京市','320116','六合区','','','','',3,1,''),('320117','3201','00,32,3201','溧水区','32','江苏省','3201','南京市','320117','溧水区','','','','',3,1,''),('320118','3201','00,32,3201','高淳区','32','江苏省','3201','南京市','320118','高淳区','','','','',3,1,''),('3202','32','00,32','无锡市','32','江苏省','3202','无锡市','','','','','','',2,1,''),('320205','3202','00,32,3202','锡山区','32','江苏省','3202','无锡市','320205','锡山区','','','','',3,1,''),('320206','3202','00,32,3202','惠山区','32','江苏省','3202','无锡市','320206','惠山区','','','','',3,1,''),('320211','3202','00,32,3202','滨湖区','32','江苏省','3202','无锡市','320211','滨湖区','','','','',3,1,''),('320213','3202','00,32,3202','梁溪区','32','江苏省','3202','无锡市','320213','梁溪区','','','','',3,1,''),('320214','3202','00,32,3202','新吴区','32','江苏省','3202','无锡市','320214','新吴区','','','','',3,1,''),('320281','3202','00,32,3202','江阴市','32','江苏省','3202','无锡市','320281','江阴市','','','','',3,1,''),('320282','3202','00,32,3202','宜兴市','32','江苏省','3202','无锡市','320282','宜兴市','','','','',3,1,''),('3203','32','00,32','徐州市','32','江苏省','3203','徐州市','','','','','','',2,1,''),('320302','3203','00,32,3203','鼓楼区','32','江苏省','3203','徐州市','320302','鼓楼区','','','','',3,1,''),('320303','3203','00,32,3203','云龙区','32','江苏省','3203','徐州市','320303','云龙区','','','','',3,1,''),('320305','3203','00,32,3203','贾汪区','32','江苏省','3203','徐州市','320305','贾汪区','','','','',3,1,''),('320311','3203','00,32,3203','泉山区','32','江苏省','3203','徐州市','320311','泉山区','','','','',3,1,''),('320312','3203','00,32,3203','铜山区','32','江苏省','3203','徐州市','320312','铜山区','','','','',3,1,''),('320321','3203','00,32,3203','丰县','32','江苏省','3203','徐州市','320321','丰县','','','','',3,1,''),('320322','3203','00,32,3203','沛县','32','江苏省','3203','徐州市','320322','沛县','','','','',3,1,''),('320324','3203','00,32,3203','睢宁县','32','江苏省','3203','徐州市','320324','睢宁县','','','','',3,1,''),('320381','3203','00,32,3203','新沂市','32','江苏省','3203','徐州市','320381','新沂市','','','','',3,1,''),('320382','3203','00,32,3203','邳州市','32','江苏省','3203','徐州市','320382','邳州市','','','','',3,1,''),('3204','32','00,32','常州市','32','江苏省','3204','常州市','','','','','','',2,1,''),('320402','3204','00,32,3204','天宁区','32','江苏省','3204','常州市','320402','天宁区','','','','',3,1,''),('320404','3204','00,32,3204','钟楼区','32','江苏省','3204','常州市','320404','钟楼区','','','','',3,1,''),('320411','3204','00,32,3204','新北区','32','江苏省','3204','常州市','320411','新北区','','','','',3,1,''),('320412','3204','00,32,3204','武进区','32','江苏省','3204','常州市','320412','武进区','','','','',3,1,''),('320413','3204','00,32,3204','金坛区','32','江苏省','3204','常州市','320413','金坛区','','','','',3,1,''),('320481','3204','00,32,3204','溧阳市','32','江苏省','3204','常州市','320481','溧阳市','','','','',3,1,''),('3205','32','00,32','苏州市','32','江苏省','3205','苏州市','','','','','','',2,1,''),('320505','3205','00,32,3205','虎丘区','32','江苏省','3205','苏州市','320505','虎丘区','','','','',3,1,''),('320506','3205','00,32,3205','吴中区','32','江苏省','3205','苏州市','320506','吴中区','','','','',3,1,''),('320507','3205','00,32,3205','相城区','32','江苏省','3205','苏州市','320507','相城区','','','','',3,1,''),('320508','3205','00,32,3205','姑苏区','32','江苏省','3205','苏州市','320508','姑苏区','','','','',3,1,''),('320509','3205','00,32,3205','吴江区','32','江苏省','3205','苏州市','320509','吴江区','','','','',3,1,''),('320581','3205','00,32,3205','常熟市','32','江苏省','3205','苏州市','320581','常熟市','','','','',3,1,''),('320582','3205','00,32,3205','张家港市','32','江苏省','3205','苏州市','320582','张家港市','','','','',3,1,''),('320583','3205','00,32,3205','昆山市','32','江苏省','3205','苏州市','320583','昆山市','','','','',3,1,''),('320585','3205','00,32,3205','太仓市','32','江苏省','3205','苏州市','320585','太仓市','','','','',3,1,''),('3206','32','00,32','南通市','32','江苏省','3206','南通市','','','','','','',2,1,''),('320602','3206','00,32,3206','崇川区','32','江苏省','3206','南通市','320602','崇川区','','','','',3,1,''),('320611','3206','00,32,3206','港闸区','32','江苏省','3206','南通市','320611','港闸区','','','','',3,1,''),('320612','3206','00,32,3206','通州区','32','江苏省','3206','南通市','320612','通州区','','','','',3,1,''),('320623','3206','00,32,3206','如东县','32','江苏省','3206','南通市','320623','如东县','','','','',3,1,''),('320681','3206','00,32,3206','启东市','32','江苏省','3206','南通市','320681','启东市','','','','',3,1,''),('320682','3206','00,32,3206','如皋市','32','江苏省','3206','南通市','320682','如皋市','','','','',3,1,''),('320684','3206','00,32,3206','海门市','32','江苏省','3206','南通市','320684','海门市','','','','',3,1,''),('320685','3206','00,32,3206','海安市','32','江苏省','3206','南通市','320685','海安市','','','','',3,1,''),('3207','32','00,32','连云港市','32','江苏省','3207','连云港市','','','','','','',2,1,''),('320703','3207','00,32,3207','连云区','32','江苏省','3207','连云港市','320703','连云区','','','','',3,1,''),('320706','3207','00,32,3207','海州区','32','江苏省','3207','连云港市','320706','海州区','','','','',3,1,''),('320707','3207','00,32,3207','赣榆区','32','江苏省','3207','连云港市','320707','赣榆区','','','','',3,1,''),('320722','3207','00,32,3207','东海县','32','江苏省','3207','连云港市','320722','东海县','','','','',3,1,''),('320723','3207','00,32,3207','灌云县','32','江苏省','3207','连云港市','320723','灌云县','','','','',3,1,''),('320724','3207','00,32,3207','灌南县','32','江苏省','3207','连云港市','320724','灌南县','','','','',3,1,''),('3208','32','00,32','淮安市','32','江苏省','3208','淮安市','','','','','','',2,1,''),('320803','3208','00,32,3208','淮安区','32','江苏省','3208','淮安市','320803','淮安区','','','','',3,1,''),('320804','3208','00,32,3208','淮阴区','32','江苏省','3208','淮安市','320804','淮阴区','','','','',3,1,''),('320812','3208','00,32,3208','清江浦区','32','江苏省','3208','淮安市','320812','清江浦区','','','','',3,1,''),('320813','3208','00,32,3208','洪泽区','32','江苏省','3208','淮安市','320813','洪泽区','','','','',3,1,''),('320826','3208','00,32,3208','涟水县','32','江苏省','3208','淮安市','320826','涟水县','','','','',3,1,''),('320830','3208','00,32,3208','盱眙县','32','江苏省','3208','淮安市','320830','盱眙县','','','','',3,1,''),('320831','3208','00,32,3208','金湖县','32','江苏省','3208','淮安市','320831','金湖县','','','','',3,1,''),('3209','32','00,32','盐城市','32','江苏省','3209','盐城市','','','','','','',2,1,''),('320902','3209','00,32,3209','亭湖区','32','江苏省','3209','盐城市','320902','亭湖区','','','','',3,1,''),('320903','3209','00,32,3209','盐都区','32','江苏省','3209','盐城市','320903','盐都区','','','','',3,1,''),('320904','3209','00,32,3209','大丰区','32','江苏省','3209','盐城市','320904','大丰区','','','','',3,1,''),('320921','3209','00,32,3209','响水县','32','江苏省','3209','盐城市','320921','响水县','','','','',3,1,''),('320922','3209','00,32,3209','滨海县','32','江苏省','3209','盐城市','320922','滨海县','','','','',3,1,''),('320923','3209','00,32,3209','阜宁县','32','江苏省','3209','盐城市','320923','阜宁县','','','','',3,1,''),('320924','3209','00,32,3209','射阳县','32','江苏省','3209','盐城市','320924','射阳县','','','','',3,1,''),('320925','3209','00,32,3209','建湖县','32','江苏省','3209','盐城市','320925','建湖县','','','','',3,1,''),('320981','3209','00,32,3209','东台市','32','江苏省','3209','盐城市','320981','东台市','','','','',3,1,''),('3210','32','00,32','扬州市','32','江苏省','3210','扬州市','','','','','','',2,1,''),('321002','3210','00,32,3210','广陵区','32','江苏省','3210','扬州市','321002','广陵区','','','','',3,1,''),('321003','3210','00,32,3210','邗江区','32','江苏省','3210','扬州市','321003','邗江区','','','','',3,1,''),('321012','3210','00,32,3210','江都区','32','江苏省','3210','扬州市','321012','江都区','','','','',3,1,''),('321023','3210','00,32,3210','宝应县','32','江苏省','3210','扬州市','321023','宝应县','','','','',3,1,''),('321081','3210','00,32,3210','仪征市','32','江苏省','3210','扬州市','321081','仪征市','','','','',3,1,''),('321084','3210','00,32,3210','高邮市','32','江苏省','3210','扬州市','321084','高邮市','','','','',3,1,''),('3211','32','00,32','镇江市','32','江苏省','3211','镇江市','','','','','','',2,1,''),('321102','3211','00,32,3211','京口区','32','江苏省','3211','镇江市','321102','京口区','','','','',3,1,''),('321111','3211','00,32,3211','润州区','32','江苏省','3211','镇江市','321111','润州区','','','','',3,1,''),('321112','3211','00,32,3211','丹徒区','32','江苏省','3211','镇江市','321112','丹徒区','','','','',3,1,''),('321181','3211','00,32,3211','丹阳市','32','江苏省','3211','镇江市','321181','丹阳市','','','','',3,1,''),('321182','3211','00,32,3211','扬中市','32','江苏省','3211','镇江市','321182','扬中市','','','','',3,1,''),('321183','3211','00,32,3211','句容市','32','江苏省','3211','镇江市','321183','句容市','','','','',3,1,''),('3212','32','00,32','泰州市','32','江苏省','3212','泰州市','','','','','','',2,1,''),('321202','3212','00,32,3212','海陵区','32','江苏省','3212','泰州市','321202','海陵区','','','','',3,1,''),('321203','3212','00,32,3212','高港区','32','江苏省','3212','泰州市','321203','高港区','','','','',3,1,''),('321204','3212','00,32,3212','姜堰区','32','江苏省','3212','泰州市','321204','姜堰区','','','','',3,1,''),('321281','3212','00,32,3212','兴化市','32','江苏省','3212','泰州市','321281','兴化市','','','','',3,1,''),('321282','3212','00,32,3212','靖江市','32','江苏省','3212','泰州市','321282','靖江市','','','','',3,1,''),('321283','3212','00,32,3212','泰兴市','32','江苏省','3212','泰州市','321283','泰兴市','','','','',3,1,''),('3213','32','00,32','宿迁市','32','江苏省','3213','宿迁市','','','','','','',2,1,''),('321302','3213','00,32,3213','宿城区','32','江苏省','3213','宿迁市','321302','宿城区','','','','',3,1,''),('321311','3213','00,32,3213','宿豫区','32','江苏省','3213','宿迁市','321311','宿豫区','','','','',3,1,''),('321322','3213','00,32,3213','沭阳县','32','江苏省','3213','宿迁市','321322','沭阳县','','','','',3,1,''),('321323','3213','00,32,3213','泗阳县','32','江苏省','3213','宿迁市','321323','泗阳县','','','','',3,1,''),('321324','3213','00,32,3213','泗洪县','32','江苏省','3213','宿迁市','321324','泗洪县','','','','',3,1,''),('33','00','00','浙江省','33','浙江省','','','','','','','','',1,1,''),('3301','33','00,33','杭州市','33','浙江省','3301','杭州市','','','','','','',2,1,''),('330102','3301','00,33,3301','上城区','33','浙江省','3301','杭州市','330102','上城区','','','','',3,1,''),('330103','3301','00,33,3301','下城区','33','浙江省','3301','杭州市','330103','下城区','','','','',3,1,''),('330104','3301','00,33,3301','江干区','33','浙江省','3301','杭州市','330104','江干区','','','','',3,1,''),('330105','3301','00,33,3301','拱墅区','33','浙江省','3301','杭州市','330105','拱墅区','','','','',3,1,''),('330106','3301','00,33,3301','西湖区','33','浙江省','3301','杭州市','330106','西湖区','','','','',3,1,''),('330108','3301','00,33,3301','滨江区','33','浙江省','3301','杭州市','330108','滨江区','','','','',3,1,''),('330109','3301','00,33,3301','萧山区','33','浙江省','3301','杭州市','330109','萧山区','','','','',3,1,''),('330110','3301','00,33,3301','余杭区','33','浙江省','3301','杭州市','330110','余杭区','','','','',3,1,''),('330111','3301','00,33,3301','富阳区','33','浙江省','3301','杭州市','330111','富阳区','','','','',3,1,''),('330112','3301','00,33,3301','临安区','33','浙江省','3301','杭州市','330112','临安区','','','','',3,1,''),('330122','3301','00,33,3301','桐庐县','33','浙江省','3301','杭州市','330122','桐庐县','','','','',3,1,''),('330127','3301','00,33,3301','淳安县','33','浙江省','3301','杭州市','330127','淳安县','','','','',3,1,''),('330182','3301','00,33,3301','建德市','33','浙江省','3301','杭州市','330182','建德市','','','','',3,1,''),('3302','33','00,33','宁波市','33','浙江省','3302','宁波市','','','','','','',2,1,''),('330203','3302','00,33,3302','海曙区','33','浙江省','3302','宁波市','330203','海曙区','','','','',3,1,''),('330205','3302','00,33,3302','江北区','33','浙江省','3302','宁波市','330205','江北区','','','','',3,1,''),('330206','3302','00,33,3302','北仑区','33','浙江省','3302','宁波市','330206','北仑区','','','','',3,1,''),('330211','3302','00,33,3302','镇海区','33','浙江省','3302','宁波市','330211','镇海区','','','','',3,1,''),('330212','3302','00,33,3302','鄞州区','33','浙江省','3302','宁波市','330212','鄞州区','','','','',3,1,''),('330213','3302','00,33,3302','奉化区','33','浙江省','3302','宁波市','330213','奉化区','','','','',3,1,''),('330225','3302','00,33,3302','象山县','33','浙江省','3302','宁波市','330225','象山县','','','','',3,1,''),('330226','3302','00,33,3302','宁海县','33','浙江省','3302','宁波市','330226','宁海县','','','','',3,1,''),('330281','3302','00,33,3302','余姚市','33','浙江省','3302','宁波市','330281','余姚市','','','','',3,1,''),('330282','3302','00,33,3302','慈溪市','33','浙江省','3302','宁波市','330282','慈溪市','','','','',3,1,''),('3303','33','00,33','温州市','33','浙江省','3303','温州市','','','','','','',2,1,''),('330302','3303','00,33,3303','鹿城区','33','浙江省','3303','温州市','330302','鹿城区','','','','',3,1,''),('330303','3303','00,33,3303','龙湾区','33','浙江省','3303','温州市','330303','龙湾区','','','','',3,1,''),('330304','3303','00,33,3303','瓯海区','33','浙江省','3303','温州市','330304','瓯海区','','','','',3,1,''),('330305','3303','00,33,3303','洞头区','33','浙江省','3303','温州市','330305','洞头区','','','','',3,1,''),('330324','3303','00,33,3303','永嘉县','33','浙江省','3303','温州市','330324','永嘉县','','','','',3,1,''),('330326','3303','00,33,3303','平阳县','33','浙江省','3303','温州市','330326','平阳县','','','','',3,1,''),('330327','3303','00,33,3303','苍南县','33','浙江省','3303','温州市','330327','苍南县','','','','',3,1,''),('330328','3303','00,33,3303','文成县','33','浙江省','3303','温州市','330328','文成县','','','','',3,1,''),('330329','3303','00,33,3303','泰顺县','33','浙江省','3303','温州市','330329','泰顺县','','','','',3,1,''),('330381','3303','00,33,3303','瑞安市','33','浙江省','3303','温州市','330381','瑞安市','','','','',3,1,''),('330382','3303','00,33,3303','乐清市','33','浙江省','3303','温州市','330382','乐清市','','','','',3,1,''),('330383','3303','00,33,3303','龙港市','33','浙江省','3303','温州市','330383','龙港市','','','','',3,1,''),('3304','33','00,33','嘉兴市','33','浙江省','3304','嘉兴市','','','','','','',2,1,''),('330402','3304','00,33,3304','南湖区','33','浙江省','3304','嘉兴市','330402','南湖区','','','','',3,1,''),('330411','3304','00,33,3304','秀洲区','33','浙江省','3304','嘉兴市','330411','秀洲区','','','','',3,1,''),('330421','3304','00,33,3304','嘉善县','33','浙江省','3304','嘉兴市','330421','嘉善县','','','','',3,1,''),('330424','3304','00,33,3304','海盐县','33','浙江省','3304','嘉兴市','330424','海盐县','','','','',3,1,''),('330481','3304','00,33,3304','海宁市','33','浙江省','3304','嘉兴市','330481','海宁市','','','','',3,1,''),('330482','3304','00,33,3304','平湖市','33','浙江省','3304','嘉兴市','330482','平湖市','','','','',3,1,''),('330483','3304','00,33,3304','桐乡市','33','浙江省','3304','嘉兴市','330483','桐乡市','','','','',3,1,''),('3305','33','00,33','湖州市','33','浙江省','3305','湖州市','','','','','','',2,1,''),('330502','3305','00,33,3305','吴兴区','33','浙江省','3305','湖州市','330502','吴兴区','','','','',3,1,''),('330503','3305','00,33,3305','南浔区','33','浙江省','3305','湖州市','330503','南浔区','','','','',3,1,''),('330521','3305','00,33,3305','德清县','33','浙江省','3305','湖州市','330521','德清县','','','','',3,1,''),('330522','3305','00,33,3305','长兴县','33','浙江省','3305','湖州市','330522','长兴县','','','','',3,1,''),('330523','3305','00,33,3305','安吉县','33','浙江省','3305','湖州市','330523','安吉县','','','','',3,1,''),('3306','33','00,33','绍兴市','33','浙江省','3306','绍兴市','','','','','','',2,1,''),('330602','3306','00,33,3306','越城区','33','浙江省','3306','绍兴市','330602','越城区','','','','',3,1,''),('330603','3306','00,33,3306','柯桥区','33','浙江省','3306','绍兴市','330603','柯桥区','','','','',3,1,''),('330604','3306','00,33,3306','上虞区','33','浙江省','3306','绍兴市','330604','上虞区','','','','',3,1,''),('330624','3306','00,33,3306','新昌县','33','浙江省','3306','绍兴市','330624','新昌县','','','','',3,1,''),('330681','3306','00,33,3306','诸暨市','33','浙江省','3306','绍兴市','330681','诸暨市','','','','',3,1,''),('330683','3306','00,33,3306','嵊州市','33','浙江省','3306','绍兴市','330683','嵊州市','','','','',3,1,''),('3307','33','00,33','金华市','33','浙江省','3307','金华市','','','','','','',2,1,''),('330702','3307','00,33,3307','婺城区','33','浙江省','3307','金华市','330702','婺城区','','','','',3,1,''),('330703','3307','00,33,3307','金东区','33','浙江省','3307','金华市','330703','金东区','','','','',3,1,''),('330723','3307','00,33,3307','武义县','33','浙江省','3307','金华市','330723','武义县','','','','',3,1,''),('330726','3307','00,33,3307','浦江县','33','浙江省','3307','金华市','330726','浦江县','','','','',3,1,''),('330727','3307','00,33,3307','磐安县','33','浙江省','3307','金华市','330727','磐安县','','','','',3,1,''),('330781','3307','00,33,3307','兰溪市','33','浙江省','3307','金华市','330781','兰溪市','','','','',3,1,''),('330782','3307','00,33,3307','义乌市','33','浙江省','3307','金华市','330782','义乌市','','','','',3,1,''),('330783','3307','00,33,3307','东阳市','33','浙江省','3307','金华市','330783','东阳市','','','','',3,1,''),('330784','3307','00,33,3307','永康市','33','浙江省','3307','金华市','330784','永康市','','','','',3,1,''),('3308','33','00,33','衢州市','33','浙江省','3308','衢州市','','','','','','',2,1,''),('330802','3308','00,33,3308','柯城区','33','浙江省','3308','衢州市','330802','柯城区','','','','',3,1,''),('330803','3308','00,33,3308','衢江区','33','浙江省','3308','衢州市','330803','衢江区','','','','',3,1,''),('330822','3308','00,33,3308','常山县','33','浙江省','3308','衢州市','330822','常山县','','','','',3,1,''),('330824','3308','00,33,3308','开化县','33','浙江省','3308','衢州市','330824','开化县','','','','',3,1,''),('330825','3308','00,33,3308','龙游县','33','浙江省','3308','衢州市','330825','龙游县','','','','',3,1,''),('330881','3308','00,33,3308','江山市','33','浙江省','3308','衢州市','330881','江山市','','','','',3,1,''),('3309','33','00,33','舟山市','33','浙江省','3309','舟山市','','','','','','',2,1,''),('330902','3309','00,33,3309','定海区','33','浙江省','3309','舟山市','330902','定海区','','','','',3,1,''),('330903','3309','00,33,3309','普陀区','33','浙江省','3309','舟山市','330903','普陀区','','','','',3,1,''),('330921','3309','00,33,3309','岱山县','33','浙江省','3309','舟山市','330921','岱山县','','','','',3,1,''),('330922','3309','00,33,3309','嵊泗县','33','浙江省','3309','舟山市','330922','嵊泗县','','','','',3,1,''),('3310','33','00,33','台州市','33','浙江省','3310','台州市','','','','','','',2,1,''),('331002','3310','00,33,3310','椒江区','33','浙江省','3310','台州市','331002','椒江区','','','','',3,1,''),('331003','3310','00,33,3310','黄岩区','33','浙江省','3310','台州市','331003','黄岩区','','','','',3,1,''),('331004','3310','00,33,3310','路桥区','33','浙江省','3310','台州市','331004','路桥区','','','','',3,1,''),('331022','3310','00,33,3310','三门县','33','浙江省','3310','台州市','331022','三门县','','','','',3,1,''),('331023','3310','00,33,3310','天台县','33','浙江省','3310','台州市','331023','天台县','','','','',3,1,''),('331024','3310','00,33,3310','仙居县','33','浙江省','3310','台州市','331024','仙居县','','','','',3,1,''),('331081','3310','00,33,3310','温岭市','33','浙江省','3310','台州市','331081','温岭市','','','','',3,1,''),('331082','3310','00,33,3310','临海市','33','浙江省','3310','台州市','331082','临海市','','','','',3,1,''),('331083','3310','00,33,3310','玉环市','33','浙江省','3310','台州市','331083','玉环市','','','','',3,1,''),('3311','33','00,33','丽水市','33','浙江省','3311','丽水市','','','','','','',2,1,''),('331102','3311','00,33,3311','莲都区','33','浙江省','3311','丽水市','331102','莲都区','','','','',3,1,''),('331121','3311','00,33,3311','青田县','33','浙江省','3311','丽水市','331121','青田县','','','','',3,1,''),('331122','3311','00,33,3311','缙云县','33','浙江省','3311','丽水市','331122','缙云县','','','','',3,1,''),('331123','3311','00,33,3311','遂昌县','33','浙江省','3311','丽水市','331123','遂昌县','','','','',3,1,''),('331124','3311','00,33,3311','松阳县','33','浙江省','3311','丽水市','331124','松阳县','','','','',3,1,''),('331125','3311','00,33,3311','云和县','33','浙江省','3311','丽水市','331125','云和县','','','','',3,1,''),('331126','3311','00,33,3311','庆元县','33','浙江省','3311','丽水市','331126','庆元县','','','','',3,1,''),('331127','3311','00,33,3311','景宁畲族自治县','33','浙江省','3311','丽水市','331127','景宁畲族自治县','','','','',3,1,''),('331181','3311','00,33,3311','龙泉市','33','浙江省','3311','丽水市','331181','龙泉市','','','','',3,1,''),('34','00','00','安徽省','34','安徽省','','','','','','','','',1,1,''),('3401','34','00,34','合肥市','34','安徽省','3401','合肥市','','','','','','',2,1,''),('340102','3401','00,34,3401','瑶海区','34','安徽省','3401','合肥市','340102','瑶海区','','','','',3,1,''),('340103','3401','00,34,3401','庐阳区','34','安徽省','3401','合肥市','340103','庐阳区','','','','',3,1,''),('340104','3401','00,34,3401','蜀山区','34','安徽省','3401','合肥市','340104','蜀山区','','','','',3,1,''),('340111','3401','00,34,3401','包河区','34','安徽省','3401','合肥市','340111','包河区','','','','',3,1,''),('340121','3401','00,34,3401','长丰县','34','安徽省','3401','合肥市','340121','长丰县','','','','',3,1,''),('340122','3401','00,34,3401','肥东县','34','安徽省','3401','合肥市','340122','肥东县','','','','',3,1,''),('340123','3401','00,34,3401','肥西县','34','安徽省','3401','合肥市','340123','肥西县','','','','',3,1,''),('340124','3401','00,34,3401','庐江县','34','安徽省','3401','合肥市','340124','庐江县','','','','',3,1,''),('340181','3401','00,34,3401','巢湖市','34','安徽省','3401','合肥市','340181','巢湖市','','','','',3,1,''),('3402','34','00,34','芜湖市','34','安徽省','3402','芜湖市','','','','','','',2,1,''),('340202','3402','00,34,3402','镜湖区','34','安徽省','3402','芜湖市','340202','镜湖区','','','','',3,1,''),('340203','3402','00,34,3402','弋江区','34','安徽省','3402','芜湖市','340203','弋江区','','','','',3,1,''),('340207','3402','00,34,3402','鸠江区','34','安徽省','3402','芜湖市','340207','鸠江区','','','','',3,1,''),('340208','3402','00,34,3402','三山区','34','安徽省','3402','芜湖市','340208','三山区','','','','',3,1,''),('340221','3402','00,34,3402','芜湖县','34','安徽省','3402','芜湖市','340221','芜湖县','','','','',3,1,''),('340222','3402','00,34,3402','繁昌县','34','安徽省','3402','芜湖市','340222','繁昌县','','','','',3,1,''),('340223','3402','00,34,3402','南陵县','34','安徽省','3402','芜湖市','340223','南陵县','','','','',3,1,''),('340281','3402','00,34,3402','无为市','34','安徽省','3402','芜湖市','340281','无为市','','','','',3,1,''),('3403','34','00,34','蚌埠市','34','安徽省','3403','蚌埠市','','','','','','',2,1,''),('340302','3403','00,34,3403','龙子湖区','34','安徽省','3403','蚌埠市','340302','龙子湖区','','','','',3,1,''),('340303','3403','00,34,3403','蚌山区','34','安徽省','3403','蚌埠市','340303','蚌山区','','','','',3,1,''),('340304','3403','00,34,3403','禹会区','34','安徽省','3403','蚌埠市','340304','禹会区','','','','',3,1,''),('340311','3403','00,34,3403','淮上区','34','安徽省','3403','蚌埠市','340311','淮上区','','','','',3,1,''),('340321','3403','00,34,3403','怀远县','34','安徽省','3403','蚌埠市','340321','怀远县','','','','',3,1,''),('340322','3403','00,34,3403','五河县','34','安徽省','3403','蚌埠市','340322','五河县','','','','',3,1,''),('340323','3403','00,34,3403','固镇县','34','安徽省','3403','蚌埠市','340323','固镇县','','','','',3,1,''),('3404','34','00,34','淮南市','34','安徽省','3404','淮南市','','','','','','',2,1,''),('340402','3404','00,34,3404','大通区','34','安徽省','3404','淮南市','340402','大通区','','','','',3,1,''),('340403','3404','00,34,3404','田家庵区','34','安徽省','3404','淮南市','340403','田家庵区','','','','',3,1,''),('340404','3404','00,34,3404','谢家集区','34','安徽省','3404','淮南市','340404','谢家集区','','','','',3,1,''),('340405','3404','00,34,3404','八公山区','34','安徽省','3404','淮南市','340405','八公山区','','','','',3,1,''),('340406','3404','00,34,3404','潘集区','34','安徽省','3404','淮南市','340406','潘集区','','','','',3,1,''),('340421','3404','00,34,3404','凤台县','34','安徽省','3404','淮南市','340421','凤台县','','','','',3,1,''),('340422','3404','00,34,3404','寿县','34','安徽省','3404','淮南市','340422','寿县','','','','',3,1,''),('3405','34','00,34','马鞍山市','34','安徽省','3405','马鞍山市','','','','','','',2,1,''),('340503','3405','00,34,3405','花山区','34','安徽省','3405','马鞍山市','340503','花山区','','','','',3,1,''),('340504','3405','00,34,3405','雨山区','34','安徽省','3405','马鞍山市','340504','雨山区','','','','',3,1,''),('340506','3405','00,34,3405','博望区','34','安徽省','3405','马鞍山市','340506','博望区','','','','',3,1,''),('340521','3405','00,34,3405','当涂县','34','安徽省','3405','马鞍山市','340521','当涂县','','','','',3,1,''),('340522','3405','00,34,3405','含山县','34','安徽省','3405','马鞍山市','340522','含山县','','','','',3,1,''),('340523','3405','00,34,3405','和县','34','安徽省','3405','马鞍山市','340523','和县','','','','',3,1,''),('3406','34','00,34','淮北市','34','安徽省','3406','淮北市','','','','','','',2,1,''),('340602','3406','00,34,3406','杜集区','34','安徽省','3406','淮北市','340602','杜集区','','','','',3,1,''),('340603','3406','00,34,3406','相山区','34','安徽省','3406','淮北市','340603','相山区','','','','',3,1,''),('340604','3406','00,34,3406','烈山区','34','安徽省','3406','淮北市','340604','烈山区','','','','',3,1,''),('340621','3406','00,34,3406','濉溪县','34','安徽省','3406','淮北市','340621','濉溪县','','','','',3,1,''),('3407','34','00,34','铜陵市','34','安徽省','3407','铜陵市','','','','','','',2,1,''),('340705','3407','00,34,3407','铜官区','34','安徽省','3407','铜陵市','340705','铜官区','','','','',3,1,''),('340706','3407','00,34,3407','义安区','34','安徽省','3407','铜陵市','340706','义安区','','','','',3,1,''),('340711','3407','00,34,3407','郊区','34','安徽省','3407','铜陵市','340711','郊区','','','','',3,1,''),('340722','3407','00,34,3407','枞阳县','34','安徽省','3407','铜陵市','340722','枞阳县','','','','',3,1,''),('3408','34','00,34','安庆市','34','安徽省','3408','安庆市','','','','','','',2,1,''),('340802','3408','00,34,3408','迎江区','34','安徽省','3408','安庆市','340802','迎江区','','','','',3,1,''),('340803','3408','00,34,3408','大观区','34','安徽省','3408','安庆市','340803','大观区','','','','',3,1,''),('340811','3408','00,34,3408','宜秀区','34','安徽省','3408','安庆市','340811','宜秀区','','','','',3,1,''),('340822','3408','00,34,3408','怀宁县','34','安徽省','3408','安庆市','340822','怀宁县','','','','',3,1,''),('340825','3408','00,34,3408','太湖县','34','安徽省','3408','安庆市','340825','太湖县','','','','',3,1,''),('340826','3408','00,34,3408','宿松县','34','安徽省','3408','安庆市','340826','宿松县','','','','',3,1,''),('340827','3408','00,34,3408','望江县','34','安徽省','3408','安庆市','340827','望江县','','','','',3,1,''),('340828','3408','00,34,3408','岳西县','34','安徽省','3408','安庆市','340828','岳西县','','','','',3,1,''),('340881','3408','00,34,3408','桐城市','34','安徽省','3408','安庆市','340881','桐城市','','','','',3,1,''),('340882','3408','00,34,3408','潜山市','34','安徽省','3408','安庆市','340882','潜山市','','','','',3,1,''),('3410','34','00,34','黄山市','34','安徽省','3410','黄山市','','','','','','',2,1,''),('341002','3410','00,34,3410','屯溪区','34','安徽省','3410','黄山市','341002','屯溪区','','','','',3,1,''),('341003','3410','00,34,3410','黄山区','34','安徽省','3410','黄山市','341003','黄山区','','','','',3,1,''),('341004','3410','00,34,3410','徽州区','34','安徽省','3410','黄山市','341004','徽州区','','','','',3,1,''),('341021','3410','00,34,3410','歙县','34','安徽省','3410','黄山市','341021','歙县','','','','',3,1,''),('341022','3410','00,34,3410','休宁县','34','安徽省','3410','黄山市','341022','休宁县','','','','',3,1,''),('341023','3410','00,34,3410','黟县','34','安徽省','3410','黄山市','341023','黟县','','','','',3,1,''),('341024','3410','00,34,3410','祁门县','34','安徽省','3410','黄山市','341024','祁门县','','','','',3,1,''),('3411','34','00,34','滁州市','34','安徽省','3411','滁州市','','','','','','',2,1,''),('341102','3411','00,34,3411','琅琊区','34','安徽省','3411','滁州市','341102','琅琊区','','','','',3,1,''),('341103','3411','00,34,3411','南谯区','34','安徽省','3411','滁州市','341103','南谯区','','','','',3,1,''),('341122','3411','00,34,3411','来安县','34','安徽省','3411','滁州市','341122','来安县','','','','',3,1,''),('341124','3411','00,34,3411','全椒县','34','安徽省','3411','滁州市','341124','全椒县','','','','',3,1,''),('341125','3411','00,34,3411','定远县','34','安徽省','3411','滁州市','341125','定远县','','','','',3,1,''),('341126','3411','00,34,3411','凤阳县','34','安徽省','3411','滁州市','341126','凤阳县','','','','',3,1,''),('341181','3411','00,34,3411','天长市','34','安徽省','3411','滁州市','341181','天长市','','','','',3,1,''),('341182','3411','00,34,3411','明光市','34','安徽省','3411','滁州市','341182','明光市','','','','',3,1,''),('3412','34','00,34','阜阳市','34','安徽省','3412','阜阳市','','','','','','',2,1,''),('341202','3412','00,34,3412','颍州区','34','安徽省','3412','阜阳市','341202','颍州区','','','','',3,1,''),('341203','3412','00,34,3412','颍东区','34','安徽省','3412','阜阳市','341203','颍东区','','','','',3,1,''),('341204','3412','00,34,3412','颍泉区','34','安徽省','3412','阜阳市','341204','颍泉区','','','','',3,1,''),('341221','3412','00,34,3412','临泉县','34','安徽省','3412','阜阳市','341221','临泉县','','','','',3,1,''),('341222','3412','00,34,3412','太和县','34','安徽省','3412','阜阳市','341222','太和县','','','','',3,1,''),('341225','3412','00,34,3412','阜南县','34','安徽省','3412','阜阳市','341225','阜南县','','','','',3,1,''),('341226','3412','00,34,3412','颍上县','34','安徽省','3412','阜阳市','341226','颍上县','','','','',3,1,''),('341282','3412','00,34,3412','界首市','34','安徽省','3412','阜阳市','341282','界首市','','','','',3,1,''),('3413','34','00,34','宿州市','34','安徽省','3413','宿州市','','','','','','',2,1,''),('341302','3413','00,34,3413','埇桥区','34','安徽省','3413','宿州市','341302','埇桥区','','','','',3,1,''),('341321','3413','00,34,3413','砀山县','34','安徽省','3413','宿州市','341321','砀山县','','','','',3,1,''),('341322','3413','00,34,3413','萧县','34','安徽省','3413','宿州市','341322','萧县','','','','',3,1,''),('341323','3413','00,34,3413','灵璧县','34','安徽省','3413','宿州市','341323','灵璧县','','','','',3,1,''),('341324','3413','00,34,3413','泗县','34','安徽省','3413','宿州市','341324','泗县','','','','',3,1,''),('3415','34','00,34','六安市','34','安徽省','3415','六安市','','','','','','',2,1,''),('341502','3415','00,34,3415','金安区','34','安徽省','3415','六安市','341502','金安区','','','','',3,1,''),('341503','3415','00,34,3415','裕安区','34','安徽省','3415','六安市','341503','裕安区','','','','',3,1,''),('341504','3415','00,34,3415','叶集区','34','安徽省','3415','六安市','341504','叶集区','','','','',3,1,''),('341522','3415','00,34,3415','霍邱县','34','安徽省','3415','六安市','341522','霍邱县','','','','',3,1,''),('341523','3415','00,34,3415','舒城县','34','安徽省','3415','六安市','341523','舒城县','','','','',3,1,''),('341524','3415','00,34,3415','金寨县','34','安徽省','3415','六安市','341524','金寨县','','','','',3,1,''),('341525','3415','00,34,3415','霍山县','34','安徽省','3415','六安市','341525','霍山县','','','','',3,1,''),('3416','34','00,34','亳州市','34','安徽省','3416','亳州市','','','','','','',2,1,''),('341602','3416','00,34,3416','谯城区','34','安徽省','3416','亳州市','341602','谯城区','','','','',3,1,''),('341621','3416','00,34,3416','涡阳县','34','安徽省','3416','亳州市','341621','涡阳县','','','','',3,1,''),('341622','3416','00,34,3416','蒙城县','34','安徽省','3416','亳州市','341622','蒙城县','','','','',3,1,''),('341623','3416','00,34,3416','利辛县','34','安徽省','3416','亳州市','341623','利辛县','','','','',3,1,''),('3417','34','00,34','池州市','34','安徽省','3417','池州市','','','','','','',2,1,''),('341702','3417','00,34,3417','贵池区','34','安徽省','3417','池州市','341702','贵池区','','','','',3,1,''),('341721','3417','00,34,3417','东至县','34','安徽省','3417','池州市','341721','东至县','','','','',3,1,''),('341722','3417','00,34,3417','石台县','34','安徽省','3417','池州市','341722','石台县','','','','',3,1,''),('341723','3417','00,34,3417','青阳县','34','安徽省','3417','池州市','341723','青阳县','','','','',3,1,''),('3418','34','00,34','宣城市','34','安徽省','3418','宣城市','','','','','','',2,1,''),('341802','3418','00,34,3418','宣州区','34','安徽省','3418','宣城市','341802','宣州区','','','','',3,1,''),('341821','3418','00,34,3418','郎溪县','34','安徽省','3418','宣城市','341821','郎溪县','','','','',3,1,''),('341823','3418','00,34,3418','泾县','34','安徽省','3418','宣城市','341823','泾县','','','','',3,1,''),('341824','3418','00,34,3418','绩溪县','34','安徽省','3418','宣城市','341824','绩溪县','','','','',3,1,''),('341825','3418','00,34,3418','旌德县','34','安徽省','3418','宣城市','341825','旌德县','','','','',3,1,''),('341881','3418','00,34,3418','宁国市','34','安徽省','3418','宣城市','341881','宁国市','','','','',3,1,''),('341882','3418','00,34,3418','广德市','34','安徽省','3418','宣城市','341882','广德市','','','','',3,1,''),('35','00','00','福建省','35','福建省','','','','','','','','',1,1,''),('3501','35','00,35','福州市','35','福建省','3501','福州市','','','','','','',2,1,''),('350102','3501','00,35,3501','鼓楼区','35','福建省','3501','福州市','350102','鼓楼区','','','','',3,1,''),('350103','3501','00,35,3501','台江区','35','福建省','3501','福州市','350103','台江区','','','','',3,1,''),('350104','3501','00,35,3501','仓山区','35','福建省','3501','福州市','350104','仓山区','','','','',3,1,''),('350105','3501','00,35,3501','马尾区','35','福建省','3501','福州市','350105','马尾区','','','','',3,1,''),('350111','3501','00,35,3501','晋安区','35','福建省','3501','福州市','350111','晋安区','','','','',3,1,''),('350112','3501','00,35,3501','长乐区','35','福建省','3501','福州市','350112','长乐区','','','','',3,1,''),('350121','3501','00,35,3501','闽侯县','35','福建省','3501','福州市','350121','闽侯县','','','','',3,1,''),('350122','3501','00,35,3501','连江县','35','福建省','3501','福州市','350122','连江县','','','','',3,1,''),('350123','3501','00,35,3501','罗源县','35','福建省','3501','福州市','350123','罗源县','','','','',3,1,''),('350124','3501','00,35,3501','闽清县','35','福建省','3501','福州市','350124','闽清县','','','','',3,1,''),('350125','3501','00,35,3501','永泰县','35','福建省','3501','福州市','350125','永泰县','','','','',3,1,''),('350128','3501','00,35,3501','平潭县','35','福建省','3501','福州市','350128','平潭县','','','','',3,1,''),('350181','3501','00,35,3501','福清市','35','福建省','3501','福州市','350181','福清市','','','','',3,1,''),('3502','35','00,35','厦门市','35','福建省','3502','厦门市','','','','','','',2,1,''),('350203','3502','00,35,3502','思明区','35','福建省','3502','厦门市','350203','思明区','','','','',3,1,''),('350205','3502','00,35,3502','海沧区','35','福建省','3502','厦门市','350205','海沧区','','','','',3,1,''),('350206','3502','00,35,3502','湖里区','35','福建省','3502','厦门市','350206','湖里区','','','','',3,1,''),('350211','3502','00,35,3502','集美区','35','福建省','3502','厦门市','350211','集美区','','','','',3,1,''),('350212','3502','00,35,3502','同安区','35','福建省','3502','厦门市','350212','同安区','','','','',3,1,''),('350213','3502','00,35,3502','翔安区','35','福建省','3502','厦门市','350213','翔安区','','','','',3,1,''),('3503','35','00,35','莆田市','35','福建省','3503','莆田市','','','','','','',2,1,''),('350302','3503','00,35,3503','城厢区','35','福建省','3503','莆田市','350302','城厢区','','','','',3,1,''),('350303','3503','00,35,3503','涵江区','35','福建省','3503','莆田市','350303','涵江区','','','','',3,1,''),('350304','3503','00,35,3503','荔城区','35','福建省','3503','莆田市','350304','荔城区','','','','',3,1,''),('350305','3503','00,35,3503','秀屿区','35','福建省','3503','莆田市','350305','秀屿区','','','','',3,1,''),('350322','3503','00,35,3503','仙游县','35','福建省','3503','莆田市','350322','仙游县','','','','',3,1,''),('3504','35','00,35','三明市','35','福建省','3504','三明市','','','','','','',2,1,''),('350402','3504','00,35,3504','梅列区','35','福建省','3504','三明市','350402','梅列区','','','','',3,1,''),('350403','3504','00,35,3504','三元区','35','福建省','3504','三明市','350403','三元区','','','','',3,1,''),('350421','3504','00,35,3504','明溪县','35','福建省','3504','三明市','350421','明溪县','','','','',3,1,''),('350423','3504','00,35,3504','清流县','35','福建省','3504','三明市','350423','清流县','','','','',3,1,''),('350424','3504','00,35,3504','宁化县','35','福建省','3504','三明市','350424','宁化县','','','','',3,1,''),('350425','3504','00,35,3504','大田县','35','福建省','3504','三明市','350425','大田县','','','','',3,1,''),('350426','3504','00,35,3504','尤溪县','35','福建省','3504','三明市','350426','尤溪县','','','','',3,1,''),('350427','3504','00,35,3504','沙县','35','福建省','3504','三明市','350427','沙县','','','','',3,1,''),('350428','3504','00,35,3504','将乐县','35','福建省','3504','三明市','350428','将乐县','','','','',3,1,''),('350429','3504','00,35,3504','泰宁县','35','福建省','3504','三明市','350429','泰宁县','','','','',3,1,''),('350430','3504','00,35,3504','建宁县','35','福建省','3504','三明市','350430','建宁县','','','','',3,1,''),('350481','3504','00,35,3504','永安市','35','福建省','3504','三明市','350481','永安市','','','','',3,1,''),('3505','35','00,35','泉州市','35','福建省','3505','泉州市','','','','','','',2,1,''),('350502','3505','00,35,3505','鲤城区','35','福建省','3505','泉州市','350502','鲤城区','','','','',3,1,''),('350503','3505','00,35,3505','丰泽区','35','福建省','3505','泉州市','350503','丰泽区','','','','',3,1,''),('350504','3505','00,35,3505','洛江区','35','福建省','3505','泉州市','350504','洛江区','','','','',3,1,''),('350505','3505','00,35,3505','泉港区','35','福建省','3505','泉州市','350505','泉港区','','','','',3,1,''),('350521','3505','00,35,3505','惠安县','35','福建省','3505','泉州市','350521','惠安县','','','','',3,1,''),('350524','3505','00,35,3505','安溪县','35','福建省','3505','泉州市','350524','安溪县','','','','',3,1,''),('350525','3505','00,35,3505','永春县','35','福建省','3505','泉州市','350525','永春县','','','','',3,1,''),('350526','3505','00,35,3505','德化县','35','福建省','3505','泉州市','350526','德化县','','','','',3,1,''),('350527','3505','00,35,3505','金门县','35','福建省','3505','泉州市','350527','金门县','','','','',3,1,''),('350581','3505','00,35,3505','石狮市','35','福建省','3505','泉州市','350581','石狮市','','','','',3,1,''),('350582','3505','00,35,3505','晋江市','35','福建省','3505','泉州市','350582','晋江市','','','','',3,1,''),('350583','3505','00,35,3505','南安市','35','福建省','3505','泉州市','350583','南安市','','','','',3,1,''),('3506','35','00,35','漳州市','35','福建省','3506','漳州市','','','','','','',2,1,''),('350602','3506','00,35,3506','芗城区','35','福建省','3506','漳州市','350602','芗城区','','','','',3,1,''),('350603','3506','00,35,3506','龙文区','35','福建省','3506','漳州市','350603','龙文区','','','','',3,1,''),('350622','3506','00,35,3506','云霄县','35','福建省','3506','漳州市','350622','云霄县','','','','',3,1,''),('350623','3506','00,35,3506','漳浦县','35','福建省','3506','漳州市','350623','漳浦县','','','','',3,1,''),('350624','3506','00,35,3506','诏安县','35','福建省','3506','漳州市','350624','诏安县','','','','',3,1,''),('350625','3506','00,35,3506','长泰县','35','福建省','3506','漳州市','350625','长泰县','','','','',3,1,''),('350626','3506','00,35,3506','东山县','35','福建省','3506','漳州市','350626','东山县','','','','',3,1,''),('350627','3506','00,35,3506','南靖县','35','福建省','3506','漳州市','350627','南靖县','','','','',3,1,''),('350628','3506','00,35,3506','平和县','35','福建省','3506','漳州市','350628','平和县','','','','',3,1,''),('350629','3506','00,35,3506','华安县','35','福建省','3506','漳州市','350629','华安县','','','','',3,1,''),('350681','3506','00,35,3506','龙海市','35','福建省','3506','漳州市','350681','龙海市','','','','',3,1,''),('3507','35','00,35','南平市','35','福建省','3507','南平市','','','','','','',2,1,''),('350702','3507','00,35,3507','延平区','35','福建省','3507','南平市','350702','延平区','','','','',3,1,''),('350703','3507','00,35,3507','建阳区','35','福建省','3507','南平市','350703','建阳区','','','','',3,1,''),('350721','3507','00,35,3507','顺昌县','35','福建省','3507','南平市','350721','顺昌县','','','','',3,1,''),('350722','3507','00,35,3507','浦城县','35','福建省','3507','南平市','350722','浦城县','','','','',3,1,''),('350723','3507','00,35,3507','光泽县','35','福建省','3507','南平市','350723','光泽县','','','','',3,1,''),('350724','3507','00,35,3507','松溪县','35','福建省','3507','南平市','350724','松溪县','','','','',3,1,''),('350725','3507','00,35,3507','政和县','35','福建省','3507','南平市','350725','政和县','','','','',3,1,''),('350781','3507','00,35,3507','邵武市','35','福建省','3507','南平市','350781','邵武市','','','','',3,1,''),('350782','3507','00,35,3507','武夷山市','35','福建省','3507','南平市','350782','武夷山市','','','','',3,1,''),('350783','3507','00,35,3507','建瓯市','35','福建省','3507','南平市','350783','建瓯市','','','','',3,1,''),('3508','35','00,35','龙岩市','35','福建省','3508','龙岩市','','','','','','',2,1,''),('350802','3508','00,35,3508','新罗区','35','福建省','3508','龙岩市','350802','新罗区','','','','',3,1,''),('350803','3508','00,35,3508','永定区','35','福建省','3508','龙岩市','350803','永定区','','','','',3,1,''),('350821','3508','00,35,3508','长汀县','35','福建省','3508','龙岩市','350821','长汀县','','','','',3,1,''),('350823','3508','00,35,3508','上杭县','35','福建省','3508','龙岩市','350823','上杭县','','','','',3,1,''),('350824','3508','00,35,3508','武平县','35','福建省','3508','龙岩市','350824','武平县','','','','',3,1,''),('350825','3508','00,35,3508','连城县','35','福建省','3508','龙岩市','350825','连城县','','','','',3,1,''),('350881','3508','00,35,3508','漳平市','35','福建省','3508','龙岩市','350881','漳平市','','','','',3,1,''),('3509','35','00,35','宁德市','35','福建省','3509','宁德市','','','','','','',2,1,''),('350902','3509','00,35,3509','蕉城区','35','福建省','3509','宁德市','350902','蕉城区','','','','',3,1,''),('350921','3509','00,35,3509','霞浦县','35','福建省','3509','宁德市','350921','霞浦县','','','','',3,1,''),('350922','3509','00,35,3509','古田县','35','福建省','3509','宁德市','350922','古田县','','','','',3,1,''),('350923','3509','00,35,3509','屏南县','35','福建省','3509','宁德市','350923','屏南县','','','','',3,1,''),('350924','3509','00,35,3509','寿宁县','35','福建省','3509','宁德市','350924','寿宁县','','','','',3,1,''),('350925','3509','00,35,3509','周宁县','35','福建省','3509','宁德市','350925','周宁县','','','','',3,1,''),('350926','3509','00,35,3509','柘荣县','35','福建省','3509','宁德市','350926','柘荣县','','','','',3,1,''),('350981','3509','00,35,3509','福安市','35','福建省','3509','宁德市','350981','福安市','','','','',3,1,''),('350982','3509','00,35,3509','福鼎市','35','福建省','3509','宁德市','350982','福鼎市','','','','',3,1,''),('36','00','00','江西省','36','江西省','','','','','','','','',1,1,''),('3601','36','00,36','南昌市','36','江西省','3601','南昌市','','','','','','',2,1,''),('360102','3601','00,36,3601','东湖区','36','江西省','3601','南昌市','360102','东湖区','','','','',3,1,''),('360103','3601','00,36,3601','西湖区','36','江西省','3601','南昌市','360103','西湖区','','','','',3,1,''),('360104','3601','00,36,3601','青云谱区','36','江西省','3601','南昌市','360104','青云谱区','','','','',3,1,''),('360111','3601','00,36,3601','青山湖区','36','江西省','3601','南昌市','360111','青山湖区','','','','',3,1,''),('360112','3601','00,36,3601','新建区','36','江西省','3601','南昌市','360112','新建区','','','','',3,1,''),('360113','3601','00,36,3601','红谷滩区','36','江西省','3601','南昌市','360113','红谷滩区','','','','',3,1,''),('360121','3601','00,36,3601','南昌县','36','江西省','3601','南昌市','360121','南昌县','','','','',3,1,''),('360123','3601','00,36,3601','安义县','36','江西省','3601','南昌市','360123','安义县','','','','',3,1,''),('360124','3601','00,36,3601','进贤县','36','江西省','3601','南昌市','360124','进贤县','','','','',3,1,''),('3602','36','00,36','景德镇市','36','江西省','3602','景德镇市','','','','','','',2,1,''),('360202','3602','00,36,3602','昌江区','36','江西省','3602','景德镇市','360202','昌江区','','','','',3,1,''),('360203','3602','00,36,3602','珠山区','36','江西省','3602','景德镇市','360203','珠山区','','','','',3,1,''),('360222','3602','00,36,3602','浮梁县','36','江西省','3602','景德镇市','360222','浮梁县','','','','',3,1,''),('360281','3602','00,36,3602','乐平市','36','江西省','3602','景德镇市','360281','乐平市','','','','',3,1,''),('3603','36','00,36','萍乡市','36','江西省','3603','萍乡市','','','','','','',2,1,''),('360302','3603','00,36,3603','安源区','36','江西省','3603','萍乡市','360302','安源区','','','','',3,1,''),('360313','3603','00,36,3603','湘东区','36','江西省','3603','萍乡市','360313','湘东区','','','','',3,1,''),('360321','3603','00,36,3603','莲花县','36','江西省','3603','萍乡市','360321','莲花县','','','','',3,1,''),('360322','3603','00,36,3603','上栗县','36','江西省','3603','萍乡市','360322','上栗县','','','','',3,1,''),('360323','3603','00,36,3603','芦溪县','36','江西省','3603','萍乡市','360323','芦溪县','','','','',3,1,''),('3604','36','00,36','九江市','36','江西省','3604','九江市','','','','','','',2,1,''),('360402','3604','00,36,3604','濂溪区','36','江西省','3604','九江市','360402','濂溪区','','','','',3,1,''),('360403','3604','00,36,3604','浔阳区','36','江西省','3604','九江市','360403','浔阳区','','','','',3,1,''),('360404','3604','00,36,3604','柴桑区','36','江西省','3604','九江市','360404','柴桑区','','','','',3,1,''),('360423','3604','00,36,3604','武宁县','36','江西省','3604','九江市','360423','武宁县','','','','',3,1,''),('360424','3604','00,36,3604','修水县','36','江西省','3604','九江市','360424','修水县','','','','',3,1,''),('360425','3604','00,36,3604','永修县','36','江西省','3604','九江市','360425','永修县','','','','',3,1,''),('360426','3604','00,36,3604','德安县','36','江西省','3604','九江市','360426','德安县','','','','',3,1,''),('360428','3604','00,36,3604','都昌县','36','江西省','3604','九江市','360428','都昌县','','','','',3,1,''),('360429','3604','00,36,3604','湖口县','36','江西省','3604','九江市','360429','湖口县','','','','',3,1,''),('360430','3604','00,36,3604','彭泽县','36','江西省','3604','九江市','360430','彭泽县','','','','',3,1,''),('360481','3604','00,36,3604','瑞昌市','36','江西省','3604','九江市','360481','瑞昌市','','','','',3,1,''),('360482','3604','00,36,3604','共青城市','36','江西省','3604','九江市','360482','共青城市','','','','',3,1,''),('360483','3604','00,36,3604','庐山市','36','江西省','3604','九江市','360483','庐山市','','','','',3,1,''),('3605','36','00,36','新余市','36','江西省','3605','新余市','','','','','','',2,1,''),('360502','3605','00,36,3605','渝水区','36','江西省','3605','新余市','360502','渝水区','','','','',3,1,''),('360521','3605','00,36,3605','分宜县','36','江西省','3605','新余市','360521','分宜县','','','','',3,1,''),('3606','36','00,36','鹰潭市','36','江西省','3606','鹰潭市','','','','','','',2,1,''),('360602','3606','00,36,3606','月湖区','36','江西省','3606','鹰潭市','360602','月湖区','','','','',3,1,''),('360603','3606','00,36,3606','余江区','36','江西省','3606','鹰潭市','360603','余江区','','','','',3,1,''),('360681','3606','00,36,3606','贵溪市','36','江西省','3606','鹰潭市','360681','贵溪市','','','','',3,1,''),('3607','36','00,36','赣州市','36','江西省','3607','赣州市','','','','','','',2,1,''),('360702','3607','00,36,3607','章贡区','36','江西省','3607','赣州市','360702','章贡区','','','','',3,1,''),('360703','3607','00,36,3607','南康区','36','江西省','3607','赣州市','360703','南康区','','','','',3,1,''),('360704','3607','00,36,3607','赣县区','36','江西省','3607','赣州市','360704','赣县区','','','','',3,1,''),('360722','3607','00,36,3607','信丰县','36','江西省','3607','赣州市','360722','信丰县','','','','',3,1,''),('360723','3607','00,36,3607','大余县','36','江西省','3607','赣州市','360723','大余县','','','','',3,1,''),('360724','3607','00,36,3607','上犹县','36','江西省','3607','赣州市','360724','上犹县','','','','',3,1,''),('360725','3607','00,36,3607','崇义县','36','江西省','3607','赣州市','360725','崇义县','','','','',3,1,''),('360726','3607','00,36,3607','安远县','36','江西省','3607','赣州市','360726','安远县','','','','',3,1,''),('360727','3607','00,36,3607','龙南县','36','江西省','3607','赣州市','360727','龙南县','','','','',3,1,''),('360728','3607','00,36,3607','定南县','36','江西省','3607','赣州市','360728','定南县','','','','',3,1,''),('360729','3607','00,36,3607','全南县','36','江西省','3607','赣州市','360729','全南县','','','','',3,1,''),('360730','3607','00,36,3607','宁都县','36','江西省','3607','赣州市','360730','宁都县','','','','',3,1,''),('360731','3607','00,36,3607','于都县','36','江西省','3607','赣州市','360731','于都县','','','','',3,1,''),('360732','3607','00,36,3607','兴国县','36','江西省','3607','赣州市','360732','兴国县','','','','',3,1,''),('360733','3607','00,36,3607','会昌县','36','江西省','3607','赣州市','360733','会昌县','','','','',3,1,''),('360734','3607','00,36,3607','寻乌县','36','江西省','3607','赣州市','360734','寻乌县','','','','',3,1,''),('360735','3607','00,36,3607','石城县','36','江西省','3607','赣州市','360735','石城县','','','','',3,1,''),('360781','3607','00,36,3607','瑞金市','36','江西省','3607','赣州市','360781','瑞金市','','','','',3,1,''),('3608','36','00,36','吉安市','36','江西省','3608','吉安市','','','','','','',2,1,''),('360802','3608','00,36,3608','吉州区','36','江西省','3608','吉安市','360802','吉州区','','','','',3,1,''),('360803','3608','00,36,3608','青原区','36','江西省','3608','吉安市','360803','青原区','','','','',3,1,''),('360821','3608','00,36,3608','吉安县','36','江西省','3608','吉安市','360821','吉安县','','','','',3,1,''),('360822','3608','00,36,3608','吉水县','36','江西省','3608','吉安市','360822','吉水县','','','','',3,1,''),('360823','3608','00,36,3608','峡江县','36','江西省','3608','吉安市','360823','峡江县','','','','',3,1,''),('360824','3608','00,36,3608','新干县','36','江西省','3608','吉安市','360824','新干县','','','','',3,1,''),('360825','3608','00,36,3608','永丰县','36','江西省','3608','吉安市','360825','永丰县','','','','',3,1,''),('360826','3608','00,36,3608','泰和县','36','江西省','3608','吉安市','360826','泰和县','','','','',3,1,''),('360827','3608','00,36,3608','遂川县','36','江西省','3608','吉安市','360827','遂川县','','','','',3,1,''),('360828','3608','00,36,3608','万安县','36','江西省','3608','吉安市','360828','万安县','','','','',3,1,''),('360829','3608','00,36,3608','安福县','36','江西省','3608','吉安市','360829','安福县','','','','',3,1,''),('360830','3608','00,36,3608','永新县','36','江西省','3608','吉安市','360830','永新县','','','','',3,1,''),('360881','3608','00,36,3608','井冈山市','36','江西省','3608','吉安市','360881','井冈山市','','','','',3,1,''),('3609','36','00,36','宜春市','36','江西省','3609','宜春市','','','','','','',2,1,''),('360902','3609','00,36,3609','袁州区','36','江西省','3609','宜春市','360902','袁州区','','','','',3,1,''),('360921','3609','00,36,3609','奉新县','36','江西省','3609','宜春市','360921','奉新县','','','','',3,1,''),('360922','3609','00,36,3609','万载县','36','江西省','3609','宜春市','360922','万载县','','','','',3,1,''),('360923','3609','00,36,3609','上高县','36','江西省','3609','宜春市','360923','上高县','','','','',3,1,''),('360924','3609','00,36,3609','宜丰县','36','江西省','3609','宜春市','360924','宜丰县','','','','',3,1,''),('360925','3609','00,36,3609','靖安县','36','江西省','3609','宜春市','360925','靖安县','','','','',3,1,''),('360926','3609','00,36,3609','铜鼓县','36','江西省','3609','宜春市','360926','铜鼓县','','','','',3,1,''),('360981','3609','00,36,3609','丰城市','36','江西省','3609','宜春市','360981','丰城市','','','','',3,1,''),('360982','3609','00,36,3609','樟树市','36','江西省','3609','宜春市','360982','樟树市','','','','',3,1,''),('360983','3609','00,36,3609','高安市','36','江西省','3609','宜春市','360983','高安市','','','','',3,1,''),('3610','36','00,36','抚州市','36','江西省','3610','抚州市','','','','','','',2,1,''),('361002','3610','00,36,3610','临川区','36','江西省','3610','抚州市','361002','临川区','','','','',3,1,''),('361003','3610','00,36,3610','东乡区','36','江西省','3610','抚州市','361003','东乡区','','','','',3,1,''),('361021','3610','00,36,3610','南城县','36','江西省','3610','抚州市','361021','南城县','','','','',3,1,''),('361022','3610','00,36,3610','黎川县','36','江西省','3610','抚州市','361022','黎川县','','','','',3,1,''),('361023','3610','00,36,3610','南丰县','36','江西省','3610','抚州市','361023','南丰县','','','','',3,1,''),('361024','3610','00,36,3610','崇仁县','36','江西省','3610','抚州市','361024','崇仁县','','','','',3,1,''),('361025','3610','00,36,3610','乐安县','36','江西省','3610','抚州市','361025','乐安县','','','','',3,1,''),('361026','3610','00,36,3610','宜黄县','36','江西省','3610','抚州市','361026','宜黄县','','','','',3,1,''),('361027','3610','00,36,3610','金溪县','36','江西省','3610','抚州市','361027','金溪县','','','','',3,1,''),('361028','3610','00,36,3610','资溪县','36','江西省','3610','抚州市','361028','资溪县','','','','',3,1,''),('361030','3610','00,36,3610','广昌县','36','江西省','3610','抚州市','361030','广昌县','','','','',3,1,''),('3611','36','00,36','上饶市','36','江西省','3611','上饶市','','','','','','',2,1,''),('361102','3611','00,36,3611','信州区','36','江西省','3611','上饶市','361102','信州区','','','','',3,1,''),('361103','3611','00,36,3611','广丰区','36','江西省','3611','上饶市','361103','广丰区','','','','',3,1,''),('361104','3611','00,36,3611','广信区','36','江西省','3611','上饶市','361104','广信区','','','','',3,1,''),('361123','3611','00,36,3611','玉山县','36','江西省','3611','上饶市','361123','玉山县','','','','',3,1,''),('361124','3611','00,36,3611','铅山县','36','江西省','3611','上饶市','361124','铅山县','','','','',3,1,''),('361125','3611','00,36,3611','横峰县','36','江西省','3611','上饶市','361125','横峰县','','','','',3,1,''),('361126','3611','00,36,3611','弋阳县','36','江西省','3611','上饶市','361126','弋阳县','','','','',3,1,''),('361127','3611','00,36,3611','余干县','36','江西省','3611','上饶市','361127','余干县','','','','',3,1,''),('361128','3611','00,36,3611','鄱阳县','36','江西省','3611','上饶市','361128','鄱阳县','','','','',3,1,''),('361129','3611','00,36,3611','万年县','36','江西省','3611','上饶市','361129','万年县','','','','',3,1,''),('361130','3611','00,36,3611','婺源县','36','江西省','3611','上饶市','361130','婺源县','','','','',3,1,''),('361181','3611','00,36,3611','德兴市','36','江西省','3611','上饶市','361181','德兴市','','','','',3,1,''),('37','00','00','山东省','37','山东省','','','','','','','','',1,1,''),('3701','37','00,37','济南市','37','山东省','3701','济南市','','','','','','',2,1,''),('370102','3701','00,37,3701','历下区','37','山东省','3701','济南市','370102','历下区','','','','',3,1,''),('370103','3701','00,37,3701','市中区','37','山东省','3701','济南市','370103','市中区','','','','',3,1,''),('370104','3701','00,37,3701','槐荫区','37','山东省','3701','济南市','370104','槐荫区','','','','',3,1,''),('370105','3701','00,37,3701','天桥区','37','山东省','3701','济南市','370105','天桥区','','','','',3,1,''),('370112','3701','00,37,3701','历城区','37','山东省','3701','济南市','370112','历城区','','','','',3,1,''),('370113','3701','00,37,3701','长清区','37','山东省','3701','济南市','370113','长清区','','','','',3,1,''),('370114','3701','00,37,3701','章丘区','37','山东省','3701','济南市','370114','章丘区','','','','',3,1,''),('370115','3701','00,37,3701','济阳区','37','山东省','3701','济南市','370115','济阳区','','','','',3,1,''),('370116','3701','00,37,3701','莱芜区','37','山东省','3701','济南市','370116','莱芜区','','','','',3,1,''),('370117','3701','00,37,3701','钢城区','37','山东省','3701','济南市','370117','钢城区','','','','',3,1,''),('370124','3701','00,37,3701','平阴县','37','山东省','3701','济南市','370124','平阴县','','','','',3,1,''),('370126','3701','00,37,3701','商河县','37','山东省','3701','济南市','370126','商河县','','','','',3,1,''),('3702','37','00,37','青岛市','37','山东省','3702','青岛市','','','','','','',2,1,''),('370202','3702','00,37,3702','市南区','37','山东省','3702','青岛市','370202','市南区','','','','',3,1,''),('370203','3702','00,37,3702','市北区','37','山东省','3702','青岛市','370203','市北区','','','','',3,1,''),('370211','3702','00,37,3702','黄岛区','37','山东省','3702','青岛市','370211','黄岛区','','','','',3,1,''),('370212','3702','00,37,3702','崂山区','37','山东省','3702','青岛市','370212','崂山区','','','','',3,1,''),('370213','3702','00,37,3702','李沧区','37','山东省','3702','青岛市','370213','李沧区','','','','',3,1,''),('370214','3702','00,37,3702','城阳区','37','山东省','3702','青岛市','370214','城阳区','','','','',3,1,''),('370215','3702','00,37,3702','即墨区','37','山东省','3702','青岛市','370215','即墨区','','','','',3,1,''),('370281','3702','00,37,3702','胶州市','37','山东省','3702','青岛市','370281','胶州市','','','','',3,1,''),('370283','3702','00,37,3702','平度市','37','山东省','3702','青岛市','370283','平度市','','','','',3,1,''),('370285','3702','00,37,3702','莱西市','37','山东省','3702','青岛市','370285','莱西市','','','','',3,1,''),('3703','37','00,37','淄博市','37','山东省','3703','淄博市','','','','','','',2,1,''),('370302','3703','00,37,3703','淄川区','37','山东省','3703','淄博市','370302','淄川区','','','','',3,1,''),('370303','3703','00,37,3703','张店区','37','山东省','3703','淄博市','370303','张店区','','','','',3,1,''),('370304','3703','00,37,3703','博山区','37','山东省','3703','淄博市','370304','博山区','','','','',3,1,''),('370305','3703','00,37,3703','临淄区','37','山东省','3703','淄博市','370305','临淄区','','','','',3,1,''),('370306','3703','00,37,3703','周村区','37','山东省','3703','淄博市','370306','周村区','','','','',3,1,''),('370321','3703','00,37,3703','桓台县','37','山东省','3703','淄博市','370321','桓台县','','','','',3,1,''),('370322','3703','00,37,3703','高青县','37','山东省','3703','淄博市','370322','高青县','','','','',3,1,''),('370323','3703','00,37,3703','沂源县','37','山东省','3703','淄博市','370323','沂源县','','','','',3,1,''),('3704','37','00,37','枣庄市','37','山东省','3704','枣庄市','','','','','','',2,1,''),('370402','3704','00,37,3704','市中区','37','山东省','3704','枣庄市','370402','市中区','','','','',3,1,''),('370403','3704','00,37,3704','薛城区','37','山东省','3704','枣庄市','370403','薛城区','','','','',3,1,''),('370404','3704','00,37,3704','峄城区','37','山东省','3704','枣庄市','370404','峄城区','','','','',3,1,''),('370405','3704','00,37,3704','台儿庄区','37','山东省','3704','枣庄市','370405','台儿庄区','','','','',3,1,''),('370406','3704','00,37,3704','山亭区','37','山东省','3704','枣庄市','370406','山亭区','','','','',3,1,''),('370481','3704','00,37,3704','滕州市','37','山东省','3704','枣庄市','370481','滕州市','','','','',3,1,''),('3705','37','00,37','东营市','37','山东省','3705','东营市','','','','','','',2,1,''),('370502','3705','00,37,3705','东营区','37','山东省','3705','东营市','370502','东营区','','','','',3,1,''),('370503','3705','00,37,3705','河口区','37','山东省','3705','东营市','370503','河口区','','','','',3,1,''),('370505','3705','00,37,3705','垦利区','37','山东省','3705','东营市','370505','垦利区','','','','',3,1,''),('370522','3705','00,37,3705','利津县','37','山东省','3705','东营市','370522','利津县','','','','',3,1,''),('370523','3705','00,37,3705','广饶县','37','山东省','3705','东营市','370523','广饶县','','','','',3,1,''),('3706','37','00,37','烟台市','37','山东省','3706','烟台市','','','','','','',2,1,''),('370602','3706','00,37,3706','芝罘区','37','山东省','3706','烟台市','370602','芝罘区','','','','',3,1,''),('370611','3706','00,37,3706','福山区','37','山东省','3706','烟台市','370611','福山区','','','','',3,1,''),('370612','3706','00,37,3706','牟平区','37','山东省','3706','烟台市','370612','牟平区','','','','',3,1,''),('370613','3706','00,37,3706','莱山区','37','山东省','3706','烟台市','370613','莱山区','','','','',3,1,''),('370634','3706','00,37,3706','长岛县','37','山东省','3706','烟台市','370634','长岛县','','','','',3,1,''),('370681','3706','00,37,3706','龙口市','37','山东省','3706','烟台市','370681','龙口市','','','','',3,1,''),('370682','3706','00,37,3706','莱阳市','37','山东省','3706','烟台市','370682','莱阳市','','','','',3,1,''),('370683','3706','00,37,3706','莱州市','37','山东省','3706','烟台市','370683','莱州市','','','','',3,1,''),('370684','3706','00,37,3706','蓬莱市','37','山东省','3706','烟台市','370684','蓬莱市','','','','',3,1,''),('370685','3706','00,37,3706','招远市','37','山东省','3706','烟台市','370685','招远市','','','','',3,1,''),('370686','3706','00,37,3706','栖霞市','37','山东省','3706','烟台市','370686','栖霞市','','','','',3,1,''),('370687','3706','00,37,3706','海阳市','37','山东省','3706','烟台市','370687','海阳市','','','','',3,1,''),('3707','37','00,37','潍坊市','37','山东省','3707','潍坊市','','','','','','',2,1,''),('370702','3707','00,37,3707','潍城区','37','山东省','3707','潍坊市','370702','潍城区','','','','',3,1,''),('370703','3707','00,37,3707','寒亭区','37','山东省','3707','潍坊市','370703','寒亭区','','','','',3,1,''),('370704','3707','00,37,3707','坊子区','37','山东省','3707','潍坊市','370704','坊子区','','','','',3,1,''),('370705','3707','00,37,3707','奎文区','37','山东省','3707','潍坊市','370705','奎文区','','','','',3,1,''),('370724','3707','00,37,3707','临朐县','37','山东省','3707','潍坊市','370724','临朐县','','','','',3,1,''),('370725','3707','00,37,3707','昌乐县','37','山东省','3707','潍坊市','370725','昌乐县','','','','',3,1,''),('370781','3707','00,37,3707','青州市','37','山东省','3707','潍坊市','370781','青州市','','','','',3,1,''),('370782','3707','00,37,3707','诸城市','37','山东省','3707','潍坊市','370782','诸城市','','','','',3,1,''),('370783','3707','00,37,3707','寿光市','37','山东省','3707','潍坊市','370783','寿光市','','','','',3,1,''),('370784','3707','00,37,3707','安丘市','37','山东省','3707','潍坊市','370784','安丘市','','','','',3,1,''),('370785','3707','00,37,3707','高密市','37','山东省','3707','潍坊市','370785','高密市','','','','',3,1,''),('370786','3707','00,37,3707','昌邑市','37','山东省','3707','潍坊市','370786','昌邑市','','','','',3,1,''),('3708','37','00,37','济宁市','37','山东省','3708','济宁市','','','','','','',2,1,''),('370811','3708','00,37,3708','任城区','37','山东省','3708','济宁市','370811','任城区','','','','',3,1,''),('370812','3708','00,37,3708','兖州区','37','山东省','3708','济宁市','370812','兖州区','','','','',3,1,''),('370826','3708','00,37,3708','微山县','37','山东省','3708','济宁市','370826','微山县','','','','',3,1,''),('370827','3708','00,37,3708','鱼台县','37','山东省','3708','济宁市','370827','鱼台县','','','','',3,1,''),('370828','3708','00,37,3708','金乡县','37','山东省','3708','济宁市','370828','金乡县','','','','',3,1,''),('370829','3708','00,37,3708','嘉祥县','37','山东省','3708','济宁市','370829','嘉祥县','','','','',3,1,''),('370830','3708','00,37,3708','汶上县','37','山东省','3708','济宁市','370830','汶上县','','','','',3,1,''),('370831','3708','00,37,3708','泗水县','37','山东省','3708','济宁市','370831','泗水县','','','','',3,1,''),('370832','3708','00,37,3708','梁山县','37','山东省','3708','济宁市','370832','梁山县','','','','',3,1,''),('370881','3708','00,37,3708','曲阜市','37','山东省','3708','济宁市','370881','曲阜市','','','','',3,1,''),('370883','3708','00,37,3708','邹城市','37','山东省','3708','济宁市','370883','邹城市','','','','',3,1,''),('3709','37','00,37','泰安市','37','山东省','3709','泰安市','','','','','','',2,1,''),('370902','3709','00,37,3709','泰山区','37','山东省','3709','泰安市','370902','泰山区','','','','',3,1,''),('370911','3709','00,37,3709','岱岳区','37','山东省','3709','泰安市','370911','岱岳区','','','','',3,1,''),('370921','3709','00,37,3709','宁阳县','37','山东省','3709','泰安市','370921','宁阳县','','','','',3,1,''),('370923','3709','00,37,3709','东平县','37','山东省','3709','泰安市','370923','东平县','','','','',3,1,''),('370982','3709','00,37,3709','新泰市','37','山东省','3709','泰安市','370982','新泰市','','','','',3,1,''),('370983','3709','00,37,3709','肥城市','37','山东省','3709','泰安市','370983','肥城市','','','','',3,1,''),('3710','37','00,37','威海市','37','山东省','3710','威海市','','','','','','',2,1,''),('371002','3710','00,37,3710','环翠区','37','山东省','3710','威海市','371002','环翠区','','','','',3,1,''),('371003','3710','00,37,3710','文登区','37','山东省','3710','威海市','371003','文登区','','','','',3,1,''),('371082','3710','00,37,3710','荣成市','37','山东省','3710','威海市','371082','荣成市','','','','',3,1,''),('371083','3710','00,37,3710','乳山市','37','山东省','3710','威海市','371083','乳山市','','','','',3,1,''),('3711','37','00,37','日照市','37','山东省','3711','日照市','','','','','','',2,1,''),('371102','3711','00,37,3711','东港区','37','山东省','3711','日照市','371102','东港区','','','','',3,1,''),('371103','3711','00,37,3711','岚山区','37','山东省','3711','日照市','371103','岚山区','','','','',3,1,''),('371121','3711','00,37,3711','五莲县','37','山东省','3711','日照市','371121','五莲县','','','','',3,1,''),('371122','3711','00,37,3711','莒县','37','山东省','3711','日照市','371122','莒县','','','','',3,1,''),('3713','37','00,37','临沂市','37','山东省','3713','临沂市','','','','','','',2,1,''),('371302','3713','00,37,3713','兰山区','37','山东省','3713','临沂市','371302','兰山区','','','','',3,1,''),('371311','3713','00,37,3713','罗庄区','37','山东省','3713','临沂市','371311','罗庄区','','','','',3,1,''),('371312','3713','00,37,3713','河东区','37','山东省','3713','临沂市','371312','河东区','','','','',3,1,''),('371321','3713','00,37,3713','沂南县','37','山东省','3713','临沂市','371321','沂南县','','','','',3,1,''),('371322','3713','00,37,3713','郯城县','37','山东省','3713','临沂市','371322','郯城县','','','','',3,1,''),('371323','3713','00,37,3713','沂水县','37','山东省','3713','临沂市','371323','沂水县','','','','',3,1,''),('371324','3713','00,37,3713','兰陵县','37','山东省','3713','临沂市','371324','兰陵县','','','','',3,1,''),('371325','3713','00,37,3713','费县','37','山东省','3713','临沂市','371325','费县','','','','',3,1,''),('371326','3713','00,37,3713','平邑县','37','山东省','3713','临沂市','371326','平邑县','','','','',3,1,''),('371327','3713','00,37,3713','莒南县','37','山东省','3713','临沂市','371327','莒南县','','','','',3,1,''),('371328','3713','00,37,3713','蒙阴县','37','山东省','3713','临沂市','371328','蒙阴县','','','','',3,1,''),('371329','3713','00,37,3713','临沭县','37','山东省','3713','临沂市','371329','临沭县','','','','',3,1,''),('3714','37','00,37','德州市','37','山东省','3714','德州市','','','','','','',2,1,''),('371402','3714','00,37,3714','德城区','37','山东省','3714','德州市','371402','德城区','','','','',3,1,''),('371403','3714','00,37,3714','陵城区','37','山东省','3714','德州市','371403','陵城区','','','','',3,1,''),('371422','3714','00,37,3714','宁津县','37','山东省','3714','德州市','371422','宁津县','','','','',3,1,''),('371423','3714','00,37,3714','庆云县','37','山东省','3714','德州市','371423','庆云县','','','','',3,1,''),('371424','3714','00,37,3714','临邑县','37','山东省','3714','德州市','371424','临邑县','','','','',3,1,''),('371425','3714','00,37,3714','齐河县','37','山东省','3714','德州市','371425','齐河县','','','','',3,1,''),('371426','3714','00,37,3714','平原县','37','山东省','3714','德州市','371426','平原县','','','','',3,1,''),('371427','3714','00,37,3714','夏津县','37','山东省','3714','德州市','371427','夏津县','','','','',3,1,''),('371428','3714','00,37,3714','武城县','37','山东省','3714','德州市','371428','武城县','','','','',3,1,''),('371481','3714','00,37,3714','乐陵市','37','山东省','3714','德州市','371481','乐陵市','','','','',3,1,''),('371482','3714','00,37,3714','禹城市','37','山东省','3714','德州市','371482','禹城市','','','','',3,1,''),('3715','37','00,37','聊城市','37','山东省','3715','聊城市','','','','','','',2,1,''),('371502','3715','00,37,3715','东昌府区','37','山东省','3715','聊城市','371502','东昌府区','','','','',3,1,''),('371503','3715','00,37,3715','茌平区','37','山东省','3715','聊城市','371503','茌平区','','','','',3,1,''),('371521','3715','00,37,3715','阳谷县','37','山东省','3715','聊城市','371521','阳谷县','','','','',3,1,''),('371522','3715','00,37,3715','莘县','37','山东省','3715','聊城市','371522','莘县','','','','',3,1,''),('371524','3715','00,37,3715','东阿县','37','山东省','3715','聊城市','371524','东阿县','','','','',3,1,''),('371525','3715','00,37,3715','冠县','37','山东省','3715','聊城市','371525','冠县','','','','',3,1,''),('371526','3715','00,37,3715','高唐县','37','山东省','3715','聊城市','371526','高唐县','','','','',3,1,''),('371581','3715','00,37,3715','临清市','37','山东省','3715','聊城市','371581','临清市','','','','',3,1,''),('3716','37','00,37','滨州市','37','山东省','3716','滨州市','','','','','','',2,1,''),('371602','3716','00,37,3716','滨城区','37','山东省','3716','滨州市','371602','滨城区','','','','',3,1,''),('371603','3716','00,37,3716','沾化区','37','山东省','3716','滨州市','371603','沾化区','','','','',3,1,''),('371621','3716','00,37,3716','惠民县','37','山东省','3716','滨州市','371621','惠民县','','','','',3,1,''),('371622','3716','00,37,3716','阳信县','37','山东省','3716','滨州市','371622','阳信县','','','','',3,1,''),('371623','3716','00,37,3716','无棣县','37','山东省','3716','滨州市','371623','无棣县','','','','',3,1,''),('371625','3716','00,37,3716','博兴县','37','山东省','3716','滨州市','371625','博兴县','','','','',3,1,''),('371681','3716','00,37,3716','邹平市','37','山东省','3716','滨州市','371681','邹平市','','','','',3,1,''),('3717','37','00,37','菏泽市','37','山东省','3717','菏泽市','','','','','','',2,1,''),('371702','3717','00,37,3717','牡丹区','37','山东省','3717','菏泽市','371702','牡丹区','','','','',3,1,''),('371703','3717','00,37,3717','定陶区','37','山东省','3717','菏泽市','371703','定陶区','','','','',3,1,''),('371721','3717','00,37,3717','曹县','37','山东省','3717','菏泽市','371721','曹县','','','','',3,1,''),('371722','3717','00,37,3717','单县','37','山东省','3717','菏泽市','371722','单县','','','','',3,1,''),('371723','3717','00,37,3717','成武县','37','山东省','3717','菏泽市','371723','成武县','','','','',3,1,''),('371724','3717','00,37,3717','巨野县','37','山东省','3717','菏泽市','371724','巨野县','','','','',3,1,''),('371725','3717','00,37,3717','郓城县','37','山东省','3717','菏泽市','371725','郓城县','','','','',3,1,''),('371726','3717','00,37,3717','鄄城县','37','山东省','3717','菏泽市','371726','鄄城县','','','','',3,1,''),('371728','3717','00,37,3717','东明县','37','山东省','3717','菏泽市','371728','东明县','','','','',3,1,''),('41','00','00','河南省','41','河南省','','','','','','','','',1,1,''),('4101','41','00,41','郑州市','41','河南省','4101','郑州市','','','','','','',2,1,''),('410102','4101','00,41,4101','中原区','41','河南省','4101','郑州市','410102','中原区','','','','',3,1,''),('410103','4101','00,41,4101','二七区','41','河南省','4101','郑州市','410103','二七区','','','','',3,1,''),('410104','4101','00,41,4101','管城回族区','41','河南省','4101','郑州市','410104','管城回族区','','','','',3,1,''),('410105','4101','00,41,4101','金水区','41','河南省','4101','郑州市','410105','金水区','','','','',3,1,''),('410106','4101','00,41,4101','上街区','41','河南省','4101','郑州市','410106','上街区','','','','',3,1,''),('410108','4101','00,41,4101','惠济区','41','河南省','4101','郑州市','410108','惠济区','','','','',3,1,''),('410122','4101','00,41,4101','中牟县','41','河南省','4101','郑州市','410122','中牟县','','','','',3,1,''),('410181','4101','00,41,4101','巩义市','41','河南省','4101','郑州市','410181','巩义市','','','','',3,1,''),('410182','4101','00,41,4101','荥阳市','41','河南省','4101','郑州市','410182','荥阳市','','','','',3,1,''),('410183','4101','00,41,4101','新密市','41','河南省','4101','郑州市','410183','新密市','','','','',3,1,''),('410184','4101','00,41,4101','新郑市','41','河南省','4101','郑州市','410184','新郑市','','','','',3,1,''),('410185','4101','00,41,4101','登封市','41','河南省','4101','郑州市','410185','登封市','','','','',3,1,''),('4102','41','00,41','开封市','41','河南省','4102','开封市','','','','','','',2,1,''),('410202','4102','00,41,4102','龙亭区','41','河南省','4102','开封市','410202','龙亭区','','','','',3,1,''),('410203','4102','00,41,4102','顺河回族区','41','河南省','4102','开封市','410203','顺河回族区','','','','',3,1,''),('410204','4102','00,41,4102','鼓楼区','41','河南省','4102','开封市','410204','鼓楼区','','','','',3,1,''),('410205','4102','00,41,4102','禹王台区','41','河南省','4102','开封市','410205','禹王台区','','','','',3,1,''),('410212','4102','00,41,4102','祥符区','41','河南省','4102','开封市','410212','祥符区','','','','',3,1,''),('410221','4102','00,41,4102','杞县','41','河南省','4102','开封市','410221','杞县','','','','',3,1,''),('410222','4102','00,41,4102','通许县','41','河南省','4102','开封市','410222','通许县','','','','',3,1,''),('410223','4102','00,41,4102','尉氏县','41','河南省','4102','开封市','410223','尉氏县','','','','',3,1,''),('410225','4102','00,41,4102','兰考县','41','河南省','4102','开封市','410225','兰考县','','','','',3,1,''),('4103','41','00,41','洛阳市','41','河南省','4103','洛阳市','','','','','','',2,1,''),('410302','4103','00,41,4103','老城区','41','河南省','4103','洛阳市','410302','老城区','','','','',3,1,''),('410303','4103','00,41,4103','西工区','41','河南省','4103','洛阳市','410303','西工区','','','','',3,1,''),('410304','4103','00,41,4103','瀍河回族区','41','河南省','4103','洛阳市','410304','瀍河回族区','','','','',3,1,''),('410305','4103','00,41,4103','涧西区','41','河南省','4103','洛阳市','410305','涧西区','','','','',3,1,''),('410306','4103','00,41,4103','吉利区','41','河南省','4103','洛阳市','410306','吉利区','','','','',3,1,''),('410311','4103','00,41,4103','洛龙区','41','河南省','4103','洛阳市','410311','洛龙区','','','','',3,1,''),('410322','4103','00,41,4103','孟津县','41','河南省','4103','洛阳市','410322','孟津县','','','','',3,1,''),('410323','4103','00,41,4103','新安县','41','河南省','4103','洛阳市','410323','新安县','','','','',3,1,''),('410324','4103','00,41,4103','栾川县','41','河南省','4103','洛阳市','410324','栾川县','','','','',3,1,''),('410325','4103','00,41,4103','嵩县','41','河南省','4103','洛阳市','410325','嵩县','','','','',3,1,''),('410326','4103','00,41,4103','汝阳县','41','河南省','4103','洛阳市','410326','汝阳县','','','','',3,1,''),('410327','4103','00,41,4103','宜阳县','41','河南省','4103','洛阳市','410327','宜阳县','','','','',3,1,''),('410328','4103','00,41,4103','洛宁县','41','河南省','4103','洛阳市','410328','洛宁县','','','','',3,1,''),('410329','4103','00,41,4103','伊川县','41','河南省','4103','洛阳市','410329','伊川县','','','','',3,1,''),('410381','4103','00,41,4103','偃师市','41','河南省','4103','洛阳市','410381','偃师市','','','','',3,1,''),('4104','41','00,41','平顶山市','41','河南省','4104','平顶山市','','','','','','',2,1,''),('410402','4104','00,41,4104','新华区','41','河南省','4104','平顶山市','410402','新华区','','','','',3,1,''),('410403','4104','00,41,4104','卫东区','41','河南省','4104','平顶山市','410403','卫东区','','','','',3,1,''),('410404','4104','00,41,4104','石龙区','41','河南省','4104','平顶山市','410404','石龙区','','','','',3,1,''),('410411','4104','00,41,4104','湛河区','41','河南省','4104','平顶山市','410411','湛河区','','','','',3,1,''),('410421','4104','00,41,4104','宝丰县','41','河南省','4104','平顶山市','410421','宝丰县','','','','',3,1,''),('410422','4104','00,41,4104','叶县','41','河南省','4104','平顶山市','410422','叶县','','','','',3,1,''),('410423','4104','00,41,4104','鲁山县','41','河南省','4104','平顶山市','410423','鲁山县','','','','',3,1,''),('410425','4104','00,41,4104','郏县','41','河南省','4104','平顶山市','410425','郏县','','','','',3,1,''),('410481','4104','00,41,4104','舞钢市','41','河南省','4104','平顶山市','410481','舞钢市','','','','',3,1,''),('410482','4104','00,41,4104','汝州市','41','河南省','4104','平顶山市','410482','汝州市','','','','',3,1,''),('4105','41','00,41','安阳市','41','河南省','4105','安阳市','','','','','','',2,1,''),('410502','4105','00,41,4105','文峰区','41','河南省','4105','安阳市','410502','文峰区','','','','',3,1,''),('410503','4105','00,41,4105','北关区','41','河南省','4105','安阳市','410503','北关区','','','','',3,1,''),('410505','4105','00,41,4105','殷都区','41','河南省','4105','安阳市','410505','殷都区','','','','',3,1,''),('410506','4105','00,41,4105','龙安区','41','河南省','4105','安阳市','410506','龙安区','','','','',3,1,''),('410522','4105','00,41,4105','安阳县','41','河南省','4105','安阳市','410522','安阳县','','','','',3,1,''),('410523','4105','00,41,4105','汤阴县','41','河南省','4105','安阳市','410523','汤阴县','','','','',3,1,''),('410526','4105','00,41,4105','滑县','41','河南省','4105','安阳市','410526','滑县','','','','',3,1,''),('410527','4105','00,41,4105','内黄县','41','河南省','4105','安阳市','410527','内黄县','','','','',3,1,''),('410581','4105','00,41,4105','林州市','41','河南省','4105','安阳市','410581','林州市','','','','',3,1,''),('4106','41','00,41','鹤壁市','41','河南省','4106','鹤壁市','','','','','','',2,1,''),('410602','4106','00,41,4106','鹤山区','41','河南省','4106','鹤壁市','410602','鹤山区','','','','',3,1,''),('410603','4106','00,41,4106','山城区','41','河南省','4106','鹤壁市','410603','山城区','','','','',3,1,''),('410611','4106','00,41,4106','淇滨区','41','河南省','4106','鹤壁市','410611','淇滨区','','','','',3,1,''),('410621','4106','00,41,4106','浚县','41','河南省','4106','鹤壁市','410621','浚县','','','','',3,1,''),('410622','4106','00,41,4106','淇县','41','河南省','4106','鹤壁市','410622','淇县','','','','',3,1,''),('4107','41','00,41','新乡市','41','河南省','4107','新乡市','','','','','','',2,1,''),('410702','4107','00,41,4107','红旗区','41','河南省','4107','新乡市','410702','红旗区','','','','',3,1,''),('410703','4107','00,41,4107','卫滨区','41','河南省','4107','新乡市','410703','卫滨区','','','','',3,1,''),('410704','4107','00,41,4107','凤泉区','41','河南省','4107','新乡市','410704','凤泉区','','','','',3,1,''),('410711','4107','00,41,4107','牧野区','41','河南省','4107','新乡市','410711','牧野区','','','','',3,1,''),('410721','4107','00,41,4107','新乡县','41','河南省','4107','新乡市','410721','新乡县','','','','',3,1,''),('410724','4107','00,41,4107','获嘉县','41','河南省','4107','新乡市','410724','获嘉县','','','','',3,1,''),('410725','4107','00,41,4107','原阳县','41','河南省','4107','新乡市','410725','原阳县','','','','',3,1,''),('410726','4107','00,41,4107','延津县','41','河南省','4107','新乡市','410726','延津县','','','','',3,1,''),('410727','4107','00,41,4107','封丘县','41','河南省','4107','新乡市','410727','封丘县','','','','',3,1,''),('410781','4107','00,41,4107','卫辉市','41','河南省','4107','新乡市','410781','卫辉市','','','','',3,1,''),('410782','4107','00,41,4107','辉县市','41','河南省','4107','新乡市','410782','辉县市','','','','',3,1,''),('410783','4107','00,41,4107','长垣市','41','河南省','4107','新乡市','410783','长垣市','','','','',3,1,''),('4108','41','00,41','焦作市','41','河南省','4108','焦作市','','','','','','',2,1,''),('410802','4108','00,41,4108','解放区','41','河南省','4108','焦作市','410802','解放区','','','','',3,1,''),('410803','4108','00,41,4108','中站区','41','河南省','4108','焦作市','410803','中站区','','','','',3,1,''),('410804','4108','00,41,4108','马村区','41','河南省','4108','焦作市','410804','马村区','','','','',3,1,''),('410811','4108','00,41,4108','山阳区','41','河南省','4108','焦作市','410811','山阳区','','','','',3,1,''),('410821','4108','00,41,4108','修武县','41','河南省','4108','焦作市','410821','修武县','','','','',3,1,''),('410822','4108','00,41,4108','博爱县','41','河南省','4108','焦作市','410822','博爱县','','','','',3,1,''),('410823','4108','00,41,4108','武陟县','41','河南省','4108','焦作市','410823','武陟县','','','','',3,1,''),('410825','4108','00,41,4108','温县','41','河南省','4108','焦作市','410825','温县','','','','',3,1,''),('410882','4108','00,41,4108','沁阳市','41','河南省','4108','焦作市','410882','沁阳市','','','','',3,1,''),('410883','4108','00,41,4108','孟州市','41','河南省','4108','焦作市','410883','孟州市','','','','',3,1,''),('4109','41','00,41','濮阳市','41','河南省','4109','濮阳市','','','','','','',2,1,''),('410902','4109','00,41,4109','华龙区','41','河南省','4109','濮阳市','410902','华龙区','','','','',3,1,''),('410922','4109','00,41,4109','清丰县','41','河南省','4109','濮阳市','410922','清丰县','','','','',3,1,''),('410923','4109','00,41,4109','南乐县','41','河南省','4109','濮阳市','410923','南乐县','','','','',3,1,''),('410926','4109','00,41,4109','范县','41','河南省','4109','濮阳市','410926','范县','','','','',3,1,''),('410927','4109','00,41,4109','台前县','41','河南省','4109','濮阳市','410927','台前县','','','','',3,1,''),('410928','4109','00,41,4109','濮阳县','41','河南省','4109','濮阳市','410928','濮阳县','','','','',3,1,''),('4110','41','00,41','许昌市','41','河南省','4110','许昌市','','','','','','',2,1,''),('411002','4110','00,41,4110','魏都区','41','河南省','4110','许昌市','411002','魏都区','','','','',3,1,''),('411003','4110','00,41,4110','建安区','41','河南省','4110','许昌市','411003','建安区','','','','',3,1,''),('411024','4110','00,41,4110','鄢陵县','41','河南省','4110','许昌市','411024','鄢陵县','','','','',3,1,''),('411025','4110','00,41,4110','襄城县','41','河南省','4110','许昌市','411025','襄城县','','','','',3,1,''),('411081','4110','00,41,4110','禹州市','41','河南省','4110','许昌市','411081','禹州市','','','','',3,1,''),('411082','4110','00,41,4110','长葛市','41','河南省','4110','许昌市','411082','长葛市','','','','',3,1,''),('4111','41','00,41','漯河市','41','河南省','4111','漯河市','','','','','','',2,1,''),('411102','4111','00,41,4111','源汇区','41','河南省','4111','漯河市','411102','源汇区','','','','',3,1,''),('411103','4111','00,41,4111','郾城区','41','河南省','4111','漯河市','411103','郾城区','','','','',3,1,''),('411104','4111','00,41,4111','召陵区','41','河南省','4111','漯河市','411104','召陵区','','','','',3,1,''),('411121','4111','00,41,4111','舞阳县','41','河南省','4111','漯河市','411121','舞阳县','','','','',3,1,''),('411122','4111','00,41,4111','临颍县','41','河南省','4111','漯河市','411122','临颍县','','','','',3,1,''),('4112','41','00,41','三门峡市','41','河南省','4112','三门峡市','','','','','','',2,1,''),('411202','4112','00,41,4112','湖滨区','41','河南省','4112','三门峡市','411202','湖滨区','','','','',3,1,''),('411203','4112','00,41,4112','陕州区','41','河南省','4112','三门峡市','411203','陕州区','','','','',3,1,''),('411221','4112','00,41,4112','渑池县','41','河南省','4112','三门峡市','411221','渑池县','','','','',3,1,''),('411224','4112','00,41,4112','卢氏县','41','河南省','4112','三门峡市','411224','卢氏县','','','','',3,1,''),('411281','4112','00,41,4112','义马市','41','河南省','4112','三门峡市','411281','义马市','','','','',3,1,''),('411282','4112','00,41,4112','灵宝市','41','河南省','4112','三门峡市','411282','灵宝市','','','','',3,1,''),('4113','41','00,41','南阳市','41','河南省','4113','南阳市','','','','','','',2,1,''),('411302','4113','00,41,4113','宛城区','41','河南省','4113','南阳市','411302','宛城区','','','','',3,1,''),('411303','4113','00,41,4113','卧龙区','41','河南省','4113','南阳市','411303','卧龙区','','','','',3,1,''),('411321','4113','00,41,4113','南召县','41','河南省','4113','南阳市','411321','南召县','','','','',3,1,''),('411322','4113','00,41,4113','方城县','41','河南省','4113','南阳市','411322','方城县','','','','',3,1,''),('411323','4113','00,41,4113','西峡县','41','河南省','4113','南阳市','411323','西峡县','','','','',3,1,''),('411324','4113','00,41,4113','镇平县','41','河南省','4113','南阳市','411324','镇平县','','','','',3,1,''),('411325','4113','00,41,4113','内乡县','41','河南省','4113','南阳市','411325','内乡县','','','','',3,1,''),('411326','4113','00,41,4113','淅川县','41','河南省','4113','南阳市','411326','淅川县','','','','',3,1,''),('411327','4113','00,41,4113','社旗县','41','河南省','4113','南阳市','411327','社旗县','','','','',3,1,''),('411328','4113','00,41,4113','唐河县','41','河南省','4113','南阳市','411328','唐河县','','','','',3,1,''),('411329','4113','00,41,4113','新野县','41','河南省','4113','南阳市','411329','新野县','','','','',3,1,''),('411330','4113','00,41,4113','桐柏县','41','河南省','4113','南阳市','411330','桐柏县','','','','',3,1,''),('411381','4113','00,41,4113','邓州市','41','河南省','4113','南阳市','411381','邓州市','','','','',3,1,''),('4114','41','00,41','商丘市','41','河南省','4114','商丘市','','','','','','',2,1,''),('411402','4114','00,41,4114','梁园区','41','河南省','4114','商丘市','411402','梁园区','','','','',3,1,''),('411403','4114','00,41,4114','睢阳区','41','河南省','4114','商丘市','411403','睢阳区','','','','',3,1,''),('411421','4114','00,41,4114','民权县','41','河南省','4114','商丘市','411421','民权县','','','','',3,1,''),('411422','4114','00,41,4114','睢县','41','河南省','4114','商丘市','411422','睢县','','','','',3,1,''),('411423','4114','00,41,4114','宁陵县','41','河南省','4114','商丘市','411423','宁陵县','','','','',3,1,''),('411424','4114','00,41,4114','柘城县','41','河南省','4114','商丘市','411424','柘城县','','','','',3,1,''),('411425','4114','00,41,4114','虞城县','41','河南省','4114','商丘市','411425','虞城县','','','','',3,1,''),('411426','4114','00,41,4114','夏邑县','41','河南省','4114','商丘市','411426','夏邑县','','','','',3,1,''),('411481','4114','00,41,4114','永城市','41','河南省','4114','商丘市','411481','永城市','','','','',3,1,''),('4115','41','00,41','信阳市','41','河南省','4115','信阳市','','','','','','',2,1,''),('411502','4115','00,41,4115','浉河区','41','河南省','4115','信阳市','411502','浉河区','','','','',3,1,''),('411503','4115','00,41,4115','平桥区','41','河南省','4115','信阳市','411503','平桥区','','','','',3,1,''),('411521','4115','00,41,4115','罗山县','41','河南省','4115','信阳市','411521','罗山县','','','','',3,1,''),('411522','4115','00,41,4115','光山县','41','河南省','4115','信阳市','411522','光山县','','','','',3,1,''),('411523','4115','00,41,4115','新县','41','河南省','4115','信阳市','411523','新县','','','','',3,1,''),('411524','4115','00,41,4115','商城县','41','河南省','4115','信阳市','411524','商城县','','','','',3,1,''),('411525','4115','00,41,4115','固始县','41','河南省','4115','信阳市','411525','固始县','','','','',3,1,''),('411526','4115','00,41,4115','潢川县','41','河南省','4115','信阳市','411526','潢川县','','','','',3,1,''),('411527','4115','00,41,4115','淮滨县','41','河南省','4115','信阳市','411527','淮滨县','','','','',3,1,''),('411528','4115','00,41,4115','息县','41','河南省','4115','信阳市','411528','息县','','','','',3,1,''),('4116','41','00,41','周口市','41','河南省','4116','周口市','','','','','','',2,1,''),('411602','4116','00,41,4116','川汇区','41','河南省','4116','周口市','411602','川汇区','','','','',3,1,''),('411603','4116','00,41,4116','淮阳区','41','河南省','4116','周口市','411603','淮阳区','','','','',3,1,''),('411621','4116','00,41,4116','扶沟县','41','河南省','4116','周口市','411621','扶沟县','','','','',3,1,''),('411622','4116','00,41,4116','西华县','41','河南省','4116','周口市','411622','西华县','','','','',3,1,''),('411623','4116','00,41,4116','商水县','41','河南省','4116','周口市','411623','商水县','','','','',3,1,''),('411624','4116','00,41,4116','沈丘县','41','河南省','4116','周口市','411624','沈丘县','','','','',3,1,''),('411625','4116','00,41,4116','郸城县','41','河南省','4116','周口市','411625','郸城县','','','','',3,1,''),('411627','4116','00,41,4116','太康县','41','河南省','4116','周口市','411627','太康县','','','','',3,1,''),('411628','4116','00,41,4116','鹿邑县','41','河南省','4116','周口市','411628','鹿邑县','','','','',3,1,''),('411681','4116','00,41,4116','项城市','41','河南省','4116','周口市','411681','项城市','','','','',3,1,''),('4117','41','00,41','驻马店市','41','河南省','4117','驻马店市','','','','','','',2,1,''),('411702','4117','00,41,4117','驿城区','41','河南省','4117','驻马店市','411702','驿城区','','','','',3,1,''),('411721','4117','00,41,4117','西平县','41','河南省','4117','驻马店市','411721','西平县','','','','',3,1,''),('411722','4117','00,41,4117','上蔡县','41','河南省','4117','驻马店市','411722','上蔡县','','','','',3,1,''),('411723','4117','00,41,4117','平舆县','41','河南省','4117','驻马店市','411723','平舆县','','','','',3,1,''),('411724','4117','00,41,4117','正阳县','41','河南省','4117','驻马店市','411724','正阳县','','','','',3,1,''),('411725','4117','00,41,4117','确山县','41','河南省','4117','驻马店市','411725','确山县','','','','',3,1,''),('411726','4117','00,41,4117','泌阳县','41','河南省','4117','驻马店市','411726','泌阳县','','','','',3,1,''),('411727','4117','00,41,4117','汝南县','41','河南省','4117','驻马店市','411727','汝南县','','','','',3,1,''),('411728','4117','00,41,4117','遂平县','41','河南省','4117','驻马店市','411728','遂平县','','','','',3,1,''),('411729','4117','00,41,4117','新蔡县','41','河南省','4117','驻马店市','411729','新蔡县','','','','',3,1,''),('4190','41','00,41','省直辖县级行政区','41','河南省','4190','省直辖县级行政区','','','','','','',2,1,''),('419001','4190','00,41,4190','济源市','41','河南省','4190','省直辖县级行政区','419001','济源市','','','','',3,1,''),('42','00','00','湖北省','42','湖北省','','','','','','','','',1,1,''),('4201','42','00,42','武汉市','42','湖北省','4201','武汉市','','','','','','',2,1,''),('420102','4201','00,42,4201','江岸区','42','湖北省','4201','武汉市','420102','江岸区','','','','',3,1,''),('420103','4201','00,42,4201','江汉区','42','湖北省','4201','武汉市','420103','江汉区','','','','',3,1,''),('420104','4201','00,42,4201','硚口区','42','湖北省','4201','武汉市','420104','硚口区','','','','',3,1,''),('420105','4201','00,42,4201','汉阳区','42','湖北省','4201','武汉市','420105','汉阳区','','','','',3,1,''),('420106','4201','00,42,4201','武昌区','42','湖北省','4201','武汉市','420106','武昌区','','','','',3,1,''),('420107','4201','00,42,4201','青山区','42','湖北省','4201','武汉市','420107','青山区','','','','',3,1,''),('420111','4201','00,42,4201','洪山区','42','湖北省','4201','武汉市','420111','洪山区','','','','',3,1,''),('420112','4201','00,42,4201','东西湖区','42','湖北省','4201','武汉市','420112','东西湖区','','','','',3,1,''),('420113','4201','00,42,4201','汉南区','42','湖北省','4201','武汉市','420113','汉南区','','','','',3,1,''),('420114','4201','00,42,4201','蔡甸区','42','湖北省','4201','武汉市','420114','蔡甸区','','','','',3,1,''),('420115','4201','00,42,4201','江夏区','42','湖北省','4201','武汉市','420115','江夏区','','','','',3,1,''),('420116','4201','00,42,4201','黄陂区','42','湖北省','4201','武汉市','420116','黄陂区','','','','',3,1,''),('420117','4201','00,42,4201','新洲区','42','湖北省','4201','武汉市','420117','新洲区','','','','',3,1,''),('4202','42','00,42','黄石市','42','湖北省','4202','黄石市','','','','','','',2,1,''),('420202','4202','00,42,4202','黄石港区','42','湖北省','4202','黄石市','420202','黄石港区','','','','',3,1,''),('420203','4202','00,42,4202','西塞山区','42','湖北省','4202','黄石市','420203','西塞山区','','','','',3,1,''),('420204','4202','00,42,4202','下陆区','42','湖北省','4202','黄石市','420204','下陆区','','','','',3,1,''),('420205','4202','00,42,4202','铁山区','42','湖北省','4202','黄石市','420205','铁山区','','','','',3,1,''),('420222','4202','00,42,4202','阳新县','42','湖北省','4202','黄石市','420222','阳新县','','','','',3,1,''),('420281','4202','00,42,4202','大冶市','42','湖北省','4202','黄石市','420281','大冶市','','','','',3,1,''),('4203','42','00,42','十堰市','42','湖北省','4203','十堰市','','','','','','',2,1,''),('420302','4203','00,42,4203','茅箭区','42','湖北省','4203','十堰市','420302','茅箭区','','','','',3,1,''),('420303','4203','00,42,4203','张湾区','42','湖北省','4203','十堰市','420303','张湾区','','','','',3,1,''),('420304','4203','00,42,4203','郧阳区','42','湖北省','4203','十堰市','420304','郧阳区','','','','',3,1,''),('420322','4203','00,42,4203','郧西县','42','湖北省','4203','十堰市','420322','郧西县','','','','',3,1,''),('420323','4203','00,42,4203','竹山县','42','湖北省','4203','十堰市','420323','竹山县','','','','',3,1,''),('420324','4203','00,42,4203','竹溪县','42','湖北省','4203','十堰市','420324','竹溪县','','','','',3,1,''),('420325','4203','00,42,4203','房县','42','湖北省','4203','十堰市','420325','房县','','','','',3,1,''),('420381','4203','00,42,4203','丹江口市','42','湖北省','4203','十堰市','420381','丹江口市','','','','',3,1,''),('4205','42','00,42','宜昌市','42','湖北省','4205','宜昌市','','','','','','',2,1,''),('420502','4205','00,42,4205','西陵区','42','湖北省','4205','宜昌市','420502','西陵区','','','','',3,1,''),('420503','4205','00,42,4205','伍家岗区','42','湖北省','4205','宜昌市','420503','伍家岗区','','','','',3,1,''),('420504','4205','00,42,4205','点军区','42','湖北省','4205','宜昌市','420504','点军区','','','','',3,1,''),('420505','4205','00,42,4205','猇亭区','42','湖北省','4205','宜昌市','420505','猇亭区','','','','',3,1,''),('420506','4205','00,42,4205','夷陵区','42','湖北省','4205','宜昌市','420506','夷陵区','','','','',3,1,''),('420525','4205','00,42,4205','远安县','42','湖北省','4205','宜昌市','420525','远安县','','','','',3,1,''),('420526','4205','00,42,4205','兴山县','42','湖北省','4205','宜昌市','420526','兴山县','','','','',3,1,''),('420527','4205','00,42,4205','秭归县','42','湖北省','4205','宜昌市','420527','秭归县','','','','',3,1,''),('420528','4205','00,42,4205','长阳土家族自治县','42','湖北省','4205','宜昌市','420528','长阳土家族自治县','','','','',3,1,''),('420529','4205','00,42,4205','五峰土家族自治县','42','湖北省','4205','宜昌市','420529','五峰土家族自治县','','','','',3,1,''),('420581','4205','00,42,4205','宜都市','42','湖北省','4205','宜昌市','420581','宜都市','','','','',3,1,''),('420582','4205','00,42,4205','当阳市','42','湖北省','4205','宜昌市','420582','当阳市','','','','',3,1,''),('420583','4205','00,42,4205','枝江市','42','湖北省','4205','宜昌市','420583','枝江市','','','','',3,1,''),('4206','42','00,42','襄阳市','42','湖北省','4206','襄阳市','','','','','','',2,1,''),('420602','4206','00,42,4206','襄城区','42','湖北省','4206','襄阳市','420602','襄城区','','','','',3,1,''),('420606','4206','00,42,4206','樊城区','42','湖北省','4206','襄阳市','420606','樊城区','','','','',3,1,''),('420607','4206','00,42,4206','襄州区','42','湖北省','4206','襄阳市','420607','襄州区','','','','',3,1,''),('420624','4206','00,42,4206','南漳县','42','湖北省','4206','襄阳市','420624','南漳县','','','','',3,1,''),('420625','4206','00,42,4206','谷城县','42','湖北省','4206','襄阳市','420625','谷城县','','','','',3,1,''),('420626','4206','00,42,4206','保康县','42','湖北省','4206','襄阳市','420626','保康县','','','','',3,1,''),('420682','4206','00,42,4206','老河口市','42','湖北省','4206','襄阳市','420682','老河口市','','','','',3,1,''),('420683','4206','00,42,4206','枣阳市','42','湖北省','4206','襄阳市','420683','枣阳市','','','','',3,1,''),('420684','4206','00,42,4206','宜城市','42','湖北省','4206','襄阳市','420684','宜城市','','','','',3,1,''),('4207','42','00,42','鄂州市','42','湖北省','4207','鄂州市','','','','','','',2,1,''),('420702','4207','00,42,4207','梁子湖区','42','湖北省','4207','鄂州市','420702','梁子湖区','','','','',3,1,''),('420703','4207','00,42,4207','华容区','42','湖北省','4207','鄂州市','420703','华容区','','','','',3,1,''),('420704','4207','00,42,4207','鄂城区','42','湖北省','4207','鄂州市','420704','鄂城区','','','','',3,1,''),('4208','42','00,42','荆门市','42','湖北省','4208','荆门市','','','','','','',2,1,''),('420802','4208','00,42,4208','东宝区','42','湖北省','4208','荆门市','420802','东宝区','','','','',3,1,''),('420804','4208','00,42,4208','掇刀区','42','湖北省','4208','荆门市','420804','掇刀区','','','','',3,1,''),('420822','4208','00,42,4208','沙洋县','42','湖北省','4208','荆门市','420822','沙洋县','','','','',3,1,''),('420881','4208','00,42,4208','钟祥市','42','湖北省','4208','荆门市','420881','钟祥市','','','','',3,1,''),('420882','4208','00,42,4208','京山市','42','湖北省','4208','荆门市','420882','京山市','','','','',3,1,''),('4209','42','00,42','孝感市','42','湖北省','4209','孝感市','','','','','','',2,1,''),('420902','4209','00,42,4209','孝南区','42','湖北省','4209','孝感市','420902','孝南区','','','','',3,1,''),('420921','4209','00,42,4209','孝昌县','42','湖北省','4209','孝感市','420921','孝昌县','','','','',3,1,''),('420922','4209','00,42,4209','大悟县','42','湖北省','4209','孝感市','420922','大悟县','','','','',3,1,''),('420923','4209','00,42,4209','云梦县','42','湖北省','4209','孝感市','420923','云梦县','','','','',3,1,''),('420981','4209','00,42,4209','应城市','42','湖北省','4209','孝感市','420981','应城市','','','','',3,1,''),('420982','4209','00,42,4209','安陆市','42','湖北省','4209','孝感市','420982','安陆市','','','','',3,1,''),('420984','4209','00,42,4209','汉川市','42','湖北省','4209','孝感市','420984','汉川市','','','','',3,1,''),('4210','42','00,42','荆州市','42','湖北省','4210','荆州市','','','','','','',2,1,''),('421002','4210','00,42,4210','沙市区','42','湖北省','4210','荆州市','421002','沙市区','','','','',3,1,''),('421003','4210','00,42,4210','荆州区','42','湖北省','4210','荆州市','421003','荆州区','','','','',3,1,''),('421022','4210','00,42,4210','公安县','42','湖北省','4210','荆州市','421022','公安县','','','','',3,1,''),('421023','4210','00,42,4210','监利县','42','湖北省','4210','荆州市','421023','监利县','','','','',3,1,''),('421024','4210','00,42,4210','江陵县','42','湖北省','4210','荆州市','421024','江陵县','','','','',3,1,''),('421081','4210','00,42,4210','石首市','42','湖北省','4210','荆州市','421081','石首市','','','','',3,1,''),('421083','4210','00,42,4210','洪湖市','42','湖北省','4210','荆州市','421083','洪湖市','','','','',3,1,''),('421087','4210','00,42,4210','松滋市','42','湖北省','4210','荆州市','421087','松滋市','','','','',3,1,''),('4211','42','00,42','黄冈市','42','湖北省','4211','黄冈市','','','','','','',2,1,''),('421102','4211','00,42,4211','黄州区','42','湖北省','4211','黄冈市','421102','黄州区','','','','',3,1,''),('421121','4211','00,42,4211','团风县','42','湖北省','4211','黄冈市','421121','团风县','','','','',3,1,''),('421122','4211','00,42,4211','红安县','42','湖北省','4211','黄冈市','421122','红安县','','','','',3,1,''),('421123','4211','00,42,4211','罗田县','42','湖北省','4211','黄冈市','421123','罗田县','','','','',3,1,''),('421124','4211','00,42,4211','英山县','42','湖北省','4211','黄冈市','421124','英山县','','','','',3,1,''),('421125','4211','00,42,4211','浠水县','42','湖北省','4211','黄冈市','421125','浠水县','','','','',3,1,''),('421126','4211','00,42,4211','蕲春县','42','湖北省','4211','黄冈市','421126','蕲春县','','','','',3,1,''),('421127','4211','00,42,4211','黄梅县','42','湖北省','4211','黄冈市','421127','黄梅县','','','','',3,1,''),('421181','4211','00,42,4211','麻城市','42','湖北省','4211','黄冈市','421181','麻城市','','','','',3,1,''),('421182','4211','00,42,4211','武穴市','42','湖北省','4211','黄冈市','421182','武穴市','','','','',3,1,''),('4212','42','00,42','咸宁市','42','湖北省','4212','咸宁市','','','','','','',2,1,''),('421202','4212','00,42,4212','咸安区','42','湖北省','4212','咸宁市','421202','咸安区','','','','',3,1,''),('421221','4212','00,42,4212','嘉鱼县','42','湖北省','4212','咸宁市','421221','嘉鱼县','','','','',3,1,''),('421222','4212','00,42,4212','通城县','42','湖北省','4212','咸宁市','421222','通城县','','','','',3,1,''),('421223','4212','00,42,4212','崇阳县','42','湖北省','4212','咸宁市','421223','崇阳县','','','','',3,1,''),('421224','4212','00,42,4212','通山县','42','湖北省','4212','咸宁市','421224','通山县','','','','',3,1,''),('421281','4212','00,42,4212','赤壁市','42','湖北省','4212','咸宁市','421281','赤壁市','','','','',3,1,''),('4213','42','00,42','随州市','42','湖北省','4213','随州市','','','','','','',2,1,''),('421303','4213','00,42,4213','曾都区','42','湖北省','4213','随州市','421303','曾都区','','','','',3,1,''),('421321','4213','00,42,4213','随县','42','湖北省','4213','随州市','421321','随县','','','','',3,1,''),('421381','4213','00,42,4213','广水市','42','湖北省','4213','随州市','421381','广水市','','','','',3,1,''),('4228','42','00,42','恩施土家族苗族自治州','42','湖北省','4228','恩施土家族苗族自治州','','','','','','',2,1,''),('422801','4228','00,42,4228','恩施市','42','湖北省','4228','恩施土家族苗族自治州','422801','恩施市','','','','',3,1,''),('422802','4228','00,42,4228','利川市','42','湖北省','4228','恩施土家族苗族自治州','422802','利川市','','','','',3,1,''),('422822','4228','00,42,4228','建始县','42','湖北省','4228','恩施土家族苗族自治州','422822','建始县','','','','',3,1,''),('422823','4228','00,42,4228','巴东县','42','湖北省','4228','恩施土家族苗族自治州','422823','巴东县','','','','',3,1,''),('422825','4228','00,42,4228','宣恩县','42','湖北省','4228','恩施土家族苗族自治州','422825','宣恩县','','','','',3,1,''),('422826','4228','00,42,4228','咸丰县','42','湖北省','4228','恩施土家族苗族自治州','422826','咸丰县','','','','',3,1,''),('422827','4228','00,42,4228','来凤县','42','湖北省','4228','恩施土家族苗族自治州','422827','来凤县','','','','',3,1,''),('422828','4228','00,42,4228','鹤峰县','42','湖北省','4228','恩施土家族苗族自治州','422828','鹤峰县','','','','',3,1,''),('4290','42','00,42','省直辖县级行政区','42','湖北省','4290','省直辖县级行政区','','','','','','',2,1,''),('429004','4290','00,42,4290','仙桃市','42','湖北省','4290','省直辖县级行政区','429004','仙桃市','','','','',3,1,''),('429005','4290','00,42,4290','潜江市','42','湖北省','4290','省直辖县级行政区','429005','潜江市','','','','',3,1,''),('429006','4290','00,42,4290','天门市','42','湖北省','4290','省直辖县级行政区','429006','天门市','','','','',3,1,''),('429021','4290','00,42,4290','神农架林区','42','湖北省','4290','省直辖县级行政区','429021','神农架林区','','','','',3,1,''),('43','00','00','湖南省','43','湖南省','','','','','','','','',1,1,''),('4301','43','00,43','长沙市','43','湖南省','4301','长沙市','','','','','','',2,1,''),('430102','4301','00,43,4301','芙蓉区','43','湖南省','4301','长沙市','430102','芙蓉区','','','','',3,1,''),('430103','4301','00,43,4301','天心区','43','湖南省','4301','长沙市','430103','天心区','','','','',3,1,''),('430104','4301','00,43,4301','岳麓区','43','湖南省','4301','长沙市','430104','岳麓区','','','','',3,1,''),('430105','4301','00,43,4301','开福区','43','湖南省','4301','长沙市','430105','开福区','','','','',3,1,''),('430111','4301','00,43,4301','雨花区','43','湖南省','4301','长沙市','430111','雨花区','','','','',3,1,''),('430112','4301','00,43,4301','望城区','43','湖南省','4301','长沙市','430112','望城区','','','','',3,1,''),('430121','4301','00,43,4301','长沙县','43','湖南省','4301','长沙市','430121','长沙县','','','','',3,1,''),('430181','4301','00,43,4301','浏阳市','43','湖南省','4301','长沙市','430181','浏阳市','','','','',3,1,''),('430182','4301','00,43,4301','宁乡市','43','湖南省','4301','长沙市','430182','宁乡市','','','','',3,1,''),('4302','43','00,43','株洲市','43','湖南省','4302','株洲市','','','','','','',2,1,''),('430202','4302','00,43,4302','荷塘区','43','湖南省','4302','株洲市','430202','荷塘区','','','','',3,1,''),('430203','4302','00,43,4302','芦淞区','43','湖南省','4302','株洲市','430203','芦淞区','','','','',3,1,''),('430204','4302','00,43,4302','石峰区','43','湖南省','4302','株洲市','430204','石峰区','','','','',3,1,''),('430211','4302','00,43,4302','天元区','43','湖南省','4302','株洲市','430211','天元区','','','','',3,1,''),('430212','4302','00,43,4302','渌口区','43','湖南省','4302','株洲市','430212','渌口区','','','','',3,1,''),('430223','4302','00,43,4302','攸县','43','湖南省','4302','株洲市','430223','攸县','','','','',3,1,''),('430224','4302','00,43,4302','茶陵县','43','湖南省','4302','株洲市','430224','茶陵县','','','','',3,1,''),('430225','4302','00,43,4302','炎陵县','43','湖南省','4302','株洲市','430225','炎陵县','','','','',3,1,''),('430281','4302','00,43,4302','醴陵市','43','湖南省','4302','株洲市','430281','醴陵市','','','','',3,1,''),('4303','43','00,43','湘潭市','43','湖南省','4303','湘潭市','','','','','','',2,1,''),('430302','4303','00,43,4303','雨湖区','43','湖南省','4303','湘潭市','430302','雨湖区','','','','',3,1,''),('430304','4303','00,43,4303','岳塘区','43','湖南省','4303','湘潭市','430304','岳塘区','','','','',3,1,''),('430321','4303','00,43,4303','湘潭县','43','湖南省','4303','湘潭市','430321','湘潭县','','','','',3,1,''),('430381','4303','00,43,4303','湘乡市','43','湖南省','4303','湘潭市','430381','湘乡市','','','','',3,1,''),('430382','4303','00,43,4303','韶山市','43','湖南省','4303','湘潭市','430382','韶山市','','','','',3,1,''),('4304','43','00,43','衡阳市','43','湖南省','4304','衡阳市','','','','','','',2,1,''),('430405','4304','00,43,4304','珠晖区','43','湖南省','4304','衡阳市','430405','珠晖区','','','','',3,1,''),('430406','4304','00,43,4304','雁峰区','43','湖南省','4304','衡阳市','430406','雁峰区','','','','',3,1,''),('430407','4304','00,43,4304','石鼓区','43','湖南省','4304','衡阳市','430407','石鼓区','','','','',3,1,''),('430408','4304','00,43,4304','蒸湘区','43','湖南省','4304','衡阳市','430408','蒸湘区','','','','',3,1,''),('430412','4304','00,43,4304','南岳区','43','湖南省','4304','衡阳市','430412','南岳区','','','','',3,1,''),('430421','4304','00,43,4304','衡阳县','43','湖南省','4304','衡阳市','430421','衡阳县','','','','',3,1,''),('430422','4304','00,43,4304','衡南县','43','湖南省','4304','衡阳市','430422','衡南县','','','','',3,1,''),('430423','4304','00,43,4304','衡山县','43','湖南省','4304','衡阳市','430423','衡山县','','','','',3,1,''),('430424','4304','00,43,4304','衡东县','43','湖南省','4304','衡阳市','430424','衡东县','','','','',3,1,''),('430426','4304','00,43,4304','祁东县','43','湖南省','4304','衡阳市','430426','祁东县','','','','',3,1,''),('430481','4304','00,43,4304','耒阳市','43','湖南省','4304','衡阳市','430481','耒阳市','','','','',3,1,''),('430482','4304','00,43,4304','常宁市','43','湖南省','4304','衡阳市','430482','常宁市','','','','',3,1,''),('4305','43','00,43','邵阳市','43','湖南省','4305','邵阳市','','','','','','',2,1,''),('430502','4305','00,43,4305','双清区','43','湖南省','4305','邵阳市','430502','双清区','','','','',3,1,''),('430503','4305','00,43,4305','大祥区','43','湖南省','4305','邵阳市','430503','大祥区','','','','',3,1,''),('430511','4305','00,43,4305','北塔区','43','湖南省','4305','邵阳市','430511','北塔区','','','','',3,1,''),('430522','4305','00,43,4305','新邵县','43','湖南省','4305','邵阳市','430522','新邵县','','','','',3,1,''),('430523','4305','00,43,4305','邵阳县','43','湖南省','4305','邵阳市','430523','邵阳县','','','','',3,1,''),('430524','4305','00,43,4305','隆回县','43','湖南省','4305','邵阳市','430524','隆回县','','','','',3,1,''),('430525','4305','00,43,4305','洞口县','43','湖南省','4305','邵阳市','430525','洞口县','','','','',3,1,''),('430527','4305','00,43,4305','绥宁县','43','湖南省','4305','邵阳市','430527','绥宁县','','','','',3,1,''),('430528','4305','00,43,4305','新宁县','43','湖南省','4305','邵阳市','430528','新宁县','','','','',3,1,''),('430529','4305','00,43,4305','城步苗族自治县','43','湖南省','4305','邵阳市','430529','城步苗族自治县','','','','',3,1,''),('430581','4305','00,43,4305','武冈市','43','湖南省','4305','邵阳市','430581','武冈市','','','','',3,1,''),('430582','4305','00,43,4305','邵东市','43','湖南省','4305','邵阳市','430582','邵东市','','','','',3,1,''),('4306','43','00,43','岳阳市','43','湖南省','4306','岳阳市','','','','','','',2,1,''),('430602','4306','00,43,4306','岳阳楼区','43','湖南省','4306','岳阳市','430602','岳阳楼区','','','','',3,1,''),('430603','4306','00,43,4306','云溪区','43','湖南省','4306','岳阳市','430603','云溪区','','','','',3,1,''),('430611','4306','00,43,4306','君山区','43','湖南省','4306','岳阳市','430611','君山区','','','','',3,1,''),('430621','4306','00,43,4306','岳阳县','43','湖南省','4306','岳阳市','430621','岳阳县','','','','',3,1,''),('430623','4306','00,43,4306','华容县','43','湖南省','4306','岳阳市','430623','华容县','','','','',3,1,''),('430624','4306','00,43,4306','湘阴县','43','湖南省','4306','岳阳市','430624','湘阴县','','','','',3,1,''),('430626','4306','00,43,4306','平江县','43','湖南省','4306','岳阳市','430626','平江县','','','','',3,1,''),('430681','4306','00,43,4306','汨罗市','43','湖南省','4306','岳阳市','430681','汨罗市','','','','',3,1,''),('430682','4306','00,43,4306','临湘市','43','湖南省','4306','岳阳市','430682','临湘市','','','','',3,1,''),('4307','43','00,43','常德市','43','湖南省','4307','常德市','','','','','','',2,1,''),('430702','4307','00,43,4307','武陵区','43','湖南省','4307','常德市','430702','武陵区','','','','',3,1,''),('430703','4307','00,43,4307','鼎城区','43','湖南省','4307','常德市','430703','鼎城区','','','','',3,1,''),('430721','4307','00,43,4307','安乡县','43','湖南省','4307','常德市','430721','安乡县','','','','',3,1,''),('430722','4307','00,43,4307','汉寿县','43','湖南省','4307','常德市','430722','汉寿县','','','','',3,1,''),('430723','4307','00,43,4307','澧县','43','湖南省','4307','常德市','430723','澧县','','','','',3,1,''),('430724','4307','00,43,4307','临澧县','43','湖南省','4307','常德市','430724','临澧县','','','','',3,1,''),('430725','4307','00,43,4307','桃源县','43','湖南省','4307','常德市','430725','桃源县','','','','',3,1,''),('430726','4307','00,43,4307','石门县','43','湖南省','4307','常德市','430726','石门县','','','','',3,1,''),('430781','4307','00,43,4307','津市市','43','湖南省','4307','常德市','430781','津市市','','','','',3,1,''),('4308','43','00,43','张家界市','43','湖南省','4308','张家界市','','','','','','',2,1,''),('430802','4308','00,43,4308','永定区','43','湖南省','4308','张家界市','430802','永定区','','','','',3,1,''),('430811','4308','00,43,4308','武陵源区','43','湖南省','4308','张家界市','430811','武陵源区','','','','',3,1,''),('430821','4308','00,43,4308','慈利县','43','湖南省','4308','张家界市','430821','慈利县','','','','',3,1,''),('430822','4308','00,43,4308','桑植县','43','湖南省','4308','张家界市','430822','桑植县','','','','',3,1,''),('4309','43','00,43','益阳市','43','湖南省','4309','益阳市','','','','','','',2,1,''),('430902','4309','00,43,4309','资阳区','43','湖南省','4309','益阳市','430902','资阳区','','','','',3,1,''),('430903','4309','00,43,4309','赫山区','43','湖南省','4309','益阳市','430903','赫山区','','','','',3,1,''),('430921','4309','00,43,4309','南县','43','湖南省','4309','益阳市','430921','南县','','','','',3,1,''),('430922','4309','00,43,4309','桃江县','43','湖南省','4309','益阳市','430922','桃江县','','','','',3,1,''),('430923','4309','00,43,4309','安化县','43','湖南省','4309','益阳市','430923','安化县','','','','',3,1,''),('430981','4309','00,43,4309','沅江市','43','湖南省','4309','益阳市','430981','沅江市','','','','',3,1,''),('4310','43','00,43','郴州市','43','湖南省','4310','郴州市','','','','','','',2,1,''),('431002','4310','00,43,4310','北湖区','43','湖南省','4310','郴州市','431002','北湖区','','','','',3,1,''),('431003','4310','00,43,4310','苏仙区','43','湖南省','4310','郴州市','431003','苏仙区','','','','',3,1,''),('431021','4310','00,43,4310','桂阳县','43','湖南省','4310','郴州市','431021','桂阳县','','','','',3,1,''),('431022','4310','00,43,4310','宜章县','43','湖南省','4310','郴州市','431022','宜章县','','','','',3,1,''),('431023','4310','00,43,4310','永兴县','43','湖南省','4310','郴州市','431023','永兴县','','','','',3,1,''),('431024','4310','00,43,4310','嘉禾县','43','湖南省','4310','郴州市','431024','嘉禾县','','','','',3,1,''),('431025','4310','00,43,4310','临武县','43','湖南省','4310','郴州市','431025','临武县','','','','',3,1,''),('431026','4310','00,43,4310','汝城县','43','湖南省','4310','郴州市','431026','汝城县','','','','',3,1,''),('431027','4310','00,43,4310','桂东县','43','湖南省','4310','郴州市','431027','桂东县','','','','',3,1,''),('431028','4310','00,43,4310','安仁县','43','湖南省','4310','郴州市','431028','安仁县','','','','',3,1,''),('431081','4310','00,43,4310','资兴市','43','湖南省','4310','郴州市','431081','资兴市','','','','',3,1,''),('4311','43','00,43','永州市','43','湖南省','4311','永州市','','','','','','',2,1,''),('431102','4311','00,43,4311','零陵区','43','湖南省','4311','永州市','431102','零陵区','','','','',3,1,''),('431103','4311','00,43,4311','冷水滩区','43','湖南省','4311','永州市','431103','冷水滩区','','','','',3,1,''),('431121','4311','00,43,4311','祁阳县','43','湖南省','4311','永州市','431121','祁阳县','','','','',3,1,''),('431122','4311','00,43,4311','东安县','43','湖南省','4311','永州市','431122','东安县','','','','',3,1,''),('431123','4311','00,43,4311','双牌县','43','湖南省','4311','永州市','431123','双牌县','','','','',3,1,''),('431124','4311','00,43,4311','道县','43','湖南省','4311','永州市','431124','道县','','','','',3,1,''),('431125','4311','00,43,4311','江永县','43','湖南省','4311','永州市','431125','江永县','','','','',3,1,''),('431126','4311','00,43,4311','宁远县','43','湖南省','4311','永州市','431126','宁远县','','','','',3,1,''),('431127','4311','00,43,4311','蓝山县','43','湖南省','4311','永州市','431127','蓝山县','','','','',3,1,''),('431128','4311','00,43,4311','新田县','43','湖南省','4311','永州市','431128','新田县','','','','',3,1,''),('431129','4311','00,43,4311','江华瑶族自治县','43','湖南省','4311','永州市','431129','江华瑶族自治县','','','','',3,1,''),('4312','43','00,43','怀化市','43','湖南省','4312','怀化市','','','','','','',2,1,''),('431202','4312','00,43,4312','鹤城区','43','湖南省','4312','怀化市','431202','鹤城区','','','','',3,1,''),('431221','4312','00,43,4312','中方县','43','湖南省','4312','怀化市','431221','中方县','','','','',3,1,''),('431222','4312','00,43,4312','沅陵县','43','湖南省','4312','怀化市','431222','沅陵县','','','','',3,1,''),('431223','4312','00,43,4312','辰溪县','43','湖南省','4312','怀化市','431223','辰溪县','','','','',3,1,''),('431224','4312','00,43,4312','溆浦县','43','湖南省','4312','怀化市','431224','溆浦县','','','','',3,1,''),('431225','4312','00,43,4312','会同县','43','湖南省','4312','怀化市','431225','会同县','','','','',3,1,''),('431226','4312','00,43,4312','麻阳苗族自治县','43','湖南省','4312','怀化市','431226','麻阳苗族自治县','','','','',3,1,''),('431227','4312','00,43,4312','新晃侗族自治县','43','湖南省','4312','怀化市','431227','新晃侗族自治县','','','','',3,1,''),('431228','4312','00,43,4312','芷江侗族自治县','43','湖南省','4312','怀化市','431228','芷江侗族自治县','','','','',3,1,''),('431229','4312','00,43,4312','靖州苗族侗族自治县','43','湖南省','4312','怀化市','431229','靖州苗族侗族自治县','','','','',3,1,''),('431230','4312','00,43,4312','通道侗族自治县','43','湖南省','4312','怀化市','431230','通道侗族自治县','','','','',3,1,''),('431281','4312','00,43,4312','洪江市','43','湖南省','4312','怀化市','431281','洪江市','','','','',3,1,''),('4313','43','00,43','娄底市','43','湖南省','4313','娄底市','','','','','','',2,1,''),('431302','4313','00,43,4313','娄星区','43','湖南省','4313','娄底市','431302','娄星区','','','','',3,1,''),('431321','4313','00,43,4313','双峰县','43','湖南省','4313','娄底市','431321','双峰县','','','','',3,1,''),('431322','4313','00,43,4313','新化县','43','湖南省','4313','娄底市','431322','新化县','','','','',3,1,''),('431381','4313','00,43,4313','冷水江市','43','湖南省','4313','娄底市','431381','冷水江市','','','','',3,1,''),('431382','4313','00,43,4313','涟源市','43','湖南省','4313','娄底市','431382','涟源市','','','','',3,1,''),('4331','43','00,43','湘西土家族苗族自治州','43','湖南省','4331','湘西土家族苗族自治州','','','','','','',2,1,''),('433101','4331','00,43,4331','吉首市','43','湖南省','4331','湘西土家族苗族自治州','433101','吉首市','','','','',3,1,''),('433122','4331','00,43,4331','泸溪县','43','湖南省','4331','湘西土家族苗族自治州','433122','泸溪县','','','','',3,1,''),('433123','4331','00,43,4331','凤凰县','43','湖南省','4331','湘西土家族苗族自治州','433123','凤凰县','','','','',3,1,''),('433124','4331','00,43,4331','花垣县','43','湖南省','4331','湘西土家族苗族自治州','433124','花垣县','','','','',3,1,''),('433125','4331','00,43,4331','保靖县','43','湖南省','4331','湘西土家族苗族自治州','433125','保靖县','','','','',3,1,''),('433126','4331','00,43,4331','古丈县','43','湖南省','4331','湘西土家族苗族自治州','433126','古丈县','','','','',3,1,''),('433127','4331','00,43,4331','永顺县','43','湖南省','4331','湘西土家族苗族自治州','433127','永顺县','','','','',3,1,''),('433130','4331','00,43,4331','龙山县','43','湖南省','4331','湘西土家族苗族自治州','433130','龙山县','','','','',3,1,''),('44','00','00','广东省','44','广东省','','','','','','','','',1,1,''),('4401','44','00,44','广州市','44','广东省','4401','广州市','','','','','','',2,1,''),('440103','4401','00,44,4401','荔湾区','44','广东省','4401','广州市','440103','荔湾区','','','','',3,1,''),('440104','4401','00,44,4401','越秀区','44','广东省','4401','广州市','440104','越秀区','','','','',3,1,''),('440105','4401','00,44,4401','海珠区','44','广东省','4401','广州市','440105','海珠区','','','','',3,1,''),('440106','4401','00,44,4401','天河区','44','广东省','4401','广州市','440106','天河区','','','','',3,1,''),('440111','4401','00,44,4401','白云区','44','广东省','4401','广州市','440111','白云区','','','','',3,1,''),('440112','4401','00,44,4401','黄埔区','44','广东省','4401','广州市','440112','黄埔区','','','','',3,1,''),('440113','4401','00,44,4401','番禺区','44','广东省','4401','广州市','440113','番禺区','','','','',3,1,''),('440114','4401','00,44,4401','花都区','44','广东省','4401','广州市','440114','花都区','','','','',3,1,''),('440115','4401','00,44,4401','南沙区','44','广东省','4401','广州市','440115','南沙区','','','','',3,1,''),('440117','4401','00,44,4401','从化区','44','广东省','4401','广州市','440117','从化区','','','','',3,1,''),('440118','4401','00,44,4401','增城区','44','广东省','4401','广州市','440118','增城区','','','','',3,1,''),('4402','44','00,44','韶关市','44','广东省','4402','韶关市','','','','','','',2,1,''),('440203','4402','00,44,4402','武江区','44','广东省','4402','韶关市','440203','武江区','','','','',3,1,''),('440204','4402','00,44,4402','浈江区','44','广东省','4402','韶关市','440204','浈江区','','','','',3,1,''),('440205','4402','00,44,4402','曲江区','44','广东省','4402','韶关市','440205','曲江区','','','','',3,1,''),('440222','4402','00,44,4402','始兴县','44','广东省','4402','韶关市','440222','始兴县','','','','',3,1,''),('440224','4402','00,44,4402','仁化县','44','广东省','4402','韶关市','440224','仁化县','','','','',3,1,''),('440229','4402','00,44,4402','翁源县','44','广东省','4402','韶关市','440229','翁源县','','','','',3,1,''),('440232','4402','00,44,4402','乳源瑶族自治县','44','广东省','4402','韶关市','440232','乳源瑶族自治县','','','','',3,1,''),('440233','4402','00,44,4402','新丰县','44','广东省','4402','韶关市','440233','新丰县','','','','',3,1,''),('440281','4402','00,44,4402','乐昌市','44','广东省','4402','韶关市','440281','乐昌市','','','','',3,1,''),('440282','4402','00,44,4402','南雄市','44','广东省','4402','韶关市','440282','南雄市','','','','',3,1,''),('4403','44','00,44','深圳市','44','广东省','4403','深圳市','','','','','','',2,1,''),('440303','4403','00,44,4403','罗湖区','44','广东省','4403','深圳市','440303','罗湖区','','','','',3,1,''),('440304','4403','00,44,4403','福田区','44','广东省','4403','深圳市','440304','福田区','','','','',3,1,''),('440305','4403','00,44,4403','南山区','44','广东省','4403','深圳市','440305','南山区','','','','',3,1,''),('440306','4403','00,44,4403','宝安区','44','广东省','4403','深圳市','440306','宝安区','','','','',3,1,''),('440307','4403','00,44,4403','龙岗区','44','广东省','4403','深圳市','440307','龙岗区','','','','',3,1,''),('440308','4403','00,44,4403','盐田区','44','广东省','4403','深圳市','440308','盐田区','','','','',3,1,''),('440309','4403','00,44,4403','龙华区','44','广东省','4403','深圳市','440309','龙华区','','','','',3,1,''),('440310','4403','00,44,4403','坪山区','44','广东省','4403','深圳市','440310','坪山区','','','','',3,1,''),('440311','4403','00,44,4403','光明区','44','广东省','4403','深圳市','440311','光明区','','','','',3,1,''),('4404','44','00,44','珠海市','44','广东省','4404','珠海市','','','','','','',2,1,''),('440402','4404','00,44,4404','香洲区','44','广东省','4404','珠海市','440402','香洲区','','','','',3,1,''),('440403','4404','00,44,4404','斗门区','44','广东省','4404','珠海市','440403','斗门区','','','','',3,1,''),('440404','4404','00,44,4404','金湾区','44','广东省','4404','珠海市','440404','金湾区','','','','',3,1,''),('4405','44','00,44','汕头市','44','广东省','4405','汕头市','','','','','','',2,1,''),('440507','4405','00,44,4405','龙湖区','44','广东省','4405','汕头市','440507','龙湖区','','','','',3,1,''),('440511','4405','00,44,4405','金平区','44','广东省','4405','汕头市','440511','金平区','','','','',3,1,''),('440512','4405','00,44,4405','濠江区','44','广东省','4405','汕头市','440512','濠江区','','','','',3,1,''),('440513','4405','00,44,4405','潮阳区','44','广东省','4405','汕头市','440513','潮阳区','','','','',3,1,''),('440514','4405','00,44,4405','潮南区','44','广东省','4405','汕头市','440514','潮南区','','','','',3,1,''),('440515','4405','00,44,4405','澄海区','44','广东省','4405','汕头市','440515','澄海区','','','','',3,1,''),('440523','4405','00,44,4405','南澳县','44','广东省','4405','汕头市','440523','南澳县','','','','',3,1,''),('4406','44','00,44','佛山市','44','广东省','4406','佛山市','','','','','','',2,1,''),('440604','4406','00,44,4406','禅城区','44','广东省','4406','佛山市','440604','禅城区','','','','',3,1,''),('440605','4406','00,44,4406','南海区','44','广东省','4406','佛山市','440605','南海区','','','','',3,1,''),('440606','4406','00,44,4406','顺德区','44','广东省','4406','佛山市','440606','顺德区','','','','',3,1,''),('440607','4406','00,44,4406','三水区','44','广东省','4406','佛山市','440607','三水区','','','','',3,1,''),('440608','4406','00,44,4406','高明区','44','广东省','4406','佛山市','440608','高明区','','','','',3,1,''),('4407','44','00,44','江门市','44','广东省','4407','江门市','','','','','','',2,1,''),('440703','4407','00,44,4407','蓬江区','44','广东省','4407','江门市','440703','蓬江区','','','','',3,1,''),('440704','4407','00,44,4407','江海区','44','广东省','4407','江门市','440704','江海区','','','','',3,1,''),('440705','4407','00,44,4407','新会区','44','广东省','4407','江门市','440705','新会区','','','','',3,1,''),('440781','4407','00,44,4407','台山市','44','广东省','4407','江门市','440781','台山市','','','','',3,1,''),('440783','4407','00,44,4407','开平市','44','广东省','4407','江门市','440783','开平市','','','','',3,1,''),('440784','4407','00,44,4407','鹤山市','44','广东省','4407','江门市','440784','鹤山市','','','','',3,1,''),('440785','4407','00,44,4407','恩平市','44','广东省','4407','江门市','440785','恩平市','','','','',3,1,''),('4408','44','00,44','湛江市','44','广东省','4408','湛江市','','','','','','',2,1,''),('440802','4408','00,44,4408','赤坎区','44','广东省','4408','湛江市','440802','赤坎区','','','','',3,1,''),('440803','4408','00,44,4408','霞山区','44','广东省','4408','湛江市','440803','霞山区','','','','',3,1,''),('440804','4408','00,44,4408','坡头区','44','广东省','4408','湛江市','440804','坡头区','','','','',3,1,''),('440811','4408','00,44,4408','麻章区','44','广东省','4408','湛江市','440811','麻章区','','','','',3,1,''),('440823','4408','00,44,4408','遂溪县','44','广东省','4408','湛江市','440823','遂溪县','','','','',3,1,''),('440825','4408','00,44,4408','徐闻县','44','广东省','4408','湛江市','440825','徐闻县','','','','',3,1,''),('440881','4408','00,44,4408','廉江市','44','广东省','4408','湛江市','440881','廉江市','','','','',3,1,''),('440882','4408','00,44,4408','雷州市','44','广东省','4408','湛江市','440882','雷州市','','','','',3,1,''),('440883','4408','00,44,4408','吴川市','44','广东省','4408','湛江市','440883','吴川市','','','','',3,1,''),('4409','44','00,44','茂名市','44','广东省','4409','茂名市','','','','','','',2,1,''),('440902','4409','00,44,4409','茂南区','44','广东省','4409','茂名市','440902','茂南区','','','','',3,1,''),('440904','4409','00,44,4409','电白区','44','广东省','4409','茂名市','440904','电白区','','','','',3,1,''),('440981','4409','00,44,4409','高州市','44','广东省','4409','茂名市','440981','高州市','','','','',3,1,''),('440982','4409','00,44,4409','化州市','44','广东省','4409','茂名市','440982','化州市','','','','',3,1,''),('440983','4409','00,44,4409','信宜市','44','广东省','4409','茂名市','440983','信宜市','','','','',3,1,''),('4412','44','00,44','肇庆市','44','广东省','4412','肇庆市','','','','','','',2,1,''),('441202','4412','00,44,4412','端州区','44','广东省','4412','肇庆市','441202','端州区','','','','',3,1,''),('441203','4412','00,44,4412','鼎湖区','44','广东省','4412','肇庆市','441203','鼎湖区','','','','',3,1,''),('441204','4412','00,44,4412','高要区','44','广东省','4412','肇庆市','441204','高要区','','','','',3,1,''),('441223','4412','00,44,4412','广宁县','44','广东省','4412','肇庆市','441223','广宁县','','','','',3,1,''),('441224','4412','00,44,4412','怀集县','44','广东省','4412','肇庆市','441224','怀集县','','','','',3,1,''),('441225','4412','00,44,4412','封开县','44','广东省','4412','肇庆市','441225','封开县','','','','',3,1,''),('441226','4412','00,44,4412','德庆县','44','广东省','4412','肇庆市','441226','德庆县','','','','',3,1,''),('441284','4412','00,44,4412','四会市','44','广东省','4412','肇庆市','441284','四会市','','','','',3,1,''),('4413','44','00,44','惠州市','44','广东省','4413','惠州市','','','','','','',2,1,''),('441302','4413','00,44,4413','惠城区','44','广东省','4413','惠州市','441302','惠城区','','','','',3,1,''),('441303','4413','00,44,4413','惠阳区','44','广东省','4413','惠州市','441303','惠阳区','','','','',3,1,''),('441322','4413','00,44,4413','博罗县','44','广东省','4413','惠州市','441322','博罗县','','','','',3,1,''),('441323','4413','00,44,4413','惠东县','44','广东省','4413','惠州市','441323','惠东县','','','','',3,1,''),('441324','4413','00,44,4413','龙门县','44','广东省','4413','惠州市','441324','龙门县','','','','',3,1,''),('4414','44','00,44','梅州市','44','广东省','4414','梅州市','','','','','','',2,1,''),('441402','4414','00,44,4414','梅江区','44','广东省','4414','梅州市','441402','梅江区','','','','',3,1,''),('441403','4414','00,44,4414','梅县区','44','广东省','4414','梅州市','441403','梅县区','','','','',3,1,''),('441422','4414','00,44,4414','大埔县','44','广东省','4414','梅州市','441422','大埔县','','','','',3,1,''),('441423','4414','00,44,4414','丰顺县','44','广东省','4414','梅州市','441423','丰顺县','','','','',3,1,''),('441424','4414','00,44,4414','五华县','44','广东省','4414','梅州市','441424','五华县','','','','',3,1,''),('441426','4414','00,44,4414','平远县','44','广东省','4414','梅州市','441426','平远县','','','','',3,1,''),('441427','4414','00,44,4414','蕉岭县','44','广东省','4414','梅州市','441427','蕉岭县','','','','',3,1,''),('441481','4414','00,44,4414','兴宁市','44','广东省','4414','梅州市','441481','兴宁市','','','','',3,1,''),('4415','44','00,44','汕尾市','44','广东省','4415','汕尾市','','','','','','',2,1,''),('441502','4415','00,44,4415','城区','44','广东省','4415','汕尾市','441502','城区','','','','',3,1,''),('441521','4415','00,44,4415','海丰县','44','广东省','4415','汕尾市','441521','海丰县','','','','',3,1,''),('441523','4415','00,44,4415','陆河县','44','广东省','4415','汕尾市','441523','陆河县','','','','',3,1,''),('441581','4415','00,44,4415','陆丰市','44','广东省','4415','汕尾市','441581','陆丰市','','','','',3,1,''),('4416','44','00,44','河源市','44','广东省','4416','河源市','','','','','','',2,1,''),('441602','4416','00,44,4416','源城区','44','广东省','4416','河源市','441602','源城区','','','','',3,1,''),('441621','4416','00,44,4416','紫金县','44','广东省','4416','河源市','441621','紫金县','','','','',3,1,''),('441622','4416','00,44,4416','龙川县','44','广东省','4416','河源市','441622','龙川县','','','','',3,1,''),('441623','4416','00,44,4416','连平县','44','广东省','4416','河源市','441623','连平县','','','','',3,1,''),('441624','4416','00,44,4416','和平县','44','广东省','4416','河源市','441624','和平县','','','','',3,1,''),('441625','4416','00,44,4416','东源县','44','广东省','4416','河源市','441625','东源县','','','','',3,1,''),('4417','44','00,44','阳江市','44','广东省','4417','阳江市','','','','','','',2,1,''),('441702','4417','00,44,4417','江城区','44','广东省','4417','阳江市','441702','江城区','','','','',3,1,''),('441704','4417','00,44,4417','阳东区','44','广东省','4417','阳江市','441704','阳东区','','','','',3,1,''),('441721','4417','00,44,4417','阳西县','44','广东省','4417','阳江市','441721','阳西县','','','','',3,1,''),('441781','4417','00,44,4417','阳春市','44','广东省','4417','阳江市','441781','阳春市','','','','',3,1,''),('4418','44','00,44','清远市','44','广东省','4418','清远市','','','','','','',2,1,''),('441802','4418','00,44,4418','清城区','44','广东省','4418','清远市','441802','清城区','','','','',3,1,''),('441803','4418','00,44,4418','清新区','44','广东省','4418','清远市','441803','清新区','','','','',3,1,''),('441821','4418','00,44,4418','佛冈县','44','广东省','4418','清远市','441821','佛冈县','','','','',3,1,''),('441823','4418','00,44,4418','阳山县','44','广东省','4418','清远市','441823','阳山县','','','','',3,1,''),('441825','4418','00,44,4418','连山壮族瑶族自治县','44','广东省','4418','清远市','441825','连山壮族瑶族自治县','','','','',3,1,''),('441826','4418','00,44,4418','连南瑶族自治县','44','广东省','4418','清远市','441826','连南瑶族自治县','','','','',3,1,''),('441881','4418','00,44,4418','英德市','44','广东省','4418','清远市','441881','英德市','','','','',3,1,''),('441882','4418','00,44,4418','连州市','44','广东省','4418','清远市','441882','连州市','','','','',3,1,''),('4419','44','00,44','东莞市','44','广东省','4419','东莞市','','','','','','',2,1,''),('441900','4419','00,44,4419','东莞市','44','广东省','4419','东莞市','441900','东莞市','','','','',3,1,''),('4420','44','00,44','中山市','44','广东省','4420','中山市','','','','','','',2,1,''),('442000','4420','00,44,4420','中山市','44','广东省','4420','中山市','442000','中山市','','','','',3,1,''),('4451','44','00,44','潮州市','44','广东省','4451','潮州市','','','','','','',2,1,''),('445102','4451','00,44,4451','湘桥区','44','广东省','4451','潮州市','445102','湘桥区','','','','',3,1,''),('445103','4451','00,44,4451','潮安区','44','广东省','4451','潮州市','445103','潮安区','','','','',3,1,''),('445122','4451','00,44,4451','饶平县','44','广东省','4451','潮州市','445122','饶平县','','','','',3,1,''),('4452','44','00,44','揭阳市','44','广东省','4452','揭阳市','','','','','','',2,1,''),('445202','4452','00,44,4452','榕城区','44','广东省','4452','揭阳市','445202','榕城区','','','','',3,1,''),('445203','4452','00,44,4452','揭东区','44','广东省','4452','揭阳市','445203','揭东区','','','','',3,1,''),('445222','4452','00,44,4452','揭西县','44','广东省','4452','揭阳市','445222','揭西县','','','','',3,1,''),('445224','4452','00,44,4452','惠来县','44','广东省','4452','揭阳市','445224','惠来县','','','','',3,1,''),('445281','4452','00,44,4452','普宁市','44','广东省','4452','揭阳市','445281','普宁市','','','','',3,1,''),('4453','44','00,44','云浮市','44','广东省','4453','云浮市','','','','','','',2,1,''),('445302','4453','00,44,4453','云城区','44','广东省','4453','云浮市','445302','云城区','','','','',3,1,''),('445303','4453','00,44,4453','云安区','44','广东省','4453','云浮市','445303','云安区','','','','',3,1,''),('445321','4453','00,44,4453','新兴县','44','广东省','4453','云浮市','445321','新兴县','','','','',3,1,''),('445322','4453','00,44,4453','郁南县','44','广东省','4453','云浮市','445322','郁南县','','','','',3,1,''),('445381','4453','00,44,4453','罗定市','44','广东省','4453','云浮市','445381','罗定市','','','','',3,1,''),('45','00','00','广西壮族自治区','45','广西壮族自治区','','','','','','','','',1,1,''),('4501','45','00,45','南宁市','45','广西壮族自治区','4501','南宁市','','','','','','',2,1,''),('450102','4501','00,45,4501','兴宁区','45','广西壮族自治区','4501','南宁市','450102','兴宁区','','','','',3,1,''),('450103','4501','00,45,4501','青秀区','45','广西壮族自治区','4501','南宁市','450103','青秀区','','','','',3,1,''),('450105','4501','00,45,4501','江南区','45','广西壮族自治区','4501','南宁市','450105','江南区','','','','',3,1,''),('450107','4501','00,45,4501','西乡塘区','45','广西壮族自治区','4501','南宁市','450107','西乡塘区','','','','',3,1,''),('450108','4501','00,45,4501','良庆区','45','广西壮族自治区','4501','南宁市','450108','良庆区','','','','',3,1,''),('450109','4501','00,45,4501','邕宁区','45','广西壮族自治区','4501','南宁市','450109','邕宁区','','','','',3,1,''),('450110','4501','00,45,4501','武鸣区','45','广西壮族自治区','4501','南宁市','450110','武鸣区','','','','',3,1,''),('450123','4501','00,45,4501','隆安县','45','广西壮族自治区','4501','南宁市','450123','隆安县','','','','',3,1,''),('450124','4501','00,45,4501','马山县','45','广西壮族自治区','4501','南宁市','450124','马山县','','','','',3,1,''),('450125','4501','00,45,4501','上林县','45','广西壮族自治区','4501','南宁市','450125','上林县','','','','',3,1,''),('450126','4501','00,45,4501','宾阳县','45','广西壮族自治区','4501','南宁市','450126','宾阳县','','','','',3,1,''),('450127','4501','00,45,4501','横县','45','广西壮族自治区','4501','南宁市','450127','横县','','','','',3,1,''),('4502','45','00,45','柳州市','45','广西壮族自治区','4502','柳州市','','','','','','',2,1,''),('450202','4502','00,45,4502','城中区','45','广西壮族自治区','4502','柳州市','450202','城中区','','','','',3,1,''),('450203','4502','00,45,4502','鱼峰区','45','广西壮族自治区','4502','柳州市','450203','鱼峰区','','','','',3,1,''),('450204','4502','00,45,4502','柳南区','45','广西壮族自治区','4502','柳州市','450204','柳南区','','','','',3,1,''),('450205','4502','00,45,4502','柳北区','45','广西壮族自治区','4502','柳州市','450205','柳北区','','','','',3,1,''),('450206','4502','00,45,4502','柳江区','45','广西壮族自治区','4502','柳州市','450206','柳江区','','','','',3,1,''),('450222','4502','00,45,4502','柳城县','45','广西壮族自治区','4502','柳州市','450222','柳城县','','','','',3,1,''),('450223','4502','00,45,4502','鹿寨县','45','广西壮族自治区','4502','柳州市','450223','鹿寨县','','','','',3,1,''),('450224','4502','00,45,4502','融安县','45','广西壮族自治区','4502','柳州市','450224','融安县','','','','',3,1,''),('450225','4502','00,45,4502','融水苗族自治县','45','广西壮族自治区','4502','柳州市','450225','融水苗族自治县','','','','',3,1,''),('450226','4502','00,45,4502','三江侗族自治县','45','广西壮族自治区','4502','柳州市','450226','三江侗族自治县','','','','',3,1,''),('4503','45','00,45','桂林市','45','广西壮族自治区','4503','桂林市','','','','','','',2,1,''),('450302','4503','00,45,4503','秀峰区','45','广西壮族自治区','4503','桂林市','450302','秀峰区','','','','',3,1,''),('450303','4503','00,45,4503','叠彩区','45','广西壮族自治区','4503','桂林市','450303','叠彩区','','','','',3,1,''),('450304','4503','00,45,4503','象山区','45','广西壮族自治区','4503','桂林市','450304','象山区','','','','',3,1,''),('450305','4503','00,45,4503','七星区','45','广西壮族自治区','4503','桂林市','450305','七星区','','','','',3,1,''),('450311','4503','00,45,4503','雁山区','45','广西壮族自治区','4503','桂林市','450311','雁山区','','','','',3,1,''),('450312','4503','00,45,4503','临桂区','45','广西壮族自治区','4503','桂林市','450312','临桂区','','','','',3,1,''),('450321','4503','00,45,4503','阳朔县','45','广西壮族自治区','4503','桂林市','450321','阳朔县','','','','',3,1,''),('450323','4503','00,45,4503','灵川县','45','广西壮族自治区','4503','桂林市','450323','灵川县','','','','',3,1,''),('450324','4503','00,45,4503','全州县','45','广西壮族自治区','4503','桂林市','450324','全州县','','','','',3,1,''),('450325','4503','00,45,4503','兴安县','45','广西壮族自治区','4503','桂林市','450325','兴安县','','','','',3,1,''),('450326','4503','00,45,4503','永福县','45','广西壮族自治区','4503','桂林市','450326','永福县','','','','',3,1,''),('450327','4503','00,45,4503','灌阳县','45','广西壮族自治区','4503','桂林市','450327','灌阳县','','','','',3,1,''),('450328','4503','00,45,4503','龙胜各族自治县','45','广西壮族自治区','4503','桂林市','450328','龙胜各族自治县','','','','',3,1,''),('450329','4503','00,45,4503','资源县','45','广西壮族自治区','4503','桂林市','450329','资源县','','','','',3,1,''),('450330','4503','00,45,4503','平乐县','45','广西壮族自治区','4503','桂林市','450330','平乐县','','','','',3,1,''),('450332','4503','00,45,4503','恭城瑶族自治县','45','广西壮族自治区','4503','桂林市','450332','恭城瑶族自治县','','','','',3,1,''),('450381','4503','00,45,4503','荔浦市','45','广西壮族自治区','4503','桂林市','450381','荔浦市','','','','',3,1,''),('4504','45','00,45','梧州市','45','广西壮族自治区','4504','梧州市','','','','','','',2,1,''),('450403','4504','00,45,4504','万秀区','45','广西壮族自治区','4504','梧州市','450403','万秀区','','','','',3,1,''),('450405','4504','00,45,4504','长洲区','45','广西壮族自治区','4504','梧州市','450405','长洲区','','','','',3,1,''),('450406','4504','00,45,4504','龙圩区','45','广西壮族自治区','4504','梧州市','450406','龙圩区','','','','',3,1,''),('450421','4504','00,45,4504','苍梧县','45','广西壮族自治区','4504','梧州市','450421','苍梧县','','','','',3,1,''),('450422','4504','00,45,4504','藤县','45','广西壮族自治区','4504','梧州市','450422','藤县','','','','',3,1,''),('450423','4504','00,45,4504','蒙山县','45','广西壮族自治区','4504','梧州市','450423','蒙山县','','','','',3,1,''),('450481','4504','00,45,4504','岑溪市','45','广西壮族自治区','4504','梧州市','450481','岑溪市','','','','',3,1,''),('4505','45','00,45','北海市','45','广西壮族自治区','4505','北海市','','','','','','',2,1,''),('450502','4505','00,45,4505','海城区','45','广西壮族自治区','4505','北海市','450502','海城区','','','','',3,1,''),('450503','4505','00,45,4505','银海区','45','广西壮族自治区','4505','北海市','450503','银海区','','','','',3,1,''),('450512','4505','00,45,4505','铁山港区','45','广西壮族自治区','4505','北海市','450512','铁山港区','','','','',3,1,''),('450521','4505','00,45,4505','合浦县','45','广西壮族自治区','4505','北海市','450521','合浦县','','','','',3,1,''),('4506','45','00,45','防城港市','45','广西壮族自治区','4506','防城港市','','','','','','',2,1,''),('450602','4506','00,45,4506','港口区','45','广西壮族自治区','4506','防城港市','450602','港口区','','','','',3,1,''),('450603','4506','00,45,4506','防城区','45','广西壮族自治区','4506','防城港市','450603','防城区','','','','',3,1,''),('450621','4506','00,45,4506','上思县','45','广西壮族自治区','4506','防城港市','450621','上思县','','','','',3,1,''),('450681','4506','00,45,4506','东兴市','45','广西壮族自治区','4506','防城港市','450681','东兴市','','','','',3,1,''),('4507','45','00,45','钦州市','45','广西壮族自治区','4507','钦州市','','','','','','',2,1,''),('450702','4507','00,45,4507','钦南区','45','广西壮族自治区','4507','钦州市','450702','钦南区','','','','',3,1,''),('450703','4507','00,45,4507','钦北区','45','广西壮族自治区','4507','钦州市','450703','钦北区','','','','',3,1,''),('450721','4507','00,45,4507','灵山县','45','广西壮族自治区','4507','钦州市','450721','灵山县','','','','',3,1,''),('450722','4507','00,45,4507','浦北县','45','广西壮族自治区','4507','钦州市','450722','浦北县','','','','',3,1,''),('4508','45','00,45','贵港市','45','广西壮族自治区','4508','贵港市','','','','','','',2,1,''),('450802','4508','00,45,4508','港北区','45','广西壮族自治区','4508','贵港市','450802','港北区','','','','',3,1,''),('450803','4508','00,45,4508','港南区','45','广西壮族自治区','4508','贵港市','450803','港南区','','','','',3,1,''),('450804','4508','00,45,4508','覃塘区','45','广西壮族自治区','4508','贵港市','450804','覃塘区','','','','',3,1,''),('450821','4508','00,45,4508','平南县','45','广西壮族自治区','4508','贵港市','450821','平南县','','','','',3,1,''),('450881','4508','00,45,4508','桂平市','45','广西壮族自治区','4508','贵港市','450881','桂平市','','','','',3,1,''),('4509','45','00,45','玉林市','45','广西壮族自治区','4509','玉林市','','','','','','',2,1,''),('450902','4509','00,45,4509','玉州区','45','广西壮族自治区','4509','玉林市','450902','玉州区','','','','',3,1,''),('450903','4509','00,45,4509','福绵区','45','广西壮族自治区','4509','玉林市','450903','福绵区','','','','',3,1,''),('450921','4509','00,45,4509','容县','45','广西壮族自治区','4509','玉林市','450921','容县','','','','',3,1,''),('450922','4509','00,45,4509','陆川县','45','广西壮族自治区','4509','玉林市','450922','陆川县','','','','',3,1,''),('450923','4509','00,45,4509','博白县','45','广西壮族自治区','4509','玉林市','450923','博白县','','','','',3,1,''),('450924','4509','00,45,4509','兴业县','45','广西壮族自治区','4509','玉林市','450924','兴业县','','','','',3,1,''),('450981','4509','00,45,4509','北流市','45','广西壮族自治区','4509','玉林市','450981','北流市','','','','',3,1,''),('4510','45','00,45','百色市','45','广西壮族自治区','4510','百色市','','','','','','',2,1,''),('451002','4510','00,45,4510','右江区','45','广西壮族自治区','4510','百色市','451002','右江区','','','','',3,1,''),('451003','4510','00,45,4510','田阳区','45','广西壮族自治区','4510','百色市','451003','田阳区','','','','',3,1,''),('451022','4510','00,45,4510','田东县','45','广西壮族自治区','4510','百色市','451022','田东县','','','','',3,1,''),('451024','4510','00,45,4510','德保县','45','广西壮族自治区','4510','百色市','451024','德保县','','','','',3,1,''),('451026','4510','00,45,4510','那坡县','45','广西壮族自治区','4510','百色市','451026','那坡县','','','','',3,1,''),('451027','4510','00,45,4510','凌云县','45','广西壮族自治区','4510','百色市','451027','凌云县','','','','',3,1,''),('451028','4510','00,45,4510','乐业县','45','广西壮族自治区','4510','百色市','451028','乐业县','','','','',3,1,''),('451029','4510','00,45,4510','田林县','45','广西壮族自治区','4510','百色市','451029','田林县','','','','',3,1,''),('451030','4510','00,45,4510','西林县','45','广西壮族自治区','4510','百色市','451030','西林县','','','','',3,1,''),('451031','4510','00,45,4510','隆林各族自治县','45','广西壮族自治区','4510','百色市','451031','隆林各族自治县','','','','',3,1,''),('451081','4510','00,45,4510','靖西市','45','广西壮族自治区','4510','百色市','451081','靖西市','','','','',3,1,''),('451082','4510','00,45,4510','平果市','45','广西壮族自治区','4510','百色市','451082','平果市','','','','',3,1,''),('4511','45','00,45','贺州市','45','广西壮族自治区','4511','贺州市','','','','','','',2,1,''),('451102','4511','00,45,4511','八步区','45','广西壮族自治区','4511','贺州市','451102','八步区','','','','',3,1,''),('451103','4511','00,45,4511','平桂区','45','广西壮族自治区','4511','贺州市','451103','平桂区','','','','',3,1,''),('451121','4511','00,45,4511','昭平县','45','广西壮族自治区','4511','贺州市','451121','昭平县','','','','',3,1,''),('451122','4511','00,45,4511','钟山县','45','广西壮族自治区','4511','贺州市','451122','钟山县','','','','',3,1,''),('451123','4511','00,45,4511','富川瑶族自治县','45','广西壮族自治区','4511','贺州市','451123','富川瑶族自治县','','','','',3,1,''),('4512','45','00,45','河池市','45','广西壮族自治区','4512','河池市','','','','','','',2,1,''),('451202','4512','00,45,4512','金城江区','45','广西壮族自治区','4512','河池市','451202','金城江区','','','','',3,1,''),('451203','4512','00,45,4512','宜州区','45','广西壮族自治区','4512','河池市','451203','宜州区','','','','',3,1,''),('451221','4512','00,45,4512','南丹县','45','广西壮族自治区','4512','河池市','451221','南丹县','','','','',3,1,''),('451222','4512','00,45,4512','天峨县','45','广西壮族自治区','4512','河池市','451222','天峨县','','','','',3,1,''),('451223','4512','00,45,4512','凤山县','45','广西壮族自治区','4512','河池市','451223','凤山县','','','','',3,1,''),('451224','4512','00,45,4512','东兰县','45','广西壮族自治区','4512','河池市','451224','东兰县','','','','',3,1,''),('451225','4512','00,45,4512','罗城仫佬族自治县','45','广西壮族自治区','4512','河池市','451225','罗城仫佬族自治县','','','','',3,1,''),('451226','4512','00,45,4512','环江毛南族自治县','45','广西壮族自治区','4512','河池市','451226','环江毛南族自治县','','','','',3,1,''),('451227','4512','00,45,4512','巴马瑶族自治县','45','广西壮族自治区','4512','河池市','451227','巴马瑶族自治县','','','','',3,1,''),('451228','4512','00,45,4512','都安瑶族自治县','45','广西壮族自治区','4512','河池市','451228','都安瑶族自治县','','','','',3,1,''),('451229','4512','00,45,4512','大化瑶族自治县','45','广西壮族自治区','4512','河池市','451229','大化瑶族自治县','','','','',3,1,''),('4513','45','00,45','来宾市','45','广西壮族自治区','4513','来宾市','','','','','','',2,1,''),('451302','4513','00,45,4513','兴宾区','45','广西壮族自治区','4513','来宾市','451302','兴宾区','','','','',3,1,''),('451321','4513','00,45,4513','忻城县','45','广西壮族自治区','4513','来宾市','451321','忻城县','','','','',3,1,''),('451322','4513','00,45,4513','象州县','45','广西壮族自治区','4513','来宾市','451322','象州县','','','','',3,1,''),('451323','4513','00,45,4513','武宣县','45','广西壮族自治区','4513','来宾市','451323','武宣县','','','','',3,1,''),('451324','4513','00,45,4513','金秀瑶族自治县','45','广西壮族自治区','4513','来宾市','451324','金秀瑶族自治县','','','','',3,1,''),('451381','4513','00,45,4513','合山市','45','广西壮族自治区','4513','来宾市','451381','合山市','','','','',3,1,''),('4514','45','00,45','崇左市','45','广西壮族自治区','4514','崇左市','','','','','','',2,1,''),('451402','4514','00,45,4514','江州区','45','广西壮族自治区','4514','崇左市','451402','江州区','','','','',3,1,''),('451421','4514','00,45,4514','扶绥县','45','广西壮族自治区','4514','崇左市','451421','扶绥县','','','','',3,1,''),('451422','4514','00,45,4514','宁明县','45','广西壮族自治区','4514','崇左市','451422','宁明县','','','','',3,1,''),('451423','4514','00,45,4514','龙州县','45','广西壮族自治区','4514','崇左市','451423','龙州县','','','','',3,1,''),('451424','4514','00,45,4514','大新县','45','广西壮族自治区','4514','崇左市','451424','大新县','','','','',3,1,''),('451425','4514','00,45,4514','天等县','45','广西壮族自治区','4514','崇左市','451425','天等县','','','','',3,1,''),('451481','4514','00,45,4514','凭祥市','45','广西壮族自治区','4514','崇左市','451481','凭祥市','','','','',3,1,''),('46','00','00','海南省','46','海南省','','','','','','','','',1,1,''),('4601','46','00,46','海口市','46','海南省','4601','海口市','','','','','','',2,1,''),('460105','4601','00,46,4601','秀英区','46','海南省','4601','海口市','460105','秀英区','','','','',3,1,''),('460106','4601','00,46,4601','龙华区','46','海南省','4601','海口市','460106','龙华区','','','','',3,1,''),('460107','4601','00,46,4601','琼山区','46','海南省','4601','海口市','460107','琼山区','','','','',3,1,''),('460108','4601','00,46,4601','美兰区','46','海南省','4601','海口市','460108','美兰区','','','','',3,1,''),('4602','46','00,46','三亚市','46','海南省','4602','三亚市','','','','','','',2,1,''),('460202','4602','00,46,4602','海棠区','46','海南省','4602','三亚市','460202','海棠区','','','','',3,1,''),('460203','4602','00,46,4602','吉阳区','46','海南省','4602','三亚市','460203','吉阳区','','','','',3,1,''),('460204','4602','00,46,4602','天涯区','46','海南省','4602','三亚市','460204','天涯区','','','','',3,1,''),('460205','4602','00,46,4602','崖州区','46','海南省','4602','三亚市','460205','崖州区','','','','',3,1,''),('4603','46','00,46','三沙市','46','海南省','4603','三沙市','','','','','','',2,1,''),('460300','4603','00,46,4603','三沙市','46','海南省','4603','三沙市','460300','三沙市','','','','',3,1,''),('4604','46','00,46','儋州市','46','海南省','4604','儋州市','','','','','','',2,1,''),('460400','4604','00,46,4604','儋州市','46','海南省','4604','儋州市','460400','儋州市','','','','',3,1,''),('4690','46','00,46','省直辖县级行政区','46','海南省','4690','省直辖县级行政区','','','','','','',2,1,''),('469001','4690','00,46,4690','五指山市','46','海南省','4690','省直辖县级行政区','469001','五指山市','','','','',3,1,''),('469002','4690','00,46,4690','琼海市','46','海南省','4690','省直辖县级行政区','469002','琼海市','','','','',3,1,''),('469005','4690','00,46,4690','文昌市','46','海南省','4690','省直辖县级行政区','469005','文昌市','','','','',3,1,''),('469006','4690','00,46,4690','万宁市','46','海南省','4690','省直辖县级行政区','469006','万宁市','','','','',3,1,''),('469007','4690','00,46,4690','东方市','46','海南省','4690','省直辖县级行政区','469007','东方市','','','','',3,1,''),('469021','4690','00,46,4690','定安县','46','海南省','4690','省直辖县级行政区','469021','定安县','','','','',3,1,''),('469022','4690','00,46,4690','屯昌县','46','海南省','4690','省直辖县级行政区','469022','屯昌县','','','','',3,1,''),('469023','4690','00,46,4690','澄迈县','46','海南省','4690','省直辖县级行政区','469023','澄迈县','','','','',3,1,''),('469024','4690','00,46,4690','临高县','46','海南省','4690','省直辖县级行政区','469024','临高县','','','','',3,1,''),('469025','4690','00,46,4690','白沙黎族自治县','46','海南省','4690','省直辖县级行政区','469025','白沙黎族自治县','','','','',3,1,''),('469026','4690','00,46,4690','昌江黎族自治县','46','海南省','4690','省直辖县级行政区','469026','昌江黎族自治县','','','','',3,1,''),('469027','4690','00,46,4690','乐东黎族自治县','46','海南省','4690','省直辖县级行政区','469027','乐东黎族自治县','','','','',3,1,''),('469028','4690','00,46,4690','陵水黎族自治县','46','海南省','4690','省直辖县级行政区','469028','陵水黎族自治县','','','','',3,1,''),('469029','4690','00,46,4690','保亭黎族苗族自治县','46','海南省','4690','省直辖县级行政区','469029','保亭黎族苗族自治县','','','','',3,1,''),('469030','4690','00,46,4690','琼中黎族苗族自治县','46','海南省','4690','省直辖县级行政区','469030','琼中黎族苗族自治县','','','','',3,1,''),('50','00','00','重庆市','50','重庆市','','','','','','','','',1,1,''),('5001','50','00,50','重庆市','50','重庆市','5001','重庆市','','','','','','',2,1,''),('500101','5001','00,50,5001','万州区','50','重庆市','5001','重庆市','500101','万州区','','','','',3,1,''),('500102','5001','00,50,5001','涪陵区','50','重庆市','5001','重庆市','500102','涪陵区','','','','',3,1,''),('500103','5001','00,50,5001','渝中区','50','重庆市','5001','重庆市','500103','渝中区','','','','',3,1,''),('500104','5001','00,50,5001','大渡口区','50','重庆市','5001','重庆市','500104','大渡口区','','','','',3,1,''),('500105','5001','00,50,5001','江北区','50','重庆市','5001','重庆市','500105','江北区','','','','',3,1,''),('500106','5001','00,50,5001','沙坪坝区','50','重庆市','5001','重庆市','500106','沙坪坝区','','','','',3,1,''),('500107','5001','00,50,5001','九龙坡区','50','重庆市','5001','重庆市','500107','九龙坡区','','','','',3,1,''),('500108','5001','00,50,5001','南岸区','50','重庆市','5001','重庆市','500108','南岸区','','','','',3,1,''),('500109','5001','00,50,5001','北碚区','50','重庆市','5001','重庆市','500109','北碚区','','','','',3,1,''),('500110','5001','00,50,5001','綦江区','50','重庆市','5001','重庆市','500110','綦江区','','','','',3,1,''),('500111','5001','00,50,5001','大足区','50','重庆市','5001','重庆市','500111','大足区','','','','',3,1,''),('500112','5001','00,50,5001','渝北区','50','重庆市','5001','重庆市','500112','渝北区','','','','',3,1,''),('500113','5001','00,50,5001','巴南区','50','重庆市','5001','重庆市','500113','巴南区','','','','',3,1,''),('500114','5001','00,50,5001','黔江区','50','重庆市','5001','重庆市','500114','黔江区','','','','',3,1,''),('500115','5001','00,50,5001','长寿区','50','重庆市','5001','重庆市','500115','长寿区','','','','',3,1,''),('500116','5001','00,50,5001','江津区','50','重庆市','5001','重庆市','500116','江津区','','','','',3,1,''),('500117','5001','00,50,5001','合川区','50','重庆市','5001','重庆市','500117','合川区','','','','',3,1,''),('500118','5001','00,50,5001','永川区','50','重庆市','5001','重庆市','500118','永川区','','','','',3,1,''),('500119','5001','00,50,5001','南川区','50','重庆市','5001','重庆市','500119','南川区','','','','',3,1,''),('500120','5001','00,50,5001','璧山区','50','重庆市','5001','重庆市','500120','璧山区','','','','',3,1,''),('500151','5001','00,50,5001','铜梁区','50','重庆市','5001','重庆市','500151','铜梁区','','','','',3,1,''),('500152','5001','00,50,5001','潼南区','50','重庆市','5001','重庆市','500152','潼南区','','','','',3,1,''),('500153','5001','00,50,5001','荣昌区','50','重庆市','5001','重庆市','500153','荣昌区','','','','',3,1,''),('500154','5001','00,50,5001','开州区','50','重庆市','5001','重庆市','500154','开州区','','','','',3,1,''),('500155','5001','00,50,5001','梁平区','50','重庆市','5001','重庆市','500155','梁平区','','','','',3,1,''),('500156','5001','00,50,5001','武隆区','50','重庆市','5001','重庆市','500156','武隆区','','','','',3,1,''),('5002','50','00,50','重庆市','50','重庆市','5002','重庆市','','','','','','',2,1,''),('500229','5002','00,50,5002','城口县','50','重庆市','5002','重庆市','500229','城口县','','','','',3,1,''),('500230','5002','00,50,5002','丰都县','50','重庆市','5002','重庆市','500230','丰都县','','','','',3,1,''),('500231','5002','00,50,5002','垫江县','50','重庆市','5002','重庆市','500231','垫江县','','','','',3,1,''),('500233','5002','00,50,5002','忠县','50','重庆市','5002','重庆市','500233','忠县','','','','',3,1,''),('500235','5002','00,50,5002','云阳县','50','重庆市','5002','重庆市','500235','云阳县','','','','',3,1,''),('500236','5002','00,50,5002','奉节县','50','重庆市','5002','重庆市','500236','奉节县','','','','',3,1,''),('500237','5002','00,50,5002','巫山县','50','重庆市','5002','重庆市','500237','巫山县','','','','',3,1,''),('500238','5002','00,50,5002','巫溪县','50','重庆市','5002','重庆市','500238','巫溪县','','','','',3,1,''),('500240','5002','00,50,5002','石柱土家族自治县','50','重庆市','5002','重庆市','500240','石柱土家族自治县','','','','',3,1,''),('500241','5002','00,50,5002','秀山土家族苗族自治县','50','重庆市','5002','重庆市','500241','秀山土家族苗族自治县','','','','',3,1,''),('500242','5002','00,50,5002','酉阳土家族苗族自治县','50','重庆市','5002','重庆市','500242','酉阳土家族苗族自治县','','','','',3,1,''),('500243','5002','00,50,5002','彭水苗族土家族自治县','50','重庆市','5002','重庆市','500243','彭水苗族土家族自治县','','','','',3,1,''),('51','00','00','四川省','51','四川省','','','','','','','','',1,1,''),('5101','51','00,51','成都市','51','四川省','5101','成都市','','','','','','',2,1,''),('510104','5101','00,51,5101','锦江区','51','四川省','5101','成都市','510104','锦江区','','','','',3,1,''),('510105','5101','00,51,5101','青羊区','51','四川省','5101','成都市','510105','青羊区','','','','',3,1,''),('510106','5101','00,51,5101','金牛区','51','四川省','5101','成都市','510106','金牛区','','','','',3,1,''),('510107','5101','00,51,5101','武侯区','51','四川省','5101','成都市','510107','武侯区','','','','',3,1,''),('510108','5101','00,51,5101','成华区','51','四川省','5101','成都市','510108','成华区','','','','',3,1,''),('510112','5101','00,51,5101','龙泉驿区','51','四川省','5101','成都市','510112','龙泉驿区','','','','',3,1,''),('510113','5101','00,51,5101','青白江区','51','四川省','5101','成都市','510113','青白江区','','','','',3,1,''),('510114','5101','00,51,5101','新都区','51','四川省','5101','成都市','510114','新都区','','','','',3,1,''),('510115','5101','00,51,5101','温江区','51','四川省','5101','成都市','510115','温江区','','','','',3,1,''),('510116','5101','00,51,5101','双流区','51','四川省','5101','成都市','510116','双流区','','','','',3,1,''),('510117','5101','00,51,5101','郫都区','51','四川省','5101','成都市','510117','郫都区','','','','',3,1,''),('510121','5101','00,51,5101','金堂县','51','四川省','5101','成都市','510121','金堂县','','','','',3,1,''),('510129','5101','00,51,5101','大邑县','51','四川省','5101','成都市','510129','大邑县','','','','',3,1,''),('510131','5101','00,51,5101','蒲江县','51','四川省','5101','成都市','510131','蒲江县','','','','',3,1,''),('510132','5101','00,51,5101','新津县','51','四川省','5101','成都市','510132','新津县','','','','',3,1,''),('510181','5101','00,51,5101','都江堰市','51','四川省','5101','成都市','510181','都江堰市','','','','',3,1,''),('510182','5101','00,51,5101','彭州市','51','四川省','5101','成都市','510182','彭州市','','','','',3,1,''),('510183','5101','00,51,5101','邛崃市','51','四川省','5101','成都市','510183','邛崃市','','','','',3,1,''),('510184','5101','00,51,5101','崇州市','51','四川省','5101','成都市','510184','崇州市','','','','',3,1,''),('510185','5101','00,51,5101','简阳市','51','四川省','5101','成都市','510185','简阳市','','','','',3,1,''),('5103','51','00,51','自贡市','51','四川省','5103','自贡市','','','','','','',2,1,''),('510302','5103','00,51,5103','自流井区','51','四川省','5103','自贡市','510302','自流井区','','','','',3,1,''),('510303','5103','00,51,5103','贡井区','51','四川省','5103','自贡市','510303','贡井区','','','','',3,1,''),('510304','5103','00,51,5103','大安区','51','四川省','5103','自贡市','510304','大安区','','','','',3,1,''),('510311','5103','00,51,5103','沿滩区','51','四川省','5103','自贡市','510311','沿滩区','','','','',3,1,''),('510321','5103','00,51,5103','荣县','51','四川省','5103','自贡市','510321','荣县','','','','',3,1,''),('510322','5103','00,51,5103','富顺县','51','四川省','5103','自贡市','510322','富顺县','','','','',3,1,''),('5104','51','00,51','攀枝花市','51','四川省','5104','攀枝花市','','','','','','',2,1,''),('510402','5104','00,51,5104','东区','51','四川省','5104','攀枝花市','510402','东区','','','','',3,1,''),('510403','5104','00,51,5104','西区','51','四川省','5104','攀枝花市','510403','西区','','','','',3,1,''),('510411','5104','00,51,5104','仁和区','51','四川省','5104','攀枝花市','510411','仁和区','','','','',3,1,''),('510421','5104','00,51,5104','米易县','51','四川省','5104','攀枝花市','510421','米易县','','','','',3,1,''),('510422','5104','00,51,5104','盐边县','51','四川省','5104','攀枝花市','510422','盐边县','','','','',3,1,''),('5105','51','00,51','泸州市','51','四川省','5105','泸州市','','','','','','',2,1,''),('510502','5105','00,51,5105','江阳区','51','四川省','5105','泸州市','510502','江阳区','','','','',3,1,''),('510503','5105','00,51,5105','纳溪区','51','四川省','5105','泸州市','510503','纳溪区','','','','',3,1,''),('510504','5105','00,51,5105','龙马潭区','51','四川省','5105','泸州市','510504','龙马潭区','','','','',3,1,''),('510521','5105','00,51,5105','泸县','51','四川省','5105','泸州市','510521','泸县','','','','',3,1,''),('510522','5105','00,51,5105','合江县','51','四川省','5105','泸州市','510522','合江县','','','','',3,1,''),('510524','5105','00,51,5105','叙永县','51','四川省','5105','泸州市','510524','叙永县','','','','',3,1,''),('510525','5105','00,51,5105','古蔺县','51','四川省','5105','泸州市','510525','古蔺县','','','','',3,1,''),('5106','51','00,51','德阳市','51','四川省','5106','德阳市','','','','','','',2,1,''),('510603','5106','00,51,5106','旌阳区','51','四川省','5106','德阳市','510603','旌阳区','','','','',3,1,''),('510604','5106','00,51,5106','罗江区','51','四川省','5106','德阳市','510604','罗江区','','','','',3,1,''),('510623','5106','00,51,5106','中江县','51','四川省','5106','德阳市','510623','中江县','','','','',3,1,''),('510681','5106','00,51,5106','广汉市','51','四川省','5106','德阳市','510681','广汉市','','','','',3,1,''),('510682','5106','00,51,5106','什邡市','51','四川省','5106','德阳市','510682','什邡市','','','','',3,1,''),('510683','5106','00,51,5106','绵竹市','51','四川省','5106','德阳市','510683','绵竹市','','','','',3,1,''),('5107','51','00,51','绵阳市','51','四川省','5107','绵阳市','','','','','','',2,1,''),('510703','5107','00,51,5107','涪城区','51','四川省','5107','绵阳市','510703','涪城区','','','','',3,1,''),('510704','5107','00,51,5107','游仙区','51','四川省','5107','绵阳市','510704','游仙区','','','','',3,1,''),('510705','5107','00,51,5107','安州区','51','四川省','5107','绵阳市','510705','安州区','','','','',3,1,''),('510722','5107','00,51,5107','三台县','51','四川省','5107','绵阳市','510722','三台县','','','','',3,1,''),('510723','5107','00,51,5107','盐亭县','51','四川省','5107','绵阳市','510723','盐亭县','','','','',3,1,''),('510725','5107','00,51,5107','梓潼县','51','四川省','5107','绵阳市','510725','梓潼县','','','','',3,1,''),('510726','5107','00,51,5107','北川羌族自治县','51','四川省','5107','绵阳市','510726','北川羌族自治县','','','','',3,1,''),('510727','5107','00,51,5107','平武县','51','四川省','5107','绵阳市','510727','平武县','','','','',3,1,''),('510781','5107','00,51,5107','江油市','51','四川省','5107','绵阳市','510781','江油市','','','','',3,1,''),('5108','51','00,51','广元市','51','四川省','5108','广元市','','','','','','',2,1,''),('510802','5108','00,51,5108','利州区','51','四川省','5108','广元市','510802','利州区','','','','',3,1,''),('510811','5108','00,51,5108','昭化区','51','四川省','5108','广元市','510811','昭化区','','','','',3,1,''),('510812','5108','00,51,5108','朝天区','51','四川省','5108','广元市','510812','朝天区','','','','',3,1,''),('510821','5108','00,51,5108','旺苍县','51','四川省','5108','广元市','510821','旺苍县','','','','',3,1,''),('510822','5108','00,51,5108','青川县','51','四川省','5108','广元市','510822','青川县','','','','',3,1,''),('510823','5108','00,51,5108','剑阁县','51','四川省','5108','广元市','510823','剑阁县','','','','',3,1,''),('510824','5108','00,51,5108','苍溪县','51','四川省','5108','广元市','510824','苍溪县','','','','',3,1,''),('5109','51','00,51','遂宁市','51','四川省','5109','遂宁市','','','','','','',2,1,''),('510903','5109','00,51,5109','船山区','51','四川省','5109','遂宁市','510903','船山区','','','','',3,1,''),('510904','5109','00,51,5109','安居区','51','四川省','5109','遂宁市','510904','安居区','','','','',3,1,''),('510921','5109','00,51,5109','蓬溪县','51','四川省','5109','遂宁市','510921','蓬溪县','','','','',3,1,''),('510923','5109','00,51,5109','大英县','51','四川省','5109','遂宁市','510923','大英县','','','','',3,1,''),('510981','5109','00,51,5109','射洪市','51','四川省','5109','遂宁市','510981','射洪市','','','','',3,1,''),('5110','51','00,51','内江市','51','四川省','5110','内江市','','','','','','',2,1,''),('511002','5110','00,51,5110','市中区','51','四川省','5110','内江市','511002','市中区','','','','',3,1,''),('511011','5110','00,51,5110','东兴区','51','四川省','5110','内江市','511011','东兴区','','','','',3,1,''),('511024','5110','00,51,5110','威远县','51','四川省','5110','内江市','511024','威远县','','','','',3,1,''),('511025','5110','00,51,5110','资中县','51','四川省','5110','内江市','511025','资中县','','','','',3,1,''),('511083','5110','00,51,5110','隆昌市','51','四川省','5110','内江市','511083','隆昌市','','','','',3,1,''),('5111','51','00,51','乐山市','51','四川省','5111','乐山市','','','','','','',2,1,''),('511102','5111','00,51,5111','市中区','51','四川省','5111','乐山市','511102','市中区','','','','',3,1,''),('511111','5111','00,51,5111','沙湾区','51','四川省','5111','乐山市','511111','沙湾区','','','','',3,1,''),('511112','5111','00,51,5111','五通桥区','51','四川省','5111','乐山市','511112','五通桥区','','','','',3,1,''),('511113','5111','00,51,5111','金口河区','51','四川省','5111','乐山市','511113','金口河区','','','','',3,1,''),('511123','5111','00,51,5111','犍为县','51','四川省','5111','乐山市','511123','犍为县','','','','',3,1,''),('511124','5111','00,51,5111','井研县','51','四川省','5111','乐山市','511124','井研县','','','','',3,1,''),('511126','5111','00,51,5111','夹江县','51','四川省','5111','乐山市','511126','夹江县','','','','',3,1,''),('511129','5111','00,51,5111','沐川县','51','四川省','5111','乐山市','511129','沐川县','','','','',3,1,''),('511132','5111','00,51,5111','峨边彝族自治县','51','四川省','5111','乐山市','511132','峨边彝族自治县','','','','',3,1,''),('511133','5111','00,51,5111','马边彝族自治县','51','四川省','5111','乐山市','511133','马边彝族自治县','','','','',3,1,''),('511181','5111','00,51,5111','峨眉山市','51','四川省','5111','乐山市','511181','峨眉山市','','','','',3,1,''),('5113','51','00,51','南充市','51','四川省','5113','南充市','','','','','','',2,1,''),('511302','5113','00,51,5113','顺庆区','51','四川省','5113','南充市','511302','顺庆区','','','','',3,1,''),('511303','5113','00,51,5113','高坪区','51','四川省','5113','南充市','511303','高坪区','','','','',3,1,''),('511304','5113','00,51,5113','嘉陵区','51','四川省','5113','南充市','511304','嘉陵区','','','','',3,1,''),('511321','5113','00,51,5113','南部县','51','四川省','5113','南充市','511321','南部县','','','','',3,1,''),('511322','5113','00,51,5113','营山县','51','四川省','5113','南充市','511322','营山县','','','','',3,1,''),('511323','5113','00,51,5113','蓬安县','51','四川省','5113','南充市','511323','蓬安县','','','','',3,1,''),('511324','5113','00,51,5113','仪陇县','51','四川省','5113','南充市','511324','仪陇县','','','','',3,1,''),('511325','5113','00,51,5113','西充县','51','四川省','5113','南充市','511325','西充县','','','','',3,1,''),('511381','5113','00,51,5113','阆中市','51','四川省','5113','南充市','511381','阆中市','','','','',3,1,''),('5114','51','00,51','眉山市','51','四川省','5114','眉山市','','','','','','',2,1,''),('511402','5114','00,51,5114','东坡区','51','四川省','5114','眉山市','511402','东坡区','','','','',3,1,''),('511403','5114','00,51,5114','彭山区','51','四川省','5114','眉山市','511403','彭山区','','','','',3,1,''),('511421','5114','00,51,5114','仁寿县','51','四川省','5114','眉山市','511421','仁寿县','','','','',3,1,''),('511423','5114','00,51,5114','洪雅县','51','四川省','5114','眉山市','511423','洪雅县','','','','',3,1,''),('511424','5114','00,51,5114','丹棱县','51','四川省','5114','眉山市','511424','丹棱县','','','','',3,1,''),('511425','5114','00,51,5114','青神县','51','四川省','5114','眉山市','511425','青神县','','','','',3,1,''),('5115','51','00,51','宜宾市','51','四川省','5115','宜宾市','','','','','','',2,1,''),('511502','5115','00,51,5115','翠屏区','51','四川省','5115','宜宾市','511502','翠屏区','','','','',3,1,''),('511503','5115','00,51,5115','南溪区','51','四川省','5115','宜宾市','511503','南溪区','','','','',3,1,''),('511504','5115','00,51,5115','叙州区','51','四川省','5115','宜宾市','511504','叙州区','','','','',3,1,''),('511523','5115','00,51,5115','江安县','51','四川省','5115','宜宾市','511523','江安县','','','','',3,1,''),('511524','5115','00,51,5115','长宁县','51','四川省','5115','宜宾市','511524','长宁县','','','','',3,1,''),('511525','5115','00,51,5115','高县','51','四川省','5115','宜宾市','511525','高县','','','','',3,1,''),('511526','5115','00,51,5115','珙县','51','四川省','5115','宜宾市','511526','珙县','','','','',3,1,''),('511527','5115','00,51,5115','筠连县','51','四川省','5115','宜宾市','511527','筠连县','','','','',3,1,''),('511528','5115','00,51,5115','兴文县','51','四川省','5115','宜宾市','511528','兴文县','','','','',3,1,''),('511529','5115','00,51,5115','屏山县','51','四川省','5115','宜宾市','511529','屏山县','','','','',3,1,''),('5116','51','00,51','广安市','51','四川省','5116','广安市','','','','','','',2,1,''),('511602','5116','00,51,5116','广安区','51','四川省','5116','广安市','511602','广安区','','','','',3,1,''),('511603','5116','00,51,5116','前锋区','51','四川省','5116','广安市','511603','前锋区','','','','',3,1,''),('511621','5116','00,51,5116','岳池县','51','四川省','5116','广安市','511621','岳池县','','','','',3,1,''),('511622','5116','00,51,5116','武胜县','51','四川省','5116','广安市','511622','武胜县','','','','',3,1,''),('511623','5116','00,51,5116','邻水县','51','四川省','5116','广安市','511623','邻水县','','','','',3,1,''),('511681','5116','00,51,5116','华蓥市','51','四川省','5116','广安市','511681','华蓥市','','','','',3,1,''),('5117','51','00,51','达州市','51','四川省','5117','达州市','','','','','','',2,1,''),('511702','5117','00,51,5117','通川区','51','四川省','5117','达州市','511702','通川区','','','','',3,1,''),('511703','5117','00,51,5117','达川区','51','四川省','5117','达州市','511703','达川区','','','','',3,1,''),('511722','5117','00,51,5117','宣汉县','51','四川省','5117','达州市','511722','宣汉县','','','','',3,1,''),('511723','5117','00,51,5117','开江县','51','四川省','5117','达州市','511723','开江县','','','','',3,1,''),('511724','5117','00,51,5117','大竹县','51','四川省','5117','达州市','511724','大竹县','','','','',3,1,''),('511725','5117','00,51,5117','渠县','51','四川省','5117','达州市','511725','渠县','','','','',3,1,''),('511781','5117','00,51,5117','万源市','51','四川省','5117','达州市','511781','万源市','','','','',3,1,''),('5118','51','00,51','雅安市','51','四川省','5118','雅安市','','','','','','',2,1,''),('511802','5118','00,51,5118','雨城区','51','四川省','5118','雅安市','511802','雨城区','','','','',3,1,''),('511803','5118','00,51,5118','名山区','51','四川省','5118','雅安市','511803','名山区','','','','',3,1,''),('511822','5118','00,51,5118','荥经县','51','四川省','5118','雅安市','511822','荥经县','','','','',3,1,''),('511823','5118','00,51,5118','汉源县','51','四川省','5118','雅安市','511823','汉源县','','','','',3,1,''),('511824','5118','00,51,5118','石棉县','51','四川省','5118','雅安市','511824','石棉县','','','','',3,1,''),('511825','5118','00,51,5118','天全县','51','四川省','5118','雅安市','511825','天全县','','','','',3,1,''),('511826','5118','00,51,5118','芦山县','51','四川省','5118','雅安市','511826','芦山县','','','','',3,1,''),('511827','5118','00,51,5118','宝兴县','51','四川省','5118','雅安市','511827','宝兴县','','','','',3,1,''),('5119','51','00,51','巴中市','51','四川省','5119','巴中市','','','','','','',2,1,''),('511902','5119','00,51,5119','巴州区','51','四川省','5119','巴中市','511902','巴州区','','','','',3,1,''),('511903','5119','00,51,5119','恩阳区','51','四川省','5119','巴中市','511903','恩阳区','','','','',3,1,''),('511921','5119','00,51,5119','通江县','51','四川省','5119','巴中市','511921','通江县','','','','',3,1,''),('511922','5119','00,51,5119','南江县','51','四川省','5119','巴中市','511922','南江县','','','','',3,1,''),('511923','5119','00,51,5119','平昌县','51','四川省','5119','巴中市','511923','平昌县','','','','',3,1,''),('5120','51','00,51','资阳市','51','四川省','5120','资阳市','','','','','','',2,1,''),('512002','5120','00,51,5120','雁江区','51','四川省','5120','资阳市','512002','雁江区','','','','',3,1,''),('512021','5120','00,51,5120','安岳县','51','四川省','5120','资阳市','512021','安岳县','','','','',3,1,''),('512022','5120','00,51,5120','乐至县','51','四川省','5120','资阳市','512022','乐至县','','','','',3,1,''),('5132','51','00,51','阿坝藏族羌族自治州','51','四川省','5132','阿坝藏族羌族自治州','','','','','','',2,1,''),('513201','5132','00,51,5132','马尔康市','51','四川省','5132','阿坝藏族羌族自治州','513201','马尔康市','','','','',3,1,''),('513221','5132','00,51,5132','汶川县','51','四川省','5132','阿坝藏族羌族自治州','513221','汶川县','','','','',3,1,''),('513222','5132','00,51,5132','理县','51','四川省','5132','阿坝藏族羌族自治州','513222','理县','','','','',3,1,''),('513223','5132','00,51,5132','茂县','51','四川省','5132','阿坝藏族羌族自治州','513223','茂县','','','','',3,1,''),('513224','5132','00,51,5132','松潘县','51','四川省','5132','阿坝藏族羌族自治州','513224','松潘县','','','','',3,1,''),('513225','5132','00,51,5132','九寨沟县','51','四川省','5132','阿坝藏族羌族自治州','513225','九寨沟县','','','','',3,1,''),('513226','5132','00,51,5132','金川县','51','四川省','5132','阿坝藏族羌族自治州','513226','金川县','','','','',3,1,''),('513227','5132','00,51,5132','小金县','51','四川省','5132','阿坝藏族羌族自治州','513227','小金县','','','','',3,1,''),('513228','5132','00,51,5132','黑水县','51','四川省','5132','阿坝藏族羌族自治州','513228','黑水县','','','','',3,1,''),('513230','5132','00,51,5132','壤塘县','51','四川省','5132','阿坝藏族羌族自治州','513230','壤塘县','','','','',3,1,''),('513231','5132','00,51,5132','阿坝县','51','四川省','5132','阿坝藏族羌族自治州','513231','阿坝县','','','','',3,1,''),('513232','5132','00,51,5132','若尔盖县','51','四川省','5132','阿坝藏族羌族自治州','513232','若尔盖县','','','','',3,1,''),('513233','5132','00,51,5132','红原县','51','四川省','5132','阿坝藏族羌族自治州','513233','红原县','','','','',3,1,''),('5133','51','00,51','甘孜藏族自治州','51','四川省','5133','甘孜藏族自治州','','','','','','',2,1,''),('513301','5133','00,51,5133','康定市','51','四川省','5133','甘孜藏族自治州','513301','康定市','','','','',3,1,''),('513322','5133','00,51,5133','泸定县','51','四川省','5133','甘孜藏族自治州','513322','泸定县','','','','',3,1,''),('513323','5133','00,51,5133','丹巴县','51','四川省','5133','甘孜藏族自治州','513323','丹巴县','','','','',3,1,''),('513324','5133','00,51,5133','九龙县','51','四川省','5133','甘孜藏族自治州','513324','九龙县','','','','',3,1,''),('513325','5133','00,51,5133','雅江县','51','四川省','5133','甘孜藏族自治州','513325','雅江县','','','','',3,1,''),('513326','5133','00,51,5133','道孚县','51','四川省','5133','甘孜藏族自治州','513326','道孚县','','','','',3,1,''),('513327','5133','00,51,5133','炉霍县','51','四川省','5133','甘孜藏族自治州','513327','炉霍县','','','','',3,1,''),('513328','5133','00,51,5133','甘孜县','51','四川省','5133','甘孜藏族自治州','513328','甘孜县','','','','',3,1,''),('513329','5133','00,51,5133','新龙县','51','四川省','5133','甘孜藏族自治州','513329','新龙县','','','','',3,1,''),('513330','5133','00,51,5133','德格县','51','四川省','5133','甘孜藏族自治州','513330','德格县','','','','',3,1,''),('513331','5133','00,51,5133','白玉县','51','四川省','5133','甘孜藏族自治州','513331','白玉县','','','','',3,1,''),('513332','5133','00,51,5133','石渠县','51','四川省','5133','甘孜藏族自治州','513332','石渠县','','','','',3,1,''),('513333','5133','00,51,5133','色达县','51','四川省','5133','甘孜藏族自治州','513333','色达县','','','','',3,1,''),('513334','5133','00,51,5133','理塘县','51','四川省','5133','甘孜藏族自治州','513334','理塘县','','','','',3,1,''),('513335','5133','00,51,5133','巴塘县','51','四川省','5133','甘孜藏族自治州','513335','巴塘县','','','','',3,1,''),('513336','5133','00,51,5133','乡城县','51','四川省','5133','甘孜藏族自治州','513336','乡城县','','','','',3,1,''),('513337','5133','00,51,5133','稻城县','51','四川省','5133','甘孜藏族自治州','513337','稻城县','','','','',3,1,''),('513338','5133','00,51,5133','得荣县','51','四川省','5133','甘孜藏族自治州','513338','得荣县','','','','',3,1,''),('5134','51','00,51','凉山彝族自治州','51','四川省','5134','凉山彝族自治州','','','','','','',2,1,''),('513401','5134','00,51,5134','西昌市','51','四川省','5134','凉山彝族自治州','513401','西昌市','','','','',3,1,''),('513422','5134','00,51,5134','木里藏族自治县','51','四川省','5134','凉山彝族自治州','513422','木里藏族自治县','','','','',3,1,''),('513423','5134','00,51,5134','盐源县','51','四川省','5134','凉山彝族自治州','513423','盐源县','','','','',3,1,''),('513424','5134','00,51,5134','德昌县','51','四川省','5134','凉山彝族自治州','513424','德昌县','','','','',3,1,''),('513425','5134','00,51,5134','会理县','51','四川省','5134','凉山彝族自治州','513425','会理县','','','','',3,1,''),('513426','5134','00,51,5134','会东县','51','四川省','5134','凉山彝族自治州','513426','会东县','','','','',3,1,''),('513427','5134','00,51,5134','宁南县','51','四川省','5134','凉山彝族自治州','513427','宁南县','','','','',3,1,''),('513428','5134','00,51,5134','普格县','51','四川省','5134','凉山彝族自治州','513428','普格县','','','','',3,1,''),('513429','5134','00,51,5134','布拖县','51','四川省','5134','凉山彝族自治州','513429','布拖县','','','','',3,1,''),('513430','5134','00,51,5134','金阳县','51','四川省','5134','凉山彝族自治州','513430','金阳县','','','','',3,1,''),('513431','5134','00,51,5134','昭觉县','51','四川省','5134','凉山彝族自治州','513431','昭觉县','','','','',3,1,''),('513432','5134','00,51,5134','喜德县','51','四川省','5134','凉山彝族自治州','513432','喜德县','','','','',3,1,''),('513433','5134','00,51,5134','冕宁县','51','四川省','5134','凉山彝族自治州','513433','冕宁县','','','','',3,1,''),('513434','5134','00,51,5134','越西县','51','四川省','5134','凉山彝族自治州','513434','越西县','','','','',3,1,''),('513435','5134','00,51,5134','甘洛县','51','四川省','5134','凉山彝族自治州','513435','甘洛县','','','','',3,1,''),('513436','5134','00,51,5134','美姑县','51','四川省','5134','凉山彝族自治州','513436','美姑县','','','','',3,1,''),('513437','5134','00,51,5134','雷波县','51','四川省','5134','凉山彝族自治州','513437','雷波县','','','','',3,1,''),('52','00','00','贵州省','52','贵州省','','','','','','','','',1,1,''),('5201','52','00,52','贵阳市','52','贵州省','5201','贵阳市','','','','','','',2,1,''),('520102','5201','00,52,5201','南明区','52','贵州省','5201','贵阳市','520102','南明区','','','','',3,1,''),('520103','5201','00,52,5201','云岩区','52','贵州省','5201','贵阳市','520103','云岩区','','','','',3,1,''),('520111','5201','00,52,5201','花溪区','52','贵州省','5201','贵阳市','520111','花溪区','','','','',3,1,''),('520112','5201','00,52,5201','乌当区','52','贵州省','5201','贵阳市','520112','乌当区','','','','',3,1,''),('520113','5201','00,52,5201','白云区','52','贵州省','5201','贵阳市','520113','白云区','','','','',3,1,''),('520115','5201','00,52,5201','观山湖区','52','贵州省','5201','贵阳市','520115','观山湖区','','','','',3,1,''),('520121','5201','00,52,5201','开阳县','52','贵州省','5201','贵阳市','520121','开阳县','','','','',3,1,''),('520122','5201','00,52,5201','息烽县','52','贵州省','5201','贵阳市','520122','息烽县','','','','',3,1,''),('520123','5201','00,52,5201','修文县','52','贵州省','5201','贵阳市','520123','修文县','','','','',3,1,''),('520181','5201','00,52,5201','清镇市','52','贵州省','5201','贵阳市','520181','清镇市','','','','',3,1,''),('5202','52','00,52','六盘水市','52','贵州省','5202','六盘水市','','','','','','',2,1,''),('520201','5202','00,52,5202','钟山区','52','贵州省','5202','六盘水市','520201','钟山区','','','','',3,1,''),('520203','5202','00,52,5202','六枝特区','52','贵州省','5202','六盘水市','520203','六枝特区','','','','',3,1,''),('520221','5202','00,52,5202','水城县','52','贵州省','5202','六盘水市','520221','水城县','','','','',3,1,''),('520281','5202','00,52,5202','盘州市','52','贵州省','5202','六盘水市','520281','盘州市','','','','',3,1,''),('5203','52','00,52','遵义市','52','贵州省','5203','遵义市','','','','','','',2,1,''),('520302','5203','00,52,5203','红花岗区','52','贵州省','5203','遵义市','520302','红花岗区','','','','',3,1,''),('520303','5203','00,52,5203','汇川区','52','贵州省','5203','遵义市','520303','汇川区','','','','',3,1,''),('520304','5203','00,52,5203','播州区','52','贵州省','5203','遵义市','520304','播州区','','','','',3,1,''),('520322','5203','00,52,5203','桐梓县','52','贵州省','5203','遵义市','520322','桐梓县','','','','',3,1,''),('520323','5203','00,52,5203','绥阳县','52','贵州省','5203','遵义市','520323','绥阳县','','','','',3,1,''),('520324','5203','00,52,5203','正安县','52','贵州省','5203','遵义市','520324','正安县','','','','',3,1,''),('520325','5203','00,52,5203','道真仡佬族苗族自治县','52','贵州省','5203','遵义市','520325','道真仡佬族苗族自治县','','','','',3,1,''),('520326','5203','00,52,5203','务川仡佬族苗族自治县','52','贵州省','5203','遵义市','520326','务川仡佬族苗族自治县','','','','',3,1,''),('520327','5203','00,52,5203','凤冈县','52','贵州省','5203','遵义市','520327','凤冈县','','','','',3,1,''),('520328','5203','00,52,5203','湄潭县','52','贵州省','5203','遵义市','520328','湄潭县','','','','',3,1,''),('520329','5203','00,52,5203','余庆县','52','贵州省','5203','遵义市','520329','余庆县','','','','',3,1,''),('520330','5203','00,52,5203','习水县','52','贵州省','5203','遵义市','520330','习水县','','','','',3,1,''),('520381','5203','00,52,5203','赤水市','52','贵州省','5203','遵义市','520381','赤水市','','','','',3,1,''),('520382','5203','00,52,5203','仁怀市','52','贵州省','5203','遵义市','520382','仁怀市','','','','',3,1,''),('5204','52','00,52','安顺市','52','贵州省','5204','安顺市','','','','','','',2,1,''),('520402','5204','00,52,5204','西秀区','52','贵州省','5204','安顺市','520402','西秀区','','','','',3,1,''),('520403','5204','00,52,5204','平坝区','52','贵州省','5204','安顺市','520403','平坝区','','','','',3,1,''),('520422','5204','00,52,5204','普定县','52','贵州省','5204','安顺市','520422','普定县','','','','',3,1,''),('520423','5204','00,52,5204','镇宁布依族苗族自治县','52','贵州省','5204','安顺市','520423','镇宁布依族苗族自治县','','','','',3,1,''),('520424','5204','00,52,5204','关岭布依族苗族自治县','52','贵州省','5204','安顺市','520424','关岭布依族苗族自治县','','','','',3,1,''),('520425','5204','00,52,5204','紫云苗族布依族自治县','52','贵州省','5204','安顺市','520425','紫云苗族布依族自治县','','','','',3,1,''),('5205','52','00,52','毕节市','52','贵州省','5205','毕节市','','','','','','',2,1,''),('520502','5205','00,52,5205','七星关区','52','贵州省','5205','毕节市','520502','七星关区','','','','',3,1,''),('520521','5205','00,52,5205','大方县','52','贵州省','5205','毕节市','520521','大方县','','','','',3,1,''),('520522','5205','00,52,5205','黔西县','52','贵州省','5205','毕节市','520522','黔西县','','','','',3,1,''),('520523','5205','00,52,5205','金沙县','52','贵州省','5205','毕节市','520523','金沙县','','','','',3,1,''),('520524','5205','00,52,5205','织金县','52','贵州省','5205','毕节市','520524','织金县','','','','',3,1,''),('520525','5205','00,52,5205','纳雍县','52','贵州省','5205','毕节市','520525','纳雍县','','','','',3,1,''),('520526','5205','00,52,5205','威宁彝族回族苗族自治县','52','贵州省','5205','毕节市','520526','威宁彝族回族苗族自治县','','','','',3,1,''),('520527','5205','00,52,5205','赫章县','52','贵州省','5205','毕节市','520527','赫章县','','','','',3,1,''),('5206','52','00,52','铜仁市','52','贵州省','5206','铜仁市','','','','','','',2,1,''),('520602','5206','00,52,5206','碧江区','52','贵州省','5206','铜仁市','520602','碧江区','','','','',3,1,''),('520603','5206','00,52,5206','万山区','52','贵州省','5206','铜仁市','520603','万山区','','','','',3,1,''),('520621','5206','00,52,5206','江口县','52','贵州省','5206','铜仁市','520621','江口县','','','','',3,1,''),('520622','5206','00,52,5206','玉屏侗族自治县','52','贵州省','5206','铜仁市','520622','玉屏侗族自治县','','','','',3,1,''),('520623','5206','00,52,5206','石阡县','52','贵州省','5206','铜仁市','520623','石阡县','','','','',3,1,''),('520624','5206','00,52,5206','思南县','52','贵州省','5206','铜仁市','520624','思南县','','','','',3,1,''),('520625','5206','00,52,5206','印江土家族苗族自治县','52','贵州省','5206','铜仁市','520625','印江土家族苗族自治县','','','','',3,1,''),('520626','5206','00,52,5206','德江县','52','贵州省','5206','铜仁市','520626','德江县','','','','',3,1,''),('520627','5206','00,52,5206','沿河土家族自治县','52','贵州省','5206','铜仁市','520627','沿河土家族自治县','','','','',3,1,''),('520628','5206','00,52,5206','松桃苗族自治县','52','贵州省','5206','铜仁市','520628','松桃苗族自治县','','','','',3,1,''),('5223','52','00,52','黔西南布依族苗族自治州','52','贵州省','5223','黔西南布依族苗族自治州','','','','','','',2,1,''),('522301','5223','00,52,5223','兴义市','52','贵州省','5223','黔西南布依族苗族自治州','522301','兴义市','','','','',3,1,''),('522302','5223','00,52,5223','兴仁市','52','贵州省','5223','黔西南布依族苗族自治州','522302','兴仁市','','','','',3,1,''),('522323','5223','00,52,5223','普安县','52','贵州省','5223','黔西南布依族苗族自治州','522323','普安县','','','','',3,1,''),('522324','5223','00,52,5223','晴隆县','52','贵州省','5223','黔西南布依族苗族自治州','522324','晴隆县','','','','',3,1,''),('522325','5223','00,52,5223','贞丰县','52','贵州省','5223','黔西南布依族苗族自治州','522325','贞丰县','','','','',3,1,''),('522326','5223','00,52,5223','望谟县','52','贵州省','5223','黔西南布依族苗族自治州','522326','望谟县','','','','',3,1,''),('522327','5223','00,52,5223','册亨县','52','贵州省','5223','黔西南布依族苗族自治州','522327','册亨县','','','','',3,1,''),('522328','5223','00,52,5223','安龙县','52','贵州省','5223','黔西南布依族苗族自治州','522328','安龙县','','','','',3,1,''),('5226','52','00,52','黔东南苗族侗族自治州','52','贵州省','5226','黔东南苗族侗族自治州','','','','','','',2,1,''),('522601','5226','00,52,5226','凯里市','52','贵州省','5226','黔东南苗族侗族自治州','522601','凯里市','','','','',3,1,''),('522622','5226','00,52,5226','黄平县','52','贵州省','5226','黔东南苗族侗族自治州','522622','黄平县','','','','',3,1,''),('522623','5226','00,52,5226','施秉县','52','贵州省','5226','黔东南苗族侗族自治州','522623','施秉县','','','','',3,1,''),('522624','5226','00,52,5226','三穗县','52','贵州省','5226','黔东南苗族侗族自治州','522624','三穗县','','','','',3,1,''),('522625','5226','00,52,5226','镇远县','52','贵州省','5226','黔东南苗族侗族自治州','522625','镇远县','','','','',3,1,''),('522626','5226','00,52,5226','岑巩县','52','贵州省','5226','黔东南苗族侗族自治州','522626','岑巩县','','','','',3,1,''),('522627','5226','00,52,5226','天柱县','52','贵州省','5226','黔东南苗族侗族自治州','522627','天柱县','','','','',3,1,''),('522628','5226','00,52,5226','锦屏县','52','贵州省','5226','黔东南苗族侗族自治州','522628','锦屏县','','','','',3,1,''),('522629','5226','00,52,5226','剑河县','52','贵州省','5226','黔东南苗族侗族自治州','522629','剑河县','','','','',3,1,''),('522630','5226','00,52,5226','台江县','52','贵州省','5226','黔东南苗族侗族自治州','522630','台江县','','','','',3,1,''),('522631','5226','00,52,5226','黎平县','52','贵州省','5226','黔东南苗族侗族自治州','522631','黎平县','','','','',3,1,''),('522632','5226','00,52,5226','榕江县','52','贵州省','5226','黔东南苗族侗族自治州','522632','榕江县','','','','',3,1,''),('522633','5226','00,52,5226','从江县','52','贵州省','5226','黔东南苗族侗族自治州','522633','从江县','','','','',3,1,''),('522634','5226','00,52,5226','雷山县','52','贵州省','5226','黔东南苗族侗族自治州','522634','雷山县','','','','',3,1,''),('522635','5226','00,52,5226','麻江县','52','贵州省','5226','黔东南苗族侗族自治州','522635','麻江县','','','','',3,1,''),('522636','5226','00,52,5226','丹寨县','52','贵州省','5226','黔东南苗族侗族自治州','522636','丹寨县','','','','',3,1,''),('5227','52','00,52','黔南布依族苗族自治州','52','贵州省','5227','黔南布依族苗族自治州','','','','','','',2,1,''),('522701','5227','00,52,5227','都匀市','52','贵州省','5227','黔南布依族苗族自治州','522701','都匀市','','','','',3,1,''),('522702','5227','00,52,5227','福泉市','52','贵州省','5227','黔南布依族苗族自治州','522702','福泉市','','','','',3,1,''),('522722','5227','00,52,5227','荔波县','52','贵州省','5227','黔南布依族苗族自治州','522722','荔波县','','','','',3,1,''),('522723','5227','00,52,5227','贵定县','52','贵州省','5227','黔南布依族苗族自治州','522723','贵定县','','','','',3,1,''),('522725','5227','00,52,5227','瓮安县','52','贵州省','5227','黔南布依族苗族自治州','522725','瓮安县','','','','',3,1,''),('522726','5227','00,52,5227','独山县','52','贵州省','5227','黔南布依族苗族自治州','522726','独山县','','','','',3,1,''),('522727','5227','00,52,5227','平塘县','52','贵州省','5227','黔南布依族苗族自治州','522727','平塘县','','','','',3,1,''),('522728','5227','00,52,5227','罗甸县','52','贵州省','5227','黔南布依族苗族自治州','522728','罗甸县','','','','',3,1,''),('522729','5227','00,52,5227','长顺县','52','贵州省','5227','黔南布依族苗族自治州','522729','长顺县','','','','',3,1,''),('522730','5227','00,52,5227','龙里县','52','贵州省','5227','黔南布依族苗族自治州','522730','龙里县','','','','',3,1,''),('522731','5227','00,52,5227','惠水县','52','贵州省','5227','黔南布依族苗族自治州','522731','惠水县','','','','',3,1,''),('522732','5227','00,52,5227','三都水族自治县','52','贵州省','5227','黔南布依族苗族自治州','522732','三都水族自治县','','','','',3,1,''),('53','00','00','云南省','53','云南省','','','','','','','','',1,1,''),('5301','53','00,53','昆明市','53','云南省','5301','昆明市','','','','','','',2,1,''),('530102','5301','00,53,5301','五华区','53','云南省','5301','昆明市','530102','五华区','','','','',3,1,''),('530103','5301','00,53,5301','盘龙区','53','云南省','5301','昆明市','530103','盘龙区','','','','',3,1,''),('530111','5301','00,53,5301','官渡区','53','云南省','5301','昆明市','530111','官渡区','','','','',3,1,''),('530112','5301','00,53,5301','西山区','53','云南省','5301','昆明市','530112','西山区','','','','',3,1,''),('530113','5301','00,53,5301','东川区','53','云南省','5301','昆明市','530113','东川区','','','','',3,1,''),('530114','5301','00,53,5301','呈贡区','53','云南省','5301','昆明市','530114','呈贡区','','','','',3,1,''),('530115','5301','00,53,5301','晋宁区','53','云南省','5301','昆明市','530115','晋宁区','','','','',3,1,''),('530124','5301','00,53,5301','富民县','53','云南省','5301','昆明市','530124','富民县','','','','',3,1,''),('530125','5301','00,53,5301','宜良县','53','云南省','5301','昆明市','530125','宜良县','','','','',3,1,''),('530126','5301','00,53,5301','石林彝族自治县','53','云南省','5301','昆明市','530126','石林彝族自治县','','','','',3,1,''),('530127','5301','00,53,5301','嵩明县','53','云南省','5301','昆明市','530127','嵩明县','','','','',3,1,''),('530128','5301','00,53,5301','禄劝彝族苗族自治县','53','云南省','5301','昆明市','530128','禄劝彝族苗族自治县','','','','',3,1,''),('530129','5301','00,53,5301','寻甸回族彝族自治县','53','云南省','5301','昆明市','530129','寻甸回族彝族自治县','','','','',3,1,''),('530181','5301','00,53,5301','安宁市','53','云南省','5301','昆明市','530181','安宁市','','','','',3,1,''),('5303','53','00,53','曲靖市','53','云南省','5303','曲靖市','','','','','','',2,1,''),('530302','5303','00,53,5303','麒麟区','53','云南省','5303','曲靖市','530302','麒麟区','','','','',3,1,''),('530303','5303','00,53,5303','沾益区','53','云南省','5303','曲靖市','530303','沾益区','','','','',3,1,''),('530304','5303','00,53,5303','马龙区','53','云南省','5303','曲靖市','530304','马龙区','','','','',3,1,''),('530322','5303','00,53,5303','陆良县','53','云南省','5303','曲靖市','530322','陆良县','','','','',3,1,''),('530323','5303','00,53,5303','师宗县','53','云南省','5303','曲靖市','530323','师宗县','','','','',3,1,''),('530324','5303','00,53,5303','罗平县','53','云南省','5303','曲靖市','530324','罗平县','','','','',3,1,''),('530325','5303','00,53,5303','富源县','53','云南省','5303','曲靖市','530325','富源县','','','','',3,1,''),('530326','5303','00,53,5303','会泽县','53','云南省','5303','曲靖市','530326','会泽县','','','','',3,1,''),('530381','5303','00,53,5303','宣威市','53','云南省','5303','曲靖市','530381','宣威市','','','','',3,1,''),('5304','53','00,53','玉溪市','53','云南省','5304','玉溪市','','','','','','',2,1,''),('530402','5304','00,53,5304','红塔区','53','云南省','5304','玉溪市','530402','红塔区','','','','',3,1,''),('530403','5304','00,53,5304','江川区','53','云南省','5304','玉溪市','530403','江川区','','','','',3,1,''),('530423','5304','00,53,5304','通海县','53','云南省','5304','玉溪市','530423','通海县','','','','',3,1,''),('530424','5304','00,53,5304','华宁县','53','云南省','5304','玉溪市','530424','华宁县','','','','',3,1,''),('530425','5304','00,53,5304','易门县','53','云南省','5304','玉溪市','530425','易门县','','','','',3,1,''),('530426','5304','00,53,5304','峨山彝族自治县','53','云南省','5304','玉溪市','530426','峨山彝族自治县','','','','',3,1,''),('530427','5304','00,53,5304','新平彝族傣族自治县','53','云南省','5304','玉溪市','530427','新平彝族傣族自治县','','','','',3,1,''),('530428','5304','00,53,5304','元江哈尼族彝族傣族自治县','53','云南省','5304','玉溪市','530428','元江哈尼族彝族傣族自治县','','','','',3,1,''),('530481','5304','00,53,5304','澄江市','53','云南省','5304','玉溪市','530481','澄江市','','','','',3,1,''),('5305','53','00,53','保山市','53','云南省','5305','保山市','','','','','','',2,1,''),('530502','5305','00,53,5305','隆阳区','53','云南省','5305','保山市','530502','隆阳区','','','','',3,1,''),('530521','5305','00,53,5305','施甸县','53','云南省','5305','保山市','530521','施甸县','','','','',3,1,''),('530523','5305','00,53,5305','龙陵县','53','云南省','5305','保山市','530523','龙陵县','','','','',3,1,''),('530524','5305','00,53,5305','昌宁县','53','云南省','5305','保山市','530524','昌宁县','','','','',3,1,''),('530581','5305','00,53,5305','腾冲市','53','云南省','5305','保山市','530581','腾冲市','','','','',3,1,''),('5306','53','00,53','昭通市','53','云南省','5306','昭通市','','','','','','',2,1,''),('530602','5306','00,53,5306','昭阳区','53','云南省','5306','昭通市','530602','昭阳区','','','','',3,1,''),('530621','5306','00,53,5306','鲁甸县','53','云南省','5306','昭通市','530621','鲁甸县','','','','',3,1,''),('530622','5306','00,53,5306','巧家县','53','云南省','5306','昭通市','530622','巧家县','','','','',3,1,''),('530623','5306','00,53,5306','盐津县','53','云南省','5306','昭通市','530623','盐津县','','','','',3,1,''),('530624','5306','00,53,5306','大关县','53','云南省','5306','昭通市','530624','大关县','','','','',3,1,''),('530625','5306','00,53,5306','永善县','53','云南省','5306','昭通市','530625','永善县','','','','',3,1,''),('530626','5306','00,53,5306','绥江县','53','云南省','5306','昭通市','530626','绥江县','','','','',3,1,''),('530627','5306','00,53,5306','镇雄县','53','云南省','5306','昭通市','530627','镇雄县','','','','',3,1,''),('530628','5306','00,53,5306','彝良县','53','云南省','5306','昭通市','530628','彝良县','','','','',3,1,''),('530629','5306','00,53,5306','威信县','53','云南省','5306','昭通市','530629','威信县','','','','',3,1,''),('530681','5306','00,53,5306','水富市','53','云南省','5306','昭通市','530681','水富市','','','','',3,1,''),('5307','53','00,53','丽江市','53','云南省','5307','丽江市','','','','','','',2,1,''),('530702','5307','00,53,5307','古城区','53','云南省','5307','丽江市','530702','古城区','','','','',3,1,''),('530721','5307','00,53,5307','玉龙纳西族自治县','53','云南省','5307','丽江市','530721','玉龙纳西族自治县','','','','',3,1,''),('530722','5307','00,53,5307','永胜县','53','云南省','5307','丽江市','530722','永胜县','','','','',3,1,''),('530723','5307','00,53,5307','华坪县','53','云南省','5307','丽江市','530723','华坪县','','','','',3,1,''),('530724','5307','00,53,5307','宁蒗彝族自治县','53','云南省','5307','丽江市','530724','宁蒗彝族自治县','','','','',3,1,''),('5308','53','00,53','普洱市','53','云南省','5308','普洱市','','','','','','',2,1,''),('530802','5308','00,53,5308','思茅区','53','云南省','5308','普洱市','530802','思茅区','','','','',3,1,''),('530821','5308','00,53,5308','宁洱哈尼族彝族自治县','53','云南省','5308','普洱市','530821','宁洱哈尼族彝族自治县','','','','',3,1,''),('530822','5308','00,53,5308','墨江哈尼族自治县','53','云南省','5308','普洱市','530822','墨江哈尼族自治县','','','','',3,1,''),('530823','5308','00,53,5308','景东彝族自治县','53','云南省','5308','普洱市','530823','景东彝族自治县','','','','',3,1,''),('530824','5308','00,53,5308','景谷傣族彝族自治县','53','云南省','5308','普洱市','530824','景谷傣族彝族自治县','','','','',3,1,''),('530825','5308','00,53,5308','镇沅彝族哈尼族拉祜族自治县','53','云南省','5308','普洱市','530825','镇沅彝族哈尼族拉祜族自治县','','','','',3,1,''),('530826','5308','00,53,5308','江城哈尼族彝族自治县','53','云南省','5308','普洱市','530826','江城哈尼族彝族自治县','','','','',3,1,''),('530827','5308','00,53,5308','孟连傣族拉祜族佤族自治县','53','云南省','5308','普洱市','530827','孟连傣族拉祜族佤族自治县','','','','',3,1,''),('530828','5308','00,53,5308','澜沧拉祜族自治县','53','云南省','5308','普洱市','530828','澜沧拉祜族自治县','','','','',3,1,''),('530829','5308','00,53,5308','西盟佤族自治县','53','云南省','5308','普洱市','530829','西盟佤族自治县','','','','',3,1,''),('5309','53','00,53','临沧市','53','云南省','5309','临沧市','','','','','','',2,1,''),('530902','5309','00,53,5309','临翔区','53','云南省','5309','临沧市','530902','临翔区','','','','',3,1,''),('530921','5309','00,53,5309','凤庆县','53','云南省','5309','临沧市','530921','凤庆县','','','','',3,1,''),('530922','5309','00,53,5309','云县','53','云南省','5309','临沧市','530922','云县','','','','',3,1,''),('530923','5309','00,53,5309','永德县','53','云南省','5309','临沧市','530923','永德县','','','','',3,1,''),('530924','5309','00,53,5309','镇康县','53','云南省','5309','临沧市','530924','镇康县','','','','',3,1,''),('530925','5309','00,53,5309','双江拉祜族佤族布朗族傣族自治县','53','云南省','5309','临沧市','530925','双江拉祜族佤族布朗族傣族自治县','','','','',3,1,''),('530926','5309','00,53,5309','耿马傣族佤族自治县','53','云南省','5309','临沧市','530926','耿马傣族佤族自治县','','','','',3,1,''),('530927','5309','00,53,5309','沧源佤族自治县','53','云南省','5309','临沧市','530927','沧源佤族自治县','','','','',3,1,''),('5323','53','00,53','楚雄彝族自治州','53','云南省','5323','楚雄彝族自治州','','','','','','',2,1,''),('532301','5323','00,53,5323','楚雄市','53','云南省','5323','楚雄彝族自治州','532301','楚雄市','','','','',3,1,''),('532322','5323','00,53,5323','双柏县','53','云南省','5323','楚雄彝族自治州','532322','双柏县','','','','',3,1,''),('532323','5323','00,53,5323','牟定县','53','云南省','5323','楚雄彝族自治州','532323','牟定县','','','','',3,1,''),('532324','5323','00,53,5323','南华县','53','云南省','5323','楚雄彝族自治州','532324','南华县','','','','',3,1,''),('532325','5323','00,53,5323','姚安县','53','云南省','5323','楚雄彝族自治州','532325','姚安县','','','','',3,1,''),('532326','5323','00,53,5323','大姚县','53','云南省','5323','楚雄彝族自治州','532326','大姚县','','','','',3,1,''),('532327','5323','00,53,5323','永仁县','53','云南省','5323','楚雄彝族自治州','532327','永仁县','','','','',3,1,''),('532328','5323','00,53,5323','元谋县','53','云南省','5323','楚雄彝族自治州','532328','元谋县','','','','',3,1,''),('532329','5323','00,53,5323','武定县','53','云南省','5323','楚雄彝族自治州','532329','武定县','','','','',3,1,''),('532331','5323','00,53,5323','禄丰县','53','云南省','5323','楚雄彝族自治州','532331','禄丰县','','','','',3,1,''),('5325','53','00,53','红河哈尼族彝族自治州','53','云南省','5325','红河哈尼族彝族自治州','','','','','','',2,1,''),('532501','5325','00,53,5325','个旧市','53','云南省','5325','红河哈尼族彝族自治州','532501','个旧市','','','','',3,1,''),('532502','5325','00,53,5325','开远市','53','云南省','5325','红河哈尼族彝族自治州','532502','开远市','','','','',3,1,''),('532503','5325','00,53,5325','蒙自市','53','云南省','5325','红河哈尼族彝族自治州','532503','蒙自市','','','','',3,1,''),('532504','5325','00,53,5325','弥勒市','53','云南省','5325','红河哈尼族彝族自治州','532504','弥勒市','','','','',3,1,''),('532523','5325','00,53,5325','屏边苗族自治县','53','云南省','5325','红河哈尼族彝族自治州','532523','屏边苗族自治县','','','','',3,1,''),('532524','5325','00,53,5325','建水县','53','云南省','5325','红河哈尼族彝族自治州','532524','建水县','','','','',3,1,''),('532525','5325','00,53,5325','石屏县','53','云南省','5325','红河哈尼族彝族自治州','532525','石屏县','','','','',3,1,''),('532527','5325','00,53,5325','泸西县','53','云南省','5325','红河哈尼族彝族自治州','532527','泸西县','','','','',3,1,''),('532528','5325','00,53,5325','元阳县','53','云南省','5325','红河哈尼族彝族自治州','532528','元阳县','','','','',3,1,''),('532529','5325','00,53,5325','红河县','53','云南省','5325','红河哈尼族彝族自治州','532529','红河县','','','','',3,1,''),('532530','5325','00,53,5325','金平苗族瑶族傣族自治县','53','云南省','5325','红河哈尼族彝族自治州','532530','金平苗族瑶族傣族自治县','','','','',3,1,''),('532531','5325','00,53,5325','绿春县','53','云南省','5325','红河哈尼族彝族自治州','532531','绿春县','','','','',3,1,''),('532532','5325','00,53,5325','河口瑶族自治县','53','云南省','5325','红河哈尼族彝族自治州','532532','河口瑶族自治县','','','','',3,1,''),('5326','53','00,53','文山壮族苗族自治州','53','云南省','5326','文山壮族苗族自治州','','','','','','',2,1,''),('532601','5326','00,53,5326','文山市','53','云南省','5326','文山壮族苗族自治州','532601','文山市','','','','',3,1,''),('532622','5326','00,53,5326','砚山县','53','云南省','5326','文山壮族苗族自治州','532622','砚山县','','','','',3,1,''),('532623','5326','00,53,5326','西畴县','53','云南省','5326','文山壮族苗族自治州','532623','西畴县','','','','',3,1,''),('532624','5326','00,53,5326','麻栗坡县','53','云南省','5326','文山壮族苗族自治州','532624','麻栗坡县','','','','',3,1,''),('532625','5326','00,53,5326','马关县','53','云南省','5326','文山壮族苗族自治州','532625','马关县','','','','',3,1,''),('532626','5326','00,53,5326','丘北县','53','云南省','5326','文山壮族苗族自治州','532626','丘北县','','','','',3,1,''),('532627','5326','00,53,5326','广南县','53','云南省','5326','文山壮族苗族自治州','532627','广南县','','','','',3,1,''),('532628','5326','00,53,5326','富宁县','53','云南省','5326','文山壮族苗族自治州','532628','富宁县','','','','',3,1,''),('5328','53','00,53','西双版纳傣族自治州','53','云南省','5328','西双版纳傣族自治州','','','','','','',2,1,''),('532801','5328','00,53,5328','景洪市','53','云南省','5328','西双版纳傣族自治州','532801','景洪市','','','','',3,1,''),('532822','5328','00,53,5328','勐海县','53','云南省','5328','西双版纳傣族自治州','532822','勐海县','','','','',3,1,''),('532823','5328','00,53,5328','勐腊县','53','云南省','5328','西双版纳傣族自治州','532823','勐腊县','','','','',3,1,''),('5329','53','00,53','大理白族自治州','53','云南省','5329','大理白族自治州','','','','','','',2,1,''),('532901','5329','00,53,5329','大理市','53','云南省','5329','大理白族自治州','532901','大理市','','','','',3,1,''),('532922','5329','00,53,5329','漾濞彝族自治县','53','云南省','5329','大理白族自治州','532922','漾濞彝族自治县','','','','',3,1,''),('532923','5329','00,53,5329','祥云县','53','云南省','5329','大理白族自治州','532923','祥云县','','','','',3,1,''),('532924','5329','00,53,5329','宾川县','53','云南省','5329','大理白族自治州','532924','宾川县','','','','',3,1,''),('532925','5329','00,53,5329','弥渡县','53','云南省','5329','大理白族自治州','532925','弥渡县','','','','',3,1,''),('532926','5329','00,53,5329','南涧彝族自治县','53','云南省','5329','大理白族自治州','532926','南涧彝族自治县','','','','',3,1,''),('532927','5329','00,53,5329','巍山彝族回族自治县','53','云南省','5329','大理白族自治州','532927','巍山彝族回族自治县','','','','',3,1,''),('532928','5329','00,53,5329','永平县','53','云南省','5329','大理白族自治州','532928','永平县','','','','',3,1,''),('532929','5329','00,53,5329','云龙县','53','云南省','5329','大理白族自治州','532929','云龙县','','','','',3,1,''),('532930','5329','00,53,5329','洱源县','53','云南省','5329','大理白族自治州','532930','洱源县','','','','',3,1,''),('532931','5329','00,53,5329','剑川县','53','云南省','5329','大理白族自治州','532931','剑川县','','','','',3,1,''),('532932','5329','00,53,5329','鹤庆县','53','云南省','5329','大理白族自治州','532932','鹤庆县','','','','',3,1,''),('5331','53','00,53','德宏傣族景颇族自治州','53','云南省','5331','德宏傣族景颇族自治州','','','','','','',2,1,''),('533102','5331','00,53,5331','瑞丽市','53','云南省','5331','德宏傣族景颇族自治州','533102','瑞丽市','','','','',3,1,''),('533103','5331','00,53,5331','芒市','53','云南省','5331','德宏傣族景颇族自治州','533103','芒市','','','','',3,1,''),('533122','5331','00,53,5331','梁河县','53','云南省','5331','德宏傣族景颇族自治州','533122','梁河县','','','','',3,1,''),('533123','5331','00,53,5331','盈江县','53','云南省','5331','德宏傣族景颇族自治州','533123','盈江县','','','','',3,1,''),('533124','5331','00,53,5331','陇川县','53','云南省','5331','德宏傣族景颇族自治州','533124','陇川县','','','','',3,1,''),('5333','53','00,53','怒江傈僳族自治州','53','云南省','5333','怒江傈僳族自治州','','','','','','',2,1,''),('533301','5333','00,53,5333','泸水市','53','云南省','5333','怒江傈僳族自治州','533301','泸水市','','','','',3,1,''),('533323','5333','00,53,5333','福贡县','53','云南省','5333','怒江傈僳族自治州','533323','福贡县','','','','',3,1,''),('533324','5333','00,53,5333','贡山独龙族怒族自治县','53','云南省','5333','怒江傈僳族自治州','533324','贡山独龙族怒族自治县','','','','',3,1,''),('533325','5333','00,53,5333','兰坪白族普米族自治县','53','云南省','5333','怒江傈僳族自治州','533325','兰坪白族普米族自治县','','','','',3,1,''),('5334','53','00,53','迪庆藏族自治州','53','云南省','5334','迪庆藏族自治州','','','','','','',2,1,''),('533401','5334','00,53,5334','香格里拉市','53','云南省','5334','迪庆藏族自治州','533401','香格里拉市','','','','',3,1,''),('533422','5334','00,53,5334','德钦县','53','云南省','5334','迪庆藏族自治州','533422','德钦县','','','','',3,1,''),('533423','5334','00,53,5334','维西傈僳族自治县','53','云南省','5334','迪庆藏族自治州','533423','维西傈僳族自治县','','','','',3,1,''),('54','00','00','西藏自治区','54','西藏自治区','','','','','','','','',1,1,''),('5401','54','00,54','拉萨市','54','西藏自治区','5401','拉萨市','','','','','','',2,1,''),('540102','5401','00,54,5401','城关区','54','西藏自治区','5401','拉萨市','540102','城关区','','','','',3,1,''),('540103','5401','00,54,5401','堆龙德庆区','54','西藏自治区','5401','拉萨市','540103','堆龙德庆区','','','','',3,1,''),('540104','5401','00,54,5401','达孜区','54','西藏自治区','5401','拉萨市','540104','达孜区','','','','',3,1,''),('540121','5401','00,54,5401','林周县','54','西藏自治区','5401','拉萨市','540121','林周县','','','','',3,1,''),('540122','5401','00,54,5401','当雄县','54','西藏自治区','5401','拉萨市','540122','当雄县','','','','',3,1,''),('540123','5401','00,54,5401','尼木县','54','西藏自治区','5401','拉萨市','540123','尼木县','','','','',3,1,''),('540124','5401','00,54,5401','曲水县','54','西藏自治区','5401','拉萨市','540124','曲水县','','','','',3,1,''),('540127','5401','00,54,5401','墨竹工卡县','54','西藏自治区','5401','拉萨市','540127','墨竹工卡县','','','','',3,1,''),('5402','54','00,54','日喀则市','54','西藏自治区','5402','日喀则市','','','','','','',2,1,''),('540202','5402','00,54,5402','桑珠孜区','54','西藏自治区','5402','日喀则市','540202','桑珠孜区','','','','',3,1,''),('540221','5402','00,54,5402','南木林县','54','西藏自治区','5402','日喀则市','540221','南木林县','','','','',3,1,''),('540222','5402','00,54,5402','江孜县','54','西藏自治区','5402','日喀则市','540222','江孜县','','','','',3,1,''),('540223','5402','00,54,5402','定日县','54','西藏自治区','5402','日喀则市','540223','定日县','','','','',3,1,''),('540224','5402','00,54,5402','萨迦县','54','西藏自治区','5402','日喀则市','540224','萨迦县','','','','',3,1,''),('540225','5402','00,54,5402','拉孜县','54','西藏自治区','5402','日喀则市','540225','拉孜县','','','','',3,1,''),('540226','5402','00,54,5402','昂仁县','54','西藏自治区','5402','日喀则市','540226','昂仁县','','','','',3,1,''),('540227','5402','00,54,5402','谢通门县','54','西藏自治区','5402','日喀则市','540227','谢通门县','','','','',3,1,''),('540228','5402','00,54,5402','白朗县','54','西藏自治区','5402','日喀则市','540228','白朗县','','','','',3,1,''),('540229','5402','00,54,5402','仁布县','54','西藏自治区','5402','日喀则市','540229','仁布县','','','','',3,1,''),('540230','5402','00,54,5402','康马县','54','西藏自治区','5402','日喀则市','540230','康马县','','','','',3,1,''),('540231','5402','00,54,5402','定结县','54','西藏自治区','5402','日喀则市','540231','定结县','','','','',3,1,''),('540232','5402','00,54,5402','仲巴县','54','西藏自治区','5402','日喀则市','540232','仲巴县','','','','',3,1,''),('540233','5402','00,54,5402','亚东县','54','西藏自治区','5402','日喀则市','540233','亚东县','','','','',3,1,''),('540234','5402','00,54,5402','吉隆县','54','西藏自治区','5402','日喀则市','540234','吉隆县','','','','',3,1,''),('540235','5402','00,54,5402','聂拉木县','54','西藏自治区','5402','日喀则市','540235','聂拉木县','','','','',3,1,''),('540236','5402','00,54,5402','萨嘎县','54','西藏自治区','5402','日喀则市','540236','萨嘎县','','','','',3,1,''),('540237','5402','00,54,5402','岗巴县','54','西藏自治区','5402','日喀则市','540237','岗巴县','','','','',3,1,''),('5403','54','00,54','昌都市','54','西藏自治区','5403','昌都市','','','','','','',2,1,''),('540302','5403','00,54,5403','卡若区','54','西藏自治区','5403','昌都市','540302','卡若区','','','','',3,1,''),('540321','5403','00,54,5403','江达县','54','西藏自治区','5403','昌都市','540321','江达县','','','','',3,1,''),('540322','5403','00,54,5403','贡觉县','54','西藏自治区','5403','昌都市','540322','贡觉县','','','','',3,1,''),('540323','5403','00,54,5403','类乌齐县','54','西藏自治区','5403','昌都市','540323','类乌齐县','','','','',3,1,''),('540324','5403','00,54,5403','丁青县','54','西藏自治区','5403','昌都市','540324','丁青县','','','','',3,1,''),('540325','5403','00,54,5403','察雅县','54','西藏自治区','5403','昌都市','540325','察雅县','','','','',3,1,''),('540326','5403','00,54,5403','八宿县','54','西藏自治区','5403','昌都市','540326','八宿县','','','','',3,1,''),('540327','5403','00,54,5403','左贡县','54','西藏自治区','5403','昌都市','540327','左贡县','','','','',3,1,''),('540328','5403','00,54,5403','芒康县','54','西藏自治区','5403','昌都市','540328','芒康县','','','','',3,1,''),('540329','5403','00,54,5403','洛隆县','54','西藏自治区','5403','昌都市','540329','洛隆县','','','','',3,1,''),('540330','5403','00,54,5403','边坝县','54','西藏自治区','5403','昌都市','540330','边坝县','','','','',3,1,''),('5404','54','00,54','林芝市','54','西藏自治区','5404','林芝市','','','','','','',2,1,''),('540402','5404','00,54,5404','巴宜区','54','西藏自治区','5404','林芝市','540402','巴宜区','','','','',3,1,''),('540421','5404','00,54,5404','工布江达县','54','西藏自治区','5404','林芝市','540421','工布江达县','','','','',3,1,''),('540422','5404','00,54,5404','米林县','54','西藏自治区','5404','林芝市','540422','米林县','','','','',3,1,''),('540423','5404','00,54,5404','墨脱县','54','西藏自治区','5404','林芝市','540423','墨脱县','','','','',3,1,''),('540424','5404','00,54,5404','波密县','54','西藏自治区','5404','林芝市','540424','波密县','','','','',3,1,''),('540425','5404','00,54,5404','察隅县','54','西藏自治区','5404','林芝市','540425','察隅县','','','','',3,1,''),('540426','5404','00,54,5404','朗县','54','西藏自治区','5404','林芝市','540426','朗县','','','','',3,1,''),('5405','54','00,54','山南市','54','西藏自治区','5405','山南市','','','','','','',2,1,''),('540502','5405','00,54,5405','乃东区','54','西藏自治区','5405','山南市','540502','乃东区','','','','',3,1,''),('540521','5405','00,54,5405','扎囊县','54','西藏自治区','5405','山南市','540521','扎囊县','','','','',3,1,''),('540522','5405','00,54,5405','贡嘎县','54','西藏自治区','5405','山南市','540522','贡嘎县','','','','',3,1,''),('540523','5405','00,54,5405','桑日县','54','西藏自治区','5405','山南市','540523','桑日县','','','','',3,1,''),('540524','5405','00,54,5405','琼结县','54','西藏自治区','5405','山南市','540524','琼结县','','','','',3,1,''),('540525','5405','00,54,5405','曲松县','54','西藏自治区','5405','山南市','540525','曲松县','','','','',3,1,''),('540526','5405','00,54,5405','措美县','54','西藏自治区','5405','山南市','540526','措美县','','','','',3,1,''),('540527','5405','00,54,5405','洛扎县','54','西藏自治区','5405','山南市','540527','洛扎县','','','','',3,1,''),('540528','5405','00,54,5405','加查县','54','西藏自治区','5405','山南市','540528','加查县','','','','',3,1,''),('540529','5405','00,54,5405','隆子县','54','西藏自治区','5405','山南市','540529','隆子县','','','','',3,1,''),('540530','5405','00,54,5405','错那县','54','西藏自治区','5405','山南市','540530','错那县','','','','',3,1,''),('540531','5405','00,54,5405','浪卡子县','54','西藏自治区','5405','山南市','540531','浪卡子县','','','','',3,1,''),('5406','54','00,54','那曲市','54','西藏自治区','5406','那曲市','','','','','','',2,1,''),('540602','5406','00,54,5406','色尼区','54','西藏自治区','5406','那曲市','540602','色尼区','','','','',3,1,''),('540621','5406','00,54,5406','嘉黎县','54','西藏自治区','5406','那曲市','540621','嘉黎县','','','','',3,1,''),('540622','5406','00,54,5406','比如县','54','西藏自治区','5406','那曲市','540622','比如县','','','','',3,1,''),('540623','5406','00,54,5406','聂荣县','54','西藏自治区','5406','那曲市','540623','聂荣县','','','','',3,1,''),('540624','5406','00,54,5406','安多县','54','西藏自治区','5406','那曲市','540624','安多县','','','','',3,1,''),('540625','5406','00,54,5406','申扎县','54','西藏自治区','5406','那曲市','540625','申扎县','','','','',3,1,''),('540626','5406','00,54,5406','索县','54','西藏自治区','5406','那曲市','540626','索县','','','','',3,1,''),('540627','5406','00,54,5406','班戈县','54','西藏自治区','5406','那曲市','540627','班戈县','','','','',3,1,''),('540628','5406','00,54,5406','巴青县','54','西藏自治区','5406','那曲市','540628','巴青县','','','','',3,1,''),('540629','5406','00,54,5406','尼玛县','54','西藏自治区','5406','那曲市','540629','尼玛县','','','','',3,1,''),('540630','5406','00,54,5406','双湖县','54','西藏自治区','5406','那曲市','540630','双湖县','','','','',3,1,''),('5425','54','00,54','阿里地区','54','西藏自治区','5425','阿里地区','','','','','','',2,1,''),('542521','5425','00,54,5425','普兰县','54','西藏自治区','5425','阿里地区','542521','普兰县','','','','',3,1,''),('542522','5425','00,54,5425','札达县','54','西藏自治区','5425','阿里地区','542522','札达县','','','','',3,1,''),('542523','5425','00,54,5425','噶尔县','54','西藏自治区','5425','阿里地区','542523','噶尔县','','','','',3,1,''),('542524','5425','00,54,5425','日土县','54','西藏自治区','5425','阿里地区','542524','日土县','','','','',3,1,''),('542525','5425','00,54,5425','革吉县','54','西藏自治区','5425','阿里地区','542525','革吉县','','','','',3,1,''),('542526','5425','00,54,5425','改则县','54','西藏自治区','5425','阿里地区','542526','改则县','','','','',3,1,''),('542527','5425','00,54,5425','措勤县','54','西藏自治区','5425','阿里地区','542527','措勤县','','','','',3,1,''),('61','00','00','陕西省','61','陕西省','','','','','','','','',1,1,''),('6101','61','00,61','西安市','61','陕西省','6101','西安市','','','','','','',2,1,''),('610102','6101','00,61,6101','新城区','61','陕西省','6101','西安市','610102','新城区','','','','',3,1,''),('610103','6101','00,61,6101','碑林区','61','陕西省','6101','西安市','610103','碑林区','','','','',3,1,''),('610104','6101','00,61,6101','莲湖区','61','陕西省','6101','西安市','610104','莲湖区','','','','',3,1,''),('610111','6101','00,61,6101','灞桥区','61','陕西省','6101','西安市','610111','灞桥区','','','','',3,1,''),('610112','6101','00,61,6101','未央区','61','陕西省','6101','西安市','610112','未央区','','','','',3,1,''),('610113','6101','00,61,6101','雁塔区','61','陕西省','6101','西安市','610113','雁塔区','','','','',3,1,''),('610114','6101','00,61,6101','阎良区','61','陕西省','6101','西安市','610114','阎良区','','','','',3,1,''),('610115','6101','00,61,6101','临潼区','61','陕西省','6101','西安市','610115','临潼区','','','','',3,1,''),('610116','6101','00,61,6101','长安区','61','陕西省','6101','西安市','610116','长安区','','','','',3,1,''),('610117','6101','00,61,6101','高陵区','61','陕西省','6101','西安市','610117','高陵区','','','','',3,1,''),('610118','6101','00,61,6101','鄠邑区','61','陕西省','6101','西安市','610118','鄠邑区','','','','',3,1,''),('610122','6101','00,61,6101','蓝田县','61','陕西省','6101','西安市','610122','蓝田县','','','','',3,1,''),('610124','6101','00,61,6101','周至县','61','陕西省','6101','西安市','610124','周至县','','','','',3,1,''),('6102','61','00,61','铜川市','61','陕西省','6102','铜川市','','','','','','',2,1,''),('610202','6102','00,61,6102','王益区','61','陕西省','6102','铜川市','610202','王益区','','','','',3,1,''),('610203','6102','00,61,6102','印台区','61','陕西省','6102','铜川市','610203','印台区','','','','',3,1,''),('610204','6102','00,61,6102','耀州区','61','陕西省','6102','铜川市','610204','耀州区','','','','',3,1,''),('610222','6102','00,61,6102','宜君县','61','陕西省','6102','铜川市','610222','宜君县','','','','',3,1,''),('6103','61','00,61','宝鸡市','61','陕西省','6103','宝鸡市','','','','','','',2,1,''),('610302','6103','00,61,6103','渭滨区','61','陕西省','6103','宝鸡市','610302','渭滨区','','','','',3,1,''),('610303','6103','00,61,6103','金台区','61','陕西省','6103','宝鸡市','610303','金台区','','','','',3,1,''),('610304','6103','00,61,6103','陈仓区','61','陕西省','6103','宝鸡市','610304','陈仓区','','','','',3,1,''),('610322','6103','00,61,6103','凤翔县','61','陕西省','6103','宝鸡市','610322','凤翔县','','','','',3,1,''),('610323','6103','00,61,6103','岐山县','61','陕西省','6103','宝鸡市','610323','岐山县','','','','',3,1,''),('610324','6103','00,61,6103','扶风县','61','陕西省','6103','宝鸡市','610324','扶风县','','','','',3,1,''),('610326','6103','00,61,6103','眉县','61','陕西省','6103','宝鸡市','610326','眉县','','','','',3,1,''),('610327','6103','00,61,6103','陇县','61','陕西省','6103','宝鸡市','610327','陇县','','','','',3,1,''),('610328','6103','00,61,6103','千阳县','61','陕西省','6103','宝鸡市','610328','千阳县','','','','',3,1,''),('610329','6103','00,61,6103','麟游县','61','陕西省','6103','宝鸡市','610329','麟游县','','','','',3,1,''),('610330','6103','00,61,6103','凤县','61','陕西省','6103','宝鸡市','610330','凤县','','','','',3,1,''),('610331','6103','00,61,6103','太白县','61','陕西省','6103','宝鸡市','610331','太白县','','','','',3,1,''),('6104','61','00,61','咸阳市','61','陕西省','6104','咸阳市','','','','','','',2,1,''),('610402','6104','00,61,6104','秦都区','61','陕西省','6104','咸阳市','610402','秦都区','','','','',3,1,''),('610403','6104','00,61,6104','杨陵区','61','陕西省','6104','咸阳市','610403','杨陵区','','','','',3,1,''),('610404','6104','00,61,6104','渭城区','61','陕西省','6104','咸阳市','610404','渭城区','','','','',3,1,''),('610422','6104','00,61,6104','三原县','61','陕西省','6104','咸阳市','610422','三原县','','','','',3,1,''),('610423','6104','00,61,6104','泾阳县','61','陕西省','6104','咸阳市','610423','泾阳县','','','','',3,1,''),('610424','6104','00,61,6104','乾县','61','陕西省','6104','咸阳市','610424','乾县','','','','',3,1,''),('610425','6104','00,61,6104','礼泉县','61','陕西省','6104','咸阳市','610425','礼泉县','','','','',3,1,''),('610426','6104','00,61,6104','永寿县','61','陕西省','6104','咸阳市','610426','永寿县','','','','',3,1,''),('610428','6104','00,61,6104','长武县','61','陕西省','6104','咸阳市','610428','长武县','','','','',3,1,''),('610429','6104','00,61,6104','旬邑县','61','陕西省','6104','咸阳市','610429','旬邑县','','','','',3,1,''),('610430','6104','00,61,6104','淳化县','61','陕西省','6104','咸阳市','610430','淳化县','','','','',3,1,''),('610431','6104','00,61,6104','武功县','61','陕西省','6104','咸阳市','610431','武功县','','','','',3,1,''),('610481','6104','00,61,6104','兴平市','61','陕西省','6104','咸阳市','610481','兴平市','','','','',3,1,''),('610482','6104','00,61,6104','彬州市','61','陕西省','6104','咸阳市','610482','彬州市','','','','',3,1,''),('6105','61','00,61','渭南市','61','陕西省','6105','渭南市','','','','','','',2,1,''),('610502','6105','00,61,6105','临渭区','61','陕西省','6105','渭南市','610502','临渭区','','','','',3,1,''),('610503','6105','00,61,6105','华州区','61','陕西省','6105','渭南市','610503','华州区','','','','',3,1,''),('610522','6105','00,61,6105','潼关县','61','陕西省','6105','渭南市','610522','潼关县','','','','',3,1,''),('610523','6105','00,61,6105','大荔县','61','陕西省','6105','渭南市','610523','大荔县','','','','',3,1,''),('610524','6105','00,61,6105','合阳县','61','陕西省','6105','渭南市','610524','合阳县','','','','',3,1,''),('610525','6105','00,61,6105','澄城县','61','陕西省','6105','渭南市','610525','澄城县','','','','',3,1,''),('610526','6105','00,61,6105','蒲城县','61','陕西省','6105','渭南市','610526','蒲城县','','','','',3,1,''),('610527','6105','00,61,6105','白水县','61','陕西省','6105','渭南市','610527','白水县','','','','',3,1,''),('610528','6105','00,61,6105','富平县','61','陕西省','6105','渭南市','610528','富平县','','','','',3,1,''),('610581','6105','00,61,6105','韩城市','61','陕西省','6105','渭南市','610581','韩城市','','','','',3,1,''),('610582','6105','00,61,6105','华阴市','61','陕西省','6105','渭南市','610582','华阴市','','','','',3,1,''),('6106','61','00,61','延安市','61','陕西省','6106','延安市','','','','','','',2,1,''),('610602','6106','00,61,6106','宝塔区','61','陕西省','6106','延安市','610602','宝塔区','','','','',3,1,''),('610603','6106','00,61,6106','安塞区','61','陕西省','6106','延安市','610603','安塞区','','','','',3,1,''),('610621','6106','00,61,6106','延长县','61','陕西省','6106','延安市','610621','延长县','','','','',3,1,''),('610622','6106','00,61,6106','延川县','61','陕西省','6106','延安市','610622','延川县','','','','',3,1,''),('610625','6106','00,61,6106','志丹县','61','陕西省','6106','延安市','610625','志丹县','','','','',3,1,''),('610626','6106','00,61,6106','吴起县','61','陕西省','6106','延安市','610626','吴起县','','','','',3,1,''),('610627','6106','00,61,6106','甘泉县','61','陕西省','6106','延安市','610627','甘泉县','','','','',3,1,''),('610628','6106','00,61,6106','富县','61','陕西省','6106','延安市','610628','富县','','','','',3,1,''),('610629','6106','00,61,6106','洛川县','61','陕西省','6106','延安市','610629','洛川县','','','','',3,1,''),('610630','6106','00,61,6106','宜川县','61','陕西省','6106','延安市','610630','宜川县','','','','',3,1,''),('610631','6106','00,61,6106','黄龙县','61','陕西省','6106','延安市','610631','黄龙县','','','','',3,1,''),('610632','6106','00,61,6106','黄陵县','61','陕西省','6106','延安市','610632','黄陵县','','','','',3,1,''),('610681','6106','00,61,6106','子长市','61','陕西省','6106','延安市','610681','子长市','','','','',3,1,''),('6107','61','00,61','汉中市','61','陕西省','6107','汉中市','','','','','','',2,1,''),('610702','6107','00,61,6107','汉台区','61','陕西省','6107','汉中市','610702','汉台区','','','','',3,1,''),('610703','6107','00,61,6107','南郑区','61','陕西省','6107','汉中市','610703','南郑区','','','','',3,1,''),('610722','6107','00,61,6107','城固县','61','陕西省','6107','汉中市','610722','城固县','','','','',3,1,''),('610723','6107','00,61,6107','洋县','61','陕西省','6107','汉中市','610723','洋县','','','','',3,1,''),('610724','6107','00,61,6107','西乡县','61','陕西省','6107','汉中市','610724','西乡县','','','','',3,1,''),('610725','6107','00,61,6107','勉县','61','陕西省','6107','汉中市','610725','勉县','','','','',3,1,''),('610726','6107','00,61,6107','宁强县','61','陕西省','6107','汉中市','610726','宁强县','','','','',3,1,''),('610727','6107','00,61,6107','略阳县','61','陕西省','6107','汉中市','610727','略阳县','','','','',3,1,''),('610728','6107','00,61,6107','镇巴县','61','陕西省','6107','汉中市','610728','镇巴县','','','','',3,1,''),('610729','6107','00,61,6107','留坝县','61','陕西省','6107','汉中市','610729','留坝县','','','','',3,1,''),('610730','6107','00,61,6107','佛坪县','61','陕西省','6107','汉中市','610730','佛坪县','','','','',3,1,''),('6108','61','00,61','榆林市','61','陕西省','6108','榆林市','','','','','','',2,1,''),('610802','6108','00,61,6108','榆阳区','61','陕西省','6108','榆林市','610802','榆阳区','','','','',3,1,''),('610803','6108','00,61,6108','横山区','61','陕西省','6108','榆林市','610803','横山区','','','','',3,1,''),('610822','6108','00,61,6108','府谷县','61','陕西省','6108','榆林市','610822','府谷县','','','','',3,1,''),('610824','6108','00,61,6108','靖边县','61','陕西省','6108','榆林市','610824','靖边县','','','','',3,1,''),('610825','6108','00,61,6108','定边县','61','陕西省','6108','榆林市','610825','定边县','','','','',3,1,''),('610826','6108','00,61,6108','绥德县','61','陕西省','6108','榆林市','610826','绥德县','','','','',3,1,''),('610827','6108','00,61,6108','米脂县','61','陕西省','6108','榆林市','610827','米脂县','','','','',3,1,''),('610828','6108','00,61,6108','佳县','61','陕西省','6108','榆林市','610828','佳县','','','','',3,1,''),('610829','6108','00,61,6108','吴堡县','61','陕西省','6108','榆林市','610829','吴堡县','','','','',3,1,''),('610830','6108','00,61,6108','清涧县','61','陕西省','6108','榆林市','610830','清涧县','','','','',3,1,''),('610831','6108','00,61,6108','子洲县','61','陕西省','6108','榆林市','610831','子洲县','','','','',3,1,''),('610881','6108','00,61,6108','神木市','61','陕西省','6108','榆林市','610881','神木市','','','','',3,1,''),('6109','61','00,61','安康市','61','陕西省','6109','安康市','','','','','','',2,1,''),('610902','6109','00,61,6109','汉滨区','61','陕西省','6109','安康市','610902','汉滨区','','','','',3,1,''),('610921','6109','00,61,6109','汉阴县','61','陕西省','6109','安康市','610921','汉阴县','','','','',3,1,''),('610922','6109','00,61,6109','石泉县','61','陕西省','6109','安康市','610922','石泉县','','','','',3,1,''),('610923','6109','00,61,6109','宁陕县','61','陕西省','6109','安康市','610923','宁陕县','','','','',3,1,''),('610924','6109','00,61,6109','紫阳县','61','陕西省','6109','安康市','610924','紫阳县','','','','',3,1,''),('610925','6109','00,61,6109','岚皋县','61','陕西省','6109','安康市','610925','岚皋县','','','','',3,1,''),('610926','6109','00,61,6109','平利县','61','陕西省','6109','安康市','610926','平利县','','','','',3,1,''),('610927','6109','00,61,6109','镇坪县','61','陕西省','6109','安康市','610927','镇坪县','','','','',3,1,''),('610928','6109','00,61,6109','旬阳县','61','陕西省','6109','安康市','610928','旬阳县','','','','',3,1,''),('610929','6109','00,61,6109','白河县','61','陕西省','6109','安康市','610929','白河县','','','','',3,1,''),('6110','61','00,61','商洛市','61','陕西省','6110','商洛市','','','','','','',2,1,''),('611002','6110','00,61,6110','商州区','61','陕西省','6110','商洛市','611002','商州区','','','','',3,1,''),('611021','6110','00,61,6110','洛南县','61','陕西省','6110','商洛市','611021','洛南县','','','','',3,1,''),('611022','6110','00,61,6110','丹凤县','61','陕西省','6110','商洛市','611022','丹凤县','','','','',3,1,''),('611023','6110','00,61,6110','商南县','61','陕西省','6110','商洛市','611023','商南县','','','','',3,1,''),('611024','6110','00,61,6110','山阳县','61','陕西省','6110','商洛市','611024','山阳县','','','','',3,1,''),('611025','6110','00,61,6110','镇安县','61','陕西省','6110','商洛市','611025','镇安县','','','','',3,1,''),('611026','6110','00,61,6110','柞水县','61','陕西省','6110','商洛市','611026','柞水县','','','','',3,1,''),('62','00','00','甘肃省','62','甘肃省','','','','','','','','',1,1,''),('6201','62','00,62','兰州市','62','甘肃省','6201','兰州市','','','','','','',2,1,''),('620102','6201','00,62,6201','城关区','62','甘肃省','6201','兰州市','620102','城关区','','','','',3,1,''),('620103','6201','00,62,6201','七里河区','62','甘肃省','6201','兰州市','620103','七里河区','','','','',3,1,''),('620104','6201','00,62,6201','西固区','62','甘肃省','6201','兰州市','620104','西固区','','','','',3,1,''),('620105','6201','00,62,6201','安宁区','62','甘肃省','6201','兰州市','620105','安宁区','','','','',3,1,''),('620111','6201','00,62,6201','红古区','62','甘肃省','6201','兰州市','620111','红古区','','','','',3,1,''),('620121','6201','00,62,6201','永登县','62','甘肃省','6201','兰州市','620121','永登县','','','','',3,1,''),('620122','6201','00,62,6201','皋兰县','62','甘肃省','6201','兰州市','620122','皋兰县','','','','',3,1,''),('620123','6201','00,62,6201','榆中县','62','甘肃省','6201','兰州市','620123','榆中县','','','','',3,1,''),('6202','62','00,62','嘉峪关市','62','甘肃省','6202','嘉峪关市','','','','','','',2,1,''),('620200','6202','00,62,6202','嘉峪关市','62','甘肃省','6202','嘉峪关市','620200','嘉峪关市','','','','',3,1,''),('6203','62','00,62','金昌市','62','甘肃省','6203','金昌市','','','','','','',2,1,''),('620302','6203','00,62,6203','金川区','62','甘肃省','6203','金昌市','620302','金川区','','','','',3,1,''),('620321','6203','00,62,6203','永昌县','62','甘肃省','6203','金昌市','620321','永昌县','','','','',3,1,''),('6204','62','00,62','白银市','62','甘肃省','6204','白银市','','','','','','',2,1,''),('620402','6204','00,62,6204','白银区','62','甘肃省','6204','白银市','620402','白银区','','','','',3,1,''),('620403','6204','00,62,6204','平川区','62','甘肃省','6204','白银市','620403','平川区','','','','',3,1,''),('620421','6204','00,62,6204','靖远县','62','甘肃省','6204','白银市','620421','靖远县','','','','',3,1,''),('620422','6204','00,62,6204','会宁县','62','甘肃省','6204','白银市','620422','会宁县','','','','',3,1,''),('620423','6204','00,62,6204','景泰县','62','甘肃省','6204','白银市','620423','景泰县','','','','',3,1,''),('6205','62','00,62','天水市','62','甘肃省','6205','天水市','','','','','','',2,1,''),('620502','6205','00,62,6205','秦州区','62','甘肃省','6205','天水市','620502','秦州区','','','','',3,1,''),('620503','6205','00,62,6205','麦积区','62','甘肃省','6205','天水市','620503','麦积区','','','','',3,1,''),('620521','6205','00,62,6205','清水县','62','甘肃省','6205','天水市','620521','清水县','','','','',3,1,''),('620522','6205','00,62,6205','秦安县','62','甘肃省','6205','天水市','620522','秦安县','','','','',3,1,''),('620523','6205','00,62,6205','甘谷县','62','甘肃省','6205','天水市','620523','甘谷县','','','','',3,1,''),('620524','6205','00,62,6205','武山县','62','甘肃省','6205','天水市','620524','武山县','','','','',3,1,''),('620525','6205','00,62,6205','张家川回族自治县','62','甘肃省','6205','天水市','620525','张家川回族自治县','','','','',3,1,''),('6206','62','00,62','武威市','62','甘肃省','6206','武威市','','','','','','',2,1,''),('620602','6206','00,62,6206','凉州区','62','甘肃省','6206','武威市','620602','凉州区','','','','',3,1,''),('620621','6206','00,62,6206','民勤县','62','甘肃省','6206','武威市','620621','民勤县','','','','',3,1,''),('620622','6206','00,62,6206','古浪县','62','甘肃省','6206','武威市','620622','古浪县','','','','',3,1,''),('620623','6206','00,62,6206','天祝藏族自治县','62','甘肃省','6206','武威市','620623','天祝藏族自治县','','','','',3,1,''),('6207','62','00,62','张掖市','62','甘肃省','6207','张掖市','','','','','','',2,1,''),('620702','6207','00,62,6207','甘州区','62','甘肃省','6207','张掖市','620702','甘州区','','','','',3,1,''),('620721','6207','00,62,6207','肃南裕固族自治县','62','甘肃省','6207','张掖市','620721','肃南裕固族自治县','','','','',3,1,''),('620722','6207','00,62,6207','民乐县','62','甘肃省','6207','张掖市','620722','民乐县','','','','',3,1,''),('620723','6207','00,62,6207','临泽县','62','甘肃省','6207','张掖市','620723','临泽县','','','','',3,1,''),('620724','6207','00,62,6207','高台县','62','甘肃省','6207','张掖市','620724','高台县','','','','',3,1,''),('620725','6207','00,62,6207','山丹县','62','甘肃省','6207','张掖市','620725','山丹县','','','','',3,1,''),('6208','62','00,62','平凉市','62','甘肃省','6208','平凉市','','','','','','',2,1,''),('620802','6208','00,62,6208','崆峒区','62','甘肃省','6208','平凉市','620802','崆峒区','','','','',3,1,''),('620821','6208','00,62,6208','泾川县','62','甘肃省','6208','平凉市','620821','泾川县','','','','',3,1,''),('620822','6208','00,62,6208','灵台县','62','甘肃省','6208','平凉市','620822','灵台县','','','','',3,1,''),('620823','6208','00,62,6208','崇信县','62','甘肃省','6208','平凉市','620823','崇信县','','','','',3,1,''),('620825','6208','00,62,6208','庄浪县','62','甘肃省','6208','平凉市','620825','庄浪县','','','','',3,1,''),('620826','6208','00,62,6208','静宁县','62','甘肃省','6208','平凉市','620826','静宁县','','','','',3,1,''),('620881','6208','00,62,6208','华亭市','62','甘肃省','6208','平凉市','620881','华亭市','','','','',3,1,''),('6209','62','00,62','酒泉市','62','甘肃省','6209','酒泉市','','','','','','',2,1,''),('620902','6209','00,62,6209','肃州区','62','甘肃省','6209','酒泉市','620902','肃州区','','','','',3,1,''),('620921','6209','00,62,6209','金塔县','62','甘肃省','6209','酒泉市','620921','金塔县','','','','',3,1,''),('620922','6209','00,62,6209','瓜州县','62','甘肃省','6209','酒泉市','620922','瓜州县','','','','',3,1,''),('620923','6209','00,62,6209','肃北蒙古族自治县','62','甘肃省','6209','酒泉市','620923','肃北蒙古族自治县','','','','',3,1,''),('620924','6209','00,62,6209','阿克塞哈萨克族自治县','62','甘肃省','6209','酒泉市','620924','阿克塞哈萨克族自治县','','','','',3,1,''),('620981','6209','00,62,6209','玉门市','62','甘肃省','6209','酒泉市','620981','玉门市','','','','',3,1,''),('620982','6209','00,62,6209','敦煌市','62','甘肃省','6209','酒泉市','620982','敦煌市','','','','',3,1,''),('6210','62','00,62','庆阳市','62','甘肃省','6210','庆阳市','','','','','','',2,1,''),('621002','6210','00,62,6210','西峰区','62','甘肃省','6210','庆阳市','621002','西峰区','','','','',3,1,''),('621021','6210','00,62,6210','庆城县','62','甘肃省','6210','庆阳市','621021','庆城县','','','','',3,1,''),('621022','6210','00,62,6210','环县','62','甘肃省','6210','庆阳市','621022','环县','','','','',3,1,''),('621023','6210','00,62,6210','华池县','62','甘肃省','6210','庆阳市','621023','华池县','','','','',3,1,''),('621024','6210','00,62,6210','合水县','62','甘肃省','6210','庆阳市','621024','合水县','','','','',3,1,''),('621025','6210','00,62,6210','正宁县','62','甘肃省','6210','庆阳市','621025','正宁县','','','','',3,1,''),('621026','6210','00,62,6210','宁县','62','甘肃省','6210','庆阳市','621026','宁县','','','','',3,1,''),('621027','6210','00,62,6210','镇原县','62','甘肃省','6210','庆阳市','621027','镇原县','','','','',3,1,''),('6211','62','00,62','定西市','62','甘肃省','6211','定西市','','','','','','',2,1,''),('621102','6211','00,62,6211','安定区','62','甘肃省','6211','定西市','621102','安定区','','','','',3,1,''),('621121','6211','00,62,6211','通渭县','62','甘肃省','6211','定西市','621121','通渭县','','','','',3,1,''),('621122','6211','00,62,6211','陇西县','62','甘肃省','6211','定西市','621122','陇西县','','','','',3,1,''),('621123','6211','00,62,6211','渭源县','62','甘肃省','6211','定西市','621123','渭源县','','','','',3,1,''),('621124','6211','00,62,6211','临洮县','62','甘肃省','6211','定西市','621124','临洮县','','','','',3,1,''),('621125','6211','00,62,6211','漳县','62','甘肃省','6211','定西市','621125','漳县','','','','',3,1,''),('621126','6211','00,62,6211','岷县','62','甘肃省','6211','定西市','621126','岷县','','','','',3,1,''),('6212','62','00,62','陇南市','62','甘肃省','6212','陇南市','','','','','','',2,1,''),('621202','6212','00,62,6212','武都区','62','甘肃省','6212','陇南市','621202','武都区','','','','',3,1,''),('621221','6212','00,62,6212','成县','62','甘肃省','6212','陇南市','621221','成县','','','','',3,1,''),('621222','6212','00,62,6212','文县','62','甘肃省','6212','陇南市','621222','文县','','','','',3,1,''),('621223','6212','00,62,6212','宕昌县','62','甘肃省','6212','陇南市','621223','宕昌县','','','','',3,1,''),('621224','6212','00,62,6212','康县','62','甘肃省','6212','陇南市','621224','康县','','','','',3,1,''),('621225','6212','00,62,6212','西和县','62','甘肃省','6212','陇南市','621225','西和县','','','','',3,1,''),('621226','6212','00,62,6212','礼县','62','甘肃省','6212','陇南市','621226','礼县','','','','',3,1,''),('621227','6212','00,62,6212','徽县','62','甘肃省','6212','陇南市','621227','徽县','','','','',3,1,''),('621228','6212','00,62,6212','两当县','62','甘肃省','6212','陇南市','621228','两当县','','','','',3,1,''),('6229','62','00,62','临夏回族自治州','62','甘肃省','6229','临夏回族自治州','','','','','','',2,1,''),('622901','6229','00,62,6229','临夏市','62','甘肃省','6229','临夏回族自治州','622901','临夏市','','','','',3,1,''),('622921','6229','00,62,6229','临夏县','62','甘肃省','6229','临夏回族自治州','622921','临夏县','','','','',3,1,''),('622922','6229','00,62,6229','康乐县','62','甘肃省','6229','临夏回族自治州','622922','康乐县','','','','',3,1,''),('622923','6229','00,62,6229','永靖县','62','甘肃省','6229','临夏回族自治州','622923','永靖县','','','','',3,1,''),('622924','6229','00,62,6229','广河县','62','甘肃省','6229','临夏回族自治州','622924','广河县','','','','',3,1,''),('622925','6229','00,62,6229','和政县','62','甘肃省','6229','临夏回族自治州','622925','和政县','','','','',3,1,''),('622926','6229','00,62,6229','东乡族自治县','62','甘肃省','6229','临夏回族自治州','622926','东乡族自治县','','','','',3,1,''),('622927','6229','00,62,6229','积石山保安族东乡族撒拉族自治县','62','甘肃省','6229','临夏回族自治州','622927','积石山保安族东乡族撒拉族自治县','','','','',3,1,''),('6230','62','00,62','甘南藏族自治州','62','甘肃省','6230','甘南藏族自治州','','','','','','',2,1,''),('623001','6230','00,62,6230','合作市','62','甘肃省','6230','甘南藏族自治州','623001','合作市','','','','',3,1,''),('623021','6230','00,62,6230','临潭县','62','甘肃省','6230','甘南藏族自治州','623021','临潭县','','','','',3,1,''),('623022','6230','00,62,6230','卓尼县','62','甘肃省','6230','甘南藏族自治州','623022','卓尼县','','','','',3,1,''),('623023','6230','00,62,6230','舟曲县','62','甘肃省','6230','甘南藏族自治州','623023','舟曲县','','','','',3,1,''),('623024','6230','00,62,6230','迭部县','62','甘肃省','6230','甘南藏族自治州','623024','迭部县','','','','',3,1,''),('623025','6230','00,62,6230','玛曲县','62','甘肃省','6230','甘南藏族自治州','623025','玛曲县','','','','',3,1,''),('623026','6230','00,62,6230','碌曲县','62','甘肃省','6230','甘南藏族自治州','623026','碌曲县','','','','',3,1,''),('623027','6230','00,62,6230','夏河县','62','甘肃省','6230','甘南藏族自治州','623027','夏河县','','','','',3,1,''),('63','00','00','青海省','63','青海省','','','','','','','','',1,1,''),('6301','63','00,63','西宁市','63','青海省','6301','西宁市','','','','','','',2,1,''),('630102','6301','00,63,6301','城东区','63','青海省','6301','西宁市','630102','城东区','','','','',3,1,''),('630103','6301','00,63,6301','城中区','63','青海省','6301','西宁市','630103','城中区','','','','',3,1,''),('630104','6301','00,63,6301','城西区','63','青海省','6301','西宁市','630104','城西区','','','','',3,1,''),('630105','6301','00,63,6301','城北区','63','青海省','6301','西宁市','630105','城北区','','','','',3,1,''),('630106','6301','00,63,6301','湟中区','63','青海省','6301','西宁市','630106','湟中区','','','','',3,1,''),('630121','6301','00,63,6301','大通回族土族自治县','63','青海省','6301','西宁市','630121','大通回族土族自治县','','','','',3,1,''),('630123','6301','00,63,6301','湟源县','63','青海省','6301','西宁市','630123','湟源县','','','','',3,1,''),('6302','63','00,63','海东市','63','青海省','6302','海东市','','','','','','',2,1,''),('630202','6302','00,63,6302','乐都区','63','青海省','6302','海东市','630202','乐都区','','','','',3,1,''),('630203','6302','00,63,6302','平安区','63','青海省','6302','海东市','630203','平安区','','','','',3,1,''),('630222','6302','00,63,6302','民和回族土族自治县','63','青海省','6302','海东市','630222','民和回族土族自治县','','','','',3,1,''),('630223','6302','00,63,6302','互助土族自治县','63','青海省','6302','海东市','630223','互助土族自治县','','','','',3,1,''),('630224','6302','00,63,6302','化隆回族自治县','63','青海省','6302','海东市','630224','化隆回族自治县','','','','',3,1,''),('630225','6302','00,63,6302','循化撒拉族自治县','63','青海省','6302','海东市','630225','循化撒拉族自治县','','','','',3,1,''),('6322','63','00,63','海北藏族自治州','63','青海省','6322','海北藏族自治州','','','','','','',2,1,''),('632221','6322','00,63,6322','门源回族自治县','63','青海省','6322','海北藏族自治州','632221','门源回族自治县','','','','',3,1,''),('632222','6322','00,63,6322','祁连县','63','青海省','6322','海北藏族自治州','632222','祁连县','','','','',3,1,''),('632223','6322','00,63,6322','海晏县','63','青海省','6322','海北藏族自治州','632223','海晏县','','','','',3,1,''),('632224','6322','00,63,6322','刚察县','63','青海省','6322','海北藏族自治州','632224','刚察县','','','','',3,1,''),('6323','63','00,63','黄南藏族自治州','63','青海省','6323','黄南藏族自治州','','','','','','',2,1,''),('632321','6323','00,63,6323','同仁县','63','青海省','6323','黄南藏族自治州','632321','同仁县','','','','',3,1,''),('632322','6323','00,63,6323','尖扎县','63','青海省','6323','黄南藏族自治州','632322','尖扎县','','','','',3,1,''),('632323','6323','00,63,6323','泽库县','63','青海省','6323','黄南藏族自治州','632323','泽库县','','','','',3,1,''),('632324','6323','00,63,6323','河南蒙古族自治县','63','青海省','6323','黄南藏族自治州','632324','河南蒙古族自治县','','','','',3,1,''),('6325','63','00,63','海南藏族自治州','63','青海省','6325','海南藏族自治州','','','','','','',2,1,''),('632521','6325','00,63,6325','共和县','63','青海省','6325','海南藏族自治州','632521','共和县','','','','',3,1,''),('632522','6325','00,63,6325','同德县','63','青海省','6325','海南藏族自治州','632522','同德县','','','','',3,1,''),('632523','6325','00,63,6325','贵德县','63','青海省','6325','海南藏族自治州','632523','贵德县','','','','',3,1,''),('632524','6325','00,63,6325','兴海县','63','青海省','6325','海南藏族自治州','632524','兴海县','','','','',3,1,''),('632525','6325','00,63,6325','贵南县','63','青海省','6325','海南藏族自治州','632525','贵南县','','','','',3,1,''),('6326','63','00,63','果洛藏族自治州','63','青海省','6326','果洛藏族自治州','','','','','','',2,1,''),('632621','6326','00,63,6326','玛沁县','63','青海省','6326','果洛藏族自治州','632621','玛沁县','','','','',3,1,''),('632622','6326','00,63,6326','班玛县','63','青海省','6326','果洛藏族自治州','632622','班玛县','','','','',3,1,''),('632623','6326','00,63,6326','甘德县','63','青海省','6326','果洛藏族自治州','632623','甘德县','','','','',3,1,''),('632624','6326','00,63,6326','达日县','63','青海省','6326','果洛藏族自治州','632624','达日县','','','','',3,1,''),('632625','6326','00,63,6326','久治县','63','青海省','6326','果洛藏族自治州','632625','久治县','','','','',3,1,''),('632626','6326','00,63,6326','玛多县','63','青海省','6326','果洛藏族自治州','632626','玛多县','','','','',3,1,''),('6327','63','00,63','玉树藏族自治州','63','青海省','6327','玉树藏族自治州','','','','','','',2,1,''),('632701','6327','00,63,6327','玉树市','63','青海省','6327','玉树藏族自治州','632701','玉树市','','','','',3,1,''),('632722','6327','00,63,6327','杂多县','63','青海省','6327','玉树藏族自治州','632722','杂多县','','','','',3,1,''),('632723','6327','00,63,6327','称多县','63','青海省','6327','玉树藏族自治州','632723','称多县','','','','',3,1,''),('632724','6327','00,63,6327','治多县','63','青海省','6327','玉树藏族自治州','632724','治多县','','','','',3,1,''),('632725','6327','00,63,6327','囊谦县','63','青海省','6327','玉树藏族自治州','632725','囊谦县','','','','',3,1,''),('632726','6327','00,63,6327','曲麻莱县','63','青海省','6327','玉树藏族自治州','632726','曲麻莱县','','','','',3,1,''),('6328','63','00,63','海西蒙古族藏族自治州','63','青海省','6328','海西蒙古族藏族自治州','','','','','','',2,1,''),('632801','6328','00,63,6328','格尔木市','63','青海省','6328','海西蒙古族藏族自治州','632801','格尔木市','','','','',3,1,''),('632802','6328','00,63,6328','德令哈市','63','青海省','6328','海西蒙古族藏族自治州','632802','德令哈市','','','','',3,1,''),('632803','6328','00,63,6328','茫崖市','63','青海省','6328','海西蒙古族藏族自治州','632803','茫崖市','','','','',3,1,''),('632821','6328','00,63,6328','乌兰县','63','青海省','6328','海西蒙古族藏族自治州','632821','乌兰县','','','','',3,1,''),('632822','6328','00,63,6328','都兰县','63','青海省','6328','海西蒙古族藏族自治州','632822','都兰县','','','','',3,1,''),('632823','6328','00,63,6328','天峻县','63','青海省','6328','海西蒙古族藏族自治州','632823','天峻县','','','','',3,1,''),('64','00','00','宁夏回族自治区','64','宁夏回族自治区','','','','','','','','',1,1,''),('6401','64','00,64','银川市','64','宁夏回族自治区','6401','银川市','','','','','','',2,1,''),('640104','6401','00,64,6401','兴庆区','64','宁夏回族自治区','6401','银川市','640104','兴庆区','','','','',3,1,''),('640105','6401','00,64,6401','西夏区','64','宁夏回族自治区','6401','银川市','640105','西夏区','','','','',3,1,''),('640106','6401','00,64,6401','金凤区','64','宁夏回族自治区','6401','银川市','640106','金凤区','','','','',3,1,''),('640121','6401','00,64,6401','永宁县','64','宁夏回族自治区','6401','银川市','640121','永宁县','','','','',3,1,''),('640122','6401','00,64,6401','贺兰县','64','宁夏回族自治区','6401','银川市','640122','贺兰县','','','','',3,1,''),('640181','6401','00,64,6401','灵武市','64','宁夏回族自治区','6401','银川市','640181','灵武市','','','','',3,1,''),('6402','64','00,64','石嘴山市','64','宁夏回族自治区','6402','石嘴山市','','','','','','',2,1,''),('640202','6402','00,64,6402','大武口区','64','宁夏回族自治区','6402','石嘴山市','640202','大武口区','','','','',3,1,''),('640205','6402','00,64,6402','惠农区','64','宁夏回族自治区','6402','石嘴山市','640205','惠农区','','','','',3,1,''),('640221','6402','00,64,6402','平罗县','64','宁夏回族自治区','6402','石嘴山市','640221','平罗县','','','','',3,1,''),('6403','64','00,64','吴忠市','64','宁夏回族自治区','6403','吴忠市','','','','','','',2,1,''),('640302','6403','00,64,6403','利通区','64','宁夏回族自治区','6403','吴忠市','640302','利通区','','','','',3,1,''),('640303','6403','00,64,6403','红寺堡区','64','宁夏回族自治区','6403','吴忠市','640303','红寺堡区','','','','',3,1,''),('640323','6403','00,64,6403','盐池县','64','宁夏回族自治区','6403','吴忠市','640323','盐池县','','','','',3,1,''),('640324','6403','00,64,6403','同心县','64','宁夏回族自治区','6403','吴忠市','640324','同心县','','','','',3,1,''),('640381','6403','00,64,6403','青铜峡市','64','宁夏回族自治区','6403','吴忠市','640381','青铜峡市','','','','',3,1,''),('6404','64','00,64','固原市','64','宁夏回族自治区','6404','固原市','','','','','','',2,1,''),('640402','6404','00,64,6404','原州区','64','宁夏回族自治区','6404','固原市','640402','原州区','','','','',3,1,''),('640422','6404','00,64,6404','西吉县','64','宁夏回族自治区','6404','固原市','640422','西吉县','','','','',3,1,''),('640423','6404','00,64,6404','隆德县','64','宁夏回族自治区','6404','固原市','640423','隆德县','','','','',3,1,''),('640424','6404','00,64,6404','泾源县','64','宁夏回族自治区','6404','固原市','640424','泾源县','','','','',3,1,''),('640425','6404','00,64,6404','彭阳县','64','宁夏回族自治区','6404','固原市','640425','彭阳县','','','','',3,1,''),('6405','64','00,64','中卫市','64','宁夏回族自治区','6405','中卫市','','','','','','',2,1,''),('640502','6405','00,64,6405','沙坡头区','64','宁夏回族自治区','6405','中卫市','640502','沙坡头区','','','','',3,1,''),('640521','6405','00,64,6405','中宁县','64','宁夏回族自治区','6405','中卫市','640521','中宁县','','','','',3,1,''),('640522','6405','00,64,6405','海原县','64','宁夏回族自治区','6405','中卫市','640522','海原县','','','','',3,1,''),('65','00','00','新疆维吾尔自治区','65','新疆维吾尔自治区','','','','','','','','',1,1,''),('6501','65','00,65','乌鲁木齐市','65','新疆维吾尔自治区','6501','乌鲁木齐市','','','','','','',2,1,''),('650102','6501','00,65,6501','天山区','65','新疆维吾尔自治区','6501','乌鲁木齐市','650102','天山区','','','','',3,1,''),('650103','6501','00,65,6501','沙依巴克区','65','新疆维吾尔自治区','6501','乌鲁木齐市','650103','沙依巴克区','','','','',3,1,''),('650104','6501','00,65,6501','新市区','65','新疆维吾尔自治区','6501','乌鲁木齐市','650104','新市区','','','','',3,1,''),('650105','6501','00,65,6501','水磨沟区','65','新疆维吾尔自治区','6501','乌鲁木齐市','650105','水磨沟区','','','','',3,1,''),('650106','6501','00,65,6501','头屯河区','65','新疆维吾尔自治区','6501','乌鲁木齐市','650106','头屯河区','','','','',3,1,''),('650107','6501','00,65,6501','达坂城区','65','新疆维吾尔自治区','6501','乌鲁木齐市','650107','达坂城区','','','','',3,1,''),('650109','6501','00,65,6501','米东区','65','新疆维吾尔自治区','6501','乌鲁木齐市','650109','米东区','','','','',3,1,''),('650121','6501','00,65,6501','乌鲁木齐县','65','新疆维吾尔自治区','6501','乌鲁木齐市','650121','乌鲁木齐县','','','','',3,1,''),('6502','65','00,65','克拉玛依市','65','新疆维吾尔自治区','6502','克拉玛依市','','','','','','',2,1,''),('650202','6502','00,65,6502','独山子区','65','新疆维吾尔自治区','6502','克拉玛依市','650202','独山子区','','','','',3,1,''),('650203','6502','00,65,6502','克拉玛依区','65','新疆维吾尔自治区','6502','克拉玛依市','650203','克拉玛依区','','','','',3,1,''),('650204','6502','00,65,6502','白碱滩区','65','新疆维吾尔自治区','6502','克拉玛依市','650204','白碱滩区','','','','',3,1,''),('650205','6502','00,65,6502','乌尔禾区','65','新疆维吾尔自治区','6502','克拉玛依市','650205','乌尔禾区','','','','',3,1,''),('6504','65','00,65','吐鲁番市','65','新疆维吾尔自治区','6504','吐鲁番市','','','','','','',2,1,''),('650402','6504','00,65,6504','高昌区','65','新疆维吾尔自治区','6504','吐鲁番市','650402','高昌区','','','','',3,1,''),('650421','6504','00,65,6504','鄯善县','65','新疆维吾尔自治区','6504','吐鲁番市','650421','鄯善县','','','','',3,1,''),('650422','6504','00,65,6504','托克逊县','65','新疆维吾尔自治区','6504','吐鲁番市','650422','托克逊县','','','','',3,1,''),('6505','65','00,65','哈密市','65','新疆维吾尔自治区','6505','哈密市','','','','','','',2,1,''),('650502','6505','00,65,6505','伊州区','65','新疆维吾尔自治区','6505','哈密市','650502','伊州区','','','','',3,1,''),('650521','6505','00,65,6505','巴里坤哈萨克自治县','65','新疆维吾尔自治区','6505','哈密市','650521','巴里坤哈萨克自治县','','','','',3,1,''),('650522','6505','00,65,6505','伊吾县','65','新疆维吾尔自治区','6505','哈密市','650522','伊吾县','','','','',3,1,''),('6523','65','00,65','昌吉回族自治州','65','新疆维吾尔自治区','6523','昌吉回族自治州','','','','','','',2,1,''),('652301','6523','00,65,6523','昌吉市','65','新疆维吾尔自治区','6523','昌吉回族自治州','652301','昌吉市','','','','',3,1,''),('652302','6523','00,65,6523','阜康市','65','新疆维吾尔自治区','6523','昌吉回族自治州','652302','阜康市','','','','',3,1,''),('652323','6523','00,65,6523','呼图壁县','65','新疆维吾尔自治区','6523','昌吉回族自治州','652323','呼图壁县','','','','',3,1,''),('652324','6523','00,65,6523','玛纳斯县','65','新疆维吾尔自治区','6523','昌吉回族自治州','652324','玛纳斯县','','','','',3,1,''),('652325','6523','00,65,6523','奇台县','65','新疆维吾尔自治区','6523','昌吉回族自治州','652325','奇台县','','','','',3,1,''),('652327','6523','00,65,6523','吉木萨尔县','65','新疆维吾尔自治区','6523','昌吉回族自治州','652327','吉木萨尔县','','','','',3,1,''),('652328','6523','00,65,6523','木垒哈萨克自治县','65','新疆维吾尔自治区','6523','昌吉回族自治州','652328','木垒哈萨克自治县','','','','',3,1,''),('6527','65','00,65','博尔塔拉蒙古自治州','65','新疆维吾尔自治区','6527','博尔塔拉蒙古自治州','','','','','','',2,1,''),('652701','6527','00,65,6527','博乐市','65','新疆维吾尔自治区','6527','博尔塔拉蒙古自治州','652701','博乐市','','','','',3,1,''),('652702','6527','00,65,6527','阿拉山口市','65','新疆维吾尔自治区','6527','博尔塔拉蒙古自治州','652702','阿拉山口市','','','','',3,1,''),('652722','6527','00,65,6527','精河县','65','新疆维吾尔自治区','6527','博尔塔拉蒙古自治州','652722','精河县','','','','',3,1,''),('652723','6527','00,65,6527','温泉县','65','新疆维吾尔自治区','6527','博尔塔拉蒙古自治州','652723','温泉县','','','','',3,1,''),('6528','65','00,65','巴音郭楞蒙古自治州','65','新疆维吾尔自治区','6528','巴音郭楞蒙古自治州','','','','','','',2,1,''),('652801','6528','00,65,6528','库尔勒市','65','新疆维吾尔自治区','6528','巴音郭楞蒙古自治州','652801','库尔勒市','','','','',3,1,''),('652822','6528','00,65,6528','轮台县','65','新疆维吾尔自治区','6528','巴音郭楞蒙古自治州','652822','轮台县','','','','',3,1,''),('652823','6528','00,65,6528','尉犁县','65','新疆维吾尔自治区','6528','巴音郭楞蒙古自治州','652823','尉犁县','','','','',3,1,''),('652824','6528','00,65,6528','若羌县','65','新疆维吾尔自治区','6528','巴音郭楞蒙古自治州','652824','若羌县','','','','',3,1,''),('652825','6528','00,65,6528','且末县','65','新疆维吾尔自治区','6528','巴音郭楞蒙古自治州','652825','且末县','','','','',3,1,''),('652826','6528','00,65,6528','焉耆回族自治县','65','新疆维吾尔自治区','6528','巴音郭楞蒙古自治州','652826','焉耆回族自治县','','','','',3,1,''),('652827','6528','00,65,6528','和静县','65','新疆维吾尔自治区','6528','巴音郭楞蒙古自治州','652827','和静县','','','','',3,1,''),('652828','6528','00,65,6528','和硕县','65','新疆维吾尔自治区','6528','巴音郭楞蒙古自治州','652828','和硕县','','','','',3,1,''),('652829','6528','00,65,6528','博湖县','65','新疆维吾尔自治区','6528','巴音郭楞蒙古自治州','652829','博湖县','','','','',3,1,''),('6529','65','00,65','阿克苏地区','65','新疆维吾尔自治区','6529','阿克苏地区','','','','','','',2,1,''),('652901','6529','00,65,6529','阿克苏市','65','新疆维吾尔自治区','6529','阿克苏地区','652901','阿克苏市','','','','',3,1,''),('652902','6529','00,65,6529','库车市','65','新疆维吾尔自治区','6529','阿克苏地区','652902','库车市','','','','',3,1,''),('652922','6529','00,65,6529','温宿县','65','新疆维吾尔自治区','6529','阿克苏地区','652922','温宿县','','','','',3,1,''),('652924','6529','00,65,6529','沙雅县','65','新疆维吾尔自治区','6529','阿克苏地区','652924','沙雅县','','','','',3,1,''),('652925','6529','00,65,6529','新和县','65','新疆维吾尔自治区','6529','阿克苏地区','652925','新和县','','','','',3,1,''),('652926','6529','00,65,6529','拜城县','65','新疆维吾尔自治区','6529','阿克苏地区','652926','拜城县','','','','',3,1,''),('652927','6529','00,65,6529','乌什县','65','新疆维吾尔自治区','6529','阿克苏地区','652927','乌什县','','','','',3,1,''),('652928','6529','00,65,6529','阿瓦提县','65','新疆维吾尔自治区','6529','阿克苏地区','652928','阿瓦提县','','','','',3,1,''),('652929','6529','00,65,6529','柯坪县','65','新疆维吾尔自治区','6529','阿克苏地区','652929','柯坪县','','','','',3,1,''),('6530','65','00,65','克孜勒苏柯尔克孜自治州','65','新疆维吾尔自治区','6530','克孜勒苏柯尔克孜自治州','','','','','','',2,1,''),('653001','6530','00,65,6530','阿图什市','65','新疆维吾尔自治区','6530','克孜勒苏柯尔克孜自治州','653001','阿图什市','','','','',3,1,''),('653022','6530','00,65,6530','阿克陶县','65','新疆维吾尔自治区','6530','克孜勒苏柯尔克孜自治州','653022','阿克陶县','','','','',3,1,''),('653023','6530','00,65,6530','阿合奇县','65','新疆维吾尔自治区','6530','克孜勒苏柯尔克孜自治州','653023','阿合奇县','','','','',3,1,''),('653024','6530','00,65,6530','乌恰县','65','新疆维吾尔自治区','6530','克孜勒苏柯尔克孜自治州','653024','乌恰县','','','','',3,1,''),('6531','65','00,65','喀什地区','65','新疆维吾尔自治区','6531','喀什地区','','','','','','',2,1,''),('653101','6531','00,65,6531','喀什市','65','新疆维吾尔自治区','6531','喀什地区','653101','喀什市','','','','',3,1,''),('653121','6531','00,65,6531','疏附县','65','新疆维吾尔自治区','6531','喀什地区','653121','疏附县','','','','',3,1,''),('653122','6531','00,65,6531','疏勒县','65','新疆维吾尔自治区','6531','喀什地区','653122','疏勒县','','','','',3,1,''),('653123','6531','00,65,6531','英吉沙县','65','新疆维吾尔自治区','6531','喀什地区','653123','英吉沙县','','','','',3,1,''),('653124','6531','00,65,6531','泽普县','65','新疆维吾尔自治区','6531','喀什地区','653124','泽普县','','','','',3,1,''),('653125','6531','00,65,6531','莎车县','65','新疆维吾尔自治区','6531','喀什地区','653125','莎车县','','','','',3,1,''),('653126','6531','00,65,6531','叶城县','65','新疆维吾尔自治区','6531','喀什地区','653126','叶城县','','','','',3,1,''),('653127','6531','00,65,6531','麦盖提县','65','新疆维吾尔自治区','6531','喀什地区','653127','麦盖提县','','','','',3,1,''),('653128','6531','00,65,6531','岳普湖县','65','新疆维吾尔自治区','6531','喀什地区','653128','岳普湖县','','','','',3,1,''),('653129','6531','00,65,6531','伽师县','65','新疆维吾尔自治区','6531','喀什地区','653129','伽师县','','','','',3,1,''),('653130','6531','00,65,6531','巴楚县','65','新疆维吾尔自治区','6531','喀什地区','653130','巴楚县','','','','',3,1,''),('653131','6531','00,65,6531','塔什库尔干塔吉克自治县','65','新疆维吾尔自治区','6531','喀什地区','653131','塔什库尔干塔吉克自治县','','','','',3,1,''),('6532','65','00,65','和田地区','65','新疆维吾尔自治区','6532','和田地区','','','','','','',2,1,''),('653201','6532','00,65,6532','和田市','65','新疆维吾尔自治区','6532','和田地区','653201','和田市','','','','',3,1,''),('653221','6532','00,65,6532','和田县','65','新疆维吾尔自治区','6532','和田地区','653221','和田县','','','','',3,1,''),('653222','6532','00,65,6532','墨玉县','65','新疆维吾尔自治区','6532','和田地区','653222','墨玉县','','','','',3,1,''),('653223','6532','00,65,6532','皮山县','65','新疆维吾尔自治区','6532','和田地区','653223','皮山县','','','','',3,1,''),('653224','6532','00,65,6532','洛浦县','65','新疆维吾尔自治区','6532','和田地区','653224','洛浦县','','','','',3,1,''),('653225','6532','00,65,6532','策勒县','65','新疆维吾尔自治区','6532','和田地区','653225','策勒县','','','','',3,1,''),('653226','6532','00,65,6532','于田县','65','新疆维吾尔自治区','6532','和田地区','653226','于田县','','','','',3,1,''),('653227','6532','00,65,6532','民丰县','65','新疆维吾尔自治区','6532','和田地区','653227','民丰县','','','','',3,1,''),('6540','65','00,65','伊犁哈萨克自治州','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','','','','','','',2,1,''),('654002','6540','00,65,6540','伊宁市','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654002','伊宁市','','','','',3,1,''),('654003','6540','00,65,6540','奎屯市','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654003','奎屯市','','','','',3,1,''),('654004','6540','00,65,6540','霍尔果斯市','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654004','霍尔果斯市','','','','',3,1,''),('654021','6540','00,65,6540','伊宁县','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654021','伊宁县','','','','',3,1,''),('654022','6540','00,65,6540','察布查尔锡伯自治县','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654022','察布查尔锡伯自治县','','','','',3,1,''),('654023','6540','00,65,6540','霍城县','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654023','霍城县','','','','',3,1,''),('654024','6540','00,65,6540','巩留县','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654024','巩留县','','','','',3,1,''),('654025','6540','00,65,6540','新源县','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654025','新源县','','','','',3,1,''),('654026','6540','00,65,6540','昭苏县','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654026','昭苏县','','','','',3,1,''),('654027','6540','00,65,6540','特克斯县','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654027','特克斯县','','','','',3,1,''),('654028','6540','00,65,6540','尼勒克县','65','新疆维吾尔自治区','6540','伊犁哈萨克自治州','654028','尼勒克县','','','','',3,1,''),('6542','65','00,65','塔城地区','65','新疆维吾尔自治区','6542','塔城地区','','','','','','',2,1,''),('654201','6542','00,65,6542','塔城市','65','新疆维吾尔自治区','6542','塔城地区','654201','塔城市','','','','',3,1,''),('654202','6542','00,65,6542','乌苏市','65','新疆维吾尔自治区','6542','塔城地区','654202','乌苏市','','','','',3,1,''),('654221','6542','00,65,6542','额敏县','65','新疆维吾尔自治区','6542','塔城地区','654221','额敏县','','','','',3,1,''),('654223','6542','00,65,6542','沙湾县','65','新疆维吾尔自治区','6542','塔城地区','654223','沙湾县','','','','',3,1,''),('654224','6542','00,65,6542','托里县','65','新疆维吾尔自治区','6542','塔城地区','654224','托里县','','','','',3,1,''),('654225','6542','00,65,6542','裕民县','65','新疆维吾尔自治区','6542','塔城地区','654225','裕民县','','','','',3,1,''),('654226','6542','00,65,6542','和布克赛尔蒙古自治县','65','新疆维吾尔自治区','6542','塔城地区','654226','和布克赛尔蒙古自治县','','','','',3,1,''),('6543','65','00,65','阿勒泰地区','65','新疆维吾尔自治区','6543','阿勒泰地区','','','','','','',2,1,''),('654301','6543','00,65,6543','阿勒泰市','65','新疆维吾尔自治区','6543','阿勒泰地区','654301','阿勒泰市','','','','',3,1,''),('654321','6543','00,65,6543','布尔津县','65','新疆维吾尔自治区','6543','阿勒泰地区','654321','布尔津县','','','','',3,1,''),('654322','6543','00,65,6543','富蕴县','65','新疆维吾尔自治区','6543','阿勒泰地区','654322','富蕴县','','','','',3,1,''),('654323','6543','00,65,6543','福海县','65','新疆维吾尔自治区','6543','阿勒泰地区','654323','福海县','','','','',3,1,''),('654324','6543','00,65,6543','哈巴河县','65','新疆维吾尔自治区','6543','阿勒泰地区','654324','哈巴河县','','','','',3,1,''),('654325','6543','00,65,6543','青河县','65','新疆维吾尔自治区','6543','阿勒泰地区','654325','青河县','','','','',3,1,''),('654326','6543','00,65,6543','吉木乃县','65','新疆维吾尔自治区','6543','阿勒泰地区','654326','吉木乃县','','','','',3,1,''),('6590','65','00,65','自治区直辖县级行政区','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','','','','','','',2,1,''),('659001','6590','00,65,6590','石河子市','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','659001','石河子市','','','','',3,1,''),('659002','6590','00,65,6590','阿拉尔市','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','659002','阿拉尔市','','','','',3,1,''),('659003','6590','00,65,6590','图木舒克市','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','659003','图木舒克市','','','','',3,1,''),('659004','6590','00,65,6590','五家渠市','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','659004','五家渠市','','','','',3,1,''),('659005','6590','00,65,6590','北屯市','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','659005','北屯市','','','','',3,1,''),('659006','6590','00,65,6590','铁门关市','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','659006','铁门关市','','','','',3,1,''),('659007','6590','00,65,6590','双河市','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','659007','双河市','','','','',3,1,''),('659008','6590','00,65,6590','可克达拉市','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','659008','可克达拉市','','','','',3,1,''),('659009','6590','00,65,6590','昆玉市','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','659009','昆玉市','','','','',3,1,''),('659010','6590','00,65,6590','胡杨河市','65','新疆维吾尔自治区','6590','自治区直辖县级行政区','659010','胡杨河市','','','','',3,1,''),('71','00','00','台湾省','71','台湾省','','','','','','','','',1,1,''),('81','00','00','香港特别行政区','81','香港特别行政区','','','','','','','','',1,1,''),('82','00','00','澳门特别行政区','82','澳门特别行政区','','','','','','','','',1,1,'');
/*!40000 ALTER TABLE `blade_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_report_file`
--

DROP TABLE IF EXISTS `blade_report_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_report_file` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '文件名',
  `content` mediumblob COMMENT '文件内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='报表文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_report_file`
--

LOCK TABLES `blade_report_file` WRITE;
/*!40000 ALTER TABLE `blade_report_file` DISABLE KEYS */;
INSERT INTO `blade_report_file` VALUES (1291947054502789121,'notice.ureport.xml','<?xml version=\"1.0\" encoding=\"UTF-8\"?><ureport><cell expand=\"Down\" name=\"A1\" row=\"1\" col=\"1\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"><left-border width=\"1\" style=\"solid\" color=\"0,0,0\"/><right-border width=\"1\" style=\"solid\" color=\"0,0,0\"/><top-border width=\"1\" style=\"solid\" color=\"0,0,0\"/><bottom-border width=\"1\" style=\"solid\" color=\"0,0,0\"/></cell-style><dataset-value dataset-name=\"notice\" aggregate=\"group\" property=\"tenant_id\" order=\"none\" mapping-type=\"simple\"></dataset-value></cell><cell expand=\"Down\" name=\"B1\" row=\"1\" col=\"2\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"><left-border width=\"1\" style=\"solid\" color=\"0,0,0\"/><right-border width=\"1\" style=\"solid\" color=\"0,0,0\"/><top-border width=\"1\" style=\"solid\" color=\"0,0,0\"/><bottom-border width=\"1\" style=\"solid\" color=\"0,0,0\"/></cell-style><dataset-value dataset-name=\"notice\" aggregate=\"group\" property=\"title\" order=\"none\" mapping-type=\"simple\"></dataset-value></cell><cell expand=\"Down\" name=\"C1\" row=\"1\" col=\"3\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"><left-border width=\"1\" style=\"solid\" color=\"0,0,0\"/><right-border width=\"1\" style=\"solid\" color=\"0,0,0\"/><top-border width=\"1\" style=\"solid\" color=\"0,0,0\"/><bottom-border width=\"1\" style=\"solid\" color=\"0,0,0\"/></cell-style><dataset-value dataset-name=\"notice\" aggregate=\"group\" property=\"release_time\" order=\"none\" mapping-type=\"simple\"></dataset-value></cell><cell expand=\"None\" name=\"D1\" row=\"1\" col=\"4\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"></cell-style><simple-value><![CDATA[]]></simple-value></cell><cell expand=\"None\" name=\"A2\" row=\"2\" col=\"1\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"></cell-style><simple-value><![CDATA[]]></simple-value></cell><cell expand=\"None\" name=\"B2\" row=\"2\" col=\"2\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"></cell-style><simple-value><![CDATA[]]></simple-value></cell><cell expand=\"None\" name=\"C2\" row=\"2\" col=\"3\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"></cell-style><simple-value><![CDATA[]]></simple-value></cell><cell expand=\"None\" name=\"D2\" row=\"2\" col=\"4\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"></cell-style><simple-value><![CDATA[]]></simple-value></cell><cell expand=\"None\" name=\"A3\" row=\"3\" col=\"1\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"></cell-style><simple-value><![CDATA[]]></simple-value></cell><cell expand=\"None\" name=\"B3\" row=\"3\" col=\"2\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"></cell-style><simple-value><![CDATA[]]></simple-value></cell><cell expand=\"None\" name=\"C3\" row=\"3\" col=\"3\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"></cell-style><simple-value><![CDATA[]]></simple-value></cell><cell expand=\"None\" name=\"D3\" row=\"3\" col=\"4\"><cell-style font-size=\"10\" align=\"center\" valign=\"middle\"></cell-style><simple-value><![CDATA[]]></simple-value></cell><row row-number=\"1\" height=\"18\"/><row row-number=\"2\" height=\"18\"/><row row-number=\"3\" height=\"18\"/><column col-number=\"1\" width=\"80\"/><column col-number=\"2\" width=\"80\"/><column col-number=\"3\" width=\"131\"/><column col-number=\"4\" width=\"80\"/><datasource name=\"ReportDataSource\" type=\"buildin\"><dataset name=\"notice\" type=\"sql\"><sql><![CDATA[select * from blade_notice]]></sql><field name=\"id\"/><field name=\"tenant_id\"/><field name=\"title\"/><field name=\"category\"/><field name=\"release_time\"/><field name=\"content\"/><field name=\"create_user\"/><field name=\"create_dept\"/><field name=\"create_time\"/><field name=\"update_user\"/><field name=\"update_time\"/><field name=\"status\"/><field name=\"is_deleted\"/></dataset></datasource><paper type=\"A4\" left-margin=\"90\" right-margin=\"90\"\n    top-margin=\"72\" bottom-margin=\"72\" paging-mode=\"fitpage\" fixrows=\"0\"\n    width=\"595\" height=\"842\" orientation=\"portrait\" html-report-align=\"left\" bg-image=\"\" html-interval-refresh-value=\"0\" column-enabled=\"false\"></paper></ureport>','2020-08-08 11:59:16','2020-08-08 13:05:02',0);
/*!40000 ALTER TABLE `blade_report_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_role`
--

DROP TABLE IF EXISTS `blade_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_role` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `role_alias` varchar(255) DEFAULT NULL COMMENT '角色别名',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_role`
--

LOCK TABLES `blade_role` WRITE;
/*!40000 ALTER TABLE `blade_role` DISABLE KEYS */;
INSERT INTO `blade_role` VALUES (1123598816738675201,'000000',0,'超级管理员',1,'administrator',0),(1123598816738675202,'000000',0,'用户',2,'user',0),(1123598816738675203,'000000',1123598816738675202,'人事',1,'hr',0),(1123598816738675204,'000000',1123598816738675202,'经理',2,'manager',0),(1123598816738675205,'000000',1123598816738675202,'老板',3,'boss',0);
/*!40000 ALTER TABLE `blade_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_role_menu`
--

DROP TABLE IF EXISTS `blade_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_role_menu` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `menu_id` bigint(64) DEFAULT NULL COMMENT '菜单id',
  `role_id` bigint(64) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_role_menu`
--

LOCK TABLES `blade_role_menu` WRITE;
/*!40000 ALTER TABLE `blade_role_menu` DISABLE KEYS */;
INSERT INTO `blade_role_menu` VALUES (1402096027708182530,1123598815738675201,1123598816738675201),(1402096027716571137,1123598815738675202,1123598816738675201),(1402096027716571138,1123598815738675219,1123598816738675201),(1402096027720765442,1123598815738675220,1123598816738675201),(1402096027720765443,1123598815738675221,1123598816738675201),(1402096027720765444,1123598815738675222,1123598816738675201),(1402096027724959746,1123598815738675280,1123598816738675201),(1402096027724959747,1123598815738675281,1123598816738675201),(1402096027733348354,1123598815738675282,1123598816738675201),(1402096027737542658,1123598815738675283,1123598816738675201),(1402096027737542659,1123598815738675284,1123598816738675201),(1402096027737542660,1123598815738675285,1123598816738675201),(1402096027737542661,1123598815738675286,1123598816738675201),(1402096027737542662,1123598815738675287,1123598816738675201),(1402096027741736962,1123598815738675288,1123598816738675201),(1402096027741736963,1123598815738675289,1123598816738675201),(1402096027750125569,1123598815738675290,1123598816738675201),(1402096027750125570,1123598815738675291,1123598816738675201),(1402096027750125571,1123598815738675292,1123598816738675201),(1402096027754319874,1123598815738675293,1123598816738675201),(1402096027754319875,1123598815738675294,1123598816738675201),(1402096027754319876,1123598815738675295,1123598816738675201),(1402096027754319877,1123598815738675296,1123598816738675201),(1402096027754319878,1123598815738675297,1123598816738675201),(1402096027758514177,1123598815738675210,1123598816738675201),(1402096027758514178,1123598815738675211,1123598816738675201),(1402096027758514179,1123598815738675212,1123598816738675201),(1402096027758514180,1164733369658963251,1123598816738675201),(1402096027758514181,1164733369658963252,1123598816738675201),(1402096027758514182,1164733369658963253,1123598816738675201),(1402096027758514183,1164733369658963254,1123598816738675201),(1402096027762708482,1164733369658963255,1123598816738675201),(1402096027762708483,1123598815738675213,1123598816738675201),(1402096027762708484,1123598815738675214,1123598816738675201),(1402096027762708485,1123598815738675249,1123598816738675201),(1402096027762708486,1123598815738675215,1123598816738675201),(1402096027766902785,1123598815738675250,1123598816738675201),(1402096027766902786,1123598815738675216,1123598816738675201),(1402096027766902787,1123598815738675251,1123598816738675201),(1402096027766902788,1123598815738675217,1123598816738675201),(1402096027766902789,1123598815738675218,1123598816738675201),(1402096027766902790,1123598815738675252,1123598816738675201),(1402096027771097089,1123598815738675253,1123598816738675201),(1402096027771097090,1123598815738675254,1123598816738675201),(1402096027771097091,1123598815738675255,1123598816738675201),(1402096027771097092,1161272593873321991,1123598816738675201),(1402096027771097093,1161272593873321992,1123598816738675201),(1402096027771097094,1161272593873321993,1123598816738675201),(1402096027775291394,1161272593873321994,1123598816738675201),(1402096027775291395,1161272593873321995,1123598816738675201),(1402096027775291396,1164733121140551682,1123598816738675201),(1402096027775291397,1164733349637844993,1123598816738675201),(1402096027775291398,1164733399669962301,1123598816738675201),(1402096027775291399,1164733399669962302,1123598816738675201),(1402096027779485698,1164733399669962303,1123598816738675201),(1402096027779485699,1164733399669962304,1123598816738675201),(1402096027779485700,1123598815738675266,1123598816738675201),(1402096027779485701,1123598815738675267,1123598816738675201),(1402096027779485702,1123598815738675268,1123598816738675201),(1402096027779485703,1123598815738675269,1123598816738675201),(1402096027783680001,1123598815738675270,1123598816738675201),(1402096027783680002,1123598815738675271,1123598816738675201),(1402096027783680003,1123598815738675272,1123598816738675201),(1402096027783680004,1123598815738675273,1123598816738675201),(1402096027783680005,1123598815738675274,1123598816738675201),(1402096027783680006,1123598815738675275,1123598816738675201),(1402096027787874305,1123598815738675276,1123598816738675201),(1402096027787874306,1123598815738675277,1123598816738675201),(1402096027787874307,1123598815738675278,1123598816738675201),(1402096027787874308,1123598815738675279,1123598816738675201),(1402096027787874309,1123598815738675298,1123598816738675201),(1402096027787874310,1123598815738675299,1123598816738675201),(1402096027792068610,1123598815738675301,1123598816738675201),(1402096027792068611,1123598815738675302,1123598816738675201),(1402096027792068612,1123598815738675303,1123598816738675201),(1402096027792068613,1123598815738675304,1123598816738675201),(1402096027792068614,1123598815738675305,1123598816738675201),(1402096027796262914,1164733399669962201,1123598816738675201),(1402096027796262915,1164733399669962202,1123598816738675201),(1402096027796262916,1164733399669962203,1123598816738675201),(1402096027800457217,1164733399669962204,1123598816738675201),(1402096027804651521,1164733389658962251,1123598816738675201),(1402096027804651522,1164733389658962252,1123598816738675201),(1402096027804651523,1164733389658962253,1123598816738675201),(1402096027804651524,1164733389658962254,1123598816738675201),(1402096027808845826,1164733389658962255,1123598816738675201),(1402096027808845827,1164733389658962256,1123598816738675201),(1402096027808845828,1164733389658963251,1123598816738675201),(1402096027813040129,1164733399668962201,1123598816738675201),(1402096027813040130,1164733399668962202,1123598816738675201),(1402096027817234433,1164733399668962203,1123598816738675201),(1402096027817234434,1164733399668962204,1123598816738675201),(1402096027817234435,1164733399668962205,1123598816738675201),(1402096027817234436,1164733399668962206,1123598816738675201),(1402096027821428738,1164733399668962207,1123598816738675201),(1402096027821428739,1123598815738675307,1123598816738675201),(1402096027821428740,1123598815738675308,1123598816738675201),(1402096027821428741,1123598815738675241,1123598816738675201),(1402096027825623042,1123598815738675242,1123598816738675201),(1402096027825623043,1123598815738675243,1123598816738675201),(1402096027825623044,1123598815738675244,1123598816738675201),(1402096027825623045,1123598815738675309,1123598816738675201),(1402096027825623046,1123598815738675310,1123598816738675201),(1402096027829817346,1123598815738675311,1123598816738675201),(1402096027829817347,1123598815738675312,1123598816738675201),(1402096027829817348,1123598815738675203,1123598816738675201),(1402096027829817349,1123598815738675204,1123598816738675201),(1402096027829817350,1123598815738675223,1123598816738675201),(1402096027829817351,1123598815738675224,1123598816738675201),(1402096027829817352,1123598815738675225,1123598816738675201),(1402096027829817353,1123598815738675226,1123598816738675201),(1402096027834011650,1123598815738675227,1123598816738675201),(1402096027834011651,1123598815738675228,1123598816738675201),(1402096027834011652,1123598815738675205,1123598816738675201),(1402096027834011653,1123598815738675229,1123598816738675201),(1402096027834011654,1123598815738675230,1123598816738675201),(1402096027838205954,1123598815738675231,1123598816738675201),(1402096027838205955,1123598815738675232,1123598816738675201),(1402096027838205956,1164733389668962251,1123598816738675201),(1402096027838205957,1164733389668962252,1123598816738675201),(1402096027842400258,1164733389668962253,1123598816738675201),(1402096027842400259,1164733389668962254,1123598816738675201),(1402096027842400260,1164733389668962255,1123598816738675201),(1402096027842400261,1123598815738675206,1123598816738675201),(1402096027846594562,1123598815738675233,1123598816738675201),(1402096027846594563,1123598815738675234,1123598816738675201),(1402096027846594564,1123598815738675235,1123598816738675201),(1402096027846594565,1123598815738675236,1123598816738675201),(1402096027850788866,1164733379658963251,1123598816738675201),(1402096027850788867,1164733379658963252,1123598816738675201),(1402096027850788868,1164733379658963253,1123598816738675201),(1402096027850788869,1164733379658963254,1123598816738675201),(1402096027854983169,1164733379658963255,1123598816738675201),(1402096027854983170,1123598815738675207,1123598816738675201),(1402096027854983171,1123598815738675237,1123598816738675201),(1402096027854983172,1123598815738675238,1123598816738675201),(1402096027854983173,1123598815738675239,1123598816738675201),(1402096027859177473,1123598815738675240,1123598816738675201),(1402096027859177474,1123598815738675208,1123598816738675201),(1402096027859177475,1123598815738675313,1123598816738675201),(1402096027859177476,1123598815738675314,1123598816738675201),(1402096027859177477,1123598815738675315,1123598816738675201),(1402096027859177478,1123598815738675316,1123598816738675201),(1402096027863371778,1123598815738675317,1123598816738675201),(1402096027863371779,1123598815738675209,1123598816738675201),(1402096027863371780,1123598815738675245,1123598816738675201),(1402096027863371781,1123598815738675246,1123598816738675201),(1402096027867566081,1123598815738675247,1123598816738675201),(1402096027867566082,1123598815738675248,1123598816738675201),(1402096027871760386,1123598815738675256,1123598816738675201),(1402096027871760387,1123598815738675257,1123598816738675201),(1402096027871760388,1123598815738675258,1123598816738675201),(1402096027875954689,1123598815738675259,1123598816738675201),(1402096027875954690,1123598815738675260,1123598816738675201),(1402096027875954691,1123598815738675261,1123598816738675201),(1402096027875954692,1123598815738675262,1123598816738675201),(1402096027875954693,1123598815738675263,1123598816738675201),(1402096027880148993,1123598815738675264,1123598816738675201),(1402096027880148994,1123598815738675265,1123598816738675201),(1402096027880148995,1402034392285335553,1123598816738675201),(1402096027880148996,1402095758068961282,1123598816738675201),(1402096027880148997,1402095957529088001,1123598816738675201),(1402202867892846594,1164733399668962201,1123598816738675202),(1402202867897040897,1164733399668962202,1123598816738675202),(1402202867897040898,1164733399668962203,1123598816738675202),(1402202867897040899,1164733399668962204,1123598816738675202),(1402202867897040900,1164733399668962205,1123598816738675202),(1402202867897040901,1164733399668962206,1123598816738675202),(1402202867897040902,1164733399668962207,1123598816738675202),(1402202867897040903,1402034392285335553,1123598816738675202),(1402202867897040904,1402200670446649346,1123598816738675202),(1402202867897040905,1402200938043244545,1123598816738675202),(1402202867897040906,1402201184970309634,1123598816738675202),(1402202867897040907,1402201408950337537,1123598816738675202),(1402202867897040908,1402095758068961282,1123598816738675202),(1402202867901235202,1402095957529088001,1123598816738675202),(1402214967696523266,1164733399668962201,1123598816738675203),(1402214967700717570,1164733399668962202,1123598816738675203),(1402214967704911874,1164733399668962203,1123598816738675203),(1402214967704911875,1164733399668962204,1123598816738675203),(1402214967704911876,1164733399668962205,1123598816738675203),(1402214967704911877,1164733399668962206,1123598816738675203),(1402214967704911878,1164733399668962207,1123598816738675203),(1402214967704911879,1402212180929642497,1123598816738675203),(1402214967704911880,1402034392285335553,1123598816738675203),(1402214967704911881,1402200670446649346,1123598816738675203),(1402214967704911882,1402200938043244545,1123598816738675203),(1402214967704911883,1402201184970309634,1123598816738675203),(1402214967704911884,1402201408950337537,1123598816738675203),(1402214967704911885,1402095758068961282,1123598816738675203),(1402214967704911886,1402095957529088001,1123598816738675203);
/*!40000 ALTER TABLE `blade_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_role_scope`
--

DROP TABLE IF EXISTS `blade_role_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_role_scope` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `scope_category` int(2) DEFAULT NULL COMMENT '权限类型(1:数据权限、2:接口权限)',
  `scope_id` bigint(64) DEFAULT NULL COMMENT '权限id',
  `role_id` bigint(64) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色数据权限关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_role_scope`
--

LOCK TABLES `blade_role_scope` WRITE;
/*!40000 ALTER TABLE `blade_role_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_role_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_scope_api`
--

DROP TABLE IF EXISTS `blade_scope_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_scope_api` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `menu_id` bigint(64) DEFAULT NULL COMMENT '菜单主键',
  `resource_code` varchar(255) DEFAULT NULL COMMENT '资源编号',
  `scope_name` varchar(255) DEFAULT NULL COMMENT '接口权限名',
  `scope_path` varchar(255) DEFAULT NULL COMMENT '接口权限地址',
  `scope_type` int(2) DEFAULT NULL COMMENT '接口权限类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '接口权限备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='接口权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_scope_api`
--

LOCK TABLES `blade_scope_api` WRITE;
/*!40000 ALTER TABLE `blade_scope_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_scope_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_scope_data`
--

DROP TABLE IF EXISTS `blade_scope_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_scope_data` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `menu_id` bigint(64) DEFAULT NULL COMMENT '菜单主键',
  `resource_code` varchar(255) DEFAULT NULL COMMENT '资源编号',
  `scope_name` varchar(255) DEFAULT NULL COMMENT '数据权限名称',
  `scope_field` varchar(255) DEFAULT NULL COMMENT '数据权限字段',
  `scope_class` varchar(500) DEFAULT NULL COMMENT '数据权限类名',
  `scope_column` varchar(255) DEFAULT NULL COMMENT '数据权限字段',
  `scope_type` int(2) DEFAULT NULL COMMENT '数据权限类型',
  `scope_value` varchar(2000) DEFAULT NULL COMMENT '数据权限值域',
  `remark` varchar(255) DEFAULT NULL COMMENT '数据权限备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='数据权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_scope_data`
--

LOCK TABLES `blade_scope_data` WRITE;
/*!40000 ALTER TABLE `blade_scope_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_scope_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_sms`
--

DROP TABLE IF EXISTS `blade_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_sms` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `category` int(2) DEFAULT NULL COMMENT '分类',
  `sms_code` varchar(32) DEFAULT NULL COMMENT '资源编号',
  `template_id` varchar(64) DEFAULT NULL COMMENT '模板ID',
  `access_key` varchar(255) DEFAULT NULL COMMENT 'accessKey',
  `secret_key` varchar(255) DEFAULT NULL COMMENT 'secretKey',
  `region_id` varchar(255) DEFAULT NULL COMMENT 'regionId',
  `sign_name` varchar(64) DEFAULT NULL COMMENT '短信签名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='短信配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_sms`
--

LOCK TABLES `blade_sms` WRITE;
/*!40000 ALTER TABLE `blade_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_tenant`
--

DROP TABLE IF EXISTS `blade_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_tenant` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `tenant_name` varchar(50) NOT NULL COMMENT '租户名称',
  `domain` varchar(255) DEFAULT NULL COMMENT '域名地址',
  `background_url` varchar(1000) DEFAULT NULL COMMENT '系统背景',
  `linkman` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `account_number` int(11) DEFAULT '-1' COMMENT '账号额度',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `datasource_id` bigint(64) DEFAULT NULL COMMENT '数据源ID',
  `license_key` varchar(1000) DEFAULT NULL COMMENT '授权码',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='租户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_tenant`
--

LOCK TABLES `blade_tenant` WRITE;
/*!40000 ALTER TABLE `blade_tenant` DISABLE KEYS */;
INSERT INTO `blade_tenant` VALUES (1123598820738675201,'000000','管理组',NULL,NULL,'admin','666666','管理组',-1,NULL,NULL,NULL,1123598821738675201,1123598813738675201,'2019-01-01 00:00:39',1123598821738675201,'2019-01-01 00:00:39',1,0);
/*!40000 ALTER TABLE `blade_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_top_menu`
--

DROP TABLE IF EXISTS `blade_top_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_top_menu` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT NULL COMMENT '租户id',
  `code` varchar(255) DEFAULT NULL COMMENT '顶部菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '顶部菜单名',
  `source` varchar(255) DEFAULT NULL COMMENT '顶部菜单资源',
  `sort` int(2) DEFAULT NULL COMMENT '顶部菜单排序',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='顶部菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_top_menu`
--

LOCK TABLES `blade_top_menu` WRITE;
/*!40000 ALTER TABLE `blade_top_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_top_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_top_menu_setting`
--

DROP TABLE IF EXISTS `blade_top_menu_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_top_menu_setting` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `top_menu_id` bigint(64) DEFAULT NULL COMMENT '顶部菜单主键',
  `menu_id` bigint(64) DEFAULT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='顶部菜单配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_top_menu_setting`
--

LOCK TABLES `blade_top_menu_setting` WRITE;
/*!40000 ALTER TABLE `blade_top_menu_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_top_menu_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_user`
--

DROP TABLE IF EXISTS `blade_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_user` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `code` varchar(12) DEFAULT NULL COMMENT '用户编号',
  `user_type` int(2) DEFAULT NULL COMMENT '用户平台',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(10) DEFAULT NULL COMMENT '真名',
  `avatar` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(45) DEFAULT NULL COMMENT '手机',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(2) DEFAULT NULL COMMENT '性别',
  `role_id` varchar(1000) DEFAULT NULL COMMENT '角色id',
  `dept_id` varchar(1000) DEFAULT NULL COMMENT '部门id',
  `post_id` varchar(1000) DEFAULT NULL COMMENT '岗位id',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_user`
--

LOCK TABLES `blade_user` WRITE;
/*!40000 ALTER TABLE `blade_user` DISABLE KEYS */;
INSERT INTO `blade_user` VALUES (1123598821738675201,'000000',NULL,1,'admin','90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad','管理员','管理员','https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png','admin@bladex.vip','123333333333','2018-08-08 00:00:00',1,'1123598816738675201','1123598813738675201','1123598817738675201',1123598821738675201,1123598813738675201,'2018-08-08 00:00:00',1123598821738675201,'2018-08-08 00:00:00',1,0),(1123598821738675202,'000000',NULL,1,'hr','5e79b90f7bba52d54115f086e48f539016a27ec6','人事','人事','','hr@bladex.vip','123333333333','2018-08-08 00:00:00',1,'1123598816738675203','1123598813738675202','1123598817738675207',1123598821738675201,1123598813738675201,'2019-04-27 17:03:10',1123598821738675201,'2021-06-08 16:57:14',1,1),(1123598821738675203,'000000',NULL,1,'manager','dfbaa3b61caa3a319f463cc165085aa8c822d2ce','经理','经理','','manager@bladex.vip','123333333333','2018-08-08 00:00:00',1,'1123598816738675204','1123598813738675202','1123598817738675206',1123598821738675201,1123598813738675201,'2019-04-27 17:03:38',1123598821738675201,'2021-06-08 16:57:11',1,1),(1123598821738675204,'000000',NULL,1,'boss','abe57d23e18f7ad8ea99c86e430c90a05119a9d3','老板','老板','','boss@bladex.vip','123333333333','2018-08-08 00:00:00',1,'1123598816738675205','1123598813738675202','1123598817738675201',1123598821738675201,1123598813738675201,'2019-04-27 17:03:55',1123598821738675201,'2021-06-08 16:57:09',1,1),(1402188138378002434,'000000','',1,'user','d8406e8445cc99a16ab984cc28f6931615c766fc','user','user','','','',NULL,-1,'1123598816738675203','1123598813738675201','1123598817738675208',1123598821738675201,1123598813738675201,'2021-06-08 16:57:58',1123598821738675201,'2021-06-08 18:18:01',1,0);
/*!40000 ALTER TABLE `blade_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_user_app`
--

DROP TABLE IF EXISTS `blade_user_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_user_app` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `user_id` bigint(64) DEFAULT '0' COMMENT '用户ID',
  `user_ext` varchar(255) DEFAULT NULL COMMENT '用户拓展信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户平台拓展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_user_app`
--

LOCK TABLES `blade_user_app` WRITE;
/*!40000 ALTER TABLE `blade_user_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_user_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_user_dept`
--

DROP TABLE IF EXISTS `blade_user_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_user_dept` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `user_id` bigint(64) DEFAULT '0' COMMENT '用户ID',
  `dept_id` bigint(64) DEFAULT '0' COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_user_dept`
--

LOCK TABLES `blade_user_dept` WRITE;
/*!40000 ALTER TABLE `blade_user_dept` DISABLE KEYS */;
INSERT INTO `blade_user_dept` VALUES (1203503640757788674,1123598821738675201,1123598813738675201),(1203503653323923458,1123598821738675202,1123598813738675202),(1203503663402835969,1123598821738675203,1123598813738675202),(1203503672911323137,1123598821738675204,1123598813738675202),(1402208283687223298,1402188138378002434,1123598813738675201);
/*!40000 ALTER TABLE `blade_user_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_user_oauth`
--

DROP TABLE IF EXISTS `blade_user_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_user_oauth` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT NULL COMMENT '租户ID',
  `uuid` varchar(64) DEFAULT NULL COMMENT '第三方系统用户ID',
  `user_id` bigint(64) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(32) DEFAULT NULL COMMENT '账号',
  `nickname` varchar(64) DEFAULT NULL COMMENT '用户名',
  `avatar` varchar(1000) DEFAULT NULL COMMENT '头像',
  `blog` varchar(50) DEFAULT NULL COMMENT '应用主页',
  `company` varchar(255) DEFAULT NULL COMMENT '公司名',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `email` varchar(255) DEFAULT NULL COMMENT '邮件',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `gender` varchar(16) DEFAULT NULL COMMENT '性别',
  `source` varchar(16) DEFAULT NULL COMMENT '来源',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户第三方认证表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_user_oauth`
--

LOCK TABLES `blade_user_oauth` WRITE;
/*!40000 ALTER TABLE `blade_user_oauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_user_oauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_user_other`
--

DROP TABLE IF EXISTS `blade_user_other`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_user_other` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `user_id` bigint(64) DEFAULT '0' COMMENT '用户ID',
  `user_ext` varchar(255) DEFAULT NULL COMMENT '用户拓展信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户平台拓展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_user_other`
--

LOCK TABLES `blade_user_other` WRITE;
/*!40000 ALTER TABLE `blade_user_other` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_user_other` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blade_user_web`
--

DROP TABLE IF EXISTS `blade_user_web`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blade_user_web` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `user_id` bigint(64) DEFAULT '0' COMMENT '用户ID',
  `user_ext` varchar(255) DEFAULT NULL COMMENT '用户拓展信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户平台拓展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blade_user_web`
--

LOCK TABLES `blade_user_web` WRITE;
/*!40000 ALTER TABLE `blade_user_web` DISABLE KEYS */;
/*!40000 ALTER TABLE `blade_user_web` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_baseInfo`
--

DROP TABLE IF EXISTS `trace_baseInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trace_baseInfo` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `code` varchar(64) DEFAULT NULL COMMENT '溯源码',
  `name` varchar(64) DEFAULT NULL COMMENT '名字',
  `en_name` varchar(64) DEFAULT NULL COMMENT '英文名字',
  `type_name` varchar(64) DEFAULT NULL COMMENT '科名',
  `shu_name` varchar(64) DEFAULT NULL COMMENT '属名',
  `zhong_name` varchar(64) DEFAULT NULL COMMENT '种名',
  `res_type` varchar(64) DEFAULT NULL COMMENT '资源类型',
  `des` varchar(64) DEFAULT NULL COMMENT '描述',
  `use_str` varchar(64) DEFAULT NULL COMMENT '用途',
  `res_des` varchar(64) DEFAULT NULL COMMENT '资源描述',
  `collect_id` varchar(64) DEFAULT NULL COMMENT '溯源码',
  `caiji_id` varchar(64) DEFAULT NULL COMMENT '名字',
  `yinzhong_id` varchar(64) DEFAULT NULL COMMENT '英文名字',
  `collect_dept` varchar(64) DEFAULT NULL COMMENT '科名',
  `collect_time` varchar(64) DEFAULT NULL COMMENT '属名',
  `country` varchar(64) DEFAULT NULL COMMENT '种名',
  `province` varchar(64) DEFAULT NULL COMMENT '属名',
  `address` varchar(64) DEFAULT NULL COMMENT '种名',
  `env` varchar(64) DEFAULT NULL COMMENT '资源类型',
  `env_type` varchar(64) DEFAULT NULL COMMENT '描述',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_baseInfo`
--

LOCK TABLES `trace_baseInfo` WRITE;
/*!40000 ALTER TABLE `trace_baseInfo` DISABLE KEYS */;
INSERT INTO `trace_baseInfo` VALUES (1402095136322113537,'1234','sda','sds','fd','ds','sd','sd','sd','sd','','sd','sd','sd','ds','sd','sd','sd','sd','ds','ds',1123598821738675201,1123598813738675201,'2021-06-08 10:48:25',1123598821738675201,'2021-06-08 16:31:50',1,1),(1402095347413045249,'1234','sda','sds','fd','ds','sd','sd','sd','sd','','sd','sd','sd','ds','sd','sd','sd','sd','ds','ds',1123598821738675201,1123598813738675201,'2021-06-08 10:49:15',1123598821738675201,'2021-06-08 16:31:54',1,1),(1402184305463623681,'112233','西红柿','tomato','番茄','番茄','番茄','蔬菜','红色浆果','食用','西红柿种子','P101','T032','Y432','北京农业科技公司','2021年6月','中国','北京','海淀区','沙土','环保产地',1123598821738675201,1123598813738675201,'2021-06-08 16:42:44',1123598821738675201,'2021-06-08 16:42:44',1,0);
/*!40000 ALTER TABLE `trace_baseInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_store`
--

DROP TABLE IF EXISTS `trace_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trace_store` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `code` varchar(64) DEFAULT NULL COMMENT '溯源码',
  `store_dept` varchar(64) DEFAULT NULL COMMENT '名字',
  `store_address` varchar(64) DEFAULT NULL COMMENT '英文名字',
  `pu` varchar(64) DEFAULT NULL COMMENT '种名',
  `pu_id` varchar(64) DEFAULT NULL COMMENT '资源类型',
  `ku_id` varchar(64) DEFAULT NULL COMMENT '描述',
  `pu_time` varchar(64) DEFAULT NULL COMMENT '用途',
  `store_type1` varchar(64) DEFAULT NULL COMMENT '用途',
  `store_type2` varchar(64) DEFAULT NULL COMMENT '用途',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_store`
--

LOCK TABLES `trace_store` WRITE;
/*!40000 ALTER TABLE `trace_store` DISABLE KEYS */;
INSERT INTO `trace_store` VALUES (1402096217341054977,'fsad','fsd','fasd','fsad','fsd','fsda','fsa','fsda','fsd',1123598821738675201,1123598813738675201,'2021-06-08 10:52:43',1123598821738675201,'2021-06-08 16:45:30',1,1),(1402185389108199425,'112233','河南省粮食局','郑州金水区','1001','18号','01号','2021年6月10','冷藏','番茄',1123598821738675201,1123598813738675201,'2021-06-08 16:47:03',1123598821738675201,'2021-06-08 16:47:03',1,0);
/*!40000 ALTER TABLE `trace_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_traffic`
--

DROP TABLE IF EXISTS `trace_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trace_traffic` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `code` varchar(64) DEFAULT NULL COMMENT '溯源码',
  `traffic_id` varchar(64) DEFAULT NULL COMMENT '名字',
  `traffic_dept` varchar(64) DEFAULT NULL COMMENT '英文名字',
  `traffic_time` varchar(64) DEFAULT NULL COMMENT '科名',
  `driver` varchar(64) DEFAULT NULL COMMENT '属名',
  `send_dept` varchar(64) DEFAULT NULL COMMENT '种名',
  `send_address` varchar(64) DEFAULT NULL COMMENT '资源类型',
  `re_dept` varchar(64) DEFAULT NULL COMMENT '描述',
  `re_address` varchar(64) DEFAULT NULL COMMENT '用途',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='物流信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_traffic`
--

LOCK TABLES `trace_traffic` WRITE;
/*!40000 ALTER TABLE `trace_traffic` DISABLE KEYS */;
INSERT INTO `trace_traffic` VALUES (1402096142283984898,'1234','fsd','fads','fad','fds','fasd','fas','fsd','fasd',1123598821738675201,1123598813738675201,'2021-06-08 10:52:25',1123598821738675201,'2021-06-08 16:43:13',1,1),(1402097815224078337,'13422','3434','34','34','34','43','34','34','34',1123598821738675201,1123598813738675201,'2021-06-08 10:59:04',1123598821738675201,'2021-06-08 16:43:15',1,1),(1402184892443885570,'112233','P1000323442','顺丰','2021年6月5日','李二胡','北京农业科技公司','北京海淀区','河南农贸科技公司','河南郑州',1123598821738675201,1123598813738675201,'2021-06-08 16:45:04',1123598821738675201,'2021-06-08 16:45:04',1,0);
/*!40000 ALTER TABLE `trace_traffic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-09 15:23:17
CREATE TABLE `trace_sensor` (
	`id` bigint(64) NOT NULL COMMENT '主键',
	`code` varchar(64) DEFAULT NULL COMMENT '溯源码',
	`sensor_id` varchar(64) DEFAULT NULL COMMENT '传感器号',
	`location` varchar(64) DEFAULT NULL COMMENT '位置',
	`longitude` varchar(64) DEFAULT NULL COMMENT '经度',
	`latitude` varchar(64) DEFAULT NULL COMMENT '纬度',
	`timestamp` bigint(64) DEFAULT NULL COMMENT '时间',
	`pressure` varchar(64) DEFAULT NULL COMMENT '气压',
	`temperature` bigint(64) DEFAULT NULL COMMENT '温度',
	`humidity` varchar(64) DEFAULT NULL COMMENT '湿度',
	`create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
	`create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
	`create_time` datetime DEFAULT NULL COMMENT '创建时间',
	`update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
	`update_time` datetime DEFAULT NULL COMMENT '修改时间',
	`status` int(2) DEFAULT NULL COMMENT '状态',
	`is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
	PRIMARY KEY (`id`) USING BTREE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='传感器信息表';