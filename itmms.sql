-- -------------------------------------------------------------
-- TablePlus 5.9.2(542)
--
-- https://tableplus.com/
--
-- Database: itmms
-- Generation Time: 2024-03-28 21:13:24.2640
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `computer_resources`;
CREATE TABLE `computer_resources` (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `computers`;
CREATE TABLE `computers` (
  `computer_id` int(11) NOT NULL AUTO_INCREMENT,
  `computer_name` varchar(255) NOT NULL,
  `computer_type` varchar(255) NOT NULL,
  `brand_clone_name` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`computer_id`),
  UNIQUE KEY `computer_name` (`computer_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_no` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_no` (`room_no`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  PRIMARY KEY (`ref_no`),
  CONSTRAINT `service_order_completion_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `service_order` (`ref_no`) ON DELETE CASCADE
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
(1, 109, 'lecture', 1),
(2, 113, 'laboratory', 1),
(3, 114, 'laboratory', 1),
(4, 116, 'lecture', 2),
(5, 117, 'lecture', 1),
(6, 118, 'lecture', 1),
(7, 119, 'lecture', 5),
(8, 120, 'lecture', 5),
(9, 121, 'lecture', 1);

INSERT INTO `clusters` (`cluster_id`, `room_id`, `cluster_code`, `cluster_name`, `type`) VALUES
(1, 108, 'TSG', 'Technical Support Group', 'office'),
(2, 110, 'LRAC', 'Learning Resource Activity Center', 'office'),
(3, 111, 'VPAA', 'Vice President For Academic Affairs', 'office'),
(4, 112, 'URO', 'University Registrar Office', 'office'),
(5, 115, 'ECE', 'Electronics Engineering', 'department');

INSERT INTO `computer_designation` (`computer_id`, `designation_type`, `designation`, `workstation_no`, `assigned_to`, `date_assigned`) VALUES
(4, 'office', 'TSG', 0, 'Jonathan Pacana', '2024-02-11'),
(5, 'office', 'VPAA', 0, 'Jonathan Pacana', '2024-03-14'),
(6, 'office', 'URO', 0, 'Jonathan Pacana', '2024-03-16'),
(7, 'laboratory', 'NGE 101', -1, 'Jonathan Pacana', '2024-03-21'),
(8, 'laboratory', 'LAB101', 1, 'Jonathan Pacana', '2024-03-21'),
(9, 'laboratory', 'LAB101', 2, 'Jonathan Pacana', '2024-03-21'),
(10, 'laboratory', 'LAB101', 0, 'Test', '2024-03-25'),
(13, 'laboratory', 'LAB101', 3, '', '2024-03-25'),
(14, 'lecture', 'NGE101', 123, '', '2024-03-26'),
(15, 'lecture', 'ST102', 1, '', '2024-03-26'),
(16, 'lecture', 'ECE 102', 1, '', '2024-03-26'),
(17, 'department', 'ECE', 0, '', '2024-03-26');

INSERT INTO `computer_parts` (`id`, `computer_id`, `parts_name`, `parts_type`, `depreciation_value`, `date_created`) VALUES
(13, 4, 'Computer Set', 'Computer Set', '2 months', '2024-02-11 18:24:50'),
(14, 5, 'Video Card', 'Video Card', '1 months', '2024-02-28 11:19:44'),
(15, 6, 'Computer Set', 'Computer Set', '3 years', '2024-03-16 18:47:15'),
(16, 7, 'Computer Set', 'Computer Set', '5 years', '2024-03-21 20:05:17'),
(17, 8, 'Computer Set', 'Computer Set', '3 years', '2024-03-21 20:14:31'),
(18, 9, 'Computer Set', 'Computer Set', '5 years', '2024-03-21 20:15:01'),
(19, 13, 'Monitor', 'Monitor', '10 months', '2024-03-25 01:13:22'),
(20, 14, 'Monitor', 'Monitor', '8 months', '2024-03-26 00:05:24'),
(21, 15, 'Monitor', 'Monitor', '6 months', '2024-03-26 01:02:17'),
(22, 16, 'Computer Set', 'Computer Set', '10 months', '2024-03-26 01:14:22'),
(23, 17, 'Computer Set', 'Computer Set', '4 years', '2024-03-26 01:17:39');

INSERT INTO `computer_resources` (`resource_id`, `resource_name`, `type`, `date_added`) VALUES
(2, 'Autodesk', 'software', '2024-03-07 09:00:54'),
(3, 'Memory', 'hardware', '2024-03-07 09:01:15'),
(4, 'Power Supply', 'hardware', '2024-03-07 09:01:47'),
(5, 'Hard Drive', 'hardware', '2024-03-14 10:48:52'),
(6, 'UPS', 'hardware', '2024-03-14 10:58:38'),
(7, 'Personal Computer', 'hardware', '2024-03-24 17:51:58'),
(8, 'Printer', 'hardware', '2024-03-24 17:53:00'),
(9, 'TV', 'hardware', '2024-03-24 17:53:00'),
(10, 'Router/Switch/Access Point', 'hardware', '2024-03-24 17:53:00');

INSERT INTO `computers` (`computer_id`, `computer_name`, `computer_type`, `brand_clone_name`, `date_added`) VALUES
(4, 'TSG_JPACS', 'Branded', 'Acer', '2024-02-11 18:24:50'),
(5, 'VPAAVPAA', 'Cloned', 'Ideal Ups Black: Ideal 5106c', '2024-03-14 11:19:44'),
(6, 'URO-SUE', 'Branded', 'Acer', '2024-03-16 18:47:15'),
(7, 'NGE 11-01', 'Branded', 'Acer', '2024-03-21 20:05:17'),
(8, 'LAB1101', 'Branded', 'Dell', '2024-03-21 20:14:31'),
(9, 'LAB1102', 'Branded', 'Acer', '2024-03-21 20:15:01'),
(10, 'LAB11WS1', 'Power Supply', 'Test', '2024-03-25 01:11:02'),
(13, 'LAB1103', 'Monitor', 'Test', '2024-03-25 01:13:22'),
(14, 'NGE101123', 'Monitor', 'Test', '2024-03-26 00:05:24'),
(15, 'ST102001', 'Monitor', 'Test', '2024-03-26 01:02:17'),
(16, 'ECE 102001', 'Branded', 'Dell', '2024-03-26 01:14:22'),
(17, 'ECE- F001', 'Branded', 'Dell\r\n', '2024-03-26 01:17:39');

INSERT INTO `itmms_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('000199fd3566bc8b0013788fef6b9aa410f1254d', '::1', 1711629524, '__ci_last_regenerate|i:1711629524;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('11ccbc2034c584378bf4eff1b817499a60332ec6', '::1', 1711630205, '__ci_last_regenerate|i:1711630205;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('301843714744f8f77895a8d2a3236afcdf4bfd27', '::1', 1711604073, '__ci_last_regenerate|i:1711604073;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('55409a8adc9581f4ecfbda81ae4571579867d5b8', '::1', 1711631115, '__ci_last_regenerate|i:1711631115;'),
('713c1ebd96f958b3918b04be3fbffa67cf503b6f', '::1', 1711629839, '__ci_last_regenerate|i:1711629839;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('87b732f1052bf7f7d5c604f8da6e093b1db8ebc4', '::1', 1711631467, '__ci_last_regenerate|i:1711631467;'),
('a6ad5672f82e6656b1bf390a54bac29844df4712', '::1', 1711604810, '__ci_last_regenerate|i:1711604810;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('bbe05fb946575e1a970f8a415be9204e26e6f2b5', '::1', 1711631467, '__ci_last_regenerate|i:1711631467;'),
('d1e973d5ecc39db9cc2cacfbb33c77e886b9af72', '::1', 1711630544, '__ci_last_regenerate|i:1711630544;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('e2897d76ef09028d00f03209ef4e13469e073507', '::1', 1711603748, '__ci_last_regenerate|i:1711603748;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('f90205a4411f8e650a118438cd5bd618622ac130', '::1', 1711604439, '__ci_last_regenerate|i:1711604439;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;');

INSERT INTO `logs` (`id`, `ref_no`, `computer_name`, `activities`, `date_added`) VALUES
(1, 2, 'VPAAVPAA', 'Madelline Rico added new Service Order', '2024-03-14 11:31:39'),
(2, 2, 'VPAAVPAA', 'Jonathan  Pacana forwarded a service order to property', '2024-03-14 11:34:47'),
(3, 3, 'URO-SUE', 'Jonathan  Pacana added new Service Order', '2024-03-16 18:49:50'),
(4, 3, 'NA', 'Jonathan  Pacana edited a service order', '2024-03-16 18:52:59'),
(5, 3, 'NA', 'Jonathan  Pacana forwarded a service order to property', '2024-03-16 18:54:00'),
(6, 4, 'TSG_JPACS', 'Jonathan  Pacana added new Service Order', '2024-03-17 20:25:28'),
(7, 5, 'TSG_JPACS', 'Jonathan  Pacana added new Service Order', '2024-03-17 20:25:28'),
(8, 5, 'TSG_JPACS', 'Jonathan  Pacana voided a service order', '2024-03-17 20:25:51'),
(9, 4, 'TSG_JPACS', 'Jonathan  Pacana completed a service order', '2024-03-20 15:17:33'),
(10, 6, 'URO-SUE', 'Jonathan  Pacana added new Service Order', '2024-03-20 18:14:21'),
(11, 6, 'NA', 'Jonathan  Pacana edited a service order', '2024-03-20 18:14:55'),
(12, 7, 'TSG_JPACS', 'Jonathan  Pacana added new Service Order', '2024-03-21 19:21:28'),
(13, 8, 'LAB1101', 'Jonathan  Pacana added new Service Order', '2024-03-22 21:45:55'),
(14, 9, 'LAB1101', 'Jonathan  Pacana added new Service Order', '2024-03-22 22:15:53'),
(15, 10, 'LAB1101', 'Jonathan  Pacana added new Service Order', '2024-03-22 22:40:45'),
(16, 11, 'LAB1101', 'Jonathan  Pacana added new Service Order', '2024-03-24 18:20:11'),
(17, 11, 'NA', 'Jonathan  Pacana edited a service order', '2024-03-24 18:25:03'),
(18, 3, 'NA', 'Jonathan  Pacana edited a service order', '2024-03-24 19:49:01'),
(19, 12, 'ST102001', 'Jonathan  Pacana added new Service Order', '2024-03-26 01:32:46'),
(20, 6, 'NA', 'Jonathan  Pacana forwarded a service order to property', '2024-03-26 20:58:50'),
(21, 7, 'TSG_JPACS', 'Jonathan  Pacana completed a service order', '2024-03-26 20:59:06'),
(22, 12, 'ST102001', 'Jonathan  Pacana designate a service order to Angelo Ilagan', '2024-03-26 21:03:40'),
(23, 12, 'NA', 'Jonathan  Pacana edited a service order', '2024-03-26 21:06:28'),
(24, 12, 'NA', 'Jonathan  Pacana edited a service order', '2024-03-26 21:07:22'),
(25, 12, 'NA', 'Jonathan  Pacana edited a service order', '2024-03-26 21:08:12'),
(26, 12, 'NA', 'Jonathan  Pacana forwarded a service order to property', '2024-03-26 21:09:13'),
(27, 13, 'TSG_JPACS', 'Jonathan  Pacana added new Service Order', '2024-03-28 13:43:53'),
(28, 13, 'TSG_JPACS', 'Jonathan  Pacana forwarded a service order to property', '2024-03-28 13:45:10'),
(29, 13, 'NA', 'Jonathan  Pacana edited a service order', '2024-03-28 13:45:36');

INSERT INTO `rooms` (`room_id`, `room_no`, `date_added`) VALUES
(108, 'ST306', '2018-02-16 22:48:16'),
(109, 'NGE101', '2024-03-07 13:47:14'),
(110, 'LRAC BUILIDNG', '2024-03-14 10:38:22'),
(111, 'GLE BUILDING', '2024-03-14 10:59:28'),
(112, 'RTL BUILDING', '2024-03-16 18:43:45'),
(113, 'LAB101', '2024-03-21 20:02:51'),
(114, 'NGE 101', '2024-03-21 20:04:11'),
(115, 'GLE', '2024-03-21 20:18:01'),
(116, '12', '2024-03-25 01:39:33'),
(117, 'GAWAMO', '2024-03-25 01:40:01'),
(118, 'ST102', '2024-03-25 21:38:47'),
(119, 'ECE 102', '2024-03-25 22:32:03'),
(120, 'TEST', '2024-03-26 19:41:46'),
(121, 'ST201', '2024-03-28 13:32:07');

INSERT INTO `service_order` (`ref_no`, `emp_id`, `emp_name`, `cluster_id`, `position`, `contact_no`, `complaint_resource_id`, `complaint_details`, `computer_name`, `if_pulled_out`, `is_urgent`, `date_added`) VALUES
(2, '8', 'Atty. Corazon E. Valencia', 3, 'Vp Academic Affairs', '111', 6, 'Defective UPS', 'VPAAVPAA', 1, 0, '2024-03-14 11:31:39'),
(3, '111', 'Paul Suerte', 4, '12', '130', 5, 'Disk boot failure edited', 'NA', 1, 0, '2024-03-16 18:49:50'),
(4, 'test', 'Test', 1, 'Test', '123', 5, 'Guba', 'TSG_JPACS', 1, 0, '2024-03-17 20:25:28'),
(5, 'test', 'Test', 1, 'Test', '123', 5, 'Guba', 'TSG_JPACS', 1, 0, '2024-03-17 20:25:28'),
(6, 'test123', 'Test', 4, 'Test', '123', 5, 'Test', 'NA', 1, 0, '2024-03-20 18:14:21'),
(7, 'CIT1041', 'Test', 1, 'Test', '12345678', 5, 'Test', 'TSG_JPACS', 1, 0, '2024-03-21 19:21:28'),
(8, '123123', 'Andrew', 2, 'Test', '123', 5, 'Input complaint details', 'LAB1101', 1, 0, '2024-03-22 21:45:55'),
(9, '123', '123', 2, '123', '123', 5, 'No Power', 'LAB1101', 1, 0, '2024-03-22 22:15:53'),
(10, '123', 'Andrew', 2, 'Test', '123', 5, 'Custom complain description', 'LAB1101', 1, 0, '2024-03-22 22:40:45'),
(11, 'test', 'Test', 5, '123', '123', 6, 'Beeping', 'NA', 0, 0, '2024-03-24 18:20:11'),
(12, '123', 'Test', 1, '123', '123', 5, 'Test123', 'NA', 0, 0, '2024-03-26 01:32:46'),
(13, 'test', 'Andrew', 1, '123', '123', 7, 'Disk Boot Failure', 'NA', 0, 0, '2024-03-28 13:43:53');

INSERT INTO `service_order_acceptance` (`ref_no`, `received_by`, `assigned_to`, `designate_to`, `date_reported`, `time_reported`) VALUES
(2, NULL, 6, NULL, '2024-01-27', '11:30 AM'),
(3, NULL, 1, NULL, '2024-03-16', '6:48 PM'),
(4, NULL, 1, NULL, '2024-03-17', '7:45 PM'),
(5, NULL, 1, NULL, '2024-03-17', '7:45 PM'),
(6, NULL, 1, NULL, '2024-03-20', '6:13 PM'),
(7, NULL, 1, NULL, '2024-03-21', '7:21 PM'),
(8, NULL, 7, NULL, '2024-03-22', '9:45 PM'),
(9, NULL, 0, NULL, '2024-03-22', '10:15 PM'),
(10, NULL, 0, NULL, '2024-03-22', '10:39 PM'),
(11, NULL, 7, NULL, '2024-03-24', '6:19 PM'),
(12, NULL, 7, 8, '2024-03-26', '1:32 AM'),
(13, NULL, 6, NULL, '2024-03-28', '1:42 PM');

INSERT INTO `service_order_completion` (`ref_no`, `date_finished`, `time_finished`, `date_replaced`, `time_replaced`, `completed_by`, `unit_status`, `action_taken`, `returned_to`, `property_clerk`, `property_date_received`, `status`) VALUES
(2, '2024-03-14', '11:32 AM', '', '', 6, 'close', 'Defective UPS\r\nIDEAL UPS Black IDEAL 5106C', NULL, NULL, '2024-03-14', 'close'),
(3, '2024-03-16', '6:53 PM', '', '', 1, 'under warranty', 'neeed replacement', NULL, NULL, NULL, 'pending'),
(4, '2024-03-20', '3:17 PM', '', '', 1, 'repaired', 'test', NULL, NULL, NULL, 'close'),
(5, NULL, NULL, '', '', 0, 'void', NULL, NULL, NULL, NULL, 'void'),
(6, '2024-03-26', '8:58 PM', '', '', 1, 'under warranty', 'test', NULL, NULL, NULL, 'pending'),
(7, '2024-03-26', '8:59 PM', '', '', 1, 'close', 'test', NULL, NULL, NULL, 'close'),
(8, NULL, NULL, '', '', 0, 'under repair', NULL, NULL, NULL, NULL, 'received'),
(9, NULL, NULL, '', '', 0, 'under repair', NULL, NULL, NULL, NULL, 'received'),
(10, NULL, NULL, '', '', 0, 'under repair', NULL, NULL, NULL, NULL, 'received'),
(11, NULL, NULL, '', '', 0, 'under repair', NULL, NULL, NULL, NULL, 'received'),
(12, '2024-03-26', '9:09 PM', '', '', 8, 'close', 'test', NULL, NULL, '2024-03-28', 'close'),
(13, '2024-03-28', '1:44 PM', '', '', 1, 'close', 'replaced with brand x', NULL, NULL, '2024-03-28', 'close');

INSERT INTO `service_order_timeline` (`ref_no`, `if_inverted`, `color`) VALUES
(2, 0, 'crimson'),
(3, 1, 'orange'),
(4, 0, 'darkBrown'),
(5, 0, 'amber'),
(6, 1, 'taupe'),
(7, 0, 'black'),
(8, 0, 'lime'),
(9, 0, 'orange'),
(10, 1, 'dark'),
(11, 0, 'lightRed'),
(12, 0, 'red'),
(13, 1, 'darkCobalt');

INSERT INTO `users` (`id`, `emp_id`, `password`, `firstname`, `lastname`, `user_type`, `access_rights`, `cluster_id`, `avatar`, `status`, `contact_no`, `last_login`, `if_pass_changed`, `date_added`) VALUES
(1, 'CIT1041', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Jonathan ', 'Pacana', 'superadmin', 'ultimate_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', '2024-03-28 13:59:22', 0, '2018-02-16 22:49:27'),
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