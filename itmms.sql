-- -------------------------------------------------------------
-- TablePlus 5.9.2(542)
--
-- https://tableplus.com/
--
-- Database: itmms
-- Generation Time: 2024-03-31 15:07:10.3760
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `classrooms`;
CREATE TABLE `classrooms` (
  `classroom_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `cluster_id` int(11) NOT NULL,
  PRIMARY KEY (`classroom_id`),
  KEY `room_id` (`room_id`),
  KEY `cluster_id` (`cluster_id`),
  CONSTRAINT `classrooms_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE,
  CONSTRAINT `classrooms_ibfk_2` FOREIGN KEY (`cluster_id`) REFERENCES `clusters` (`cluster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `clusters`;
CREATE TABLE `clusters` (
  `cluster_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `cluster_code` varchar(255) NOT NULL,
  `cluster_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`cluster_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `clusters_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `computer_designation`;
CREATE TABLE `computer_designation` (
  `computer_id` int(11) NOT NULL,
  `designation_type` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `workstation_no` int(11) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `date_assigned` varchar(255) NOT NULL,
  PRIMARY KEY (`computer_id`),
  CONSTRAINT `computer_designation_ibfk_1` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`computer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `computer_parts`;
CREATE TABLE `computer_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computer_id` int(11) NOT NULL,
  `parts_name` varchar(255) NOT NULL,
  `parts_type` varchar(255) NOT NULL,
  `depreciation_value` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `computer_part` (`computer_id`),
  CONSTRAINT `computer_part` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`computer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `computer_resources`;
CREATE TABLE `computer_resources` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `order` int(11) NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `computers`;
CREATE TABLE `computers` (
  `computer_id` int(11) NOT NULL AUTO_INCREMENT,
  `computer_name` varchar(255) NOT NULL,
  `computer_type` varchar(255) NOT NULL,
  `brand_clone_name` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`computer_id`),
  UNIQUE KEY `computer_name` (`computer_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `itmms_sessions`;
CREATE TABLE `itmms_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` int(11) NOT NULL,
  `computer_name` varchar(255) NOT NULL,
  `activities` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_no` (`room_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `service_order`;
CREATE TABLE `service_order` (
  `ref_no` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) NOT NULL,
  `emp_name` varchar(255) NOT NULL,
  `cluster_id` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `complaint_resource_id` int(11) NOT NULL,
  `complaint_details` varchar(255) NOT NULL,
  `computer_name` varchar(255) NOT NULL,
  `if_pulled_out` tinyint(1) NOT NULL,
  `is_urgent` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ref_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `service_order_acceptance`;
CREATE TABLE `service_order_acceptance` (
  `ref_no` int(11) NOT NULL,
  `received_by` varchar(255) DEFAULT NULL,
  `assigned_to` int(255) NOT NULL,
  `designate_to` int(225) DEFAULT NULL,
  `date_reported` varchar(255) NOT NULL,
  `time_reported` varchar(255) NOT NULL,
  PRIMARY KEY (`ref_no`),
  CONSTRAINT `service_order_acceptance_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `service_order` (`ref_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `service_order_completion`;
CREATE TABLE `service_order_completion` (
  `ref_no` int(11) NOT NULL,
  `date_finished` varchar(255) DEFAULT NULL,
  `time_finished` varchar(255) DEFAULT NULL,
  `date_replaced` varchar(2555) NOT NULL,
  `time_replaced` varchar(255) NOT NULL,
  `completed_by` int(11) NOT NULL,
  `unit_status` varchar(255) NOT NULL DEFAULT 'under repair',
  `action_taken` varchar(255) DEFAULT NULL,
  `returned_to` varchar(255) DEFAULT NULL,
  `property_clerk` varchar(255) DEFAULT NULL,
  `property_date_received` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'received',
  `part_id` int(11) DEFAULT NULL COMMENT 'ID of the part that is replaced',
  PRIMARY KEY (`ref_no`),
  KEY `part_id` (`part_id`),
  CONSTRAINT `service_order_completion_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `service_order` (`ref_no`) ON DELETE CASCADE,
  CONSTRAINT `service_order_completion_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `computer_parts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `service_order_timeline`;
CREATE TABLE `service_order_timeline` (
  `ref_no` int(11) NOT NULL,
  `if_inverted` tinyint(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ref_no`),
  CONSTRAINT `service_order_timeline_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `service_order` (`ref_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `access_rights` varchar(255) DEFAULT NULL,
  `cluster_id` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'assets/images/avatars/default_profile.png',
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `contact_no` varchar(255) DEFAULT NULL,
  `last_login` varchar(255) DEFAULT NULL,
  `if_pass_changed` tinyint(4) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

INSERT INTO `classrooms` (`classroom_id`, `room_id`, `type`, `cluster_id`) VALUES
(1, 2, 'lecture', 1);

INSERT INTO `clusters` (`cluster_id`, `room_id`, `cluster_code`, `cluster_name`, `type`) VALUES
(1, 1, 'TSG', 'Technical Support Group', 'office');

INSERT INTO `computer_designation` (`computer_id`, `designation_type`, `designation`, `workstation_no`, `assigned_to`, `date_assigned`) VALUES
(1, 'lecture', 'ST101', -1, '', '2024-03-30'),
(2, 'lecture', 'ST101', 0, '', '2024-03-31');

INSERT INTO `computer_parts` (`id`, `computer_id`, `parts_name`, `parts_type`, `depreciation_value`, `date_created`) VALUES
(1, 1, 'Computer Set', 'Computer Set', '6 months', '2024-03-01 12:00:00'),
(2, 2, 'Monitor', 'Monitor', '3 years', '2024-03-30 20:48:05'),
(4, 1, 'Hard Drive', 'Hard Drive', '6 months', '2024-03-31 03:48:20'),
(6, 1, 'Motherboard', 'Motherboard', '6 months', '2024-03-31 14:48:54');

INSERT INTO `computer_resources` (`resource_id`, `resource_name`, `type`, `date_added`, `order`) VALUES
(2, 'Autodesk', 'software', '2024-03-07 09:00:54', 0),
(6, 'Uninterruptible Power Supply', 'hardware', '2024-03-14 10:58:38', 9),
(7, 'Personal Computer', 'hardware', '2024-03-24 17:51:58', 1),
(8, 'Printer', 'hardware', '2024-03-24 17:53:00', 2),
(9, 'Smart TV', 'hardware', '2024-03-24 17:53:00', 6),
(10, 'Router', 'hardware', '2024-03-24 17:53:00', 3),
(11, 'Switch', 'hardware', '2024-03-30 23:07:20', 4),
(12, 'Access Point', 'hardware', '2024-03-30 23:07:20', 5),
(13, 'Camera', 'hardware', '2024-03-30 23:07:20', 7),
(14, 'Network Video Recorder', 'hardware', '2024-03-30 23:07:20', 8);

INSERT INTO `computers` (`computer_id`, `computer_name`, `computer_type`, `brand_clone_name`, `date_added`) VALUES
(1, 'ST101-001', 'Branded', 'Test', '2024-03-30 23:19:08'),
(2, 'ST10100', 'Tv', 'Smart Tv', '2024-03-31 02:17:09');

INSERT INTO `itmms_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('000199fd3566bc8b0013788fef6b9aa410f1254d', '::1', 1711629524, '__ci_last_regenerate|i:1711629524;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('04b303885fdb0d7c0d6354f37412e81b0c6b01d6', '::1', 1711811759, '__ci_last_regenerate|i:1711811759;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('0658fe2f37cc938c59b67ae8fe7d9441ce6ca91b', '::1', 1711834120, '__ci_last_regenerate|i:1711834120;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('0c7aff7546191d2b6504d69db101f0594fcec730', '::1', 1711824465, '__ci_last_regenerate|i:1711824465;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('11ccbc2034c584378bf4eff1b817499a60332ec6', '::1', 1711630205, '__ci_last_regenerate|i:1711630205;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('1878d651747b639f570f7699ed18b560830df593', '::1', 1711827586, '__ci_last_regenerate|i:1711827586;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('19f656b98b6fd518a890aaefdacd76ec097271f9', '::1', 1711822248, '__ci_last_regenerate|i:1711822248;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('1a4b822741d13c775f775fe7f2189735152c7d7f', '::1', 1711633230, '__ci_last_regenerate|i:1711633230;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('217edb699cd0f6a789141c040a2ab4904f22c718', '::1', 1711827955, '__ci_last_regenerate|i:1711827955;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('27921f1519109306e96eb11318bce2dfa62eceee', '::1', 1711823823, '__ci_last_regenerate|i:1711823823;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('301843714744f8f77895a8d2a3236afcdf4bfd27', '::1', 1711604073, '__ci_last_regenerate|i:1711604073;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('39d771a6b828120feb514b6db440202745c8c18b', '::1', 1711866404, '__ci_last_regenerate|i:1711866404;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('3a0021d4ae1af3ba4406b6b966d79a8b706239fa', '::1', 1711633771, '__ci_last_regenerate|i:1711633532;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('40df525ae8e41c993cb53f59837581f8594d5cb4', '::1', 1711831301, '__ci_last_regenerate|i:1711831301;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('48a2400aebf686c892804bd82245288d8c0a4c49', '::1', 1711863722, '__ci_last_regenerate|i:1711863722;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('4b328383d7b72141da59cd1feadd8cf202daace8', '::1', 1711812441, '__ci_last_regenerate|i:1711812441;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('4ff20b2db2054385c2f6e4bd8b815bad811eaf9b', '::1', 1711811442, '__ci_last_regenerate|i:1711811442;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('55409a8adc9581f4ecfbda81ae4571579867d5b8', '::1', 1711631115, '__ci_last_regenerate|i:1711631115;'),
('59216ead64c6ae984bb2110628d20f45870dd68b', '::1', 1711833482, '__ci_last_regenerate|i:1711833482;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('5b2dfb95f78339b0a584428ef9e115901d99b694', '::1', 1711861100, '__ci_last_regenerate|i:1711861100;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('5d74db4545701da71fddeccabbbeaaae4d01a6a3', '::1', 1711832061, '__ci_last_regenerate|i:1711832061;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('60b05bba0519b7bcb384d3a42188eecefe63d54b', '::1', 1711865195, '__ci_last_regenerate|i:1711865195;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('6429aa6f5b3a8d3d376933857e47e1165fea80b5', '::1', 1711866721, '__ci_last_regenerate|i:1711866721;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('65a0238f9318f70dbfa15a543cb14fc918e2191f', '::1', 1711633532, '__ci_last_regenerate|i:1711633532;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('65a8f1f99e577c1386d0dc4f1d9e9cfcfb26aa89', '::1', 1711864866, '__ci_last_regenerate|i:1711864866;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('6d941b98134e89c91dd4d086c7b683ce3230dac2', '::1', 1711866000, '__ci_last_regenerate|i:1711866000;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('713c1ebd96f958b3918b04be3fbffa67cf503b6f', '::1', 1711629839, '__ci_last_regenerate|i:1711629839;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('76915bc0b0a99f8d9efd392183d353ee8fd02564', '::1', 1711868664, '__ci_last_regenerate|i:1711868578;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('7e0186ef75a72e6abe0115682aa42adc8c7b94b5', '::1', 1711864513, '__ci_last_regenerate|i:1711864513;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('7fdf61d0703014085370b1fb61cf7ca950f6e344', '::1', 1711868273, '__ci_last_regenerate|i:1711868273;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('813f081dbbcd169aaa3a268b9793a829d22ede2b', '::1', 1711810462, '__ci_last_regenerate|i:1711810462;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('85cb8346c0b8535dd5ff7b5d330281eb2f5d0516', '::1', 1711867079, '__ci_last_regenerate|i:1711867079;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('861115bf80657259399332722986a824e1dab0d4', '::1', 1711833785, '__ci_last_regenerate|i:1711833785;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('868681856daa500bfd80f2ad9d8f6f609769b5c9', '::1', 1711822557, '__ci_last_regenerate|i:1711822557;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('87b732f1052bf7f7d5c604f8da6e093b1db8ebc4', '::1', 1711631467, '__ci_last_regenerate|i:1711631467;'),
('8b8be3b8dc3e02dbc4ef0ca5e62e8f1c5fd8fe28', '::1', 1711868578, '__ci_last_regenerate|i:1711868578;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('8f6bd9f2945a46b86c9a4678a2ed2287ee1d6d8a', '::1', 1711867613, '__ci_last_regenerate|i:1711867613;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('9687de4178eeacfaccba720ad9dbf11e479fbd4e', '::1', 1711863412, '__ci_last_regenerate|i:1711863412;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('9ec4d35c8adead40f6f2d864f989c991f5330609', '::1', 1711861501, '__ci_last_regenerate|i:1711861501;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('a23236ab67b4ea2182a887dbed3c86b6b573f678', '::1', 1711820967, '__ci_last_regenerate|i:1711820967;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('a6ad5672f82e6656b1bf390a54bac29844df4712', '::1', 1711604810, '__ci_last_regenerate|i:1711604810;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('ae47066c7171e9d5c927129669ff17534a9a2e6a', '::1', 1711867951, '__ci_last_regenerate|i:1711867951;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('b801b93d7070aeb07baa3a6e41096554adbedbaf', '::1', 1711810023, '__ci_last_regenerate|i:1711810023;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('b8e2263a9ed47c32c8fe8bb3283ee8f442215a4b', '::1', 1711831752, '__ci_last_regenerate|i:1711831752;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('b9b4e24107620073ef3322efdad8c47eff3009f1', '::1', 1711829245, '__ci_last_regenerate|i:1711829245;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('bbe05fb946575e1a970f8a415be9204e26e6f2b5', '::1', 1711631838, '__ci_last_regenerate|i:1711631838;'),
('bd361d0ee17ee763d084bb94dcefe6e53a360c3a', '::1', 1711830709, '__ci_last_regenerate|i:1711830709;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('c1c643c6f0069cffe8fce8ca052306cfb340c080', '::1', 1711832423, '__ci_last_regenerate|i:1711832423;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('c1cf09a3ab604f5a69d331e827dfffa46b0199e9', '::1', 1711824154, '__ci_last_regenerate|i:1711824154;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('c73c52b5e99d375ff47655234da2d3d03ea3a892', '::1', 1711821862, '__ci_last_regenerate|i:1711821862;'),
('d16e6723167c9d2e698a135e6ce6475dd869a257', '::1', 1711821944, '__ci_last_regenerate|i:1711821944;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('d1e973d5ecc39db9cc2cacfbb33c77e886b9af72', '::1', 1711630544, '__ci_last_regenerate|i:1711630544;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('d8122cb1644a9c8f8aec1be06bf8a2346c3c46fb', '::1', 1711810769, '__ci_last_regenerate|i:1711810769;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('e2897d76ef09028d00f03209ef4e13469e073507', '::1', 1711603748, '__ci_last_regenerate|i:1711603748;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('e56b352265f3c4364234a37a876967727fb415f5', '::1', 1711827219, '__ci_last_regenerate|i:1711827219;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('e5d06feb70ae8b4204fb5d5d12fe38b11e7ca396', '::1', 1711833171, '__ci_last_regenerate|i:1711833171;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('e809c0ed8a1b24853e4f1d808aaa996bc0abacd1', '::1', 1711829900, '__ci_last_regenerate|i:1711829900;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('e9a41913cbafdb96f129282a269a032fb099fb4a', '::1', 1711824896, '__ci_last_regenerate|i:1711824896;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('eb93c47a548ce3c81dcea7c47af024d901078ff2', '::1', 1711825253, '__ci_last_regenerate|i:1711825253;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('eda413d893eeb2f54dd5c08b8278db9ca8ea6e50', '::1', 1711865670, '__ci_last_regenerate|i:1711865670;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('f4a0b6d527ba6a4235c28cf9cf8b4c78c1672739', '::1', 1711830218, '__ci_last_regenerate|i:1711830218;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('f90205a4411f8e650a118438cd5bd618622ac130', '::1', 1711604439, '__ci_last_regenerate|i:1711604439;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('fa8ecb0c6b1c1e4e94e5b0d88501a9d514c8451b', '::1', 1711832862, '__ci_last_regenerate|i:1711832862;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('fc5aa40ee8517b1f0b9908120bc172cd312272cc', '::1', 1711809712, '__ci_last_regenerate|i:1711809712;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;');

INSERT INTO `logs` (`id`, `ref_no`, `computer_name`, `activities`, `date_added`) VALUES
(1, 1, 'ST101-001', 'Jonathan  Pacana added new Service Order', '2024-03-30 23:28:59'),
(2, 1, 'ST101-001', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 01:53:23'),
(3, 1, 'ST101-001', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 02:08:01'),
(4, 1, 'ST101-001', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 02:08:07'),
(5, 1, 'ST101-001', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 02:10:09'),
(6, 4, 'ST101-001', 'Jonathan  Pacana added new Service Order', '2024-03-31 02:13:42'),
(7, 5, 'ST10100', 'Jonathan  Pacana added new Service Order', '2024-03-31 02:37:43'),
(8, 4, 'ST101-001', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 03:34:31'),
(9, 5, 'ST10100', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 03:37:25'),
(10, 6, 'ST10100', 'Jonathan  Pacana added new Service Order', '2024-03-31 03:40:03'),
(11, 6, 'ST10100', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 03:40:21'),
(12, 7, 'ST10100', 'Jonathan  Pacana added new Service Order', '2024-03-31 03:41:50'),
(13, 7, 'ST10100', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 03:42:18'),
(14, 7, 'ST10100', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 03:43:19'),
(15, 7, 'ST10100', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 03:44:10'),
(16, 7, 'ST10100', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 03:46:12'),
(17, 8, 'ST101-001', 'Jonathan  Pacana added new Service Order', '2024-03-31 03:46:55'),
(18, 8, 'ST101-001', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 03:47:16'),
(19, 7, 'ST10100', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 03:48:05'),
(20, 8, 'ST101-001', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 03:48:20'),
(21, 9, 'ST101-001', 'Jonathan  Pacana added new Service Order', '2024-03-31 14:47:29'),
(22, 9, 'ST101-001', 'Jonathan  Pacana forwarded a service order to property', '2024-03-31 14:48:54');

INSERT INTO `rooms` (`room_id`, `room_no`, `date_added`) VALUES
(1, 'ST BUILDING', '2024-03-30 23:12:25'),
(2, 'ST101', '2024-03-30 23:17:29');

INSERT INTO `service_order` (`ref_no`, `emp_id`, `emp_name`, `cluster_id`, `position`, `contact_no`, `complaint_resource_id`, `complaint_details`, `computer_name`, `if_pulled_out`, `is_urgent`, `date_added`) VALUES
(7, '213', '123', 1, '123', '123', 9, 'No Power', 'ST10100', 0, 0, '2024-03-31 03:41:50'),
(8, '123', '123', 1, '123', '123', 7, 'Disk Boot Failure', 'ST101-001', 0, 0, '2024-03-31 03:46:55'),
(9, 'test', '123', 1, 'Andrew', '123', 7, 'Hang-up', 'ST101-001', 0, 0, '2024-03-31 14:47:29');

INSERT INTO `service_order_acceptance` (`ref_no`, `received_by`, `assigned_to`, `designate_to`, `date_reported`, `time_reported`) VALUES
(7, NULL, 0, NULL, '2024-03-31', '3:41 AM'),
(8, NULL, 0, NULL, '2024-03-31', '3:46 AM'),
(9, NULL, 0, NULL, '2024-03-31', '2:46 PM');

INSERT INTO `service_order_completion` (`ref_no`, `date_finished`, `time_finished`, `date_replaced`, `time_replaced`, `completed_by`, `unit_status`, `action_taken`, `returned_to`, `property_clerk`, `property_date_received`, `status`, `part_id`) VALUES
(7, '2024-03-31', '3:42 AM', '', '', 7, 'under warranty', '123', NULL, NULL, NULL, 'pending', NULL),
(8, '2024-03-31', '3:47 AM', '', '', 3, 'close', 'replaced hdd', NULL, NULL, '2024-03-31', 'close', 4),
(9, '2024-03-31', '2:48 PM', '', '', 10, 'under warranty', 'test', NULL, NULL, NULL, 'pending', 6);

INSERT INTO `service_order_timeline` (`ref_no`, `if_inverted`, `color`) VALUES
(7, 0, 'emerald'),
(8, 1, 'lightTeal'),
(9, 0, 'dark');

INSERT INTO `users` (`id`, `emp_id`, `password`, `firstname`, `lastname`, `user_type`, `access_rights`, `cluster_id`, `avatar`, `status`, `contact_no`, `last_login`, `if_pass_changed`, `date_added`) VALUES
(1, 'CIT1041', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Jonathan ', 'Pacana', 'superadmin', 'ultimate_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', '2024-03-30 13:48:02', 0, '2018-02-16 22:49:27'),
(2, 'CIT101', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Tsg', 'Test', 'viewer', 'view', '1', 'assets/images/avatars/default_profile.png', 'active', '111', '2024-03-16 12:08:20', 0, '2016-10-18 04:52:40'),
(3, 'CIT123', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Ethan', 'Pacana', 'encoder', 'add', '1', 'assets/images/avatars/default_profile.png', 'active', '111', '2024-03-16 12:07:53', 0, '2020-03-03 19:10:40'),
(4, 'CIT1318', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Bebeth', 'Ricardel', 'encoder', 'add', '2', 'assets/images/avatars/default_profile.png', 'active', '178', NULL, 0, '2024-03-14 10:49:57'),
(5, 'CIT1708', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Madelline', 'Rico', 'encoder', 'add', '3', 'assets/images/avatars/default_profile.png', 'active', '136', '2024-03-14 04:40:35', 0, '2024-03-14 11:07:03'),
(6, 'CIT1057', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Dexter', 'Cabije', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', NULL, 0, '2024-03-14 11:27:22'),
(7, 'CIT1043', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Brian', 'Ferolino', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '193', NULL, 0, '2024-03-14 11:28:06'),
(8, 'CIT1056', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Angelo', 'Ilagan', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '193', NULL, 0, '2024-03-14 11:28:40'),
(9, 'CIT1873', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Celso', 'Luspoc', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', NULL, 0, '2024-03-14 11:29:10'),
(10, 'CIT225', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Rolando', 'Tindoy', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', NULL, 0, '2024-03-14 11:29:28'),
(11, 'CIT2019', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Gabriel', 'Sopsop', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', NULL, 0, '2024-03-14 11:29:58');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;