-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2024 at 12:09 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itmms`
--

-- --------------------------------------------------------

--
-- Table structure for table `classrooms`
--

CREATE TABLE `classrooms` (
  `classroom_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classrooms`
--

INSERT INTO `classrooms` (`classroom_id`, `room_id`, `type`) VALUES
(1, 109, 'e-room');

-- --------------------------------------------------------

--
-- Table structure for table `clusters`
--

CREATE TABLE `clusters` (
  `cluster_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `cluster_code` varchar(255) NOT NULL,
  `cluster_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clusters`
--

INSERT INTO `clusters` (`cluster_id`, `room_id`, `cluster_code`, `cluster_name`, `type`) VALUES
(1, 108, 'TSG', 'Technical Support Group', 'office'),
(2, 110, 'LRAC', 'Learning Resource Activity Center', 'office'),
(3, 111, 'VPAA', 'Vice President For Academic Affairs', 'office'),
(4, 112, 'URO', 'University Registrar Office', 'office');

-- --------------------------------------------------------

--
-- Table structure for table `computers`
--

CREATE TABLE `computers` (
  `computer_id` int(11) NOT NULL,
  `computer_name` varchar(255) NOT NULL,
  `computer_type` varchar(255) NOT NULL,
  `brand_clone_name` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `computers`
--

INSERT INTO `computers` (`computer_id`, `computer_name`, `computer_type`, `brand_clone_name`, `date_added`) VALUES
(4, 'TSG_JPACS', 'Branded', 'Acer', '2024-02-11 10:24:50'),
(5, 'VPAAVPAA', 'Cloned', 'Ideal Ups Black: Ideal 5106c', '2024-03-14 03:19:44'),
(6, 'URO-SUE', 'Branded', 'Acer', '2024-03-16 10:47:15');

-- --------------------------------------------------------

--
-- Table structure for table `computer_designation`
--

CREATE TABLE `computer_designation` (
  `computer_id` int(11) NOT NULL,
  `designation_type` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `workstation_no` int(11) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `date_assigned` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `computer_designation`
--

INSERT INTO `computer_designation` (`computer_id`, `designation_type`, `designation`, `workstation_no`, `assigned_to`, `date_assigned`) VALUES
(4, 'office', 'TSG', 0, 'Jonathan Pacana', '2024-02-11'),
(5, 'office', 'VPAA', 0, 'Jonathan Pacana', '2024-03-14'),
(6, 'office', 'URO', 0, 'Jonathan Pacana', '2024-03-16');

-- --------------------------------------------------------

--
-- Table structure for table `computer_parts`
--

CREATE TABLE `computer_parts` (
  `id` int(11) NOT NULL,
  `computer_id` int(11) NOT NULL,
  `parts_name` varchar(255) NOT NULL,
  `parts_type` varchar(255) NOT NULL,
  `depreciation_value` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `computer_parts`
--

INSERT INTO `computer_parts` (`id`, `computer_id`, `parts_name`, `parts_type`, `depreciation_value`, `date_created`) VALUES
(13, 4, 'Computer Set', 'Computer Set', '3 years', '2024-02-11 18:24:50'),
(14, 5, 'Video Card', 'Video Card', '3 years', '2024-03-14 11:19:44'),
(15, 6, 'Computer Set', 'Computer Set', '3 years', '2024-03-16 18:47:15');

-- --------------------------------------------------------

--
-- Table structure for table `computer_resources`
--

CREATE TABLE `computer_resources` (
  `resource_id` int(11) NOT NULL,
  `resource_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `computer_resources`
--

INSERT INTO `computer_resources` (`resource_id`, `resource_name`, `type`, `date_added`) VALUES
(2, 'Autodesk', 'software', '2024-03-07 01:00:54'),
(3, 'Memory', 'hardware', '2024-03-07 01:01:15'),
(4, 'Power Supply', 'hardware', '2024-03-07 01:01:47'),
(5, 'Hard Drive', 'hardware', '2024-03-14 02:48:52'),
(6, 'Ups', 'hardware', '2024-03-14 02:58:38');

-- --------------------------------------------------------

--
-- Table structure for table `itmms_sessions`
--

CREATE TABLE `itmms_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itmms_sessions`
--

INSERT INTO `itmms_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('00hq6jlk870g9opibkc4qufphcu53e2k', '127.0.0.1', 1709801471, '__ci_last_regenerate|i:1709801448;id|s:1:\"3\";emp_id|s:6:\"CIT123\";firstname|s:5:\"Ethan\";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:7:\"encoder\";access_rights|s:3:\"add\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('00j6rqvhdr13d2p3eak2fuheu6mv12b9', '127.0.0.1', 1709804033, '__ci_last_regenerate|i:1709804030;id|s:1:\"3\";emp_id|s:6:\"CIT123\";firstname|s:5:\"Ethan\";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:7:\"encoder\";access_rights|s:3:\"add\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('04r5o0pvo2t9h8q4c4020n6hc6pe9r9i', '::1', 1709797578, '__ci_last_regenerate|i:1709797285;id|s:1:\"2\";emp_id|s:6:\"CIT101\";firstname|s:3:\"Tsg\";lastname|s:4:\"Test\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:6:\"viewer\";access_rights|s:4:\"view\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('06p6j7k1g6p5729lla8c68bibhp2qkks', '::1', 1709798281, '__ci_last_regenerate|i:1709798013;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('0aug3tftlnpb910ln1taar52pnhppu9c', '::1', 1709868328, '__ci_last_regenerate|i:1709868113;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('0mdtg5u9dgqjuss0kiqd6gmiiioj7ah7', '::1', 1710387109, '__ci_last_regenerate|i:1710386809;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('0mgpd7eg4q7fkq0lo20m5l0i2kpl7jit', '::1', 1710385895, '__ci_last_regenerate|i:1710385625;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('13ekn730lnlmtdb5q60m87h6t5isbu7o', '::1', 1709796827, '__ci_last_regenerate|i:1709796533;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('1c97qeffcsg3mur8raucqghe1qimb1df', '::1', 1709865795, '__ci_last_regenerate|i:1709865504;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('1e49li7iarjeimm9q3m60s5ojkbhbcjr', '::1', 1710409129, '__ci_last_regenerate|i:1710408927;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('1v2tgrigqveh0ssam99nod6l3hqpa65h', '::1', 1709801114, '__ci_last_regenerate|i:1709799027;id|s:1:\"2\";emp_id|s:6:\"CIT101\";firstname|s:3:\"Tsg\";lastname|s:4:\"Test\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:6:\"viewer\";access_rights|s:4:\"view\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('2bfej6is4mje6m54n4fqoq04fba3m6sv', '::1', 1709864575, '__ci_last_regenerate|i:1709864566;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('2nrkvmhbu2dq1bu9m7t8pjldq9nathkd', '::1', 1709803621, '__ci_last_regenerate|i:1709803621;id|s:1:\"2\";emp_id|s:6:\"CIT101\";firstname|s:3:\"Tsg\";lastname|s:4:\"Test\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:6:\"viewer\";access_rights|s:4:\"view\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('37ldvrd6o8s1jeecq3l283tianoe83q6', '::1', 1709791115, '__ci_last_regenerate|i:1709790888;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('3adtnl8u731p9lknnhm9ja7aqs1r8lbo', '::1', 1709804299, '__ci_last_regenerate|i:1709804274;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('3oip1f7gvuf0m23g05bmnclr3b35en46', '::1', 1709802537, '__ci_last_regenerate|i:1709802238;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('45jf7tbvhfg5o3g0uuv92see9rrqrrv0', '::1', 1709814699, '__ci_last_regenerate|i:1709814699;'),
('4ulprmetjamris9jbddd2cpbuaf9qjra', '::1', 1709814373, '__ci_last_regenerate|i:1709814116;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('5ai3fq2cc51u7nrh3cnoljsas11ukg6b', '::1', 1709796135, '__ci_last_regenerate|i:1709795843;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('5ef55r539dudq9cfpcc067g7q920lr80', '::1', 1709867787, '__ci_last_regenerate|i:1709867783;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('5rq3b6e5gfg3r3v443ejq4v1iptbqejh', '::1', 1709798657, '__ci_last_regenerate|i:1709798377;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('5tc7d90nu205q91hv1mm993m7cqe36kl', '::1', 1710387631, '__ci_last_regenerate|i:1710387631;'),
('765bm48e3psfp3ho89kpgn6593ij7bcr', '::1', 1709867714, '__ci_last_regenerate|i:1709867479;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('7m55itv2m2967fad98lgjtjldfi1v69c', '::1', 1709799024, '__ci_last_regenerate|i:1709797608;id|s:1:\"2\";emp_id|s:6:\"CIT101\";firstname|s:3:\"Tsg\";lastname|s:4:\"Test\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:6:\"viewer\";access_rights|s:4:\"view\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('7mrottfrbkkncvica3jqoufnrapdl3qq', '::1', 1710386575, '__ci_last_regenerate|i:1710386305;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('82g8arc6e8dag1dp19iv0n731bel8v8c', '::1', 1709799161, '__ci_last_regenerate|i:1709799157;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('9d5k56ip8kg4h7grc9itmu2bo598pbl3', '::1', 1709862044, '__ci_last_regenerate|i:1709861766;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('9hremb1jhova858m3avav0ldk65rott8', '::1', 1709802191, '__ci_last_regenerate|i:1709801907;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('9m8br7fj89c6iait0kcaqcqpsughul1c', '::1', 1710387027, '__ci_last_regenerate|i:1710386736;id|s:1:\"5\";emp_id|s:7:\"CIT1708\";firstname|s:9:\"Madelline\";lastname|s:4:\"Rico\";contact_no|s:3:\"136\";cluster_id|s:1:\"3\";user_type|s:7:\"encoder\";access_rights|s:3:\"add\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('aboghjeuih3j1avelhg6fs2be2c4vnjg', '::1', 1709865959, '__ci_last_regenerate|i:1709865810;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('ae7i8kaptj2pj38okonaii3tbhtmc3ut', '::1', 1710386721, '__ci_last_regenerate|i:1710386419;id|s:1:\"5\";emp_id|s:7:\"CIT1708\";firstname|s:9:\"Madelline\";lastname|s:4:\"Rico\";contact_no|s:3:\"136\";cluster_id|s:1:\"3\";user_type|s:7:\"encoder\";access_rights|s:3:\"add\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('aiulsri314l3oipokqncbpmisutjef4c', '::1', 1710383047, '__ci_last_regenerate|i:1710382833;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('amlamb9nk0fojc192v3j5lskbfuige4t', '::1', 1709869687, '__ci_last_regenerate|i:1709869533;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('anfdlg3leqvsshheoomhrt7tks7ueh69', '::1', 1709800319, '__ci_last_regenerate|i:1709800283;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('atec9de3av1l6q920bftnchbsjma21tl', '::1', 1710587300, '__ci_last_regenerate|i:1710587300;'),
('b1d5uvqm7j2r3s69bg49tmgej3u1ran9', '::1', 1709801020, '__ci_last_regenerate|i:1709800968;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('b6pkf1b844q24av4ot5rr4pe16a1al6g', '::1', 1709801373, '__ci_last_regenerate|i:1709801126;id|s:1:\"2\";emp_id|s:6:\"CIT101\";firstname|s:3:\"Tsg\";lastname|s:4:\"Test\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:6:\"viewer\";access_rights|s:4:\"view\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('bkf4h75drr0i7bv012aed841t0mr670r', '::1', 1710221611, '__ci_last_regenerate|i:1710221611;'),
('bqflplclldrr54c81gr68g5isodhr0qf', '::1', 1710585440, '__ci_last_regenerate|i:1710585178;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('c3u4jddqq30psj719gjn97srml5c9v7l', '::1', 1709796479, '__ci_last_regenerate|i:1709796191;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('ce4i4t5sd393l9t8u5le7nr074rdrj85', '::1', 1709794579, '__ci_last_regenerate|i:1709794578;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('cfgor19pisctch25kb5oja61h28lsqvq', '::1', 1710409577, '__ci_last_regenerate|i:1710409273;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('crqm9tc8a3c314vl3783f30n3imcu6l7', '::1', 1709811611, '__ci_last_regenerate|i:1709811610;id|s:1:\"2\";emp_id|s:6:\"CIT101\";firstname|s:3:\"Tsg\";lastname|s:4:\"Test\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:6:\"viewer\";access_rights|s:4:\"view\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('cvvq62f5pqf9gdfh5hrcl5kenvdj43g6', '::1', 1709790610, '__ci_last_regenerate|i:1709790291;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('d06io37bpfvu13hhfq4lagl6f24lbc7d', '::1', 1709790139, '__ci_last_regenerate|i:1709789855;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('d13ch1bl8mucn1go0jqn9q4m6mcvf7b1', '::1', 1710383912, '__ci_last_regenerate|i:1710383912;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('e4tpj61o7trruf3h8bcsaf01ur9d5cao', '::1', 1709793392, '__ci_last_regenerate|i:1709793392;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('eh6p9bk31tfuisjea8ihh8sbgit39idq', '127.0.0.1', 1709796258, '__ci_last_regenerate|i:1709796173;id|s:1:\"3\";emp_id|s:6:\"CIT123\";firstname|s:5:\"Ethan\";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:7:\"encoder\";access_rights|s:3:\"add\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('eo5a2ap8eoojukb8k0ambfrc0jkmaf4i', '127.0.0.1', 1709797532, '__ci_last_regenerate|i:1709797292;id|s:1:\"3\";emp_id|s:6:\"CIT123\";firstname|s:5:\"Ethan\";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:7:\"encoder\";access_rights|s:3:\"add\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('fadvq243di5mnemd6u4j8e6js2ssb5oq', '::1', 1709863117, '__ci_last_regenerate|i:1709862821;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('fub7lppgtfmja38cg1j6mjd3diov5a6f', '::1', 1709811870, '__ci_last_regenerate|i:1709811794;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('g30n8trofuuv2ajnemunvgmiie9o9h8g', '::1', 1709789855, ''),
('gafv3hidp385gtc15tv4abaa9chhqgdl', '::1', 1709865499, '__ci_last_regenerate|i:1709865202;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('gf3tlfieoahr92doa3isg811ml02t2rh', '::1', 1710387635, '__ci_last_regenerate|i:1710387635;'),
('ghlcmr7o7m2ah2miuer36bskaqlsu3kf', '::1', 1709773254, '__ci_last_regenerate|i:1709772951;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('gnmc5jhcrf19ksk06efom939de4dhkfi', '::1', 1710587238, '__ci_last_regenerate|i:1710586942;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('hinp239sj8jf6k43rv0j318s11e24cb5', '::1', 1709802908, '__ci_last_regenerate|i:1709802608;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('hv3c5ovc2o1mmjk9i0gd9kktue7c9fu5', '::1', 1709870985, '__ci_last_regenerate|i:1709870722;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('ie05u5mlemg62m09nbp9en036r7dmnh5', '::1', 1709810982, '__ci_last_regenerate|i:1709810768;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('ifm61aj0uu7nvlpvop8783r5ivkhhlp8', '::1', 1709797776, '__ci_last_regenerate|i:1709797520;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('impk2v6or8djpkcch4iqe5r8q52am03v', '::1', 1709865179, '__ci_last_regenerate|i:1709864886;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('iv4e3mplngoe6qoqmdcr3gcr4fn8hscd', '::1', 1710384632, '__ci_last_regenerate|i:1710384602;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('j81mbggdqornrfncv4241a038nifv713', '127.0.0.1', 1709799072, '__ci_last_regenerate|i:1709799070;id|s:1:\"3\";emp_id|s:6:\"CIT123\";firstname|s:5:\"Ethan\";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:7:\"encoder\";access_rights|s:3:\"add\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('k4n9vvb1fpgs6m5maqc8gf2fu148laii', '::1', 1710383479, '__ci_last_regenerate|i:1710383225;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('kn0igol9rnsja8ortt1eiefmbhtf1j93', '::1', 1709798732, '__ci_last_regenerate|i:1709798702;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('kofjn7lumbkbnnctqg1pj9h24dk86sr0', '::1', 1710387409, '__ci_last_regenerate|i:1710387110;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('krbmejl6r85c3q7ho0l082tdb59ck724', '::1', 1710409964, '__ci_last_regenerate|i:1710409964;'),
('lds06pgqn4ta9u5j1kn0jcsr0e7s52d5', '::1', 1709797121, '__ci_last_regenerate|i:1709796863;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('lkjmagv07taac6orjbt9g9lahk6piv0s', '::1', 1709772947, '__ci_last_regenerate|i:1709772650;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('llkgtf75g25e6d40dtrmhrv3oiivmhq8', '::1', 1710386220, '__ci_last_regenerate|i:1710385989;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('m36uc9c1oirdtur7rjnb2757n5fi7bh0', '::1', 1709796196, '__ci_last_regenerate|i:1709796154;id|s:1:\"2\";emp_id|s:6:\"CIT101\";firstname|s:3:\"Tsg\";lastname|s:4:\"Test\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:6:\"viewer\";access_rights|s:4:\"view\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('m4tpnkan81attd5l59bmls2jvdjgju1c', '::1', 1709811728, '__ci_last_regenerate|i:1709811428;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('mq0sjchs886bae5eudici8m7416fovbr', '::1', 1709814300, '__ci_last_regenerate|i:1709814300;id|s:1:\"2\";emp_id|s:6:\"CIT101\";firstname|s:3:\"Tsg\";lastname|s:4:\"Test\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:6:\"viewer\";access_rights|s:4:\"view\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('mtl6celvsmltk7herurna9o5aom62pfb', '::1', 1709861157, '__ci_last_regenerate|i:1709860858;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('n7387splr1v04tfgd1hu6jhnota00biq', '::1', 1710387099, '__ci_last_regenerate|i:1710387057;id|s:1:\"5\";emp_id|s:7:\"CIT1708\";firstname|s:9:\"Madelline\";lastname|s:4:\"Rico\";contact_no|s:3:\"136\";cluster_id|s:1:\"3\";user_type|s:7:\"encoder\";access_rights|s:3:\"add\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('nil6qksodoo79uums56sk7efca2oup9d', '::1', 1710409883, '__ci_last_regenerate|i:1710409600;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('oj204s6ubj8caifcdu1tf92tjodo57di', '::1', 1709801724, '__ci_last_regenerate|i:1709801564;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('p9am6951ut8aafbl7l5ksd3u6qqns7f0', '::1', 1710586190, '__ci_last_regenerate|i:1710585844;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('pe8031ira5n1msmu8lrimne5drduaa91', '::1', 1709803293, '__ci_last_regenerate|i:1709802999;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('q1fpg50njlakq4bmpsu45on8uq7gs9mj', '::1', 1709810754, '__ci_last_regenerate|i:1709810456;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('q4tg2fc0jcjstu95g1avhikljovd394j', '127.0.0.1', 1709797714, '__ci_last_regenerate|i:1709797714;id|s:1:\"3\";emp_id|s:6:\"CIT123\";firstname|s:5:\"Ethan\";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:7:\"encoder\";access_rights|s:3:\"add\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('qo53ohh8llsk06fhd455m68dclkbb1cr', '::1', 1709860538, '__ci_last_regenerate|i:1709860080;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('qqj0vgcajnrqklp812lvc03l0f98ckbq', '::1', 1709862304, '__ci_last_regenerate|i:1709862299;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('qs1l3ivj0atbbqvbsi8jvjh8puq18oh9', '127.0.0.1', 1709801350, '__ci_last_regenerate|i:1709801146;id|s:1:\"3\";emp_id|s:6:\"CIT123\";firstname|s:5:\"Ethan\";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:7:\"encoder\";access_rights|s:3:\"add\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('rdvrv9jqvglc66totsvoh81f8omrq2g4', '::1', 1709797457, '__ci_last_regenerate|i:1709797201;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('rnbtoe3vfr910phvhjn5m1khnfne5nd7', '::1', 1710383902, '__ci_last_regenerate|i:1710383580;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('rvo8tgg9shd73prfnebhl208vntghm4g', '::1', 1709864133, '__ci_last_regenerate|i:1709863916;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('s5nvkckihu22h4kur7m2ndima3rodopr', '::1', 1709773379, '__ci_last_regenerate|i:1709773256;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('st9qohgvecalivck51532vl3dhf3shjr', '::1', 1710586609, '__ci_last_regenerate|i:1710586506;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('t4uqdvo835g30qe9j6bbc0fe8dh622gd', '::1', 1710586491, '__ci_last_regenerate|i:1710586193;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('tgsmibr4k92c1e6hpdj8r9ibvueuuera', '::1', 1709870606, '__ci_last_regenerate|i:1709870400;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('tm5ok9me67pitdinv7j1n4h1gg0ggn0e', '::1', 1709811255, '__ci_last_regenerate|i:1709811123;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('tnkj6li47dbtl19s5qvbdea9fg6j4qse', '::1', 1709804028, '__ci_last_regenerate|i:1709804028;id|s:1:\"2\";emp_id|s:6:\"CIT101\";firstname|s:3:\"Tsg\";lastname|s:4:\"Test\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:6:\"viewer\";access_rights|s:4:\"view\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('uheanvjvagt4kuoeansjbdie3kqi7ikb', '::1', 1710385623, '__ci_last_regenerate|i:1710385107;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('ujvdnpb2qnakgal4em77dtbuqe4nevgn', '::1', 1709804063, '__ci_last_regenerate|i:1709803890;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('uo670u370vlbkumc3do8ip64ihg6r7r1', '::1', 1709861413, '__ci_last_regenerate|i:1709861408;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:1;'),
('v0s206gu1jrbolv8lf2ul2f3dcp3ou8b', '::1', 1709876496, '__ci_last_regenerate|i:1709876496;'),
('vl7fq8vl1oa6ersmvrotfneh10pn12m7', '::1', 1709813654, '__ci_last_regenerate|i:1709813357;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('vsjk6qedve8rvol8g1iddladg2j2gf42', '::1', 1709813825, '__ci_last_regenerate|i:1709813673;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;'),
('vtai3i0ttdpfd58n70ultoqs9ma7dorc', '::1', 1710585826, '__ci_last_regenerate|i:1710585488;id|s:1:\"1\";emp_id|s:7:\"CIT1041\";firstname|s:9:\"Jonathan \";lastname|s:6:\"Pacana\";contact_no|s:3:\"111\";cluster_id|s:1:\"1\";user_type|s:10:\"superadmin\";access_rights|s:16:\"ultimate_control\";avatar|s:41:\"assets/images/avatars/default_profile.png\";is_logged_in|b:1;sidebar_status|s:6:\"active\";pass_alert|b:0;');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `ref_no` int(11) NOT NULL,
  `computer_name` varchar(255) NOT NULL,
  `activities` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `ref_no`, `computer_name`, `activities`, `date_added`) VALUES
(1, 2, 'VPAAVPAA', 'Madelline Rico added new Service Order', '2024-03-14 03:31:39'),
(2, 2, 'VPAAVPAA', 'Jonathan  Pacana forwarded a service order to property', '2024-03-14 03:34:47'),
(3, 3, 'URO-SUE', 'Jonathan  Pacana added new Service Order', '2024-03-16 10:49:50'),
(4, 3, 'NA', 'Jonathan  Pacana edited a service order', '2024-03-16 10:52:59'),
(5, 3, 'NA', 'Jonathan  Pacana forwarded a service order to property', '2024-03-16 10:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_no` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_no`, `date_added`) VALUES
(108, 'ST306', '2018-02-16 14:48:16'),
(109, 'NGE101', '2024-03-07 05:47:14'),
(110, 'LRAC BUILIDNG', '2024-03-14 02:38:22'),
(111, 'GLE BUILDING', '2024-03-14 02:59:28'),
(112, 'RTL BUILDING', '2024-03-16 10:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `service_order`
--

CREATE TABLE `service_order` (
  `ref_no` int(11) NOT NULL,
  `emp_id` varchar(255) NOT NULL,
  `emp_name` varchar(255) NOT NULL,
  `cluster_id` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `complaint_resource_id` int(11) NOT NULL,
  `complaint_details` varchar(255) NOT NULL,
  `computer_name` varchar(255) NOT NULL,
  `if_pulled_out` tinyint(1) NOT NULL,
  `is_urgent` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_order`
--

INSERT INTO `service_order` (`ref_no`, `emp_id`, `emp_name`, `cluster_id`, `position`, `contact_no`, `complaint_resource_id`, `complaint_details`, `computer_name`, `if_pulled_out`, `is_urgent`, `date_added`) VALUES
(2, '8', 'Atty. Corazon E. Valencia', 3, 'Vp Academic Affairs', '111', 6, 'Defective UPS', 'VPAAVPAA', 1, 0, '2024-03-14 03:31:39'),
(3, '111', 'Paul Suerte', 4, '12', '130', 5, 'Disk boot failure', 'NA', 1, 0, '2024-03-16 10:49:50');

-- --------------------------------------------------------

--
-- Table structure for table `service_order_acceptance`
--

CREATE TABLE `service_order_acceptance` (
  `ref_no` int(11) NOT NULL,
  `received_by` varchar(255) DEFAULT NULL,
  `assigned_to` int(255) NOT NULL,
  `designate_to` int(225) DEFAULT NULL,
  `date_reported` varchar(255) NOT NULL,
  `time_reported` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_order_acceptance`
--

INSERT INTO `service_order_acceptance` (`ref_no`, `received_by`, `assigned_to`, `designate_to`, `date_reported`, `time_reported`) VALUES
(2, NULL, 6, NULL, '2024-01-27', '11:30 AM'),
(3, NULL, 1, NULL, '2024-03-16', '6:48 PM');

-- --------------------------------------------------------

--
-- Table structure for table `service_order_completion`
--

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
  `status` varchar(255) NOT NULL DEFAULT 'received'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_order_completion`
--

INSERT INTO `service_order_completion` (`ref_no`, `date_finished`, `time_finished`, `date_replaced`, `time_replaced`, `completed_by`, `unit_status`, `action_taken`, `returned_to`, `property_clerk`, `property_date_received`, `status`) VALUES
(2, '2024-03-14', '11:32 AM', '', '', 6, 'close', 'Defective UPS\r\nIDEAL UPS Black IDEAL 5106C', NULL, NULL, '2024-03-14', 'close'),
(3, '2024-03-16', '6:53 PM', '', '', 1, 'under warranty', 'neeed replacement', NULL, NULL, NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `service_order_timeline`
--

CREATE TABLE `service_order_timeline` (
  `ref_no` int(11) NOT NULL,
  `if_inverted` tinyint(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_order_timeline`
--

INSERT INTO `service_order_timeline` (`ref_no`, `if_inverted`, `color`) VALUES
(2, 0, 'crimson'),
(3, 1, 'orange');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
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
  `if_pass_changed` tinyint(4) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `emp_id`, `password`, `firstname`, `lastname`, `user_type`, `access_rights`, `cluster_id`, `avatar`, `status`, `contact_no`, `last_login`, `if_pass_changed`, `date_added`) VALUES
(1, 'CIT1041', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Jonathan ', 'Pacana', 'superadmin', 'ultimate_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', '2024-03-16 12:07:29', 0, '2018-02-16 14:49:27'),
(2, 'CIT101', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Tsg', 'Test', 'viewer', 'view', '1', 'assets/images/avatars/default_profile.png', 'active', '111', '2024-03-16 12:08:20', 0, '2016-10-17 20:52:40'),
(3, 'CIT123', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Ethan', 'Pacana', 'encoder', 'add', '1', 'assets/images/avatars/default_profile.png', 'active', '111', '2024-03-16 12:07:53', 0, '2020-03-03 11:10:40'),
(4, 'CIT1318', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Bebeth', 'Ricardel', 'encoder', 'add', '2', 'assets/images/avatars/default_profile.png', 'active', '178', NULL, 0, '2024-03-14 02:49:57'),
(5, 'CIT1708', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Madelline', 'Rico', 'encoder', 'add', '3', 'assets/images/avatars/default_profile.png', 'active', '136', '2024-03-14 04:40:35', 0, '2024-03-14 03:07:03'),
(6, 'CIT1057', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Dexter', 'Cabije', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', NULL, 0, '2024-03-14 03:27:22'),
(7, 'CIT1043', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Brian', 'Ferolino', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '193', NULL, 0, '2024-03-14 03:28:06'),
(8, 'CIT1056', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Angelo', 'Ilagan', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '193', NULL, 0, '2024-03-14 03:28:40'),
(9, 'CIT1873', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Celso', 'Luspoc', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', NULL, 0, '2024-03-14 03:29:10'),
(10, 'CIT225', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Rolando', 'Tindoy', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', NULL, 0, '2024-03-14 03:29:28'),
(11, 'CIT2019', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Gabriel', 'Sopsop', 'administrator', 'full_control', '1', 'assets/images/avatars/default_profile.png', 'active', '111', NULL, 0, '2024-03-14 03:29:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`classroom_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `clusters`
--
ALTER TABLE `clusters`
  ADD PRIMARY KEY (`cluster_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `computers`
--
ALTER TABLE `computers`
  ADD PRIMARY KEY (`computer_id`),
  ADD UNIQUE KEY `computer_name` (`computer_name`);

--
-- Indexes for table `computer_designation`
--
ALTER TABLE `computer_designation`
  ADD PRIMARY KEY (`computer_id`);

--
-- Indexes for table `computer_parts`
--
ALTER TABLE `computer_parts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `computer_part` (`computer_id`);

--
-- Indexes for table `computer_resources`
--
ALTER TABLE `computer_resources`
  ADD PRIMARY KEY (`resource_id`);

--
-- Indexes for table `itmms_sessions`
--
ALTER TABLE `itmms_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `room_no` (`room_no`);

--
-- Indexes for table `service_order`
--
ALTER TABLE `service_order`
  ADD PRIMARY KEY (`ref_no`);

--
-- Indexes for table `service_order_acceptance`
--
ALTER TABLE `service_order_acceptance`
  ADD PRIMARY KEY (`ref_no`);

--
-- Indexes for table `service_order_completion`
--
ALTER TABLE `service_order_completion`
  ADD PRIMARY KEY (`ref_no`);

--
-- Indexes for table `service_order_timeline`
--
ALTER TABLE `service_order_timeline`
  ADD PRIMARY KEY (`ref_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_id` (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `classroom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `clusters`
--
ALTER TABLE `clusters`
  MODIFY `cluster_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `computers`
--
ALTER TABLE `computers`
  MODIFY `computer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `computer_parts`
--
ALTER TABLE `computer_parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `computer_resources`
--
ALTER TABLE `computer_resources`
  MODIFY `resource_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `service_order`
--
ALTER TABLE `service_order`
  MODIFY `ref_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `classrooms`
--
ALTER TABLE `classrooms`
  ADD CONSTRAINT `classrooms_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE;

--
-- Constraints for table `clusters`
--
ALTER TABLE `clusters`
  ADD CONSTRAINT `clusters_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE;

--
-- Constraints for table `computer_designation`
--
ALTER TABLE `computer_designation`
  ADD CONSTRAINT `computer_designation_ibfk_1` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`computer_id`) ON DELETE CASCADE;

--
-- Constraints for table `computer_parts`
--
ALTER TABLE `computer_parts`
  ADD CONSTRAINT `computer_part` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`computer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `service_order_acceptance`
--
ALTER TABLE `service_order_acceptance`
  ADD CONSTRAINT `service_order_acceptance_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `service_order` (`ref_no`) ON DELETE CASCADE;

--
-- Constraints for table `service_order_completion`
--
ALTER TABLE `service_order_completion`
  ADD CONSTRAINT `service_order_completion_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `service_order` (`ref_no`) ON DELETE CASCADE;

--
-- Constraints for table `service_order_timeline`
--
ALTER TABLE `service_order_timeline`
  ADD CONSTRAINT `service_order_timeline_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `service_order` (`ref_no`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
