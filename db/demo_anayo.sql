-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 21, 2020 at 07:21 AM
-- Server version: 5.6.47-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo_anayo`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_primary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_secondary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `first_name`, `last_name`, `address_primary`, `address_secondary`, `state`, `city`, `zip`, `country`, `company_name`, `phone_no`, `phone_no_2`, `email_address`) VALUES
(37, 48, 'Jisan', 'Ahmed', 'DIT Project, Gulshan', NULL, 'Dhaka', 'Dhaka', '1200', 'BD', 'JSIT', 'Jisan', 'Jisan', 'Jisan'),
(39, 1, 'Nirmal', 'Singh', 'A-8, Bigjos Tower', 'Hemkunt Nagar', 'India', 'Delhi', '110034', 'IN', 'Nk Dezines', NULL, NULL, NULL),
(40, 1, 'John', 'Smith', '4B, 4th Floor, Bigjos Tower, Pitampura', NULL, 'India', 'Delhi', '110034', 'IN', 'Nk Dezines', NULL, NULL, NULL),
(42, 47, 'Nirmal', 'Singh', 'A-8, Bigjos Tower', 'Hemkunt Nagar', 'India', 'Delhi', '110034', 'IN', 'Nk Dezines', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `visibility`) VALUES
(14, 'Tops', 'tops', 1),
(15, 'Dresses', 'dresses', 1),
(19, 'Sets', 'sets', 1);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `slug`) VALUES
(1, 'Black', '#000000', 'black'),
(12, 'Red', 'red', 'red'),
(26, 'WHITE', '#fff', 'white'),
(27, 'CHAMPAGNE', '#f7e7ce', 'champagne'),
(28, 'Peach', '#12321312', 'peach');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usageLimit` int(10) UNSIGNED DEFAULT NULL,
  `limitPerCustomer` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `startTime` date DEFAULT NULL,
  `expirationTime` date DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `appliesTo` int(11) DEFAULT NULL,
  `specificProduct` bigint(20) DEFAULT NULL,
  `specificCollection` bigint(20) DEFAULT NULL,
  `minimumSubtotal` bigint(20) DEFAULT NULL,
  `limitedToOneItem` tinyint(1) DEFAULT NULL,
  `fixedPriceAmount` int(10) UNSIGNED DEFAULT NULL,
  `discountAmount` int(10) UNSIGNED DEFAULT NULL,
  `discountPercentage` int(10) UNSIGNED DEFAULT NULL,
  `buyX` int(10) UNSIGNED DEFAULT NULL,
  `getY` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `name`, `usageLimit`, `limitPerCustomer`, `active`, `startTime`, `expirationTime`, `type`, `appliesTo`, `specificProduct`, `specificCollection`, `minimumSubtotal`, `limitedToOneItem`, `fixedPriceAmount`, `discountAmount`, `discountPercentage`, `buyX`, `getY`, `created_at`, `updated_at`) VALUES
(7, 'discount20', 'Discount flat 20', NULL, NULL, 1, '2020-06-10', NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 20, NULL, NULL, NULL, '2020-06-06 13:46:36', '2020-06-06 13:46:36'),
(9, 'WINTER123', 'Winter Sale', 100, 1, 1, '2020-06-06', '2020-06-07', 5, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, '2020-06-06 13:51:50', '2020-07-19 19:03:40'),
(12, 'BLACKFRIDAY123', 'Black Friday Sale', 20, 1, 1, '2020-06-06', '2020-06-07', 1, 2, NULL, 14, NULL, 0, NULL, 20, NULL, NULL, NULL, '2020-06-06 15:18:09', '2020-06-06 15:18:09'),
(13, 'Laura40', 'Summer Sale', NULL, NULL, 1, '2020-06-08', NULL, 2, 0, NULL, NULL, NULL, 0, NULL, NULL, 40, NULL, NULL, '2020-06-07 15:13:04', '2020-06-07 15:13:04'),
(14, '54164', 'John Smith', NULL, NULL, 1, '2020-07-19', NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 565, NULL, NULL, NULL, '2020-07-19 19:04:12', '2020-07-20 22:17:03'),
(15, 'kp001', 'KPSUMMER', NULL, NULL, 1, '2020-07-20', NULL, 1, 0, NULL, NULL, NULL, 0, NULL, 50, NULL, NULL, NULL, '2020-07-20 16:17:45', '2020-07-20 16:17:45');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `specialPrice` double(8,2) UNSIGNED DEFAULT NULL,
  `sortPrice` double(8,2) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ribbon` text COLLATE utf8mb4_unicode_ci,
  `trackQuantity` tinyint(1) NOT NULL DEFAULT '0',
  `continueSelling` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `color_id`, `size_id`, `slug`, `price`, `specialPrice`, `sortPrice`, `sku`, `ribbon`, `trackQuantity`, `continueSelling`, `quantity`, `created_at`, `updated_at`) VALUES
(131, 33, 12, 552, 'dress-lauren-xs-red', 299.00, NULL, 299.00, 'SS2020D-01R', 'Best Seller', 1, 0, 500, '2020-07-19 06:47:21', '2020-07-19 18:20:04'),
(132, 33, 1, 552, 'dress-lauren-xs-black', 299.00, NULL, 299.00, 'SS2020D-01B', 'Best Seller', 1, 0, 500, '2020-07-19 06:47:22', '2020-07-19 18:20:45'),
(133, 33, 12, 551, 'dress-lauren-s-red', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 06:47:24', '2020-07-19 06:47:24'),
(134, 33, 1, 551, 'dress-lauren-s-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 06:47:24', '2020-07-19 06:47:24'),
(135, 33, 12, 550, 'dress-lauren-m-red', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 06:47:24', '2020-07-19 06:47:24'),
(136, 33, 1, 550, 'dress-lauren-m-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 06:47:24', '2020-07-19 06:47:24'),
(137, 33, 12, 549, 'dress-lauren-l-red', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 06:47:24', '2020-07-19 06:47:24'),
(138, 33, 1, 549, 'dress-lauren-l-black', 280.00, NULL, 280.00, 'skutest01', NULL, 0, 0, 0, '2020-07-19 06:47:24', '2020-07-21 03:50:18'),
(140, 35, 27, 552, 'dress-aurelia-xs-champagne', 399.00, NULL, 399.00, 'SS2020D-02C', NULL, 0, 0, 10, '2020-07-19 18:22:46', '2020-07-19 20:52:02'),
(141, 35, 1, 552, 'dress-aurelia-xs-black', 399.00, NULL, 399.00, 'SS2020D-02B', NULL, 0, 0, 50, '2020-07-19 18:22:47', '2020-07-19 20:50:39'),
(142, 35, 27, 551, 'dress-aurelia-s-champagne', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:22:49', '2020-07-19 18:22:49'),
(143, 35, 1, 551, 'dress-aurelia-s-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:22:49', '2020-07-19 18:22:49'),
(144, 35, 27, 550, 'dress-aurelia-m-champagne', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:22:49', '2020-07-19 18:22:49'),
(145, 35, 1, 550, 'dress-aurelia-m-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:22:49', '2020-07-19 18:22:49'),
(146, 35, 27, 549, 'dress-aurelia-l-champagne', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:22:49', '2020-07-19 18:22:49'),
(147, 35, 1, 549, 'dress-aurelia-l-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:22:49', '2020-07-19 18:22:49'),
(148, 36, 12, 552, 'top-amal-xs-red', 199.00, NULL, NULL, 'SS2020T-03R', NULL, 0, 0, 10, '2020-07-19 18:24:50', '2020-07-19 18:24:50'),
(149, 36, 1, 552, 'top-amal-xs-black', 199.00, NULL, NULL, 'SS2020T-03B', NULL, 0, 0, 10, '2020-07-19 18:24:52', '2020-07-19 18:24:52'),
(150, 36, 12, 551, 'top-amal-s-red', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:24:54', '2020-07-19 18:24:54'),
(151, 36, 1, 551, 'top-amal-s-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:24:54', '2020-07-19 18:24:54'),
(152, 36, 12, 550, 'top-amal-m-red', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:24:54', '2020-07-19 18:24:54'),
(153, 36, 1, 550, 'top-amal-m-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:24:54', '2020-07-19 18:24:54'),
(154, 36, 12, 549, 'top-amal-l-red', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:24:54', '2020-07-19 18:24:54'),
(155, 36, 1, 549, 'top-amal-l-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:24:54', '2020-07-19 18:24:54'),
(156, 37, 26, 552, 'top-adriana-xs-white', 499.00, 250.00, 250.00, 'SS2020T-04W', 'Best Seller', 1, 0, 0, '2020-07-19 18:26:33', '2020-07-19 22:08:39'),
(157, 37, 1, 550, 'top-adriana-xs-black', 499.00, 250.00, 250.00, 'SS2020T-04B', 'Best Seller', 1, 0, 0, '2020-07-19 18:26:34', '2020-07-19 22:08:50'),
(158, 37, 26, 551, 'top-adriana-s-white', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:26:36', '2020-07-19 18:26:36'),
(159, 37, 1, 551, 'top-adriana-s-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:26:36', '2020-07-19 18:26:36'),
(160, 37, 26, 550, 'top-adriana-m-white', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:26:36', '2020-07-19 18:26:36'),
(161, 37, 1, 550, 'top-adriana-m-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:26:36', '2020-07-19 18:26:36'),
(162, 37, 26, 549, 'top-adriana-l-white', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:26:36', '2020-07-19 18:26:36'),
(163, 37, 1, 549, 'top-adriana-l-black', 0.00, NULL, NULL, NULL, NULL, 0, 0, 0, '2020-07-19 18:26:36', '2020-07-19 18:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(24, 'App\\Page', 8, 'd44290c3-fb0d-4ba6-84f7-6bdaa37a7358', 'about_bg_image', 'about-bg', 'about-bg.png', 'image/png', 'public', 'public', 313235, '[]', '[]', '[]', 3, '2020-05-03 01:36:52', '2020-05-03 01:36:52'),
(25, 'App\\Page', 2, '8c5033fa-adf2-4344-875c-966d59407872', 'home_bg_image', 'about-bg', 'about-bg.png', 'image/png', 'public', 'public', 313235, '[]', '[]', '[]', 4, '2020-05-03 01:52:34', '2020-05-03 01:52:34'),
(26, 'App\\Page', 2, 'a8ee0240-3cb8-4cf1-9fb7-20cbb89b2b84', 'home_bg_video', 'cover-girl', 'cover-girl.mp4', 'video/mp4', 'public', 'public', 4186627, '[]', '[]', '[]', 5, '2020-05-03 01:52:34', '2020-05-03 01:52:34'),
(28, 'App\\Page', 2, 'c16d7985-1192-4d22-86fe-870b37f63ac2', 'home_content2_Image', 'explore-collection-2', 'explore-collection-2.png', 'image/png', 'public', 'public', 421842, '[]', '[]', '[]', 7, '2020-05-03 01:54:43', '2020-05-03 01:54:43'),
(29, 'App\\Page', 2, '2192c774-0551-41c5-93f5-1e69b821d1f2', 'home_content1_Image', 'explore-collection-1', 'explore-collection-1.png', 'image/png', 'public', 'public', 318195, '[]', '[]', '[]', 8, '2020-05-03 01:55:10', '2020-05-03 01:55:10'),
(354, 'App\\Option', 17, '6d724ecd-2d52-4b5e-8956-91beaef711bc', 'option_site_logo_secondary', 'anayo-logo', 'anayo-logo.svg', 'image/svg', 'public', 'public', 1235, '[]', '[]', '[]', 13, '2020-05-21 12:30:32', '2020-05-21 12:30:32'),
(355, 'App\\Option', 16, '2fd6bfd2-b10f-4918-ad9f-bfe997238af8', 'option_site_logo', 'Anayo-main-logo', 'Anayo-main-logo.svg', 'image/svg', 'public', 'public', 1747, '[]', '[]', '[]', 14, '2020-05-21 12:34:44', '2020-05-21 12:34:44'),
(456, 'App\\Product', 28, '1851714e-79e7-404b-88b7-d3e08101aa17', 'product', '158797780275f3462d0502cbfa8666012c3a82da86_thumbnail_600x', '158797780275f3462d0502cbfa8666012c3a82da86_thumbnail_600x.jpg', 'image/jpeg', 'public', 'public', 121045, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"product\":true}}', '[]', 23, '2020-06-20 16:29:15', '2020-06-20 16:29:17'),
(457, 'App\\Product', 28, 'c0fea7f7-696e-4518-8f56-51e76fa7b17d', 'product', '1587977807276aa5d7f713ea487b1cab8260e20655_thumbnail_600x', '1587977807276aa5d7f713ea487b1cab8260e20655_thumbnail_600x.jpg', 'image/jpeg', 'public', 'public', 78494, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"product\":true}}', '[]', 24, '2020-06-20 16:29:17', '2020-06-20 16:29:19'),
(462, 'App\\Page', 12, '846561b8-2982-48ce-b508-b6905782c0f1', 'shop_bg_image', 'banner', 'banner.jpg', 'image/jpeg', 'public', 'public', 173012, '[]', '[]', '[]', 25, '2020-07-11 06:43:51', '2020-07-11 06:43:51'),
(487, 'App\\Inventory', 131, 'f0b3ed9b-7dde-479e-a102-68d69a7bcf7e', 'inventory', '1588664842f8fa7ffd43c01137397848e85a0f509f_thumbnail_600x', '1588664842f8fa7ffd43c01137397848e85a0f509f_thumbnail_600x.jpg', 'image/jpeg', 'public', 'public', 51363, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 1, '2020-07-19 18:19:41', '2020-07-19 18:19:42'),
(488, 'App\\Inventory', 131, '14c44042-07f0-454f-bdb3-7278cb79685a', 'inventory', '15886648337a41c956d3ed9cdca0b2be67895c7009_thumbnail_600x', '15886648337a41c956d3ed9cdca0b2be67895c7009_thumbnail_600x.jpg', 'image/jpeg', 'public', 'public', 42900, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 3, '2020-07-19 18:19:42', '2020-07-19 18:19:43'),
(489, 'App\\Inventory', 132, '3be97045-b258-41de-b7ef-6565677dd4b4', 'inventory', '1588664847c491a88c1fd106d73c830c5c4e182c76_thumbnail_600x', '1588664847c491a88c1fd106d73c830c5c4e182c76_thumbnail_600x.jpg', 'image/jpeg', 'public', 'public', 40423, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 1, '2020-07-19 18:20:23', '2020-07-19 18:20:24'),
(490, 'App\\Inventory', 132, 'c39b4f95-bb50-45de-b974-2c2c0e92140c', 'inventory', '158866485042b30a3fd1fb934da034a7a0aa0161a5_thumbnail_600x', '158866485042b30a3fd1fb934da034a7a0aa0161a5_thumbnail_600x.jpg', 'image/jpeg', 'public', 'public', 40309, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 3, '2020-07-19 18:20:24', '2020-07-19 18:20:25'),
(491, 'App\\Inventory', 140, '0553a696-0462-4638-8846-644632bb7698', 'inventory', 'media-libraryisT91W', 'media-libraryisT91W', 'image/jpeg', 'public', 'public', 63784, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 0, '2020-07-19 18:22:46', '2020-07-19 18:22:46'),
(492, 'App\\Inventory', 140, '458b42fd-e7a7-42fb-bee1-d7f6e49e3377', 'inventory', 'media-libraryt4Q6u4', 'media-libraryt4Q6u4', 'image/jpeg', 'public', 'public', 87131, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 1, '2020-07-19 18:22:46', '2020-07-19 18:22:47'),
(493, 'App\\Inventory', 141, 'fb59ea49-6eb2-47ec-ac4c-35d8eec44ade', 'inventory', 'media-libraryYmYeFm', 'media-libraryYmYeFm', 'image/jpeg', 'public', 'public', 54070, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 0, '2020-07-19 18:22:47', '2020-07-19 18:22:48'),
(494, 'App\\Inventory', 141, '7c2a0df5-8ccf-4d06-9591-562d83a2e8af', 'inventory', 'media-librarysUEnaI', 'media-librarysUEnaI', 'image/jpeg', 'public', 'public', 85744, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 1, '2020-07-19 18:22:48', '2020-07-19 18:22:49'),
(495, 'App\\Inventory', 148, 'd4dca25d-d944-4ba0-98ef-f0fb7c7570f6', 'inventory', 'media-libraryF8rOnb', 'media-libraryF8rOnb', 'image/jpeg', 'public', 'public', 115012, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 35, '2020-07-19 18:24:50', '2020-07-19 18:24:50'),
(496, 'App\\Inventory', 148, '7b079edb-36fd-4330-b61f-8cb8264262c7', 'inventory', 'media-libraryipwJcY', 'media-libraryipwJcY', 'image/jpeg', 'public', 'public', 171969, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 36, '2020-07-19 18:24:50', '2020-07-19 18:24:52'),
(497, 'App\\Inventory', 149, '3d73a190-0721-42bd-acc3-d41fdccc2cd1', 'inventory', 'media-libraryh6yB6Z', 'media-libraryh6yB6Z', 'image/jpeg', 'public', 'public', 119452, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 37, '2020-07-19 18:24:52', '2020-07-19 18:24:53'),
(498, 'App\\Inventory', 149, '477ae416-be83-4674-95e4-d9a3ceba5645', 'inventory', 'media-libraryYXKj86', 'media-libraryYXKj86', 'image/jpeg', 'public', 'public', 265776, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 38, '2020-07-19 18:24:53', '2020-07-19 18:24:54'),
(499, 'App\\Inventory', 156, '8aff80ae-ca2c-403d-a5d7-0bf307a9bc61', 'inventory', 'media-librarytGTn8g', 'media-librarytGTn8g', 'image/jpeg', 'public', 'public', 164756, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 0, '2020-07-19 18:26:33', '2020-07-19 18:26:34'),
(500, 'App\\Inventory', 156, 'f6209579-50c5-45d7-8a5c-302afbcae43a', 'inventory', 'media-library8MSJ29', 'media-library8MSJ29', 'image/jpeg', 'public', 'public', 187076, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 1, '2020-07-19 18:26:34', '2020-07-19 18:26:34'),
(501, 'App\\Inventory', 157, '996286be-a609-446c-923d-015f0b8df8ad', 'inventory', 'media-library1jt6h8', 'media-library1jt6h8', 'image/jpeg', 'public', 'public', 159152, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 0, '2020-07-19 18:26:34', '2020-07-19 18:26:35'),
(502, 'App\\Inventory', 157, '9696d608-8a2b-487d-b21e-5523ecd99149', 'inventory', 'media-libraryyA0T0b', 'media-libraryyA0T0b', 'image/jpeg', 'public', 'public', 230097, '[]', '{\"generated_conversions\":{\"thumbnail\":true,\"inventory\":true}}', '[]', 1, '2020-07-19 18:26:35', '2020-07-19 18:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2020_04_11_083750_create_options', 3),
(12, '2020_04_09_135648_create_pages', 6),
(14, '2020_04_15_080234_create_pagemeta', 7),
(19, '2020_04_23_080604_create_sizes', 9),
(40, '2020_04_11_155537_create_attachments', 17),
(44, '2020_05_03_001523_create_media_table', 20),
(50, '2020_04_28_142339_create_categories', 24),
(64, '2020_04_16_112441_create_seo', 29),
(66, '2020_04_29_141430_create_products', 31),
(67, '2020_05_10_094656_create_roles', 32),
(69, '2020_04_29_144049_create_inventory', 33),
(78, '2014_10_12_000000_create_users_table', 34),
(79, '2020_05_11_210254_create_address', 35),
(80, '2020_04_28_124317_create_colors', 36),
(82, '2020_05_19_112146_create_wishlists', 37),
(83, '2020_05_20_154716_create_sessions_table', 38),
(85, '2020_05_24_171729_create_coupons', 39);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`) VALUES
(1, 'site_title', 'Anayo'),
(2, 'site_tagline', 'Some description'),
(3, 'top_header_text', 'Free shipping worldwide on orders above $100'),
(4, 'copyright_text', '© 2020 Anayo. All Rights Reserved | contact@anayo.com'),
(5, 'site_facebook', '#'),
(6, 'site_pinterest', '#'),
(7, 'site_instagram', '#'),
(9, 'site_maintenance', NULL),
(10, 'change_email', 'nkdezines@gmail.com'),
(11, 'site_instagram_url', 'https://www.instagram.com/lezada_shop/'),
(12, 'site_instagram_user_id', '6666969077'),
(13, 'site_instagram_accesstoken', '6666969077.1677ed0.d325f406d94c4dfab939137c5c2cc6c2'),
(14, 'site_google_map_api', 'AIzaSyChs2QWiAhnzz0a4OEhzqCXwx_qA9ST_lE'),
(16, 'site_logo', 'primary_logo'),
(17, 'site_logo_secondary', 'secondary_logo');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `billing_address_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_percent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_coupon_apply` tinyint(1) DEFAULT NULL,
  `coupon_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `billing_address_id`, `shipping_address_id`, `tax`, `tax_percent`, `is_coupon_apply`, `coupon_id`, `total_amount`, `shipping_fee`, `order_status`, `created_at`, `updated_at`) VALUES
(7, 1, 36, NULL, '19', '19', NULL, NULL, '119', '0', 3, '2020-07-09 12:41:42', '2020-07-10 15:15:38'),
(8, 1, 33, NULL, '9.5', '19', NULL, NULL, '59.5', '0', 3, '2020-07-09 13:39:58', '2020-07-10 15:16:27'),
(9, 48, 37, NULL, '19', '19', NULL, NULL, '119', '0', 1, '2020-07-10 12:08:14', '2020-07-10 13:27:27'),
(10, 1, 36, NULL, '66.5', '19', NULL, NULL, '416.5', '0', 3, '2020-07-10 15:17:32', '2020-07-19 16:20:29'),
(19, 1, 36, NULL, '9.5', '19', NULL, NULL, '59.5', '0', 3, '2020-07-13 12:47:16', '2020-07-19 22:29:11'),
(20, 47, 35, NULL, '56.81', '19', NULL, NULL, '355.81', '0', 0, '2020-07-19 21:02:18', '2020-07-19 21:02:18'),
(29, 1, 40, NULL, '47.5', '19', NULL, NULL, '297.5', '0', 0, '2020-07-21 02:46:01', '2020-07-21 02:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_id`, `quantity`, `created_at`, `updated_at`) VALUES
(5, 4, 111, 1, '2020-07-08 13:26:18', '2020-07-08 13:26:18'),
(6, 5, 111, 1, '2020-07-08 13:28:05', '2020-07-08 13:28:05'),
(8, 7, 111, 1, '2020-07-09 12:41:43', '2020-07-09 12:41:43'),
(9, 8, 110, 1, '2020-07-09 13:39:58', '2020-07-09 13:39:58'),
(10, 9, 111, 1, '2020-07-10 12:08:14', '2020-07-10 12:08:14'),
(11, 10, 111, 3, '2020-07-10 15:17:33', '2020-07-10 15:17:33'),
(12, 10, 110, 1, '2020-07-10 15:17:33', '2020-07-10 15:17:33'),
(13, 19, 110, 1, '2020-07-13 12:47:16', '2020-07-13 12:47:16'),
(14, 20, 132, 1, '2020-07-19 21:02:18', '2020-07-19 21:02:18'),
(25, 29, 156, 1, '2020-07-21 02:46:01', '2020-07-21 02:46:01');

-- --------------------------------------------------------

--
-- Table structure for table `pagemeta`
--

CREATE TABLE `pagemeta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagemeta`
--

INSERT INTO `pagemeta` (`id`, `post_id`, `name`, `value`) VALUES
(1, 2, 'header_title', 'Wild Country'),
(2, 2, 'header_subtitle', 'Don\'t let the soft, sweet country florals fool you. The subtly sexy elements in the new spring collection are anything but innocent.'),
(3, 2, 'button_name', 'Shop The Collection'),
(4, 2, 'button_link', '/shop'),
(5, 2, 'section2_title', 'SHOP THE COLLECTION'),
(6, 2, 'button2_name', 'View All Products'),
(7, 2, 'button2_link', '/shop'),
(8, 2, 'content1_subtitle', 'NEW COLLECTION'),
(9, 2, 'content1_title', 'Professional <br> skin care for you'),
(10, 2, 'content1_description', 'Lorem ipsum dolor sit amet, consectetur cing elit. Suspe ndisse suscipit sagittis leo sit met condimentum estibulum issim Lorem ipsum dolor sit amet, consectetur cing elit.'),
(11, 2, 'content1_button_name', 'Shop The Collection'),
(12, 2, 'content1_button_link', '/shop'),
(13, 2, 'content2_subtitle', 'NEW COLLECTION'),
(14, 2, 'content2_title', 'Professional <br> skin care for you'),
(15, 2, 'content2_description', 'Lorem ipsum dolor sit amet, consectetur cing elit. Suspe ndisse suscipit sagittis leo sit met condimentum estibulum issim Lorem ipsum dolor sit amet, consectetur cing elit.'),
(16, 2, 'content2_button_name', 'Shop The Collection'),
(17, 2, 'content2_button_link', '/shop'),
(18, 2, 'Section3_title', '@Anayo'),
(19, 2, 'Section3_subtitle', 'FOLLOW US ON INSTAGRAM'),
(20, 2, 'content_main_title', 'Explore The Collection'),
(46, 8, 'header_title', 'CLEVER & UNIQUE IDEAS'),
(47, 8, 'sub_title', 'SIMPLY OR WHITE'),
(48, 8, 'content_top', '&lt;p&gt;&lt;span style=&quot;color: #777777;&quot;&gt;Lorem ipsum dolor sit amet, consectetur cing elit. Suspe ndisse suscipit sagittis leo sit met condimentum estibulum is Suspe ndisse suscipit sagittis leo sit met condimentum estibulorem ipsum dolor sit amet, consectetur cing elit&lt;/span&gt;&lt;/p&gt;'),
(49, 8, 'video_url', 'https://www.youtube.com/watch?v=zWTbLZCR84k'),
(50, 8, 'content_bottom', '&lt;p&gt;&lt;span style=&quot;color: #7e7e7e;&quot;&gt;Lorem ipsum dolor sit amet, consectetur cing elit. Suspe ndisse suscipit sagittis leo sit estibulum issim Lorem ipsum dolor sit amet, consectetur cing elit. ipsum dolor sit amet, consectetur cing elit. Suspe ndisse suscipit sagittis leo sit es&lt;/span&gt;&lt;/p&gt;'),
(51, 8, 'video_title', 'OUR STORY'),
(58, 8, 'button_left_name', 'ANAYO STORE'),
(59, 8, 'button_left_link', '#'),
(60, 8, 'button_right_name', 'OUR STORY'),
(61, 8, 'button_right_link', '#'),
(62, 7, 'header_title', 'CONTACT US'),
(63, 7, 'sub_title', 'COME HAVE A LOOK'),
(64, 7, 'phone_mobile', 'Mobile: (+88) – 1990 – 6886'),
(65, 7, 'phone_hotline', 'Hotline: 1800 – 1102'),
(66, 7, 'email_one', 'Mail: contact@ana-yo.com'),
(67, 7, 'email_two', 'Mail: returns@ana-yo.com'),
(68, 7, 'hours_from', 'Mon. – Fri. 10am – 5pm'),
(69, 7, 'hours_to', 'Saturday 10 am – 2 pm'),
(70, 7, 'map_zoom', '12'),
(71, 7, 'map_title', 'ANAYO'),
(72, 7, 'map_latitude', '40.7590615'),
(73, 7, 'map_longitude', '-73.969231'),
(74, 7, 'form_heading', 'GET IN TOUCH'),
(75, 2, 'Section3_title_url', '/shop'),
(76, 12, 'header_title', 'SPRING FAVORITES'),
(77, 2, 'section2_collection', '[\"{\\\"id\\\":131,\\\"type\\\":\\\"variant\\\"}\",\"{\\\"id\\\":132,\\\"type\\\":\\\"variant\\\"}\",\"{\\\"id\\\":156,\\\"type\\\":\\\"variant\\\"}\",\"{\\\"id\\\":157,\\\"type\\\":\\\"variant\\\"}\"]'),
(78, 13, 'header_title', 'test purpose'),
(79, 13, 'category_header', 'test purpose'),
(80, 19, 'category_header', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `user`, `title`, `description`, `content`, `slug`, `template`, `created_at`, `updated_at`) VALUES
(2, 7, 'Home', NULL, NULL, 'home', 'home', '2020-04-14 09:35:30', '2020-07-19 18:35:12'),
(3, 7, 'FAQ', NULL, '&lt;h2&gt;lorem &lt;a href=&quot;#&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;lorem&lt;/a&gt;&lt;/h2&gt;\r\n&lt;p&gt;&lt;span style=&quot;color: #444444;&quot;&gt;Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the &amp;hellip;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;color: #444444;&quot;&gt;Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the &amp;hellip;&lt;/span&gt;&lt;/p&gt;', 'faq', NULL, '2020-04-14 09:37:06', '2020-05-09 07:14:13'),
(4, 1, 'Privacy Policy', NULL, '&lt;p&gt;Your privacy is important to us. It is Ana-yo&#039;s policy to respect your privacy regarding any information we may collect from you across our website,&amp;nbsp;&lt;a href=&quot;http://ana-yo.com/&quot;&gt;http://ana-yo.com/&lt;/a&gt;, and other sites we own and operate.&lt;/p&gt;\r\n&lt;p&gt;We only ask for personal information when we truly need it to provide a service to you. We collect it by fair and lawful means, with your knowledge and consent. We also let you know why we&amp;rsquo;re collecting it and how it will be used.&lt;/p&gt;\r\n&lt;p&gt;We only retain collected information for as long as necessary to provide you with your requested service. What data we store, we&amp;rsquo;ll protect within commercially acceptable means to prevent loss and theft, as well as unauthorized access, disclosure, copying, use or modification.&lt;/p&gt;\r\n&lt;p&gt;We don&amp;rsquo;t share any personally identifying information publicly or with third-parties, except when required to by law.&lt;/p&gt;\r\n&lt;p&gt;Our website may link to external sites that are not operated by us. Please be aware that we have no control over the content and practices of these sites, and cannot accept responsibility or liability for their respective privacy policies.&lt;/p&gt;\r\n&lt;p&gt;You are free to refuse our request for your personal information, with the understanding that we may be unable to provide you with some of your desired services.&lt;/p&gt;\r\n&lt;p&gt;Your continued use of our website will be regarded as acceptance of our practices around privacy and personal information. If you have any questions about how we handle user data and personal information, feel free to contact us.&lt;/p&gt;\r\n&lt;p&gt;This policy is effective as of 6 June 2020.&lt;/p&gt;', 'privacy-policy', NULL, '2020-04-14 09:37:23', '2020-06-06 14:49:18'),
(5, 7, 'Shipping and Return', NULL, NULL, 'shipping-and-return', NULL, '2020-04-14 09:37:44', '2020-05-07 12:20:49'),
(6, 7, 'Payment', NULL, NULL, 'payment', NULL, '2020-04-14 09:37:53', '2020-04-14 09:37:53'),
(7, 7, 'Contact us', NULL, NULL, 'contact-us', 'contact-us', '2020-04-14 09:38:14', '2020-05-07 12:24:06'),
(8, 7, 'About Us', NULL, NULL, 'about-us', 'about-us', '2020-04-14 09:38:21', '2020-05-09 07:18:24'),
(12, 7, 'Shop', NULL, NULL, 'shop', 'shop', '2020-04-14 09:38:50', '2020-07-11 06:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('kp@gmail.com', '$2y$10$gbQ.tS62f7m90OqC4T0v1uzUEi8OnfrFxBq2.V/SyZ4NFlz3rTFnm', '2020-05-12 16:27:15'),
('test@gmail.com', '$2y$10$ISSN7K5wBoVpeO1ygJxLCe6DGKGj43ZjJye8yV9jOYcSS6Sai2oyS', '2020-05-13 15:59:39'),
('jotpreet.sindher@gmail.com', '$2y$10$0wakhB0M2Kw9J7FpSZDqJOQVbN67dbbhR/5mpM2TNnkm1.bzpFeYC', '2020-07-10 11:43:31');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `sizingAndFit` longtext COLLATE utf8mb4_unicode_ci,
  `materialsAndCare` longtext COLLATE utf8mb4_unicode_ci,
  `shippingAndReturn` longtext COLLATE utf8mb4_unicode_ci,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user`, `category_id`, `name`, `slug`, `description`, `sizingAndFit`, `materialsAndCare`, `shippingAndReturn`, `visibility`, `created_at`, `updated_at`) VALUES
(28, 1, 0, 'temp', 'temp', NULL, NULL, NULL, NULL, 1, NULL, NULL),
(33, 1, 15, 'DRESS LAUREN', 'dress-lauren', 'description', 'sizingAndFit', 'materialsAndCare', 'shippingAndReturn', 1, '2020-07-19 06:47:21', '2020-07-19 06:47:21'),
(35, 1, 15, 'DRESS AURELIA', 'dress-aurelia', 'description', 'sizingAndFit', 'materialsAndCare', 'shippingAndReturn', 1, '2020-07-19 18:22:46', '2020-07-19 18:22:46'),
(36, 1, 14, 'TOP AMAL', 'top-amal', 'description', 'sizingAndFit', 'materialsAndCare', 'shippingAndReturn', 1, '2020-07-19 18:24:49', '2020-07-19 18:24:49'),
(37, 1, 14, 'TOP ADRIANA', 'top-adriana', 'description', 'sizingAndFit', 'materialsAndCare', 'shippingAndReturn', 1, '2020-07-19 18:26:33', '2020-07-19 18:26:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2020-05-10 11:03:40', '2020-05-10 11:03:48'),
(2, 'Customer', 'customer', '2020-05-10 14:21:01', '2020-05-10 14:21:04');

-- --------------------------------------------------------

--
-- Table structure for table `seo`
--

CREATE TABLE `seo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attachable_id` bigint(20) UNSIGNED NOT NULL,
  `attachable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `description` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo`
--

INSERT INTO `seo` (`id`, `attachable_id`, `attachable_type`, `title`, `description`) VALUES
(4, 3, 'App\\Page', NULL, NULL),
(5, 8, 'App\\Page', NULL, NULL),
(6, 2, 'App\\Page', NULL, NULL),
(7, 5, 'App\\Page', NULL, NULL),
(8, 7, 'App\\Page', NULL, NULL),
(18, 59, 'App\\Product', NULL, NULL),
(27, 8, 'App\\Product', NULL, NULL),
(28, 9, 'App\\Product', NULL, NULL),
(29, 10, 'App\\Product', NULL, NULL),
(30, 11, 'App\\Product', NULL, NULL),
(31, 12, 'App\\Product', NULL, NULL),
(32, 13, 'App\\Product', NULL, NULL),
(33, 14, 'App\\Product', NULL, NULL),
(34, 12, 'App\\Page', NULL, NULL),
(55, 4, 'App\\Page', NULL, NULL),
(56, 42, 'App\\Product', NULL, NULL),
(67, 13, 'App\\Category', 'test title', 'rrrrrrrrr'),
(70, 33, 'App\\Product', NULL, NULL),
(71, 19, 'App\\Category', NULL, NULL),
(73, 35, 'App\\Product', NULL, NULL),
(74, 36, 'App\\Product', NULL, NULL),
(75, 37, 'App\\Product', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `title`) VALUES
(549, 'L'),
(550, 'M'),
(551, 'S'),
(552, 'XS');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailMarketing` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `phone`, `emailMarketing`) VALUES
(1, 1, 'John', 'Smith', 'test@gmail.com', NULL, '$2y$10$IqJGyZXHnTvIX5jUbdCYcuJwuXjdupmj1gcEiina5X/lPL99T4mQa', 1, 'VfoVB6xN3sbLu0E1CeGeDPhY7EfyJ2HpJXQPoXr2GYiJYVLYkn8Wd1pRRvZq', '2020-05-11 05:11:14', '2020-07-19 15:54:50', '9867022264', 0),
(47, 2, 'Nirmal', 'Singh', 'jotpreet.sindher@gmail.com', NULL, '$2y$10$FA5j.MCfWSXoAvZHp85cceO1iiSdOg146f0GsihzFtgixrmQlrMl6', 1, 'lu3SEDJ8NxZ7iONRHeRABdBqSbazS92GTxWv1buYB0TjiKxPY1BZUZoYsfAn', '2020-06-27 17:09:38', '2020-06-30 05:43:12', NULL, 0),
(60, 2, 'Jhon', 'Doe', 'new@gmail.com', NULL, '$2y$10$TrxZaO8FDUYZFdPpHmgUTOwBBxU5nFWgrytN0LRT08Pc2UggBrU/6', 1, NULL, '2020-07-16 13:32:34', '2020-07-17 14:40:13', NULL, 0),
(61, 2, 'Jhon', 'Doe', 'newghgh@gmail.com', NULL, '$2y$10$7Wwj9JiGQLl5x5AR.vJST.p93IWZ.yhNcwoSvmrRioTmW1wUYyaw6', 1, NULL, '2020-07-19 05:10:32', '2020-07-19 05:10:32', NULL, 0),
(62, 2, 'Nirmal', 'Singh', 'j@gmail.com', NULL, '$2y$10$uWyfim28xAO3YRmKdh.g4uZPCiCbu3OV1tGqCS2DA46XFHg/aElNS', 1, NULL, '2020-07-19 06:14:18', '2020-07-19 06:14:18', NULL, 0),
(63, 2, 'Jisan', 'Ahmed', 'jisanahmed06@gmail.com', NULL, '$2y$10$6BiclVPy9MEGdAXFeA2sS.q7UodCzcsVQVMIQHlnx6ubDu3U0MKS2', 1, NULL, '2020-07-20 16:36:19', '2020-07-20 16:36:19', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attachable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `attachable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_visibility_index` (`visibility`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_product_id_index` (`product_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_name_index` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagemeta`
--
ALTER TABLE `pagemeta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagemeta_post_id_index` (`post_id`),
  ADD KEY `pagemeta_name_index` (`name`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_user_index` (`user`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_index` (`user`),
  ADD KEY `products_category_id_index` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seo_attachable_id_index` (`attachable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_index` (`role_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_attachable_id_index` (`attachable_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=504;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pagemeta`
--
ALTER TABLE `pagemeta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seo`
--
ALTER TABLE `seo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=553;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
