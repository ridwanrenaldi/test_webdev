-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 20, 2023 at 03:48 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_description`, `category_created`, `category_modified`, `category_deleted`) VALUES
(1, 'smartphones', 'smartphones', '2023-05-20 10:48:04', '2023-05-20 10:48:19', NULL),
(2, 'laptops', 'laptops', '2023-05-20 10:48:04', '2023-05-20 10:48:19', NULL),
(3, 'fragrances', 'fragrances', '2023-05-20 10:48:04', '2023-05-20 10:48:19', NULL),
(4, 'skincare', 'skincare', '2023-05-20 10:48:04', '2023-05-20 10:48:19', NULL),
(5, 'groceries', 'groceries', '2023-05-20 10:48:04', '2023-05-20 10:48:19', NULL),
(6, 'home-decoration', 'home-decoration', '2023-05-20 10:48:04', '2023-05-20 10:48:19', NULL),
(7, 'furniture', 'furniture', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(8, 'tops', 'tops', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(9, 'womens-dresses', 'womens-dresses', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(10, 'womens-shoes', 'womens-shoes', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(11, 'mens-shirts', 'mens-shirts', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(12, 'mens-shoes', 'mens-shoes', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(13, 'mens-watches', 'mens-watches', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(14, 'womens-watches', 'womens-watches', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(15, 'womens-bags', 'womens-bags', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(16, 'womens-jewellery', 'womens-jewellery', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(17, 'sunglasses', 'sunglasses', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(18, 'automotive', 'automotive', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(19, 'motorcycle', 'motorcycle', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL),
(20, 'lighting', 'lighting', '2023-05-20 10:48:04', '2023-05-20 10:48:04', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_code`, `product_name`, `product_brand`, `product_description`, `product_stock`, `product_capital`, `product_price`, `product_discount`, `product_rating`, `product_image`, `product_created`, `product_modified`, `product_deleted`) VALUES
(1, 1, '42ACFC', 'iPhone 9', 'Apple', 'An apple mobile which is nothing like apple', 94, NULL, 549, 12.96, 4.69, 'https://i.dummyjson.com/data/products/1/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(2, 1, '1B37E2', 'iPhone X', 'Apple', 'SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...', 34, NULL, 899, 17.94, 4.44, 'https://i.dummyjson.com/data/products/2/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(3, 1, 'C01630', 'Samsung Universe 9', 'Samsung', 'Samsung\'s new variant which goes beyond Galaxy to the Universe', 36, NULL, 1249, 15.46, 4.09, 'https://i.dummyjson.com/data/products/3/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(4, 1, '9F2CD2', 'OPPOF19', 'OPPO', 'OPPO F19 is officially announced on April 2021.', 123, NULL, 280, 17.91, 4.3, 'https://i.dummyjson.com/data/products/4/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(5, 1, '253DD1', 'Huawei P30', 'Huawei', 'Huawei’s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.', 32, NULL, 499, 10.58, 4.09, 'https://i.dummyjson.com/data/products/5/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(6, 2, '574A69', 'MacBook Pro', 'Apple', 'MacBook Pro 2021 with mini-LED display may launch between September, November', 83, NULL, 1749, 11.02, 4.57, 'https://i.dummyjson.com/data/products/6/thumbnail.png', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(7, 2, '86B8F3', 'Samsung Galaxy Book', 'Samsung', 'Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched', 50, NULL, 1499, 4.15, 4.25, 'https://i.dummyjson.com/data/products/7/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(8, 2, '627506', 'Microsoft Surface Laptop 4', 'Microsoft Surface', 'Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.', 68, NULL, 1499, 10.23, 4.43, 'https://i.dummyjson.com/data/products/8/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(9, 2, 'CCDB0B', 'Infinix INBOOK', 'Infinix', 'Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey – 1 Year Warranty', 96, NULL, 1099, 11.83, 4.54, 'https://i.dummyjson.com/data/products/9/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(10, 2, 'B94F3F', 'HP Pavilion 15-DK1056WM', 'HP Pavilion', 'HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10', 89, NULL, 1099, 6.18, 4.43, 'https://i.dummyjson.com/data/products/10/thumbnail.jpeg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(11, 3, '66AC29', 'perfume Oil', 'Impression of Acqua Di Gio', 'Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil', 65, NULL, 13, 8.4, 4.26, 'https://i.dummyjson.com/data/products/11/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(12, 3, 'E707E7', 'Brown Perfume', 'Royal_Mirage', 'Royal_Mirage Sport Brown Perfume for Men & Women - 120ml', 52, NULL, 40, 15.66, 4, 'https://i.dummyjson.com/data/products/12/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(13, 3, 'D368C2', 'Fog Scent Xpressio Perfume', 'Fog Scent Xpressio', 'Product details of Best Fog Scent Xpressio Perfume 100ml For Men cool long lasting perfumes for Men', 61, NULL, 13, 8.14, 4.59, 'https://i.dummyjson.com/data/products/13/thumbnail.webp', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(14, 3, 'D3469D', 'Non-Alcoholic Concentrated Perfume Oil', 'Al Munakh', 'Original Al Munakh® by Mahal Al Musk | Our Impression of Climate | 6ml Non-Alcoholic Concentrated Perfume Oil', 114, NULL, 120, 15.6, 4.21, 'https://i.dummyjson.com/data/products/14/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(15, 3, 'F7238F', 'Eau De Perfume Spray', 'Lord - Al-Rehab', 'Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality', 105, NULL, 30, 10.99, 4.7, 'https://i.dummyjson.com/data/products/15/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(16, 4, '960580', 'Hyaluronic Acid Serum', 'L\'Oreal Paris', 'L\'OrÃ©al Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid', 110, NULL, 19, 13.31, 4.83, 'https://i.dummyjson.com/data/products/16/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(17, 4, 'DBCFF9', 'Tree Oil 30ml', 'Hemani Tea', 'Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,', 78, NULL, 12, 4.09, 4.52, 'https://i.dummyjson.com/data/products/17/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(18, 4, '36CB28', 'Oil Free Moisturizer 100ml', 'Dermive', 'Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid & sunscreen.', 88, NULL, 40, 13.1, 4.56, 'https://i.dummyjson.com/data/products/18/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(19, 4, 'FFE0DC', 'Skin Beauty Serum.', 'ROREC White Rice', 'Product name: rorec collagen hyaluronic acid white face serum riceNet weight: 15 m', 54, NULL, 46, 10.68, 4.42, 'https://i.dummyjson.com/data/products/19/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(20, 4, 'C77C3E', 'Freckle Treatment Cream- 15gm', 'Fair & Clear', 'Fair & Clear is Pakistan\'s only pure Freckle cream which helpsfade Freckles, Darkspots and pigments. Mercury level is 0%, so there are no side effects.', 140, NULL, 70, 16.99, 4.06, 'https://i.dummyjson.com/data/products/20/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(21, 5, '3ACA1E', '- Daal Masoor 500 grams', 'Saaf & Khaas', 'Fine quality Branded Product Keep in a cool and dry place', 133, NULL, 20, 4.81, 4.44, 'https://i.dummyjson.com/data/products/21/thumbnail.png', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(22, 5, '8500A4', 'Elbow Macaroni - 400 gm', 'Bake Parlor Big', 'Product details of Bake Parlor Big Elbow Macaroni - 400 gm', 146, NULL, 14, 15.58, 4.57, 'https://i.dummyjson.com/data/products/22/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(23, 5, 'F468AE', 'Orange Essence Food Flavou', 'Baking Food Items', 'Specifications of Orange Essence Food Flavour For Cakes and Baking Food Item', 26, NULL, 14, 8.04, 4.85, 'https://i.dummyjson.com/data/products/23/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(24, 5, 'A17277', 'cereals muesli fruit nuts', 'fauji', 'original fauji cereal muesli 250gm box pack original fauji cereals muesli fruit nuts flakes breakfast cereal break fast faujicereals cerels cerel foji fouji', 113, NULL, 46, 16.8, 4.94, 'https://i.dummyjson.com/data/products/24/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(25, 5, 'A25492', 'Gulab Powder 50 Gram', 'Dry Rose', 'Dry Rose Flower Powder Gulab Powder 50 Gram • Treats Wounds', 47, NULL, 70, 13.58, 4.87, 'https://i.dummyjson.com/data/products/25/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(26, 6, '41D524', 'Plant Hanger For Home', 'Boho Decor', 'Boho Decor Plant Hanger For Home Wall Decoration Macrame Wall Hanging Shelf', 131, NULL, 41, 17.86, 4.08, 'https://i.dummyjson.com/data/products/26/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(27, 6, '80778F', 'Flying Wooden Bird', 'Flying Wooden', 'Package Include 6 Birds with Adhesive Tape Shape: 3D Shaped Wooden Birds Material: Wooden MDF, Laminated 3.5mm', 17, NULL, 51, 15.58, 4.41, 'https://i.dummyjson.com/data/products/27/thumbnail.webp', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(28, 6, '475F19', '3D Embellishment Art Lamp', 'LED Lights', '3D led lamp sticker Wall sticker 3d wall art light on/off button  cell operated (included)', 54, NULL, 20, 16.49, 4.82, 'https://i.dummyjson.com/data/products/28/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(29, 6, '4C7E47', 'Handcraft Chinese style', 'luxury palace', 'Handcraft Chinese style art luxury palace hotel villa mansion home decor ceramic vase with brass fruit plate', 7, NULL, 60, 15.34, 4.44, 'https://i.dummyjson.com/data/products/29/thumbnail.webp', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL),
(30, 6, 'AAD50B', 'Key Holder', 'Golden', 'Attractive DesignMetallic materialFour key hooksReliable & DurablePremium Quality', 54, NULL, 30, 2.92, 4.92, 'https://i.dummyjson.com/data/products/30/thumbnail.jpg', '2023-05-20 10:48:19', '2023-05-20 10:48:19', NULL);

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
