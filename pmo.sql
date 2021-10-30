/*
  create new database
*/


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `pmo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pmo`;

DROP TABLE IF EXISTS `activities`;
CREATE TABLE IF NOT EXISTS `activities` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `resources`;
CREATE TABLE IF NOT EXISTS `resources` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `type` enum('fe','be') NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `work`;
CREATE TABLE IF NOT EXISTS `work` (
  `id_activity` bigint(20) UNSIGNED NOT NULL,
  `id_resource` bigint(20) UNSIGNED NOT NULL,
  `type` enum('baseline','extra') NOT NULL DEFAULT 'baseline',
  `effort` float NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `id` (`id`),
  KEY `id_activity` (`id_activity`),
  KEY `id_resource` (`id_resource`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;


ALTER TABLE `work`
  ADD CONSTRAINT `work_ibfk_1` FOREIGN KEY (`id_activity`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `work_ibfk_2` FOREIGN KEY (`id_resource`) REFERENCES `resources` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
