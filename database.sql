-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 07, 2022 at 11:23 AM
-- Server version: 5.7.36-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kiaras`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'kiaras', 'support@kiaras.in', 'kiaras', NULL, '61d49c3d573c21641323581.png', '$2y$10$4OnEWp765wzvukMeVOExOe9YoT5b7KBywNiBZKjWjo26QZNWBGMcO', NULL, '2022-01-05 02:13:01');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applied_coupons`
--

CREATE TABLE `applied_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_product_attributes`
--

CREATE TABLE `assign_product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_attribute_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `top`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'kiaras', '61d49b6d00dac1641323373.png', 1, NULL, NULL, NULL, '2022-01-05 02:09:33', '2022-01-05 02:09:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `session_id`, `product_id`, `attributes`, `quantity`, `created_at`, `updated_at`) VALUES
(9, 1, '61d61878e7865', 1, NULL, 1, '2022-01-06 05:16:39', '2022-01-06 05:16:39'),
(11, NULL, '61d6b976c4fc1', 1, NULL, 1, '2022-01-06 16:42:14', '2022-01-06 16:42:14'),
(12, 5, '61d6e226b6896', 1, NULL, 1, '2022-01-06 19:35:50', '2022-01-06 19:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_top` tinyint(1) NOT NULL DEFAULT '0',
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  `in_filter_menu` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `icon`, `meta_title`, `meta_description`, `meta_keywords`, `image`, `is_top`, `is_special`, `in_filter_menu`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 'Women', '<i class=\"fab fa-kickstarter-k\"></i>', NULL, NULL, NULL, '61d49b3a289551641323322.png', 1, 0, 0, '2022-01-05 02:08:42', '2022-01-05 02:08:42', NULL),
(2, 1, 'Rings', '<i class=\"far fa-heart\"></i>', NULL, NULL, NULL, '61d49b5c0e75a1641323356.jpg', 0, 0, 1, '2022-01-05 02:09:16', '2022-01-05 02:09:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` tinyint(4) NOT NULL COMMENT '1=fixed, 2=percent',
  `coupon_amount` double NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `minimum_spend` double(8,2) DEFAULT NULL,
  `maximum_spend` double(8,2) DEFAULT NULL,
  `usage_limit_per_coupon` int(11) DEFAULT NULL,
  `usage_limit_per_user` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=disabled, 1=enabled',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons_categories`
--

CREATE TABLE `coupons_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons_products`
--

CREATE TABLE `coupons_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `method_code` int(10) UNSIGNED NOT NULL,
  `amount` decimal(18,8) NOT NULL,
  `method_currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(18,8) NOT NULL,
  `rate` decimal(18,8) NOT NULL,
  `final_amo` decimal(18,8) DEFAULT '0.00000000',
  `detail` text COLLATE utf8mb4_unicode_ci,
  `btc_amo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1=>success, 2=>pending, 3=>cancel',
  `admin_feedback` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `order_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `try`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 300.00000000, 'INR', 0.00000000, 0.00000000, 300.00000000, NULL, '0', '', '7NVN9AJR6TVG', 0, 2, NULL, '2022-01-05 13:10:36', '2022-01-05 13:10:36'),
(2, 1, 2, 0, 100.00000000, 'INR', 0.00000000, 0.00000000, 100.00000000, NULL, '0', '', 'X7ZJUGDGTZVT', 0, 2, NULL, '2022-01-05 13:11:44', '2022-01-05 13:11:44'),
(3, 1, 3, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'C24S2XQB1Z3H', 0, 0, NULL, '2022-01-05 13:13:06', '2022-01-05 13:13:06'),
(4, 1, 4, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'OV34WCU62UDG', 0, 0, NULL, '2022-01-05 13:15:56', '2022-01-05 13:16:29'),
(5, 1, 6, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'RUW7H2P9Y23P', 0, 0, NULL, '2022-01-05 13:21:11', '2022-01-05 13:23:17'),
(6, 1, 7, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'U5QZ71EHAG5Z', 0, 0, NULL, '2022-01-05 13:24:35', '2022-01-05 13:24:35'),
(7, 1, 8, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'JDE5O479S5TM', 0, 0, NULL, '2022-01-05 13:27:58', '2022-01-05 13:27:58'),
(8, 1, 9, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'DD1F6Y3T3AEF', 0, 0, NULL, '2022-01-05 13:31:53', '2022-01-05 13:31:53'),
(9, 1, 10, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'ERQJSJ3R2EOB', 0, 0, NULL, '2022-01-05 13:46:57', '2022-01-05 13:46:57'),
(10, 1, 11, 0, 55.00000000, 'INR', 0.00000000, 0.00000000, 55.00000000, NULL, '0', '', 'K2JX214TZ7HE', 0, 2, NULL, '2022-01-05 14:02:21', '2022-01-05 14:02:21'),
(11, 1, 12, 112, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'V9XPRXTWQV3B', 0, 0, NULL, '2022-01-05 14:13:23', '2022-01-05 14:18:46'),
(12, 2, 13, 0, 10.00000000, 'INR', 0.00000000, 0.00000000, 10.00000000, NULL, '0', '', '8XTDB6H2OMV3', 0, 2, NULL, '2022-01-05 19:14:50', '2022-01-05 19:14:50'),
(13, 2, 14, 0, 70.00000000, 'INR', 0.00000000, 0.00000000, 70.00000000, NULL, '0', '', 'JKOVDDW6RJDZ', 0, 2, NULL, '2022-01-05 19:15:30', '2022-01-05 19:15:30'),
(14, 2, 15, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'U6MBRON52XAD', 0, 0, NULL, '2022-01-05 19:16:32', '2022-01-05 19:16:32'),
(15, 2, 16, 0, 505.00000000, 'INR', 0.00000000, 0.00000000, 505.00000000, NULL, '0', '', 'RMMZZR5SZNPT', 0, 2, NULL, '2022-01-05 19:18:50', '2022-01-05 19:18:50'),
(16, 1, 17, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'OPR726O4QBSF', 0, 0, NULL, '2022-01-06 04:16:25', '2022-01-06 04:16:43'),
(17, 1, 18, 0, 10.00000000, 'INR', 0.00000000, 0.00000000, 10.00000000, NULL, '0', '', 'DY4VW3UKJRXJ', 0, 1, NULL, '2022-01-06 05:16:19', '2022-01-07 07:36:33'),
(18, 1, 19, 112, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', '5KFYK3OMXS7E', 0, 0, NULL, '2022-01-06 05:16:56', '2022-01-06 05:43:07'),
(19, 4, 20, 0, 5.00000000, 'INR', 0.00000000, 0.00000000, 5.00000000, NULL, '0', '', '7CM1XHWO8EXN', 0, 2, NULL, '2022-01-06 14:20:41', '2022-01-06 14:20:41'),
(20, 4, 21, 0, 0.00000000, 'INR', 0.00000000, 0.00000000, 0.00000000, NULL, '0', '', 'TTW85EE7334J', 0, 1, NULL, '2022-01-06 14:20:42', '2022-01-07 07:36:28'),
(21, 5, 22, 112, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', NULL, 'KGUE3OVGBVN4', 0, 0, NULL, '2022-01-06 19:36:25', '2022-01-06 19:41:52'),
(22, 1, 23, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', '8Q79XFQ7TFQD', 0, 0, NULL, '2022-01-07 07:31:58', '2022-01-07 07:32:35'),
(23, 1, 24, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'XMYQ1U1C9UER', 0, 0, NULL, '2022-01-07 07:34:31', '2022-01-07 07:34:31'),
(24, 1, 25, 110, 5.00000000, 'INR', 0.00000000, 1.00000000, 5.00000000, NULL, '0', '', 'TEOON69AHKNO', 0, 0, NULL, '2022-01-07 16:52:14', '2022-01-07 16:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `email_sms_templates`
--

CREATE TABLE `email_sms_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `act` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subj` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `shortcodes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_status` tinyint(4) NOT NULL DEFAULT '1',
  `sms_status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_sms_templates`
--

INSERT INTO `email_sms_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'PASS_RESET_CODE', 'Password Reset', 'Password Reset', '<div>We have received a request to reset the password for your account on <b>{{time}} .<br></b></div><div>Requested From IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}} </b>.</div><div><br></div><br><div><div><div>Your account recovery code is:&nbsp;&nbsp; <font size=\"6\"><b>{{code}}</b></font></div><div><br></div></div></div><div><br></div><div><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><br>', 'Your account recovery code is: {{code}}', ' {\"code\":\"Password Reset Code\",\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 17:04:05', '2020-07-06 23:44:08'),
(2, 'PASS_RESET_DONE', 'Password Reset Confirmation', 'You have Reset your password', '<div><p>\r\n    You have successfully reset your password.</p><p>You changed from&nbsp; IP: <b>{{ip}}</b> using <b>{{browser}}</b> on <b>{{operating_system}}&nbsp;</b> on <b>{{time}}</b></p><p><b><br></b></p><p><font color=\"#FF0000\"><b>If you did not changed that, Please contact with us as soon as possible.</b></font><br></p></div>', 'Your password has been changed successfully', '{\"ip\":\"IP of User\",\"browser\":\"Browser of User\",\"operating_system\":\"Operating System of User\",\"time\":\"Request Time\"}', 1, 1, '2019-09-24 17:04:05', '2020-03-07 04:23:47'),
(3, 'EVER_CODE', 'Email Verification', 'Please verify your email address', '<div><br></div><div>Thanks For join with us. <br></div><div>Please use below code to verify your email address. <br></div><div><br></div><div>Your email verification code is:<font size=\"6\"><b> {{code}}</b></font></div>', 'Your email verification code is: {{code}}', '{\"code\":\"Verification code\"}', 1, 1, '2019-09-24 17:04:05', '2020-03-07 04:26:22'),
(4, 'SVER_CODE', 'SMS Verification ', 'Please verify your phone', 'Your phone verification code is: {{code}}', 'Your phone verification code is: {{code}}', '{\"code\":\"Verification code\"}', 0, 1, '2019-09-24 17:04:05', '2020-03-07 19:28:52'),
(5, 'ADMIN_SUPPORT_REPLY', 'Support Ticket Reply ', 'Reply Support Ticket', '<div><p><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong>A member from our support team has replied to the following ticket:</strong></span></p><p><b><span style=\"font-size: 11pt;\" data-mce-style=\"font-size: 11pt;\"><strong><br></strong></span></b></p><p><b>[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</b></p><p>----------------------------------------------</p><p>Here is the reply : <br></p><p> {{reply}}<br></p></div><div><br></div>', '{{subject}}\r\n\r\n{{reply}}\r\n\r\n\r\nClick here to reply:  {{link}}', '{\"ticket_id\":\"Support Ticket ID\", \"ticket_subject\":\"Subject Of Support Ticket\", \"reply\":\"Reply from Staff/Admin\",\"link\":\"Ticket URL For relpy\"}', 1, 1, '2020-06-08 12:00:00', '2020-05-03 20:24:40'),
(6, 'ORDER_ON_PROCESSING_CONFIRMATION', 'Send Order On Processing Alert', 'Order On Processing Alert', 'Greetings from {{site_name}}\r\nYour Order is on processing now get ready to to receive your products.\r\n\r\nYour Order ID: {{order_id}} ', 'Greetings from {{site_name}}\r\nYour Order is on processing now get ready to to receive your products.\r\n\r\nYour Order ID: {{order_id}} ', '{\"site_name\":\"Company Name\", \"order_id\":\"Order ID\"}', 1, 1, '2020-01-07 18:52:55', '2020-01-07 18:52:55'),
(7, 'ORDER_DISPATCHED_CONFIRMATION', 'Send Order Dispatched Alert', 'Order Dispatched Alert', 'Greetings from {{site_name}}\r\nYour Order has been dispatched please receive your products.\r\n\r\nYour Order ID: {{order_id}} ', 'Greetings from {{site_name}}\r\nYour Order has been dispatched please receive your products.\r\n\r\nYour Order ID: {{order_id}} ', '{\"site_name\":\"Company Name\", \"order_id\":\"Order ID\"}', 1, 1, '2020-01-07 19:07:31', '2020-01-07 19:07:31'),
(8, 'ORDER_CANCELLATION_CONFIRMATION', 'Send Cancellation Alert', 'Cancellation Alert', 'Greetings from {{site_name}}. We are sorry say that we couldn\'<span style=\"color: rgb(33, 37, 41); font-size: 1rem;\">t accept your order now.&nbsp; <br>Your order has been canceled.<br><br>Your Order ID: {{order_id}}</span>', 'Greetings from {{site_name}}. \r\n\r\nYour order will be canceled............\r\n\r\nYour Order ID: {{order_id}}', '{\"site_name\":\"Company Name\", \"order_id\":\"Order ID\"}', 1, 0, '2019-11-27 07:04:05', '2020-08-19 14:57:21'),
(9, 'ORDER_RETAKE_CONFIRMATION', 'Send Order Retake Confirmation', 'Order Retake Confirmation', 'Greetings from {{site_name}}\r\nYour Order has been retaken.\r\n<div><span style=\"font-family: &quot;Open Sans&quot;, sans-serif;\">Order ID <b>{{order_id}}&nbsp;</b></span><br></div>', 'Greetings from {{site_name}}\r\nYour Order has been retaken.\r\nOrder ID {{order_id}}  ', '{\"site_name\":\"Company Name\", \"order_id\":\"Order ID\"}', 1, 0, '2019-11-27 07:52:01', '2019-11-27 04:53:32'),
(10, 'ORDER_DELIVERY_CONFIRMATION', 'Send Order Delivery Confirmation', 'Order Delivery Confirmation', 'Greetings from {{site_name}}\r\nYour order for has been delivered. Thanks for your purchase form us.\r\nOrder Id :{{order_id}}', 'Greetings from {{site_name}}\r\nYour order for has been delivered. Thanks for your purchase form us.\r\nOrder Id :{{order_id}}', '{\"site_name\":\"Company Name\",\"trx\":\"Transaction Number\", \"order_id\":\"Order Track Number\",\"charge\":\"Charge Amount\"}', 1, 0, '2019-11-27 07:24:27', '2019-11-27 07:24:27'),
(11, 'DEPOSIT_COMPLETE', 'Order Confirmation With Automatic Payment', 'Order Completed Successfully', '<div>Your order of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>has been completed Successfully.<b><br></b></div><div><b><br></b></div><div><b>Details of Your Order :<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#000000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><span style=\"color: rgb(33, 37, 41);\">Order Id: {{order_id}}</span></div><div><br></div><div><br><br><br></div>', '{{amount}} {{currrency}} Deposit successfully by {{gateway_name}}', '{\"trx\":\"Transaction Number\", \"order_id\":\"Order ID\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, '2020-06-24 06:00:00', '2020-08-19 14:54:27'),
(12, 'DEPOSIT_REQUEST', 'Manual Payment - User Requested', 'Order Request Submitted Successfully', '<div>Your order request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>submitted successfully<b> .<br></b></div><div><b><br></b></div><div><b>Details of Your Order:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><span style=\"color: rgb(33, 37, 41);\">Order Id: {{order_id}}</span><br></div><div><br></div>', '{{amount}} Deposit requested by {{method}}. Charge: {{charge}} . Trx: {{trx}}\r\n', '{\"trx\":\"Transaction Number\", \"order_id\":\"Order ID\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, '2020-05-31 06:00:00', '2020-08-19 14:52:50'),
(13, 'DEPOSIT_APPROVE', 'Manual Payment - Admin Approved', 'Your Order is Approved', '<div>Your order request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} </b>is Approved .<b><br></b></div><div><b><br></b></div><div><b>Details of Your Order:<br></b></div><div><br></div><div>Amount : {{amount}} {{currency}}</div><div>Charge: <font color=\"#FF0000\">{{charge}} {{currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}} <br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div>Order Id: {{order_id}}</div><div><br><br></div>', 'Admin Approve Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}} transaction : {{transaction}}', '{\"trx\":\"Transaction Number\",\"order_id\":\"Order ID\", \"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\"}', 1, 1, '2020-06-16 06:00:00', '2020-08-19 14:51:43'),
(14, 'DEPOSIT_REJECT', 'Manual Payment - Admin Rejected', 'Your Order Request is Rejected', '<div>Your order request of <b>{{amount}} {{currency}}</b> is via&nbsp; <b>{{method_name}} has been rejected</b>.<b><br></b></div><br><div>Transaction Number was : {{trx}}</div><div><span style=\"color: rgb(33, 37, 41);\">Order Id Was: {{order_id}}</span><br></div><div><br></div><div>if you have any query, feel free to contact us.<br></div><br><div><br><br></div>\r\n\r\n\r\n\r\n{{rejection_message}}', 'Admin Rejected Your {{amount}} {{gateway_currency}} payment request by {{gateway_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction Number\",\"order_id\":\"order_id\",\"amount\":\"Request Amount By user\",\"charge\":\"Gateway Charge\",\"currency\":\"Site Currency\",\"rate\":\"Conversion Rate\",\"method_name\":\"Deposit Method Name\",\"method_currency\":\"Deposit Method Currency\",\"method_amount\":\"Deposit Method Amount After Conversion\",\"rejection_message\":\"Rejection message\"}', 1, 1, '2020-06-09 06:00:00', '2020-08-19 14:53:41'),
(15, 'WELCOME_MESSAGE', 'Welcome Message To A Customer After Create An Account', 'Welcome Message', 'Hello {{user_name}} Welcome to {{site_name}}!', 'Hello {{user_name}} Welcome to {{site_name}}!', '{\"site_name\":\"Site Name\", \"user_name\":\"user_name\", \"user_email\":\"user_email\", \"user_mobile\":\"User Mobile Number\"}', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_values` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"eComerce\",\"shopping\",\"brand\",\"product\",\"dress\",\"shoe\",\"laptop\",\"payment\",\"glass\",\"cloth\",\"tshirt\",\"pant\",\"hat\",\"bed\",\"kitchen\",\"rack\",\"house\",\"order\",\"support\",\"call\",\"online\",\"ofline\"],\"description\":\"Kiaras offers tons of products in over 20 different categories, including men\'s fashion, women\'s fashion, baby fashion, and more.\",\"social_title\":\"Kiaras\",\"social_description\":\"Kiaras offers tons of products in over 20 different categories, including men\'s fashion, women\'s fashion, baby fashion, and more.\",\"image\":\"6006e04e86bd51611063374.png\"}', '2020-07-02 23:42:52', '2022-01-05 02:18:59'),
(2, 'footer.content', '{\"has_image\":\"1\",\"cell_number\":\"+91 8595738933\",\"email\":\"thekiarashelp@gmail.com\",\"contact_address\":\"New Delhi , India\",\"footer_note\":\"Kiaras brings you tons of products in over 10+ different categories, including men\'s fashion, women\'s fashion  and more.\",\"copyright_text\":\"Copyright \\u00a9 Kiaras 2022 All rights reserved.\",\"payment_methods\":\"61d4abe31f2de1641327587.png\"}', '2020-10-26 00:59:19', '2022-01-06 06:45:23'),
(3, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/kiaras.in\"}', '2020-11-10 04:07:30', '2022-01-06 06:48:00'),
(8, 'banners_top.element', '{\"has_image\":[\"1\"],\"title\":\"Be Comfort with your Favorite brand\",\"label\":\"Everlane T-Shirt\",\"label_background\":\"Red\",\"size\":\"340x518\",\"link\":\"category\\/1\\/mens-fashion\",\"image\":\"600957c8b93281611225032.png\"}', '2020-12-13 03:02:04', '2021-02-14 17:55:57'),
(9, 'banners_top.element', '{\"has_image\":[\"1\"],\"title\":\"Choose Your Own Style\",\"label\":\"Nike sneaker\",\"label_background\":\"Red\",\"size\":\"340x275\",\"link\":\"\\/visermart\\/category\\/5\\/shoes\",\"image\":\"60095e9ab30a81611226778.png\"}', '2020-12-13 03:41:41', '2021-03-28 17:37:20'),
(10, 'banners_top.element', '{\"has_image\":[\"1\"],\"title\":\"Make your Color Pattern\",\"label\":\"EMaybelline lipstick\",\"label_background\":\"Red\",\"size\":\"340x275\",\"link\":\"category\\/3\\/womens-fashion\",\"image\":\"60095788b8b441611224968.png\"}', '2020-12-13 04:15:54', '2021-02-14 17:53:41'),
(11, 'banners_top.element', '{\"has_image\":[\"1\"],\"title\":\"Think Style-wise\",\"label\":\"Reiss Shirt\",\"label_background\":\"Red\",\"size\":\"340x518\",\"link\":\"category\\/1\\/mens-fashion\",\"image\":\"6009576455fd61611224932.png\"}', '2020-12-13 04:16:41', '2021-02-14 17:56:07'),
(12, 'banners_top.element', '{\"has_image\":[\"1\"],\"title\":\"Explore Your Comfort\",\"label\":\"Puma\",\"label_background\":\"Red\",\"size\":\"340x275\",\"link\":\"category\\/4\\/clothing\",\"image\":\"6017999ef01d91612159390.png\"}', '2020-12-13 04:17:57', '2021-02-14 17:46:28'),
(13, 'subscribe.content', '{\"text\":\"Subscribe to our newsletter to get the latest news, updates, and special offers\"}', '2020-12-13 06:17:27', '2021-04-03 07:23:57'),
(14, 'banners_top.element', '{\"has_image\":[\"1\"],\"title\":\"Be louder with NuraPhone\",\"label\":\"NuraPhone Headphone\",\"label_background\":\"Red\",\"size\":\"340x518\",\"link\":\"category\\/12\\/electronics\",\"image\":\"60095e3e0159b1611226686.png\"}', '2020-12-13 06:40:08', '2021-02-14 17:48:21'),
(15, 'banners_two.element', '{\"has_image\":\"1\",\"link\":\"\\/\",\"img\":\"5fe095b019e191608553904.jpg\"}', '2020-12-19 06:31:44', '2020-12-19 06:31:44'),
(23, 'contact_page.content', '{\"has_image\":\"1\",\"title\":\"Contact With Us\",\"description\":\"We appreciate feedback and interaction of any sort so please feel free to get in touch.\",\"image\":\"6016adfe7f1cb1612099070.png\"}', '2020-12-21 10:27:21', '2021-02-14 15:03:00'),
(25, 'social_icon.element', '{\"title\":\"Instagram\",\"social_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/kiaras.in\"}', '2020-12-24 08:36:56', '2022-01-06 06:47:39'),
(27, 'about_page.content', '{\"page_title\":\"About Us\",\"description\":\"ViserMart is an e-commerce site that will be capable of providing every kind of goods and products from every sector to every consumer all over the world. The world\\u2019s marketplace will be only finger-tips away for any customer in possession of a smartphone\\/computer and an internet connection. They will be able to purchase everything; from a safety-pin to an apartment building from our website. We have gathered the brightest minds and given them the platform to perform to their fullest extent. All the data-mining and optimization has been done in-house and no outsourcing from any organization has taken place. \\n\\nIt is a platform where people can purchase all kinds of goods from a single website. From a pencil to a book to a dress to a cell phone to cars to lands; everything is available on this website. It is built by a team of developers who have the sharpest minds in this sector and they are dedicated to only Droplet Limited. We hire no outsourcing outlets and that ensures the security of all our users. There is absolutely no chance of any information being leaked thanks to our dedicated team who are working all the time to ensure that our website is the most secure e-commerce platform. What separates us from other platforms of such sorts is the diversity of our product range and the security that we provide to our users. It is absolutely cutting-edge and state-of-the-art and we can guarantee that no other platform has this much diversity in its product range. Our website is going to be so convenient and user-friendly for our customers that, they would rather order from our website than go to the shop which is 100 meters away from his\\/her home. That is the kind of target ViserMart.com. has set for itself. And once we achieve our targets, we will start expanding towards other countries and present ourselves on a much broader and global scale and encompass the entire world with our website in a short amount of time.\"}', '2020-12-24 10:24:15', '2021-02-18 11:15:25'),
(28, 'faq_page.content', '{\"page_title\":\"Frequently Asked Questions\",\"description\":\"<h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">HOW CAN I CHANGE MY SHIPPING ADDRESS?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">By default, the last used shipping address will be saved into to your Sample Store account. When you are checking out your order, the default shipping address will be displayed and you have the option to amend it if you need to.<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">HOW DO I ACTIVATE MY ACCOUNT?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">The instructions to activate your account will be sent to your email once you have submitted the registration form. If you did not receive this email, your email service provider\\u2019s mailing software may be blocking it. You can try checking your junk \\/ spam folder or contact us at help@samplestore.com<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">WHAT DO YOU MEAN BY POINTS? HOW DO I EARN IT?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">Because you are important to us, we want to know what you think about the products. As an added value, every time you rate the products you earn points which go straight to your account. 1 point are added to your account for every review that you give. You will need those points in order to redeem the sample products. So keep rating the products to keep earning points!<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">WHY IS THERE A CHECKOUT LIMIT? \\/ WHAT ARE ALL THE CHECKOUT LIMITS?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">Sample Store is a popular spot and gets lots of shoppers at a time. These limits are in place to make sure everyone has a good time trying and purchasing their products. So...<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">- Each member is entitled to only one (1) sample order every day.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">- Each member is entitled to one (1) bundle of sample for each product.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">- Your account must have sufficient points before you can checkout the sample products.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">- Kindly clear all pending payments before another checkout.<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">HOW CAN I TRACK MY ORDERS &amp; PAYMENT?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">After logging into your account, the status of your checkout history can be found under Order History. For orders via registered postage, a tracking number (article tracking number) will be given to you after the receipt given from\\u00a0<a href=\\\"http:\\/\\/www.singpost.com.sg\\/\\\" style=\\\"color:rgb(0,0,0);border:0px;font-size:16px;margin:0px;padding:0px;vertical-align:baseline;\\\">Singapore Post Limited (SingPost)<\\/a>.<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">HOW DO I CANCEL MY ORDERS BEFORE I MAKE A PAYMENT?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">After logging into your account, go to your Shopping Cart. Here, you will be able to make payment or cancel your order. Note: We cannot give refunds once payment is verified.<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">HOW LONG WILL IT TAKE FOR MY ORDER TO ARRIVE AFTER I MAKE PAYMENT?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">Members who ship their orders within Singapore should expect to receive their orders within five (5) to ten (10) working days upon payment verification depending on the volume of orders received.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">If you experience delays in receiving your order, contact us immediately and we will help to confirm the status of your order.<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">WHAT IS THE ACCUMULATED DELIVERY FEE FOR? HOW MUCH IS THE HANDLING FEE?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">The flat-rate handling fee is\\u00a0<span style=\\\"border:0px;margin-top:0px;margin-right:0px;margin-left:0px;padding:0px;vertical-align:baseline;\\\">S$5.99<\\/span>\\u00a0and it is only applicable to normal samples. For free samples, they are fully paid for and there are no additional charges to deliver the free samples.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">Handling fee covers the delivery, material, labour and logistics cost to support the sampling service. You can redeem up to 4 different samples in each checkout and it is likely that you will find samples bundle with larger supply (up to 1-week supply) on Samplestore.com.<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">HOW DO YOU SHIP MY ORDERS?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">All your orders are sent via\\u00a0<a href=\\\"http:\\/\\/www.singpost.com.sg\\/\\\" style=\\\"color:rgb(0,0,0);border:0px;font-size:16px;margin:0px;padding:0px;vertical-align:baseline;\\\">Singapore Post Limited (SingPost)<\\/a>.<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">HOW DO I MAKE PAYMENTS USING PAYPAL? HOW DOES IT WORK?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">Paypal is the easiest way to make payments online. While checking out your order, you will be redirected to the Paypal website. Be sure to fill in correct details for fast &amp; hassle-free payment processing. After a successful Paypal payment, a payment advice will be automatically generated to Samplestore.com system for your order.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">It\'s fast, easy &amp; secure.<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">WHAT ARE THE PAYMENT METHODS AVAILABLE?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">At the moment, we only accept Credit\\/Debit cards and Paypal payments.<\\/p><h5 style=\\\"font-family:latoregular, sans-serif;font-weight:600;line-height:1.1;color:rgb(0,0,0);margin-bottom:15px;font-size:16px;border:0px;padding:0px;vertical-align:baseline;text-transform:uppercase;letter-spacing:0.05rem;\\\">CAN I PAY USING PAYPAL WITHOUT A PAYPAL ACCOUNT?<\\/h5><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">Yes! It is commonly misunderstood that a Paypal account is needed in order to make payments through Paypal. The truth is you DO NOT need one, although we strongly recommend you sign up to enjoy the added ease of use.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">Without a Paypal account, all you need is any Debit\\/Credit card stated below that is supported by Paypal.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">By using Paypal, we can process &amp; deliver your orders to you in a shorter time. Paypal is the easiest &amp; most secure way to make payment online. No account needed.<\\/p><p style=\\\"margin-right:0px;margin-bottom:20px;margin-left:0px;border:0px;font-size:16px;padding:0px;vertical-align:baseline;line-height:1.4;color:rgb(136,136,136);font-family:Lato;\\\">For more details,\\u00a0<a href=\\\"https:\\/\\/www.paypal.com\\/sg\\/webapps\\/mpp\\/how-paypal-works\\\" style=\\\"color:rgb(0,0,0);border:0px;font-size:16px;margin:0px;padding:0px;vertical-align:baseline;\\\">click here<\\/a>\\u00a0to see how Paypal works for you.<\\/p>\"}', '2020-12-24 10:34:36', '2020-12-24 10:34:36'),
(29, 'login_page.content', '{\"has_image\":\"1\",\"title\":\"Welcome Back\",\"description\":\"Hello! Welcome back\",\"image\":\"5fec5fd64ad681609326550.png\"}', '2020-12-28 22:03:17', '2021-02-14 15:21:25'),
(30, 'register_page.content', '{\"has_image\":\"1\",\"title\":\"Welcome\",\"description\":\"Welcome to Visermart\",\"image\":\"5fec6155771601609326933.png\"}', '2020-12-28 22:04:19', '2021-02-14 15:31:38'),
(31, 'authorize_email_page.content', '{\"has_image\":\"1\",\"title\":\"Verify Your Credentials\",\"description\":\"A verification code has sent to your email. Please visit your email address and put the code in the input field below.\",\"image\":\"5fec7ad312e571609333459.png\"}', '2020-12-29 01:04:19', '2020-12-29 01:35:55'),
(32, 'authorize_sms_page.content', '{\"has_image\":\"1\",\"title\":\"Just One More Step\",\"description\":\"Please verify your mobile number.\",\"image\":\"5fec8229652221609335337.png\"}', '2020-12-29 01:35:37', '2020-12-29 01:35:37'),
(33, 'forgot_password_page.content', '{\"has_image\":\"1\",\"title\":\"Don\'t Worry\",\"description\":\"Submit the email to reset your password.\",\"image\":\"5ff4c6a66059e1609877158.png\"}', '2021-01-04 14:05:58', '2021-02-14 15:32:33'),
(34, 'code_verify_page.content', '{\"has_image\":\"1\",\"title\":\"Verify Your Code\",\"description\":\"We sent you a verification code. Please allow several minutes for this code to arrive. This code will be valid for 15 minutes after you request it.\",\"image\":\"5ff4ca17eb45e1609878039.png\"}', '2021-01-04 14:20:39', '2021-02-14 13:44:36'),
(35, 'reset_password_page.content', '{\"has_image\":\"1\",\"title\":\"Be Aware!\",\"description\":\"Submit the email you signed up with to reset your password.\",\"image\":\"5ff4cd37e3d371609878839.png\"}', '2021-01-04 14:33:59', '2021-02-14 15:32:47'),
(36, 'pages.element', '{\"page_title\":\"\\u2022 Return &amp; Refund Policy\",\"description\":\"<p class=\\\"MsoNormal\\\"><b>Returns and refunds<\\/b><br \\/><\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022Our policy lasts 24 hours for any type of return and refund.<br \\/><\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022If 24 hours have gone by since your product delivery,\\nunfortunately we can\\u2019t offer you a return or refund.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022Replacements will be offered, free of cost only till 48\\nhours have gone by since your product delivery. <\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022For return under any circumstances, the below mentioned\\ncharges will be adjusted from the refund amount.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">~For a COD return, a charge of Rs.150 (shipping + COD\\ncharges) will be applicable and it will be adjusted in the refund amount.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">~For a Prepaid return, a charge of Rs. 100 (shipping\\ncharges) will be applicable and it will be adjusted in the refund amount.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">~To be eligible for a return, your item must be unused and\\nin the same condition that you received it. It must also be in the original\\npackaging. Return shipping courier partner will be arranged by company.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\"><b>\\u00a0<\\/b><\\/p><b>\\n\\n<\\/b><p class=\\\"MsoNormal\\\"><b>Non-returnable items:<\\/b><\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022Items purchased under any discount.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022Items worth less than Rs.500.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022Combo items.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">Please do not send your purchase back to the manufacturer.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\"><b>Refunds (if applicable)<\\/b><\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022Once your return is received and inspected, we will send\\nyou an email to notify you that we have received your returned item. We will\\nalso notify you of the approval or rejection of your refund.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022If you are approved, then your refund will be processed,\\nand a credit will automatically be applied to your credit card or original\\nmethod of payment, within 48 hours.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\"><b>Late or missing refunds (if applicable)<\\/b><\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022If you haven\\u2019t received a refund yet, first check your bank\\naccount again.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022Then contact your credit card company, it may take some\\ntime before your refund is officially posted.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022Next contact your bank. There is often some processing time\\nbefore a refund is posted.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022If you\\u2019ve done all of this and you still have not received\\nyour refund yet, please contact us at thekiarashelp@gmail.com<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\"><b>Sale items (if applicable)<\\/b><\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">Only regular priced items may be refunded, unfortunately\\nsale items cannot be refunded.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\"><b>\\u00a0<\\/b><\\/p><b>\\n\\n<\\/b><p class=\\\"MsoNormal\\\"><b>Exchanges (if applicable)<\\/b><\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022We only replace items if they are defective or damaged. If\\nyou need to exchange it for the same item, send us an email at thekiarashelp@gmail.com<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u2022For other exception reasons, a charge of Rs. 100 (shipping\\ncharges) will be applicable and you will need to pay to process the\\nreplacement. Not applicable for order value below Rs. 500.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\"><b>Gifts <\\/b><\\/p>\\n\\n<p class=\\\"MsoNormal\\\">If the item was marked as a gift when purchased and shipped\\ndirectly to you, you\\u2019ll receive a gift credit for the value of your return.\\nOnce the returned item is received, a gift certificate will be mailed to you.<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">\\u00a0<\\/p>\\n\\n<p class=\\\"MsoNormal\\\">If the item wasn\\u2019t marked as a gift when purchased, or the\\ngift giver had the order shipped to themselves to give to you later, we will\\nsend a refund to the gift giver and he will find out about your return<\\/p>\"}', '2021-01-30 06:35:16', '2022-01-06 07:16:21'),
(37, 'pages.element', '{\"page_title\":\"\\u2022 Shipping and Delivery\",\"description\":\"<br \\/><font face=\\\"Segoe UI, sans-serif\\\" color=\\\"#212326\\\"><span style=\\\"font-size:13.5pt;\\\"><\\/span><\\/font><p><\\/p>\"}', '2021-01-30 06:35:37', '2022-01-06 07:16:03'),
(38, 'pages.element', '{\"page_title\":\"\\u2022 Terms and Conditions\",\"description\":\"<br \\/>\"}', '2021-01-30 06:36:31', '2022-01-06 07:15:48'),
(39, 'pages.element', '{\"page_title\":\"\\u2022 Privacy Policy\",\"description\":\"<br \\/><font face=\\\"Arial, sans-serif\\\"><span style=\\\"font-size:12pt;\\\"><\\/span><\\/font><p><\\/p>\"}', '2021-01-30 06:38:58', '2022-01-06 07:15:30'),
(41, 'social_icon.element', '{\"title\":\"Whatsapp\",\"social_icon\":\"<i style=\\\"background-color:#25d366;color:#FFFFFF;\\\" class=\\\"fab fa-whatsapp\\\"><\\/i>\",\"url\":\"https:\\/\\/api.whatsapp.com\\/send?phone=+918595738933\"}', '2022-01-06 06:50:35', '2022-01-06 06:51:54'),
(42, 'social_icon.element', '{\"title\":\"Email\",\"social_icon\":\"<i class=\\\"lar la-comments\\\"><\\/i>\",\"url\":\"thekiarashelp@gmail.com\"}', '2022-01-07 13:59:31', '2022-01-07 14:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` int(11) DEFAULT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `parameters` text COLLATE utf8mb4_unicode_ci,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci,
  `crypto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `input_form` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `code`, `alias`, `image`, `name`, `status`, `parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `input_form`, `created_at`, `updated_at`) VALUES
(1, 101, 'paypal', '5f6f1bd8678601601117144.jpg', 'Paypal', 0, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"paypal@user.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:30:43'),
(2, 102, 'perfect_money', '5f6f1d2a742211601117482.jpg', 'Perfect Money', 0, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"6451561651551\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:30:46'),
(3, 103, 'stripe', '5f6f1d4bc69e71601117515.jpg', 'Stripe Hosted', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51HuxFUHyGzEKoTKAfIosswAQduMOGU4q4elcNr8OE6LoBZcp2MHKalOW835wjRiF6fxVTc7RmBgatKfAt1Qq0heb00rUaCOd2T\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51HuxFUHyGzEKoTKAueAuF9BrMDA5boMcpJLLt0vu4q3QdPX5isaGudKNe6OyVjZP1UugpYd6JA7i7TczRWsbutaP004YmBiSp5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:30:49'),
(4, 104, 'skrill', '5f6f1d41257181601117505.jpg', 'Skrill', 0, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:30:54'),
(5, 105, 'paytm', '5f6f1d1d3ec731601117469.jpg', 'PayTM', 0, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:30:58'),
(6, 106, 'payeer', '5f6f1bc61518b1601117126.jpg', 'Payeer', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.payeer\"}}', NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:31:02'),
(7, 107, 'paystack', '5f7096563dfb71601214038.jpg', 'PayStack', 0, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_3c9c87f51b13c15d99eb367ca6ebc52cc9eb1f33\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_2a3f97a146ab5694801f993b60fcb81cd7254f12\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.paystack\"}}\r\n', NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:31:06'),
(8, 108, 'voguepay', '5f6f1d5951a111601117529.jpg', 'VoguePay', 0, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:31:09'),
(9, 109, 'flutterwave', '5f6f1b9e4bb961601117086.jpg', 'Flutterwave', 0, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"FLWPUBK_TEST-5d9bb05bba2c13aa6c7a1ec7d7526ba2-X\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"FLWSECK_TEST-2ac7b05b6b9fa8a423eb58241fd7bbb6-X\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"FLWSECK_TEST32e13665a95a\"}}', '{\"KES\":\"KES\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"UGX\":\"UGX\",\"TZS\":\"TZS\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:31:14'),
(10, 110, 'razorpay', '5f6f1d3672dd61601117494.jpg', 'RazorPay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_live_4iijxYDWVkC3mu\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"c2uHvK5Cs1pEoyKoaCU7JYYE\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 13:45:51'),
(11, 111, 'stripe_js', '5f7096a31ed9a1601214115.jpg', 'Stripe Storefront', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51HuxFUHyGzEKoTKAfIosswAQduMOGU4q4elcNr8OE6LoBZcp2MHKalOW835wjRiF6fxVTc7RmBgatKfAt1Qq0heb00rUaCOd2T\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51HuxFUHyGzEKoTKAueAuF9BrMDA5boMcpJLLt0vu4q3QdPX5isaGudKNe6OyVjZP1UugpYd6JA7i7TczRWsbutaP004YmBiSp5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:34:41'),
(12, 112, 'instamojo', '5f6f1babbdbb31601117099.jpg', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"78adb2c1caadc4b9f6aecc847ae1aefd\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"bfdd8a33df484616de5880b17f27be79\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"f0b028a86ad04e52bd0d8b48045f3bd1\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-06 19:43:54'),
(13, 501, 'blockchain', '5f6f1b2b20c6f1601116971.jpg', 'Blockchain', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"8df2e5a0-3798-4b74-871d-973615b57e7b\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CXLqfWXj1xgXe79nEQb3pv2E7TGD13pZgHceZKrQAxqXdrC2FaKuQhm5CYVGyNcHLhSdWau4eQvq3EDCyayvbKJvXa11MX9i2cHPugpt3G\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:34:50'),
(14, 502, 'blockio', '5f6f19432bedf1601116483.jpg', 'Block.io', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":false,\"value\":\"1658-8015-2e5e-9afb\"},\"api_pin\":{\"title\":\"API PIN\",\"global\":true,\"value\":\"covidvai2020\"}}', '{\"BTC\":\"BTC\",\"LTC\":\"LTC\",\"DOGE\":\"DOGE\"}', 1, '{\"cron\":{\"title\": \"Cron URL\",\"value\":\"ipn.blockio\"}}', NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:35:12'),
(15, 503, 'coinpayments', '5f6f1b6c02ecd1601117036.jpg', 'CoinPayments', 0, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"7638eebaf4061b7f7cdfceb14046318bbdabf7e2f64944773d6550bd59f70274\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"Cb6dee7af8Eb9E0D4123543E690dA3673294147A5Dc8e7a621B5d484a3803207\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:35:06'),
(16, 504, 'coinpayments_fiat', '5f6f1b94e9b2b1601117076.jpg', 'CoinPayments Fiat', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:34:59'),
(17, 505, 'coingate', '5f6f1b5fe18ee1601117023.jpg', 'Coingate', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"Ba1VgPx6d437xLXGKCBkmwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:34:33'),
(18, 506, 'coinbase_commerce', '5f6f1b4c774af1601117004.jpg', 'Coinbase Commerce', 0, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.coinbase_commerce\"}}', NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:34:17'),
(24, 113, 'paypal_sdk', '5f6f1bec255c61601117164.jpg', 'Paypal Express', 0, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:34:10'),
(25, 114, 'stripe_v3', '5f709684736321601214084.jpg', 'Stripe Checkout', 0, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51HuxFUHyGzEKoTKAfIosswAQduMOGU4q4elcNr8OE6LoBZcp2MHKalOW835wjRiF6fxVTc7RmBgatKfAt1Qq0heb00rUaCOd2T\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51HuxFUHyGzEKoTKAueAuF9BrMDA5boMcpJLLt0vu4q3QdPX5isaGudKNe6OyVjZP1UugpYd6JA7i7TczRWsbutaP004YmBiSp5\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"w5555\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.stripe_v3\"}}', NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:34:04'),
(27, 115, 'mollie', '5f6f1bb765ab11601117111.jpg', 'Mollie', 0, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"ronniearea@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2019-09-14 13:14:22', '2022-01-05 02:35:17'),
(30, 116, 'cashmaal', '5f9a8b62bb4dd1603963746.png', 'Cashmaal', 0, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.cashmaal\"}}', NULL, NULL, NULL, '2022-01-05 02:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_code` int(11) DEFAULT NULL,
  `gateway_alias` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(18,8) NOT NULL,
  `max_amount` decimal(18,8) NOT NULL,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT '0.00',
  `fixed_charge` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `rate` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(6, 'Razorpay', 'INR', '₹', 110, 'razorpay', 1.00000000, 1000.00000000, 0.00, 0.00000000, 1.00000000, NULL, '{\"key_id\":\"rzp_live_4iijxYDWVkC3mu\",\"key_secret\":\"c2uHvK5Cs1pEoyKoaCU7JYYE\"}', '2022-01-05 13:46:12', '2022-01-05 13:46:12'),
(13, 'Instamojo', 'INR', '₹', 112, 'instamojo', 10.00000000, 10000.00000000, 0.00, 0.00000000, 1.00000000, NULL, '{\"api_key\":\"78adb2c1caadc4b9f6aecc847ae1aefd\",\"auth_token\":\"bfdd8a33df484616de5880b17f27be79\",\"salt\":\"f0b028a86ad04e52bd0d8b48045f3bd1\"}', '2022-01-06 19:43:54', '2022-01-06 19:43:54');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sitename` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preloader_title` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `cod` tinyint(1) NOT NULL DEFAULT '1',
  `email_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci,
  `sms_api` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci COMMENT 'email configuration',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'sms notification, 0 - dont send, 1 - send',
  `registration` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: Off	, 1: On',
  `social_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'social login',
  `social_credential` text COLLATE utf8mb4_unicode_ci,
  `active_template` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sys_version` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `sitename`, `preloader_title`, `cur_text`, `cur_sym`, `cod`, `email_from`, `email_template`, `sms_api`, `base_color`, `secondary_color`, `mail_config`, `ev`, `en`, `sv`, `sn`, `registration`, `social_login`, `social_credential`, `active_template`, `sys_version`, `created_at`, `updated_at`) VALUES
(1, 'Kiaras', 'Kiaras', 'INR', '₹', 1, 'thekiarashelp@gmail.com', '<table style=\"color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(0, 23, 54); text-decoration-style: initial; text-decoration-color: initial;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#001736\"><tbody><tr><td valign=\"top\" align=\"center\"><table class=\"mobile-shell\" width=\"650\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"td container\" style=\"width: 650px; min-width: 650px; font-size: 0pt; line-height: 0pt; margin: 0px; font-weight: normal; padding: 55px 0px;\"><div align=\"center\"><img src=\"https://i.imgur.com/tsPl7Jp.png\" width=\"316\"></div><table style=\"width: 650px; margin: 0px auto;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td style=\"padding-bottom: 10px;\"><table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"tbrr p30-15\" style=\"padding: 60px 30px; border-radius: 26px 26px 0px 0px;\" bgcolor=\"#000036\"><table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td style=\"color: rgb(255, 255, 255); font-family: Muli, Arial, sans-serif; font-size: 20px; line-height: 46px; padding-bottom: 25px; font-weight: bold;\">Hi {{name}} ,</td></tr><tr><td style=\"color: rgb(193, 205, 220); font-family: Muli, Arial, sans-serif; font-size: 20px; line-height: 30px; padding-bottom: 25px;\">{{message}}</td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table><table style=\"width: 650px; margin: 0px auto;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"p30-15 bbrr\" style=\"padding: 50px 30px; border-radius: 0px 0px 26px 26px;\" bgcolor=\"#000036\"><table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"text-footer1 pb10\" style=\"color: rgb(0, 153, 255); font-family: Muli, Arial, sans-serif; font-size: 18px; line-height: 30px; text-align: center; padding-bottom: 10px;\">© 2022 Kiaras All Rights Reserved.</td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>', 'NGM2YzU0NTk0NTU1Nzc1YTVhNTI1ODc3MzE0ZTYxNjU=', '000000', '7357e3', '{\"name\":\"php\"}', 0, 1, 0, 1, 1, 0, '{\"google_client_id\":\"53929591142-l40gafo7efd9onfe6tj545sf9g7tv15t.apps.googleusercontent.com\",\"google_client_secret\":\"BRdB3np2IgYLiy4-bwMcmOwN\",\"fb_client_id\":\"277229062999748\",\"fb_client_secret\":\"1acfc850f73d1955d14b282938585122\"}', 'basic', NULL, NULL, '2022-01-06 09:54:08');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '61d4addb980cc1641328091.png', 1, '2020-07-04 21:47:55', '2022-01-05 03:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` tinyint(4) NOT NULL COMMENT '1=fixed, 2=percent',
  `amount` double NOT NULL DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=disabled, 1=enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers_products`
--

CREATE TABLE `offers_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_method_id` int(10) UNSIGNED NOT NULL,
  `shipping_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` double NOT NULL DEFAULT '0',
  `total_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `order_type` tinyint(4) NOT NULL COMMENT '1 = Order for self, 2 = order for a guest',
  `payment_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=Not Paid ,1 = Paid, 2= Cash On Delivery',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 = pending, 1 = processing, 2=dispatched, 3=delivered, 4= canceled_by_admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `shipping_address`, `shipping_method_id`, `shipping_charge`, `coupon_code`, `coupon_amount`, `total_amount`, `order_type`, `payment_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KE2COVNDKVKW', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Hdhdhdh\",\"state\":\"Hdhdjdjd\",\"zip\":\"4948834\",\"address\":\"Bxjxjdjd fifiiff fidododod\"}', 1, 0.00, '', 0, 300.00, 1, 2, 2, '2022-01-05 13:10:36', '2022-01-06 06:35:58'),
(2, '9O112SGUN7DB', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Bdhdhd\",\"state\":\"Hdhdhdh\",\"zip\":\"201010\",\"address\":\"Dhjfjfjdbfbbdhd\"}', 1, 0.00, '', 0, 100.00, 1, 2, 2, '2022-01-05 13:11:44', '2022-01-06 06:36:01'),
(3, '2K7DAHP4S4T1', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Hdhdhd\",\"state\":\"Bdhdhdh\",\"zip\":\"Jfjfufj\",\"address\":\"Hfididifjfhhdhd\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-05 13:13:02', '2022-01-05 13:13:02'),
(4, 'BD2B9JMQ7T7H', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Vvvbhh\",\"state\":\"Ghjjnj\",\"zip\":\"Fffff\",\"address\":\"Hfhfhf\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-05 13:15:53', '2022-01-05 13:15:53'),
(5, 'B1WPO6483U5X', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Rrfd\",\"state\":\"Ffcff\",\"zip\":\"Ffffg\",\"address\":\"Hdhdjfj f brhfh\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-05 13:19:45', '2022-01-05 13:19:45'),
(6, '69PR5KN252B1', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Rrfd\",\"state\":\"Ffcff\",\"zip\":\"Ffffg\",\"address\":\"Hdhdjfj f brhfh\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-05 13:20:07', '2022-01-05 13:20:07'),
(7, 'YRV5V16P7QO1', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Hfhfjfj\",\"state\":\"Jfjfjfjfj\",\"zip\":\"20201010\",\"address\":\"Fbjfjfkf. Fhfjfjjf\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-05 13:24:33', '2022-01-05 13:24:33'),
(8, 'MBHVV6PC3AYD', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Bdhdhhd\",\"state\":\"Dhfhfh\",\"zip\":\"Fufhfhfu\",\"address\":\"Dhfhfhfh\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-05 13:27:56', '2022-01-05 13:27:56'),
(9, '49NNQ7FN87PY', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Hdhdhd\",\"state\":\"Fhfhhf\",\"zip\":\"Ffhfh\",\"address\":\"Ffhfhhf\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-05 13:31:51', '2022-01-05 13:31:51'),
(10, 'TGGBE8E97G2Q', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Hdhdh\",\"state\":\"Fhjfjf\",\"zip\":\"Hfjdjf\",\"address\":\"Dhdhfhjfjf\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-05 13:46:55', '2022-01-05 13:46:55'),
(11, '65DQRZ5Z7VY5', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Guguugug\",\"state\":\"Fuguyfuf\",\"zip\":\"Guuguggu\",\"address\":\"Cucuvuvuvugi\"}', 2, 50.00, '', 0, 55.00, 1, 2, 2, '2022-01-05 14:02:21', '2022-01-06 14:22:53'),
(12, '9H7GFPTK161C', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Yshdhd\",\"state\":\"Hdhdhdh\",\"zip\":\"Hdhxhd\",\"address\":\"Hdhxhdhd\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-05 14:13:21', '2022-01-05 14:13:21'),
(13, 'PB68E58N8BCB', 2, '{\"firstname\":\"test1234\",\"lastname\":\"test1234\",\"mobile\":\"01882363323\",\"country\":\"Bangladesh\",\"city\":\"test1234\",\"state\":\"asd\",\"zip\":\"1216\",\"address\":\"test1234\"}', 1, 0.00, '', 0, 10.00, 1, 2, 1, '2022-01-05 19:14:50', '2022-01-06 06:36:05'),
(14, 'TJN4EMXUUQZH', 2, '{\"firstname\":\"test1234\",\"lastname\":\"test1234\",\"mobile\":\"01882363323\",\"country\":\"Bangladesh\",\"city\":\"test1234\",\"state\":\"dfsd\",\"zip\":\"1216\",\"address\":\"test1234\"}', 2, 50.00, '', 0, 70.00, 2, 2, 1, '2022-01-05 19:15:30', '2022-01-06 06:36:07'),
(15, 'QWZE237SMNVN', 2, '{\"firstname\":\"test1234\",\"lastname\":\"test1234\",\"mobile\":\"01882363323\",\"country\":\"Bangladesh\",\"city\":\"test1234\",\"state\":\"sdf\",\"zip\":\"1216\",\"address\":\"test1234\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-05 19:16:30', '2022-01-05 19:16:30'),
(16, '58OPBDKMORXY', 2, '{\"firstname\":\"test1234\",\"lastname\":\"test1234\",\"mobile\":\"01882363323\",\"country\":\"Bangladesh\",\"city\":\"test1234\",\"state\":\"ewrwer\",\"zip\":\"1216\",\"address\":\"test1234\"}', 3, 500.00, '', 0, 505.00, 1, 2, 1, '2022-01-05 19:18:50', '2022-01-06 06:36:12'),
(17, 'UQ7TOSC7RFGT', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Ghaziabad\",\"state\":\"Uttar pradesh\",\"zip\":\"201010\",\"address\":\"Test address\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-06 04:16:19', '2022-01-06 04:16:19'),
(18, '91CG4N37KRUE', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"wrwfwfw\",\"state\":\"wfwfwfwf\",\"zip\":\"wff\",\"address\":\"ffwwfwfwf\"}', 1, 0.00, '', 0, 10.00, 1, 2, 3, '2022-01-06 05:16:19', '2022-01-07 07:36:33'),
(19, 'M1OQWVC8CK1P', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"wffwfw\",\"state\":\"fwwfwf\",\"zip\":\"fwff\",\"address\":\"fwfwfwfwfw\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-06 05:16:53', '2022-01-06 05:16:53'),
(20, 'TTWGH5FPBUHU', 4, '{\"firstname\":\"Shagun\",\"lastname\":\"Somani\",\"mobile\":\"918368513528\",\"country\":\"India\",\"city\":\"Ghaziabad\",\"state\":\"Uttar pradesh\",\"zip\":\"201014\",\"address\":\"2A044 gc grand Indirapuram\"}', 1, 0.00, '', 0, 5.00, 1, 2, 2, '2022-01-06 14:20:41', '2022-01-06 14:24:12'),
(21, '59DCE56A321P', 4, '{\"firstname\":\"Shagun\",\"lastname\":\"Somani\",\"mobile\":\"918368513528\",\"country\":\"India\",\"city\":\"Ghaziabad\",\"state\":\"Uttar pradesh\",\"zip\":\"201014\",\"address\":\"2A044 gc grand Indirapuram\"}', 1, 0.00, '', 0, 0.00, 1, 2, 3, '2022-01-06 14:20:42', '2022-01-07 07:36:28'),
(22, '5YWB57K8EV73', 5, '{\"firstname\":\"Colin\",\"lastname\":\"Watts\",\"mobile\":\"+1 (873) 444-2709\",\"country\":\"Argentina\",\"city\":\"Tempora praesentium\",\"state\":\"Voluptas nulla commo\",\"zip\":\"95021\",\"address\":\"Laborum consequat E\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-06 19:36:17', '2022-01-06 19:36:17'),
(23, 'YNNCVPAQGYSU', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Gahdhd\",\"state\":\"Fyfhhdhf\",\"zip\":\"Dhhfhfhf\",\"address\":\"Hdhdhfhjfjf\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-07 07:31:55', '2022-01-07 07:31:55'),
(24, 'ZKVJ1SK45JAS', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Bdhdhdhf\",\"state\":\"Hfhdhhd\",\"zip\":\"Hdhdhdhf\",\"address\":\"Chhfhfhfj fhfjfjjf fhfjfj\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-07 07:34:29', '2022-01-07 07:34:29'),
(25, 'VD9BXEQKGDQ4', 1, '{\"firstname\":\"Kartikay\",\"lastname\":\"Sharma\",\"mobile\":\"918181815438\",\"country\":\"India\",\"city\":\"Bdhdhd\",\"state\":\"Dhhfhfhd\",\"zip\":\"Hdhdhdud\",\"address\":\"Dhhfhfhfjfj\"}', 1, 0.00, '', 0, 5.00, 1, 0, 0, '2022-01-07 16:52:11', '2022-01-07 16:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `base_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `base_price`, `total_price`, `details`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 100.00, 300.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 13:10:36', '2022-01-05 13:10:36'),
(2, 2, 1, 1, 100.00, 100.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 13:11:44', '2022-01-05 13:11:44'),
(3, 3, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 13:13:02', '2022-01-05 13:13:02'),
(4, 4, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 13:15:53', '2022-01-05 13:15:53'),
(5, 5, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 13:19:45', '2022-01-05 13:19:45'),
(6, 6, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 13:20:07', '2022-01-05 13:20:07'),
(7, 7, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 13:24:33', '2022-01-05 13:24:33'),
(8, 8, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 13:27:56', '2022-01-05 13:27:56'),
(9, 9, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 13:31:51', '2022-01-05 13:31:51'),
(10, 10, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 13:46:55', '2022-01-05 13:46:55'),
(11, 11, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 14:02:21', '2022-01-05 14:02:21'),
(12, 12, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 14:13:21', '2022-01-05 14:13:21'),
(13, 13, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 19:14:50', '2022-01-05 19:14:50'),
(14, 13, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 19:14:50', '2022-01-05 19:14:50'),
(15, 14, 1, 4, 5.00, 20.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 19:15:30', '2022-01-05 19:15:30'),
(16, 15, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 19:16:30', '2022-01-05 19:16:30'),
(17, 16, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-05 19:18:50', '2022-01-05 19:18:50'),
(18, 17, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-06 04:16:19', '2022-01-06 04:16:19'),
(19, 18, 1, 2, 5.00, 10.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-06 05:16:19', '2022-01-06 05:16:19'),
(20, 19, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-06 05:16:53', '2022-01-06 05:16:53'),
(21, 20, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-06 14:20:41', '2022-01-06 14:20:41'),
(22, 22, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-06 19:36:17', '2022-01-06 19:36:17'),
(23, 23, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-07 07:31:55', '2022-01-07 07:31:55'),
(24, 24, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-07 07:34:29', '2022-01-07 07:34:29'),
(25, 25, 1, 1, 5.00, 5.00, '{\"variants\":null,\"offer_amount\":0}', '2022-01-07 16:52:11', '2022-01-07 16:52:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(10) UNSIGNED NOT NULL,
  `act` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci,
  `shortcode` text COLLATE utf8mb4_unicode_ci COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plugins`
--

INSERT INTO `plugins` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'custom-captcha', 'Custom Captcha', 'Just Put Any Random String', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 1, NULL, '2019-10-18 17:16:05', '2021-04-03 05:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_variants` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `track_inventory` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `show_in_frontend` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `main_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `specification` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `extra_descriptions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `base_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `sku`, `name`, `model`, `has_variants`, `track_inventory`, `show_in_frontend`, `main_image`, `video_link`, `description`, `summary`, `specification`, `extra_descriptions`, `base_price`, `is_featured`, `is_special`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Testproduct', 'Testproduct', 'Testproduct', 0, 0, 1, '61d49b9b407771641323419.jpg', NULL, NULL, 'Testproduct', NULL, NULL, 5.00, 0, 0, 'Testproduct', 'Testproduct', '[\"Testproduct\"]', '2022-01-05 02:10:19', '2022-01-05 13:12:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products_categories`
--

CREATE TABLE `products_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_categories`
--

INSERT INTO `products_categories` (`id`, `product_id`, `category_id`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_for_user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1 = text, 2 = color, 3= image',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `assign_product_attribute_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `attributes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `shipping_time` tinyint(4) NOT NULL COMMENT 'in days',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `name`, `description`, `charge`, `shipping_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Normal Shipping', '<b>Free of cost shipping , Your product will deliver within 4 days.</b><br>', 0.00, 4, 1, '2022-01-05 02:11:48', '2022-01-05 02:12:35'),
(2, 'Express Shipping', '<b>Express shipping will deliver your product in 2 days.</b><br>', 50.00, 2, 1, '2022-01-05 02:12:22', '2022-01-05 02:12:22'),
(3, 'Outside India', '<b>Order will be delivered in 12 days (Outside India)</b><br>', 500.00, 12, 1, '2022-01-05 14:30:59', '2022-01-05 14:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `stock_logs`
--

CREATE TABLE `stock_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1= Updated by admin, 2= Sell',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `supportticket_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `charge` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `trx_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0: banned, 1: active',
  `ev` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `mobile`, `password`, `image`, `address`, `status`, `ev`, `sv`, `ver_code`, `ver_code_send_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kartikay', 'Sharma', 'Kartikay118', 'kartikaysharma118@gmail.com', '918181815438', '$2y$10$kLDjcTtSnMZOK9EAupxGduuJqTglTQ4vvsQUOAvt5g/aTb.yQVFDi', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"India\",\"city\":\"\"}', 1, 1, 1, NULL, NULL, NULL, '2022-01-05 02:15:23', '2022-01-05 02:15:23'),
(2, 'test1234', 'test1234', 'test1234', 'test1234@gmail.com', '88001882363323', '$2y$10$geWiv0N7HRf9FMH8YjIN.OBpZFcZROB5nce5b56KvhVTD8uL7xZ56', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 1, 1, 1, NULL, NULL, NULL, '2022-01-05 19:13:43', '2022-01-05 19:13:43'),
(3, 'Naman', 'Sharma', 'Namn118', 'namansharma118@gmail.com', '918181815438', '$2y$10$ckHNkKyUqek7wQqH7q1by.dH47CBev.d04ubow6t7whUDEgIFrVyS', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"India\",\"city\":\"\"}', 1, 1, 0, '145892', '2022-01-06 02:52:09', NULL, '2022-01-06 09:52:08', '2022-01-06 09:52:09'),
(4, 'Shagun', 'Somani', 'Shagunsomani', 'somanishagun8@gmail.com', '918368513528', '$2y$10$cdJFxBzu0G7KEpzGNbELkO5R6Hw7hiZcri3bP..Cy3EXEPMeFweuW', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"India\",\"city\":\"\"}', 1, 1, 1, NULL, NULL, NULL, '2022-01-06 14:16:42', '2022-01-06 14:16:42'),
(5, 'Adrienne', 'Wilder', 'voxokavefi', 'bikat@amimail.com', '54Odit qui ratione eos', '$2y$10$K.M.8gky2FZMYA.ejYlhQOqOkKloNyB53Ti0g4vh8NS6Gs36yMYM.', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Argentina\",\"city\":\"\"}', 1, 1, 1, NULL, NULL, NULL, '2022-01-06 19:35:27', '2022-01-06 19:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(91) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `location`, `browser`, `os`, `longitude`, `latitude`, `country`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 1, '122.161.52.79', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-05 02:15:23', '2022-01-05 02:15:23'),
(2, 1, '122.161.52.79', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-05 12:46:32', '2022-01-05 12:46:32'),
(3, 1, '122.161.52.79', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-05 13:15:35', '2022-01-05 13:15:35'),
(4, 1, '122.161.52.79', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-05 13:19:25', '2022-01-05 13:19:25'),
(5, 1, '122.161.52.79', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-05 13:27:29', '2022-01-05 13:27:29'),
(6, 1, '122.161.52.79', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-05 13:31:37', '2022-01-05 13:31:37'),
(7, 1, '122.161.52.79', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-05 13:46:41', '2022-01-05 13:46:41'),
(8, 1, '122.161.52.79', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-05 14:12:28', '2022-01-05 14:12:28'),
(9, 2, '59.153.30.32', 'Dhaka - - Bangladesh - BD ', 'Chrome', 'Windows 10', '90.4093', '23.7272', 'Bangladesh', 'BD', '2022-01-05 19:13:44', '2022-01-05 19:13:44'),
(10, 1, '122.161.51.91', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-06 04:15:32', '2022-01-06 04:15:32'),
(11, 1, '122.161.51.91', 'Noida - - India - IN ', 'Firefox', 'Windows 7', '77.3063', '28.6145', 'India', 'IN', '2022-01-06 05:15:06', '2022-01-06 05:15:06'),
(12, 3, '122.161.51.152', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-06 09:52:09', '2022-01-06 09:52:09'),
(13, 4, '49.36.186.74', 'Lucknow - - India - IN ', 'Handheld Browser', 'iPhone', '80.9115', '26.8756', 'India', 'IN', '2022-01-06 14:16:42', '2022-01-06 14:16:42'),
(14, 5, '59.153.30.32', 'Dhaka - - Bangladesh - BD ', 'Chrome', 'Windows 10', '90.4093', '23.7272', 'Bangladesh', 'BD', '2022-01-06 19:35:27', '2022-01-06 19:35:27'),
(15, 1, '122.161.52.160', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-07 07:30:49', '2022-01-07 07:30:49'),
(16, 1, '122.161.52.160', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-07 07:31:35', '2022-01-07 07:31:35'),
(17, 1, '122.161.52.160', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-07 07:34:06', '2022-01-07 07:34:06'),
(18, 1, '122.161.52.160', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-07 07:35:26', '2022-01-07 07:35:26'),
(19, 1, '122.161.52.160', 'Noida - - India - IN ', 'Handheld Browser', 'iPhone', '77.3063', '28.6145', 'India', 'IN', '2022-01-07 16:51:49', '2022-01-07 16:51:49');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `session_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '61d64f0bc4752', 1, '2022-01-06 09:08:11', '2022-01-06 09:08:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applied_coupons`
--
ALTER TABLE `applied_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_product_attributes`
--
ALTER TABLE `assign_product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assign_product_attributes_product_id_index` (`product_id`),
  ADD KEY `assign_product_attributes_product_attribute_id_index` (`product_attribute_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons_categories`
--
ALTER TABLE `coupons_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_categories_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupons_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `coupons_products`
--
ALTER TABLE `coupons_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupons_products_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupons_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers_products`
--
ALTER TABLE `offers_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offers_products_offer_id_foreign` (`offer_id`),
  ADD KEY `offers_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_index` (`brand_id`);

--
-- Indexes for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_categories_product_id_foreign` (`product_id`),
  ADD KEY `products_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_index` (`product_id`),
  ADD KEY `product_images_assign_product_attribute_id_index` (`assign_product_attribute_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_logs`
--
ALTER TABLE `stock_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applied_coupons`
--
ALTER TABLE `applied_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assign_product_attributes`
--
ALTER TABLE `assign_product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons_categories`
--
ALTER TABLE `coupons_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons_products`
--
ALTER TABLE `coupons_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `email_sms_templates`
--
ALTER TABLE `email_sms_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers_products`
--
ALTER TABLE `offers_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products_categories`
--
ALTER TABLE `products_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stock_logs`
--
ALTER TABLE `stock_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coupons_categories`
--
ALTER TABLE `coupons_categories`
  ADD CONSTRAINT `coupons_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupons_categories_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons_products`
--
ALTER TABLE `coupons_products`
  ADD CONSTRAINT `coupons_products_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupons_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offers_products`
--
ALTER TABLE `offers_products`
  ADD CONSTRAINT `offers_products_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offers_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD CONSTRAINT `products_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
