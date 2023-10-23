-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: redmine
-- ------------------------------------------------------
-- Server version	5.7.42

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','production','2023-10-11 21:35:33.766874','2023-10-11 21:35:33.766874');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `disk_filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filesize` bigint(20) NOT NULL DEFAULT '0',
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `digest` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk_directory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`),
  KEY `index_attachments_on_disk_filename` (`disk_filename`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,1,'Document','1309489919-2023-10-13.pdf','231021215444_1309489919-2023-10-13.pdf',186404,'application/pdf','d5a547c7d4186ed62e566ad12f3246fc54e3818d58e87d5d14e5fbb77c1b81a9',0,1,'2023-10-21 18:54:44','','2023/10'),(2,1,'Document','Document.docx','231021224100_Document.docx',6940,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','457dc57108e797a7c429f7488ee92f92c627cb972093b6feb13be27fe25f5e27',0,1,'2023-10-21 19:41:00',NULL,'2023/10'),(5,2,'Document','Document.docx','231021233141_Document.docx',28967,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','786f7b2552580388ce64f8a49fd06cc0d3114a8cd8908a962d50743d4dcf9afc',0,14,'2023-10-21 20:31:41',NULL,'2023/10'),(6,1,'Issue','New Microsoft Word Document (2).docx','231022143208_81d664e6d88a456c07b60b7b39d2b249.docx',12012,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','d7722be8ebb10e08e5ae7aa58a7f330d51b27bbce1a83af2683898368584f99c',0,1,'2023-10-22 11:32:08','','2023/10');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `host` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `base_dn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_login` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_firstname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_lastname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attr_mail` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` text COLLATE utf8mb4_unicode_ci,
  `timeout` int(11) DEFAULT NULL,
  `verify_peer` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `messages_count` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_path` text COLLATE utf8mb4_unicode_ci,
  `from_revision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeset_parents`
--

DROP TABLE IF EXISTS `changeset_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  KEY `changeset_parents_changeset_ids` (`changeset_id`),
  KEY `changeset_parents_parent_ids` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeset_parents`
--

LOCK TABLES `changeset_parents` WRITE;
/*!40000 ALTER TABLE `changeset_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeset_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets`
--

DROP TABLE IF EXISTS `changesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `committer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets`
--

LOCK TABLES `changesets` WRITE;
/*!40000 ALTER TABLE `changesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets_issues`
--

DROP TABLE IF EXISTS `changesets_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`),
  KEY `index_changesets_issues_on_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets_issues`
--

LOCK TABLES `changesets_issues` WRITE;
/*!40000 ALTER TABLE `changesets_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_enumerations`
--

DROP TABLE IF EXISTS `custom_field_enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_enumerations`
--

LOCK TABLES `custom_field_enumerations` WRITE;
/*!40000 ALTER TABLE `custom_field_enumerations` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_field_enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_format` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `possible_values` text COLLATE utf8mb4_unicode_ci,
  `regexp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text COLLATE utf8mb4_unicode_ci,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  `format_store` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_projects`
--

DROP TABLE IF EXISTS `custom_fields_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_projects`
--

LOCK TABLES `custom_fields_projects` WRITE;
/*!40000 ALTER TABLE `custom_fields_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_roles`
--

DROP TABLE IF EXISTS `custom_fields_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_roles`
--

LOCK TABLES `custom_fields_roles` WRITE;
/*!40000 ALTER TABLE `custom_fields_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_trackers`
--

DROP TABLE IF EXISTS `custom_fields_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_trackers`
--

LOCK TABLES `custom_fields_trackers` WRITE;
/*!40000 ALTER TABLE `custom_fields_trackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_values`
--

DROP TABLE IF EXISTS `custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT '0',
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_values`
--

LOCK TABLES `custom_values` WRITE;
/*!40000 ALTER TABLE `custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,1,6,'Перевод','','2023-10-21 18:54:47'),(2,1,6,'Tecn','','2023-10-21 19:45:28');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_email_addresses_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES (1,1,'admin@example.net',1,1,'2023-10-11 21:35:33','2023-10-11 21:35:33'),(2,5,'VIzdebsky@bkport.com',1,1,'2023-10-11 21:40:13','2023-10-11 21:40:13'),(3,6,'RKotelevits@bkport.com',1,1,'2023-10-11 21:41:20','2023-10-11 21:41:20'),(4,13,'msaenko@bkport.com',1,1,'2023-10-16 12:51:34','2023-10-16 12:51:34'),(5,14,'srozhko@bbport.com',1,1,'2023-10-21 23:04:26','2023-10-21 23:04:26');
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enabled_modules`
--

DROP TABLE IF EXISTS `enabled_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_modules`
--

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (1,1,'issue_tracking'),(2,1,'time_tracking'),(3,1,'news'),(4,1,'documents'),(5,1,'files'),(6,1,'wiki'),(7,1,'repository'),(8,1,'boards'),(9,1,'calendar'),(10,1,'gantt'),(21,3,'issue_tracking'),(22,3,'time_tracking'),(23,3,'news'),(24,3,'documents'),(25,3,'files'),(26,3,'wiki'),(27,3,'repository'),(28,3,'boards'),(29,3,'calendar'),(30,3,'gantt'),(31,4,'issue_tracking'),(32,4,'time_tracking'),(33,4,'news'),(34,4,'documents'),(35,4,'files'),(36,4,'wiki'),(37,4,'repository'),(38,4,'boards'),(39,4,'calendar'),(40,4,'gantt');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumerations`
--

LOCK TABLES `enumerations` WRITE;
/*!40000 ALTER TABLE `enumerations` DISABLE KEYS */;
INSERT INTO `enumerations` VALUES (1,'Low',1,0,'IssuePriority',1,NULL,NULL,'lowest'),(2,'Normal',2,1,'IssuePriority',1,NULL,NULL,'default'),(3,'High',3,0,'IssuePriority',1,NULL,NULL,'high3'),(4,'Urgent',4,0,'IssuePriority',1,NULL,NULL,'high2'),(5,'Immediate',5,0,'IssuePriority',1,NULL,NULL,'highest'),(6,'User documentation',1,0,'DocumentCategory',1,NULL,NULL,NULL),(7,'Technical documentation',2,0,'DocumentCategory',1,NULL,NULL,NULL),(8,'Design',1,0,'TimeEntryActivity',1,NULL,NULL,NULL),(9,'Development',2,0,'TimeEntryActivity',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
INSERT INTO `groups_users` VALUES (7,13),(12,5),(12,6),(12,13);
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_items`
--

DROP TABLE IF EXISTS `import_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_import_items_on_import_id_and_unique_id` (`import_id`,`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_items`
--

LOCK TABLES `import_items` WRITE;
/*!40000 ALTER TABLE `import_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `total_items` int(11) DEFAULT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_categories`
--

DROP TABLE IF EXISTS `issue_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_categories`
--

LOCK TABLES `issue_categories` WRITE;
/*!40000 ALTER TABLE `issue_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_relations`
--

DROP TABLE IF EXISTS `issue_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_relations`
--

LOCK TABLES `issue_relations` WRITE;
/*!40000 ALTER TABLE `issue_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_statuses`
--

DROP TABLE IF EXISTS `issue_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT NULL,
  `default_done_ratio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_statuses`
--

LOCK TABLES `issue_statuses` WRITE;
/*!40000 ALTER TABLE `issue_statuses` DISABLE KEYS */;
INSERT INTO `issue_statuses` VALUES (1,'New',0,1,NULL),(2,'In Progress',0,2,NULL),(3,'Resolved',0,3,NULL),(4,'Feedback',0,4,NULL),(5,'Closed',1,5,NULL),(6,'Rejected',1,6,NULL);
/*!40000 ALTER TABLE `issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `closed_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`),
  KEY `index_issues_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'vdfbzdfb','journalctl | grep CRON\r\njournalctl | grep CRON\r\nregular . Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?v',NULL,NULL,1,NULL,2,1,1,2,'2023-10-22 11:31:47','2023-10-22 11:32:12','2023-10-22',0,NULL,NULL,1,1,2,0,NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_details`
--

DROP TABLE IF EXISTS `journal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prop_key` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `old_value` longtext COLLATE utf8mb4_unicode_ci,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_details`
--

LOCK TABLES `journal_details` WRITE;
/*!40000 ALTER TABLE `journal_details` DISABLE KEYS */;
INSERT INTO `journal_details` VALUES (1,1,'attachment','6',NULL,'New Microsoft Word Document (2).docx');
/*!40000 ALTER TABLE `journal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalized_id` int(11) NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,1,'Issue',1,'. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?. Output (Optional)\r\n\r\nBy default, cron sends an email to the owner of the crontab file when it runs. This is a convenient way to keep track of tasks. Keep in mind that regular or minor tasks can fill up your inbox quickly.\r\n\r\nAs this is an optional feature, you can prevent that scenario by disabling the output email. To turn off email output, add the following string, >/dev/null 2>&1, after the timing and command fields.\r\n\r\n* * * * * directory/command >/dev/null 2>&1\r\n\r\n4. Using Operators (Optional)\r\n\r\nFor efficiency, cron syntax also uses operators. Operators are special characters that perform operations on the provided values in the cron field.\r\n\r\n    An asterisk (*) stands for all values. Use this operator to keep tasks running during all months, or all days of the week.\r\n    A comma (,) specifies separate individual values.\r\n    A dash (–) indicates a range of values.\r\n    A forward-slash (/) is used to divide a value into steps. (*/2 would be every other value, */3 would be every third, */10 would be every tenth, etc.)\r\n\r\nSetting Up a Cron Job\r\n\r\nTo configure a cron job, open the crontab with a preferred text editor and input the syntax for the command you want to run.\r\nHow to Edit the crontab File?','2023-10-22 14:32:12',0);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_roles`
--

DROP TABLE IF EXISTS `member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`),
  KEY `index_member_roles_on_inherited_from` (`inherited_from`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_roles`
--

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
INSERT INTO `member_roles` VALUES (1,1,5,NULL),(2,2,5,NULL),(3,3,5,NULL),(4,4,3,NULL),(5,5,3,4),(6,6,3,4),(7,4,4,NULL),(8,5,4,7),(9,6,4,7),(10,7,3,NULL),(11,7,4,NULL),(12,8,3,4),(13,8,4,7),(14,8,3,10),(15,8,4,11),(16,9,3,NULL),(17,9,4,NULL),(18,10,3,NULL),(19,10,4,NULL),(20,11,3,NULL),(21,11,4,NULL),(22,12,3,NULL),(23,12,4,NULL),(24,13,3,NULL),(25,13,4,NULL),(26,13,5,NULL),(27,14,3,NULL),(28,14,4,NULL),(29,14,5,NULL);
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,11,1,'2023-10-16 07:26:11',0),(2,10,1,'2023-10-16 07:26:12',0),(3,9,1,'2023-10-16 07:26:12',0),(4,12,1,'2023-10-16 07:26:32',0),(5,5,1,'2023-10-16 07:26:32',0),(6,6,1,'2023-10-16 07:26:32',0),(7,7,1,'2023-10-16 07:26:32',0),(8,13,1,'2023-10-16 10:13:08',0),(9,6,4,'2023-10-16 10:13:55',0),(10,6,3,'2023-10-16 10:13:55',0),(11,13,4,'2023-10-16 10:14:20',0),(12,13,3,'2023-10-16 10:14:20',0),(13,14,1,'2023-10-21 20:17:42',0),(14,1,1,'2023-10-21 20:19:45',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT '0',
  `default_version_id` int(11) DEFAULT NULL,
  `default_assigned_to_id` int(11) DEFAULT NULL,
  `default_issue_query_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Navis','Інструкції, налаштування та заявки у процесі тестування та роботи','',0,NULL,'2023-10-11 18:41:46','2023-10-11 18:41:46','navis',1,5,6,0,1,NULL,NULL),(3,'BKP','Усі внутрішні питання компанії','',0,NULL,'2023-10-16 09:27:34','2023-10-16 09:34:49','bkp',1,3,4,0,NULL,NULL,NULL),(4,'1C інвентаризація, облік','Питання з роботи 1С, інвентаризація, уведення у експлуатацію, ремонту, обліку тощо.','',0,NULL,'2023-10-16 09:32:55','2023-10-16 09:34:06','accounting-1c',1,1,2,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_trackers`
--

DROP TABLE IF EXISTS `projects_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_trackers`
--

LOCK TABLES `projects_trackers` WRITE;
/*!40000 ALTER TABLE `projects_trackers` DISABLE KEYS */;
INSERT INTO `projects_trackers` VALUES (1,1),(1,2),(1,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3);
/*!40000 ALTER TABLE `projects_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filters` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `column_names` text COLLATE utf8mb4_unicode_ci,
  `sort_criteria` text COLLATE utf8mb4_unicode_ci,
  `group_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` int(11) DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,NULL,'Issues assigned to me','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nassigned_to_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - priority\n  - desc\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(2,NULL,'Reported issues','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nauthor_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(3,NULL,'Updated issues','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nupdated_by:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(4,NULL,'Watched issues','---\nstatus_id:\n  :operator: o\n  :values:\n  - \'\'\nwatcher_id:\n  :operator: \"=\"\n  :values:\n  - me\nproject.status:\n  :operator: \"=\"\n  :values:\n  - \'1\'\n',0,NULL,'---\n- - updated_on\n  - desc\n',NULL,'IssueQuery',2,NULL),(5,NULL,'My projects','---\nstatus:\n  :operator: \"=\"\n  :values:\n  - \'1\'\nid:\n  :operator: \"=\"\n  :values:\n  - mine\n',0,NULL,NULL,NULL,'ProjectQuery',2,NULL),(6,NULL,'My bookmarks','---\nstatus:\n  :operator: \"=\"\n  :values:\n  - \'1\'\nid:\n  :operator: \"=\"\n  :values:\n  - bookmarks\n',0,NULL,NULL,NULL,'ProjectQuery',2,NULL),(7,NULL,'Spent time','---\nspent_on:\n  :operator: \"*\"\n  :values:\n  - \'\'\nuser_id:\n  :operator: \"=\"\n  :values:\n  - me\n',0,NULL,'---\n- - spent_on\n  - desc\n',NULL,'TimeEntryQuery',2,'---\n:totalable_names:\n- :hours\n');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries_roles`
--

DROP TABLE IF EXISTS `queries_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries_roles` (
  `query_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries_roles`
--

LOCK TABLES `queries_roles` WRITE;
/*!40000 ALTER TABLE `queries_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `login` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `root_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path_encoding` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_encoding` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_info` longtext COLLATE utf8mb4_unicode_ci,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT NULL,
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int(11) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `issues_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `users_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `time_entries_visibility` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `all_roles_managed` tinyint(1) NOT NULL DEFAULT '1',
  `settings` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Non member',0,1,1,'---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL),(2,'Anonymous',0,1,2,NULL,'default','all','all',1,'---\npermissions_all_trackers:\n  view_issues: \'1\'\n  add_issues: \'0\'\n  edit_issues: \'0\'\n  add_issue_notes: \'0\'\npermissions_tracker_ids:\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n'),(3,'Manager',1,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :delete_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n- :view_news\n- :manage_news\n- :comment_news\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n- :view_wiki_page_watchers\n- :add_wiki_page_watchers\n- :delete_wiki_page_watchers\n- :protect_wiki_pages\n- :manage_wiki\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :view_message_watchers\n- :add_message_watchers\n- :delete_message_watchers\n- :manage_boards\n- :view_calendar\n- :view_gantt\n','all','all','all',1,NULL),(4,'Developer',2,1,0,'---\n- :manage_versions\n- :manage_categories\n- :view_issues\n- :add_issues\n- :edit_issues\n- :view_private_notes\n- :set_notes_private\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :manage_files\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_related_issues\n','default','all','all',1,NULL),(5,'Reporter',3,1,0,'---\n- :view_issues\n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :view_news\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_messages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n','default','all','all',1,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_managed_roles`
--

DROP TABLE IF EXISTS `roles_managed_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_managed_roles` (
  `role_id` int(11) NOT NULL,
  `managed_role_id` int(11) NOT NULL,
  UNIQUE KEY `index_roles_managed_roles_on_role_id_and_managed_role_id` (`role_id`,`managed_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_managed_roles`
--

LOCK TABLES `roles_managed_roles` WRITE;
/*!40000 ALTER TABLE `roles_managed_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_managed_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('10'),('100'),('101'),('102'),('103'),('104'),('105'),('106'),('107'),('108'),('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('20'),('20090214190337'),('20090312172426'),('20090312194159'),('20090318181151'),('20090323224724'),('20090401221305'),('20090401231134'),('20090403001910'),('20090406161854'),('20090425161243'),('20090503121501'),('20090503121505'),('20090503121510'),('20090614091200'),('20090704172350'),('20090704172355'),('20090704172358'),('20091010093521'),('20091017212227'),('20091017212457'),('20091017212644'),('20091017212938'),('20091017213027'),('20091017213113'),('20091017213151'),('20091017213228'),('20091017213257'),('20091017213332'),('20091017213444'),('20091017213536'),('20091017213642'),('20091017213716'),('20091017213757'),('20091017213835'),('20091017213910'),('20091017214015'),('20091017214107'),('20091017214136'),('20091017214236'),('20091017214308'),('20091017214336'),('20091017214406'),('20091017214440'),('20091017214519'),('20091017214611'),('20091017214644'),('20091017214720'),('20091017214750'),('20091025163651'),('20091108092559'),('20091114105931'),('20091123212029'),('20091205124427'),('20091220183509'),('20091220183727'),('20091220184736'),('20091225164732'),('20091227112908'),('20100129193402'),('20100129193813'),('20100221100219'),('20100313132032'),('20100313171051'),('20100705164950'),('20100819172912'),('20101104182107'),('20101107130441'),('20101114115114'),('20101114115359'),('20110220160626'),('20110223180944'),('20110223180953'),('20110224000000'),('20110226120112'),('20110226120132'),('20110227125750'),('20110228000000'),('20110228000100'),('20110401192910'),('20110408103312'),('20110412065600'),('20110511000000'),('20110902000000'),('20111201201315'),('20120115143024'),('20120115143100'),('20120115143126'),('20120127174243'),('20120205111326'),('20120223110929'),('20120301153455'),('20120422150750'),('20120705074331'),('20120707064544'),('20120714122000'),('20120714122100'),('20120714122200'),('20120731164049'),('20120930112914'),('20121026002032'),('20121026003537'),('20121209123234'),('20121209123358'),('20121213084931'),('20130110122628'),('20130201184705'),('20130202090625'),('20130207175206'),('20130207181455'),('20130215073721'),('20130215111127'),('20130215111141'),('20130217094251'),('20130602092539'),('20130710182539'),('20130713104233'),('20130713111657'),('20130729070143'),('20130911193200'),('20131004113137'),('20131005100610'),('20131124175346'),('20131210180802'),('20131214094309'),('20131215104612'),('20131218183023'),('20140228130325'),('20140903143914'),('20140920094058'),('20141029181752'),('20141029181824'),('20141109112308'),('20141122124142'),('20150113194759'),('20150113211532'),('20150113213922'),('20150113213955'),('20150208105930'),('20150510083747'),('20150525103953'),('20150526183158'),('20150528084820'),('20150528092912'),('20150528093249'),('20150725112753'),('20150730122707'),('20150730122735'),('20150921204850'),('20150921210243'),('20151020182334'),('20151020182731'),('20151021184614'),('20151021185456'),('20151021190616'),('20151024082034'),('20151025072118'),('20151031095005'),('20160404080304'),('20160416072926'),('20160529063352'),('20161001122012'),('20161002133421'),('20161010081301'),('20161010081528'),('20161010081600'),('20161126094932'),('20161220091118'),('20170207050700'),('20170302015225'),('20170309214320'),('20170320051650'),('20170418090031'),('20170419144536'),('20170723112801'),('20180501132547'),('20180913072918'),('20180923082945'),('20180923091603'),('20190315094151'),('20190315102101'),('20190510070108'),('20190620135549'),('20200826153401'),('20200826153402'),('20210704125704'),('20210705111300'),('20210728131544'),('20210801145548'),('20210801211024'),('20211213122100'),('20211213122101'),('20211213122102'),('20220224194639'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('49'),('5'),('50'),('51'),('52'),('53'),('54'),('55'),('56'),('57'),('58'),('59'),('6'),('60'),('61'),('62'),('63'),('64'),('65'),('66'),('67'),('68'),('69'),('7'),('70'),('71'),('72'),('73'),('74'),('75'),('76'),('77'),('78'),('79'),('8'),('80'),('81'),('82'),('83'),('84'),('85'),('86'),('87'),('88'),('89'),('9'),('90'),('91'),('92'),('93'),('94'),('95'),('96'),('97'),('98'),('99');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8mb4_unicode_ci,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'default_projects_tracker_ids','---\n- \'1\'\n- \'2\'\n- \'3\'\n','2023-10-11 18:36:24'),(2,'ui_theme','PurpleMine2-2.16.1','2023-10-21 20:38:47'),(3,'default_language','uk','2023-10-21 20:38:47'),(4,'force_default_language_for_anonymous','0','2023-10-11 18:36:56'),(5,'force_default_language_for_loggedin','0','2023-10-11 18:36:56'),(6,'start_of_week','','2023-10-11 18:36:56'),(7,'date_format','','2023-10-11 18:36:56'),(8,'time_format','','2023-10-11 18:36:56'),(9,'timespan_format','minutes','2023-10-11 18:36:56'),(10,'user_format','firstname_lastname','2023-10-11 18:36:56'),(11,'gravatar_enabled','0','2023-10-11 18:36:56'),(12,'thumbnails_enabled','1','2023-10-11 18:36:56'),(13,'thumbnails_size','100','2023-10-11 18:36:56'),(14,'new_item_menu_tab','2','2023-10-11 18:36:56'),(15,'app_title','LLC Brooklyn-Kyiv Port','2023-10-11 18:37:32'),(16,'welcome_text','h2. Information\r\n\r\nLLC «Brooklyn-Kiev Port» (BKP) is an operator of a container terminal based on berths No. 42-43 of SE «Odessa Commercial Sea Port».\r\n\r\nThe company was set up in 2006. Its main task was to carry out and monitor the process of construction of a berth and backyard facilities. Over the period of 2006-2007, there were constructed the berth and a yard area behind it. Construction was done by sand filling with the use of specialized vessels. During the year of 2008, a terminal operation scheme was being elaborated in cooperation with all the regulatory authorities and departments of Odessa Port.\r\n\r\nIn October 2008 a Terminal Procedure Sheet was signed, alongside with including the terminal territory into the customs checkpoint zone.\r\n\r\nThe first vessel called at out terminal on October 23, 2008. And February 22, 2010, is the date of a call at the terminal of its first 300m container ship CMA CGM Baudelaire.\r\n\r\nOn the 8th of November, 2011 BKP accommodated the biggest container vessel ever over the history of Odessa Commercial Seaport. It was TUBUL (LOA 300m, beam 46m, vessel’s flag Liberia), of 8063 TEU cargo capacity.  Nowadays, large-size container vessels regularly call at out terminal.\r\n\r\nRail handling operations are arranged on a newly developed area with our own railroad sidetracks that make it possible to handle 21-flatcar trains.\r\n\r\nThe terminal has a special hangar with eight boxes for customs examination. Also, such operations as container weighing, identification examination, and sampling can be done directly on the terminal yard.\r\n\r\nContainer terminal operating system (TOS) has been put in place. It functions as a single software and information solution for tracking and monitoring of containers that arrive at the port (terminal), are stored on and moved along the territory of the port (terminal) and passed through the border checkpoint.\r\n\r\nCurrently, the company continues its development, building plans and improving the services rendered. ','2023-10-11 18:37:50'),(17,'per_page_options','25,50,100','2023-10-11 18:37:32'),(18,'search_results_per_page','10','2023-10-11 18:37:32'),(19,'activity_days_default','10','2023-10-11 18:37:32'),(20,'host_name','localhost:3000','2023-10-11 18:37:32'),(21,'protocol','http','2023-10-11 18:37:32'),(22,'text_formatting','textile','2023-10-11 18:37:32'),(23,'cache_formatted_text','0','2023-10-11 18:37:32'),(24,'wiki_compression','','2023-10-11 18:37:32'),(25,'feeds_limit','15','2023-10-11 18:37:32'),(26,'enabled_scm','---\n- Git\n- Filesystem\n','2023-10-12 10:10:38'),(27,'autofetch_changesets','1','2023-10-12 09:27:30'),(28,'sys_api_enabled','0','2023-10-12 09:27:30'),(29,'repository_log_display_limit','100','2023-10-12 09:27:30'),(30,'commit_logs_formatting','1','2023-10-12 09:27:30'),(31,'commit_ref_keywords','refs,references,IssueID','2023-10-12 09:27:30'),(32,'commit_cross_project_ref','0','2023-10-12 09:27:30'),(33,'commit_logtime_enabled','0','2023-10-12 09:27:30'),(34,'commit_update_keywords','--- []\n','2023-10-12 09:27:30'),(35,'max_additional_emails','5','2023-10-16 07:18:37'),(36,'email_domains_allowed','','2023-10-16 07:18:37'),(37,'email_domains_denied','','2023-10-16 07:18:37'),(38,'unsubscribe','1','2023-10-16 07:18:37'),(39,'default_users_hide_mail','1','2023-10-16 07:18:37'),(40,'default_notification_option','only_my_events','2023-10-16 07:18:37'),(41,'default_users_no_self_notified','1','2023-10-16 07:18:37'),(42,'default_users_time_zone','Kyiv','2023-10-16 07:18:37'),(43,'cross_project_issue_relations','1','2023-10-16 07:19:03'),(44,'link_copied_issue','ask','2023-10-16 07:19:03'),(45,'cross_project_subtasks','tree','2023-10-16 07:19:03'),(46,'close_duplicate_issues','1','2023-10-16 07:19:03'),(47,'issue_group_assignment','1','2023-10-16 07:19:03'),(48,'default_issue_start_date_to_creation_date','1','2023-10-16 07:19:03'),(49,'display_subprojects_issues','1','2023-10-16 07:19:03'),(50,'issue_done_ratio','issue_field','2023-10-16 07:19:03'),(51,'non_working_week_days','---\n- \'6\'\n- \'7\'\n','2023-10-16 07:19:03'),(52,'issues_export_limit','500','2023-10-16 07:19:03'),(53,'gantt_items_limit','500','2023-10-16 07:19:03'),(54,'gantt_months_limit','24','2023-10-16 07:19:03'),(55,'parent_issue_dates','derived','2023-10-16 07:19:03'),(56,'parent_issue_priority','derived','2023-10-16 07:19:03'),(57,'parent_issue_done_ratio','derived','2023-10-16 07:19:03'),(58,'issue_list_default_columns','---\n- tracker\n- status\n- priority\n- subject\n- assigned_to\n- updated_on\n','2023-10-16 07:19:03'),(59,'issue_list_default_totals','--- []\n','2023-10-16 07:19:03'),(60,'default_issue_query','','2023-10-16 07:19:03'),(61,'mail_from','redmine@bkport.com','2023-10-16 09:53:01'),(62,'plain_text_mail','0','2023-10-16 09:53:01'),(63,'show_status_changes_in_mail_subject','0','2023-10-16 09:53:01'),(64,'notified_events','---\n- issue_added\n- issue_updated\n','2023-10-16 09:53:01'),(65,'emails_header','','2023-10-16 09:53:01'),(66,'emails_footer','You have received this notification because you have either subscribed to it, or are involved in it.\r\nTo change your notification preferences, please click here: http://hostname/my/account','2023-10-16 09:53:01'),(67,'login_required','1','2023-10-19 18:34:59'),(68,'autologin','0','2023-10-19 18:34:59'),(69,'self_registration','2','2023-10-19 18:34:59'),(70,'show_custom_fields_on_registration','1','2023-10-19 18:34:59'),(71,'password_min_length','8','2023-10-19 18:34:59'),(72,'password_required_char_classes','--- []\n','2023-10-19 18:34:59'),(73,'password_max_age','0','2023-10-19 18:34:59'),(74,'lost_password','1','2023-10-19 18:34:59'),(75,'twofa','1','2023-10-19 18:34:59'),(76,'session_lifetime','0','2023-10-19 18:34:59'),(77,'session_timeout','0','2023-10-19 18:34:59'),(78,'plugin_onlyoffice_redmine','--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\noo_address: http://192.168.0.102:8080/\ninner_editor: \'\'\ninner_server: \'\'\njwtsecret: LpuPNLBDNzdWS3crEIAyopYtuKYPxQTi\njwtheader: \'\'\neditor_chat: \'on\'\neditor_compact_header: \'on\'\neditor_feedback: \'on\'\neditor_help: \'on\'\neditor_toolbar_no_tabs: \'on\'\n','2023-10-21 20:22:28');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_entries`
--

DROP TABLE IF EXISTS `time_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_entries`
--

LOCK TABLES `time_entries` WRITE;
/*!40000 ALTER TABLE `time_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_value` (`value`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (3,1,'feeds','3343431c6f3e7407e73f64b5e0d41edd9dd01d07','2023-10-11 21:37:33','2023-10-11 18:37:33'),(15,5,'feeds','9da7a62fcb9f87275eb3e5a3b72e4176a7463d10','2023-10-16 09:16:34','2023-10-16 06:16:34'),(21,5,'session','14bf32319c315c1e9eafa64a042cb7a91ef0d7e9','2023-10-16 13:08:50','2023-10-16 10:13:55'),(34,14,'session','80a9e5bc73440e089a904d84f4f42059374865dc','2023-10-21 23:14:14','2023-10-21 20:14:14'),(35,14,'session','8c0c58b28957749adc1fe1ec4bdda5ce17bb4c7d','2023-10-21 23:14:50','2023-10-21 20:14:50'),(36,14,'session','df7068f99d491fb24127455b40b156bc10dc6d81','2023-10-21 23:14:56','2023-10-21 20:38:25'),(37,14,'session','4d30db80a2adbb92108cca92ca508d2a9a82a4aa','2023-10-21 23:14:58','2023-10-21 20:14:58'),(38,1,'session','8af14d3bca22987b9bc78398c3a847b552c6fbc9','2023-10-21 23:15:24','2023-10-21 20:25:49'),(42,14,'session','312046d48c3c325444e83aa0261cf246f6484e72','2023-10-21 23:18:21','2023-10-21 20:18:21'),(43,14,'session','b86b38ed052d3a7aba012bc6d38a15d5024ea057','2023-10-21 23:18:40','2023-10-21 20:18:40'),(44,14,'session','7cfd5e593754c68cf5fc8ea1a4ff848b311ca375','2023-10-21 23:18:57','2023-10-21 20:18:57'),(45,14,'session','1ef8addc199291d320a97c043bc60bd4a392b61e','2023-10-21 23:19:13','2023-10-21 20:19:13'),(46,1,'session','37b296622a290b91b4a36c3394c39808d76d92b2','2023-10-21 23:19:53','2023-10-21 20:19:53'),(47,1,'session','b500305f870c0342aacfd19b9204db50e4acf3d3','2023-10-21 23:20:13','2023-10-21 20:20:13'),(48,1,'session','b17299893b7b382ec2b0da5aea453253706549d4','2023-10-21 23:22:55','2023-10-21 20:22:55'),(49,1,'session','7b392b6b756e71958ff797fe943b4d4c27a13f7b','2023-10-21 23:23:15','2023-10-21 20:23:15'),(50,1,'session','4a2884d4078026faad2a9111a3f97c92c0811495','2023-10-21 23:23:16','2023-10-21 20:23:16'),(51,1,'session','5c634af4791aa91eff8c33ff84cdb85479f39363','2023-10-21 23:24:20','2023-10-21 20:24:20'),(52,14,'session','e872fef10fb1077882d422935a33b7a505486873','2023-10-21 23:24:28','2023-10-21 20:24:28'),(53,1,'session','e583a4318d9709a97c2607045976c0df39af0ec7','2023-10-21 23:25:53','2023-10-21 20:25:53'),(54,1,'session','ea7633de84fb21944d55c6987bcf9bd2d7d28361','2023-10-21 23:31:32','2023-10-21 20:31:32'),(55,14,'session','ffe98aa4999c5236b6f7b2c51825148bd81dc033','2023-10-21 23:31:41','2023-10-21 20:31:41'),(56,14,'feeds','5ed3301cdca09b2a1cf0b103c1e7760ad2ecb69a','2023-10-21 23:39:03','2023-10-21 20:39:03'),(57,1,'session','c07b370fb91ae446684f0d9ac4ac1624d2f2d075','2023-10-22 13:13:32','2023-10-22 11:31:47');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int(11) DEFAULT '0',
  `default_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (1,'Critical Bug','',1,0,0,1),(2,'Feature',NULL,2,1,0,1),(3,'Support',NULL,3,0,0,1);
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `others` text COLLATE utf8mb4_unicode_ci,
  `hide_mail` tinyint(1) DEFAULT '1',
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:notify_about_high_priority_issues: \'0\'\n:recently_used_project_ids: \'1,3,4\'\n:gantt_zoom: 2\n:gantt_months: 6\n:activity_scope:\n- issues\n- changesets\n- news\n- documents\n- files\n- wiki_edits\n- messages\n- time_entries\n',1,'Kyiv'),(2,5,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:notify_about_high_priority_issues: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'3,1,2\'\n:gantt_zoom: 2\n:gantt_months: 6\n',1,'Kyiv'),(3,6,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n',1,''),(4,13,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:notify_about_high_priority_issues: \'1\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n',1,'Kyiv'),(5,14,'---\n:no_self_notified: \'1\'\n:auto_watch_on:\n- \'\'\n- issue_contributed_to\n:notify_about_high_priority_issues: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n:textarea_font: \'\'\n:recently_used_projects: 3\n:history_default_tab: notes\n:toolbar_language_options: c,cpp,csharp,css,diff,go,groovy,html,java,javascript,objc,perl,php,python,r,ruby,sass,scala,shell,sql,swift,xml,yaml\n:default_issue_query: \'\'\n:default_project_query: \'\'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: \'1\'\n:activity_scope:\n- documents\n',1,'Kyiv');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hashed_password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_notification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT '0',
  `passwd_changed_on` datetime DEFAULT NULL,
  `twofa_scheme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twofa_totp_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twofa_totp_last_used_at` int(11) DEFAULT NULL,
  `twofa_required` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adminBKP','5213baae0c8ba334493e4999caf588177656a9bb','Administrator','Redmine',1,1,'2023-10-22 13:13:32','uk',NULL,'2023-10-11 18:35:27','2023-10-12 10:26:58','User','all','dee0ffb109c8105b4acb8d9dbcc84b5b',0,'2023-10-11 21:35:59',NULL,NULL,NULL,0),(2,'','','','Anonymous users',0,1,NULL,'',NULL,'2023-10-11 18:35:32','2023-10-11 18:35:32','GroupAnonymous','',NULL,0,NULL,NULL,NULL,NULL,0),(3,'','','','Non member users',0,1,NULL,'',NULL,'2023-10-11 18:35:32','2023-10-11 18:35:32','GroupNonMember','',NULL,0,NULL,NULL,NULL,NULL,0),(4,'','','','Anonymous',0,0,NULL,'',NULL,'2023-10-11 18:35:39','2023-10-11 18:35:39','AnonymousUser','only_my_events',NULL,0,NULL,NULL,NULL,NULL,0),(5,'VIzdebsky','50bc764e4b7eb865b5643f319703c1834d040300','Володимир','Іздебський',1,1,'2023-10-16 13:08:50','ru',NULL,'2023-10-11 18:40:13','2023-10-16 06:29:51','User','only_my_events','cae9e53cfdd736147eb157cdbbb713e2',0,'2023-10-16 09:14:53',NULL,NULL,NULL,0),(6,'RKotelevits','68cce7839517ecbd735c2c782f7b8e97d93cacd4','Роман','Котєлєвіц',1,1,NULL,'ru',NULL,'2023-10-11 18:41:20','2023-10-11 18:41:20','User','only_my_events','367a55abcb6f3687ff155e6f5576ba8f',1,'2023-10-11 21:41:20',NULL,NULL,NULL,0),(7,'','','','BKP Support',0,1,NULL,'',NULL,'2023-10-11 21:10:29','2023-10-16 07:15:46','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(8,'','','','Navis Team',0,1,NULL,'',NULL,'2023-10-16 07:13:37','2023-10-16 07:13:37','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(9,'','','','BKP Yard',0,1,NULL,'',NULL,'2023-10-16 07:13:44','2023-10-16 07:13:44','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(10,'','','','BKP Stevedors',0,1,NULL,'',NULL,'2023-10-16 07:13:55','2023-10-16 07:13:55','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(11,'','','','BKP Documentation Department',0,1,NULL,'',NULL,'2023-10-16 07:15:26','2023-10-16 07:15:26','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(12,'','','','BKP IT',0,1,NULL,'',NULL,'2023-10-16 07:16:10','2023-10-16 07:16:10','Group','',NULL,0,NULL,NULL,NULL,NULL,0),(13,'msaenko','2ba96a8512034a1e5d0b174e35e72c6d1a973e61','Максим','Саенко',1,1,NULL,'ru',NULL,'2023-10-16 09:51:34','2023-10-16 10:13:03','User','only_my_events','6906bcc9fd143afd7dde0d45eea79509',0,'2023-10-16 12:51:34',NULL,NULL,NULL,0),(14,'srozhko','bd4bf352f6b8a316b2ad971d55ab919ce53721d8','Serhii','Rozhko',1,1,'2023-10-21 23:14:56','uk',NULL,'2023-10-21 20:04:26','2023-10-21 20:38:55','User','only_my_events','d0640ba65b1e2f0594a252d0df4ee00c',0,'2023-10-21 23:04:26',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `wiki_page_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'open',
  `sharing` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,'Navis_V.1','','2023-10-15','2023-10-15 13:23:20','2023-10-15 13:23:20','','open','system');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchers`
--

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
INSERT INTO `watchers` VALUES (1,'Issue',1,1);
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_content_versions`
--

DROP TABLE IF EXISTS `wiki_content_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_content_versions`
--

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
INSERT INTO `wiki_content_versions` VALUES (1,1,1,5,_binary 'h1. Налаштування тестового середовища. \r\nh2. Налаштування з\'єднання\r\n\r\nN4 URLs : http://10.0.1.100:9081/apex/\r\nN4 ULC Client : http://10.0.1.100:9081/apex/apex.jnlp\r\nN4 HTML : http://10.0.1.100:9081/apex/N4.zul\r\n\r\nN4 application Credentials : admin/admin\r\nXPS Client Credentials : admin/please\r\n\r\n\r\n','','','2023-10-16 09:37:22',1),(2,1,1,5,_binary 'h1. Налаштування тестового середовища. \r\nh2. Налаштування з\'єднання\r\n\r\nN4 URLs : http://10.0.1.100:9081/apex/\r\nN4 ULC Client : http://10.0.1.100:9081/apex/apex.jnlp\r\nN4 HTML : http://10.0.1.100:9081/apex/N4.zul\r\n\r\nN4 application Credentials : admin/admin\r\nXPS Client Credentials : admin/please\r\n\r\nСистема навчання Невіс\r\nhttps://navis.csod.com/client/navis/default.aspx\r\n\r\n\r\n','','','2023-10-16 10:11:15',2),(3,1,1,5,_binary 'h1. Налаштування тестового середовища. \r\nh2. Налаштування з\'єднання\r\n\r\nN4 URLs : http://10.0.1.100:9081/apex/\r\nN4 ULC Client : http://10.0.1.100:9081/apex/apex.jnlp\r\nN4 HTML : http://10.0.1.100:9081/apex/N4.zul\r\n\r\nСистема навчання Невіс\r\nhttps://navis.csod.com/client/navis/default.aspx\r\n\r\n\r\n','','','2023-10-16 10:11:28',3),(4,1,1,5,_binary 'h1. Налаштування тестового середовища. \r\n\r\nh2. Налаштування з\'єднання\r\n\r\nN4 URLs : http://10.0.1.100:9081/apex/\r\nN4 ULC Client : http://10.0.1.100:9081/apex/apex.jnlp\r\nN4 HTML : http://10.0.1.100:9081/apex/N4.zul\r\n\r\nСистема навчання Невіс\r\nhttps://navis.csod.com/client/navis/default.aspx\r\n\r\n\r\n','','','2023-10-16 10:12:14',4),(5,1,1,5,_binary 'h1. Налаштування тестового середовища\r\n\r\nh2. Налаштування з\'єднання\r\n\r\nN4 URLs : http://10.0.1.100:9081/apex/\r\nN4 ULC Client : http://10.0.1.100:9081/apex/apex.jnlp\r\nN4 HTML : http://10.0.1.100:9081/apex/N4.zul\r\n\r\nСистема навчання Невіс\r\nhttps://navis.csod.com/client/navis/default.aspx\r\n\r\n\r\n','','','2023-10-16 10:12:24',5);
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_contents`
--

DROP TABLE IF EXISTS `wiki_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  `comments` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_contents`
--

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
INSERT INTO `wiki_contents` VALUES (1,1,5,'h1. Налаштування тестового середовища\r\n\r\nh2. Налаштування з\'єднання\r\n\r\nN4 URLs : http://10.0.1.100:9081/apex/\r\nN4 ULC Client : http://10.0.1.100:9081/apex/apex.jnlp\r\nN4 HTML : http://10.0.1.100:9081/apex/N4.zul\r\n\r\nСистема навчання Невіс\r\nhttps://navis.csod.com/client/navis/default.aspx\r\n\r\n\r\n','','2023-10-16 10:12:24',5);
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
INSERT INTO `wiki_pages` VALUES (1,1,'Wiki','2023-10-16 09:37:22',0,NULL);
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_redirects`
--

DROP TABLE IF EXISTS `wiki_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirects_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `redirects_to_wiki_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_redirects`
--

LOCK TABLES `wiki_redirects` WRITE;
/*!40000 ALTER TABLE `wiki_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikis`
--

DROP TABLE IF EXISTS `wikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikis`
--

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1),(3,3,'Wiki',1),(4,4,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`),
  KEY `index_workflows_on_tracker_id` (`tracker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (1,1,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(2,1,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(3,1,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(4,1,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(5,1,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(6,1,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(7,1,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(8,1,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(9,1,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(10,1,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(11,1,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(12,1,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(13,1,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(14,1,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(15,1,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(16,1,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(17,1,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(18,1,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(19,1,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(20,1,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(21,1,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(22,1,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(23,1,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(24,1,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(25,1,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(26,1,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(27,1,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(28,1,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(29,1,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(30,1,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(31,2,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(32,2,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(33,2,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(34,2,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(35,2,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(36,2,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(37,2,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(38,2,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(39,2,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(40,2,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(41,2,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(42,2,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(43,2,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(44,2,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(45,2,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(46,2,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(47,2,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(48,2,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(49,2,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(50,2,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(51,2,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(52,2,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(53,2,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(54,2,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(55,2,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(56,2,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(57,2,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(58,2,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(59,2,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(60,2,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(61,3,1,2,3,0,0,'WorkflowTransition',NULL,NULL),(62,3,1,3,3,0,0,'WorkflowTransition',NULL,NULL),(63,3,1,4,3,0,0,'WorkflowTransition',NULL,NULL),(64,3,1,5,3,0,0,'WorkflowTransition',NULL,NULL),(65,3,1,6,3,0,0,'WorkflowTransition',NULL,NULL),(66,3,2,1,3,0,0,'WorkflowTransition',NULL,NULL),(67,3,2,3,3,0,0,'WorkflowTransition',NULL,NULL),(68,3,2,4,3,0,0,'WorkflowTransition',NULL,NULL),(69,3,2,5,3,0,0,'WorkflowTransition',NULL,NULL),(70,3,2,6,3,0,0,'WorkflowTransition',NULL,NULL),(71,3,3,1,3,0,0,'WorkflowTransition',NULL,NULL),(72,3,3,2,3,0,0,'WorkflowTransition',NULL,NULL),(73,3,3,4,3,0,0,'WorkflowTransition',NULL,NULL),(74,3,3,5,3,0,0,'WorkflowTransition',NULL,NULL),(75,3,3,6,3,0,0,'WorkflowTransition',NULL,NULL),(76,3,4,1,3,0,0,'WorkflowTransition',NULL,NULL),(77,3,4,2,3,0,0,'WorkflowTransition',NULL,NULL),(78,3,4,3,3,0,0,'WorkflowTransition',NULL,NULL),(79,3,4,5,3,0,0,'WorkflowTransition',NULL,NULL),(80,3,4,6,3,0,0,'WorkflowTransition',NULL,NULL),(81,3,5,1,3,0,0,'WorkflowTransition',NULL,NULL),(82,3,5,2,3,0,0,'WorkflowTransition',NULL,NULL),(83,3,5,3,3,0,0,'WorkflowTransition',NULL,NULL),(84,3,5,4,3,0,0,'WorkflowTransition',NULL,NULL),(85,3,5,6,3,0,0,'WorkflowTransition',NULL,NULL),(86,3,6,1,3,0,0,'WorkflowTransition',NULL,NULL),(87,3,6,2,3,0,0,'WorkflowTransition',NULL,NULL),(88,3,6,3,3,0,0,'WorkflowTransition',NULL,NULL),(89,3,6,4,3,0,0,'WorkflowTransition',NULL,NULL),(90,3,6,5,3,0,0,'WorkflowTransition',NULL,NULL),(91,1,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(92,1,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(93,1,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(94,1,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(95,1,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(96,1,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(97,1,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(98,1,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(99,1,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(100,1,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(101,1,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(102,1,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(103,1,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(104,2,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(105,2,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(106,2,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(107,2,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(108,2,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(109,2,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(110,2,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(111,2,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(112,2,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(113,2,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(114,2,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(115,2,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(116,2,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(117,3,1,2,4,0,0,'WorkflowTransition',NULL,NULL),(118,3,1,3,4,0,0,'WorkflowTransition',NULL,NULL),(119,3,1,4,4,0,0,'WorkflowTransition',NULL,NULL),(120,3,1,5,4,0,0,'WorkflowTransition',NULL,NULL),(121,3,2,3,4,0,0,'WorkflowTransition',NULL,NULL),(122,3,2,4,4,0,0,'WorkflowTransition',NULL,NULL),(123,3,2,5,4,0,0,'WorkflowTransition',NULL,NULL),(124,3,3,2,4,0,0,'WorkflowTransition',NULL,NULL),(125,3,3,4,4,0,0,'WorkflowTransition',NULL,NULL),(126,3,3,5,4,0,0,'WorkflowTransition',NULL,NULL),(127,3,4,2,4,0,0,'WorkflowTransition',NULL,NULL),(128,3,4,3,4,0,0,'WorkflowTransition',NULL,NULL),(129,3,4,5,4,0,0,'WorkflowTransition',NULL,NULL),(130,1,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(131,1,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(132,1,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(133,1,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(134,1,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(135,2,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(136,2,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(137,2,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(138,2,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(139,2,3,4,5,0,0,'WorkflowTransition',NULL,NULL),(140,3,1,5,5,0,0,'WorkflowTransition',NULL,NULL),(141,3,2,5,5,0,0,'WorkflowTransition',NULL,NULL),(142,3,3,5,5,0,0,'WorkflowTransition',NULL,NULL),(143,3,4,5,5,0,0,'WorkflowTransition',NULL,NULL),(144,3,3,4,5,0,0,'WorkflowTransition',NULL,NULL);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-23 21:41:40
