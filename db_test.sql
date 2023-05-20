-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2023 at 03:43 AM
-- Server version: 8.0.33
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(20) DEFAULT NULL,
  `account_username` varchar(12) DEFAULT NULL,
  `account_email` varchar(50) DEFAULT NULL,
  `account_password` varchar(250) DEFAULT NULL,
  `account_role` enum('root','admin','user') DEFAULT NULL,
  `account_isactive` tinyint(1) DEFAULT NULL,
  `account_image` varchar(250) DEFAULT NULL,
  `account_created` datetime DEFAULT NULL,
  `account_modified` datetime DEFAULT NULL,
  `account_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_name`, `account_username`, `account_email`, `account_password`, `account_role`, `account_isactive`, `account_image`, `account_created`, `account_modified`, `account_deleted`) VALUES
(1, 'Super Admin', 'root', 'root@gmail.com', '$2y$10$05t8T.yZmIziYg8OxRQTdOMh.D5SoOTCF7oipBSGdqRMKKQ8AwWEi', 'root', 1, NULL, '2023-05-20 08:06:21', '2023-05-20 08:06:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) DEFAULT NULL,
  `category_description` varchar(250) DEFAULT NULL,
  `category_created` datetime DEFAULT NULL,
  `category_modified` datetime DEFAULT NULL,
  `category_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(250) DEFAULT NULL,
  `product_brand` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_description` varchar(250) DEFAULT NULL,
  `product_stock` float DEFAULT NULL,
  `product_capital` bigint DEFAULT NULL,
  `product_price` bigint DEFAULT NULL,
  `product_discount` float DEFAULT NULL,
  `product_rating` float DEFAULT NULL,
  `product_image` varchar(250) DEFAULT NULL,
  `product_created` datetime DEFAULT NULL,
  `product_modified` datetime DEFAULT NULL,
  `product_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
