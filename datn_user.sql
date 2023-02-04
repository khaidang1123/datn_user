-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 04, 2023 at 03:32 PM
-- Server version: 5.7.40
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datn_user`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_login` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  `role` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_packets`
--

DROP TABLE IF EXISTS `admin_packets`;
CREATE TABLE IF NOT EXISTS `admin_packets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weight` double DEFAULT NULL COMMENT 'khối lượng của hàng (kg)',
  `volume` double DEFAULT NULL COMMENT 'thể tích của hàng (cm3)',
  `weight_from_volume` double DEFAULT NULL COMMENT 'khối lượng quy đổi (kg)',
  `wood_packing` int(11) DEFAULT '0' COMMENT 'đóng gỗ (true/false)',
  `note` text COLLATE utf8mb4_unicode_ci COMMENT 'ghi chú kiện hàng',
  `status_id` int(11) DEFAULT NULL COMMENT 'tình trạng kiện hàng',
  `is_delete` int(11) DEFAULT '0',
  `unit_price` decimal(15,2) DEFAULT NULL,
  `wood_packing_price` decimal(15,2) DEFAULT NULL,
  `other_price` decimal(15,2) DEFAULT NULL,
  `total_price` decimal(15,2) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT '0',
  `code` text COLLATE utf8mb4_unicode_ci COMMENT 'Mã kiện hàng',
  `warehouse_id` int(11) DEFAULT NULL COMMENT 'ID kho hàng',
  `partner_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_packet_items`
--

DROP TABLE IF EXISTS `admin_packet_items`;
CREATE TABLE IF NOT EXISTS `admin_packet_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `waybill_code` text COLLATE utf8mb4_unicode_ci COMMENT 'mã vận đơn',
  `order_id` int(11) DEFAULT NULL COMMENT 'đơn hàng',
  `admin_packet_id` int(11) DEFAULT NULL COMMENT 'kiện hàng',
  `created_at` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_transactions`
--

DROP TABLE IF EXISTS `admin_transactions`;
CREATE TABLE IF NOT EXISTS `admin_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `packet_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `point_cn` decimal(15,2) DEFAULT NULL,
  `point_vn` decimal(15,2) DEFAULT NULL,
  `exchange_rate` decimal(15,2) DEFAULT NULL,
  `surplus` decimal(15,2) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  `admin_packet_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_transactions_types`
--

DROP TABLE IF EXISTS `admin_transactions_types`;
CREATE TABLE IF NOT EXISTS `admin_transactions_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn` int(11) DEFAULT NULL,
  `vi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `shop_id` bigint(20) DEFAULT '0',
  `shop_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `shop_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `total_price` decimal(15,2) DEFAULT '0.00',
  `opt_signed_order` smallint(6) DEFAULT '0',
  `opt_auto_ship` smallint(6) DEFAULT '0',
  `opt_saving_transport` smallint(6) DEFAULT '0',
  `opt_express_ship` smallint(6) DEFAULT '0',
  `opt_checking` smallint(6) DEFAULT '0',
  `opt_wood_pack` smallint(6) DEFAULT '0',
  `opt_private_wood_pack` smallint(6) DEFAULT '0',
  `is_delete` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
CREATE TABLE IF NOT EXISTS `cart_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `source` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'tên trang bán hàng',
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `propertiesId` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `properties` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `price_cn` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `original_price` decimal(15,2) DEFAULT '0.00',
  `promotion_price` decimal(15,2) DEFAULT '0.00',
  `price_table` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `quantity` int(11) DEFAULT '0',
  `quantity_min` int(11) DEFAULT '0',
  `stock` int(11) DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `image` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `image_detail` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `note` text COLLATE utf8mb4_unicode_ci,
  `is_delete` int(11) DEFAULT '0',
  `unit_price_cn` decimal(15,2) DEFAULT NULL COMMENT 'giá 1 sản phẩm trung quốc',
  `unit_price_vn` decimal(15,2) DEFAULT NULL COMMENT 'giá 1 sản phẩm việt nam',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complains`
--

DROP TABLE IF EXISTS `complains`;
CREATE TABLE IF NOT EXISTS `complains` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `order_id` int(11) DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `method_handle` text COLLATE utf8mb4_unicode_ci,
  `situation` int(11) DEFAULT '0',
  `is_delete` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
CREATE TABLE IF NOT EXISTS `configs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2022_07_20_084817_create_admin_packet_items_table', 1),
(7, '2022_07_20_084817_create_admin_packets_table', 1),
(8, '2022_07_20_084817_create_admin_transactions_table', 1),
(9, '2022_07_20_084817_create_admin_transactions_types_table', 1),
(10, '2022_07_20_084817_create_admins_table', 1),
(11, '2022_07_20_084817_create_cart_products_table', 1),
(12, '2022_07_20_084817_create_carts_table', 1),
(13, '2022_07_20_084817_create_complains_table', 1),
(14, '2022_07_20_084817_create_configs_table', 1),
(15, '2022_07_20_084817_create_order_comments_table', 1),
(16, '2022_07_20_084817_create_order_products_table', 1),
(17, '2022_07_20_084817_create_order_statuses_table', 1),
(18, '2022_07_20_084817_create_orders_table', 1),
(19, '2022_07_20_084817_create_packets_table', 1),
(20, '2022_07_20_084817_create_partner_transactions_table', 1),
(21, '2022_07_20_084817_create_partners_table', 1),
(22, '2022_07_20_084817_create_schema_migrations_table', 1),
(23, '2022_07_20_084817_create_transactions_table', 1),
(24, '2022_07_20_084817_create_transports_table', 1),
(25, '2022_07_20_084817_create_type_transactions_table', 1),
(26, '2022_07_20_084817_create_user_addresses_table', 1),
(27, '2022_07_20_084817_create_users_table', 1),
(28, '2022_07_20_084817_create_warehouses_table', 1),
(29, '2022_11_04_213446_create_order_details_table', 1),
(30, '2022_12_03_113331_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `shop_id` bigint(20) DEFAULT '0',
  `shop_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `shop_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'địa chỉ shop',
  `global_shipping_fee` decimal(15,2) DEFAULT '0.00',
  `china_shipping_fee` decimal(15,2) DEFAULT '0.00',
  `purchase_fee` decimal(15,2) DEFAULT '0.00',
  `inventory_fee` decimal(15,2) DEFAULT '0.00',
  `wood_packing_fee` decimal(15,2) DEFAULT '0.00',
  `separately_wood_packing_fee` decimal(15,2) DEFAULT '0.00',
  `high_value_fee` decimal(15,2) DEFAULT '0.00',
  `checking_order_fee` decimal(15,2) DEFAULT '0.00',
  `auto_shipping_fee` decimal(15,2) DEFAULT '0.00',
  `saving_shipping_fee` decimal(15,2) DEFAULT '0.00',
  `express_shipping_fee` decimal(15,2) DEFAULT '0.00',
  `items_price_cny` decimal(15,2) DEFAULT '0.00',
  `items_price_vnd` decimal(15,2) DEFAULT '0.00',
  `total_price` decimal(15,2) DEFAULT '0.00',
  `deposit_amount` decimal(15,2) DEFAULT '0.00',
  `note` text COLLATE utf8mb4_unicode_ci,
  `source` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_delete` double DEFAULT '0',
  `cancel_note` text COLLATE utf8mb4_unicode_ci,
  `payed` tinyint(1) DEFAULT '0',
  `source_order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waybill_code_link` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_receive` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_comments`
--

DROP TABLE IF EXISTS `order_comments`;
CREATE TABLE IF NOT EXISTS `order_comments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `is_delete` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
CREATE TABLE IF NOT EXISTS `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` bigint(20) DEFAULT '0',
  `source` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'tên trang bán hàng',
  `product_name` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'tên sản phẩm trên trang bán hàng',
  `propertiesId` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'id của các đặc điểm sản phẩm',
  `properties` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'đặc điểm của sản phẩm',
  `original_price` decimal(15,2) DEFAULT '0.00',
  `promotion_price` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `price_table` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'bảng config giá tiền ứng với số lượng',
  `quantity_min` int(11) DEFAULT '0' COMMENT 'số lượng mua tối thiểu',
  `quantity_bought` int(11) DEFAULT '0' COMMENT 'số lượng người dùng mua',
  `quantity_received` int(11) DEFAULT '0' COMMENT 'số lượng mình mua được',
  `stock` int(11) DEFAULT '0' COMMENT 'số lượng hàng còn trong kho',
  `url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'link mua hàng',
  `image_link` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'link ảnh đại diện của hàng',
  `image_detail` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_delete` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `code_language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `is_running` int(11) DEFAULT '1',
  `serial` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packets`
--

DROP TABLE IF EXISTS `packets`;
CREATE TABLE IF NOT EXISTS `packets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` smallint(6) NOT NULL,
  `code` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double DEFAULT '0' COMMENT 'khối lượng của hàng (kg)',
  `volume` double DEFAULT '0' COMMENT 'thể tích của hàng (cm3)',
  `weight_from_volume` double DEFAULT '0' COMMENT 'khối lượng quy đổi (kg)',
  `price_unit` double DEFAULT '0' COMMENT 'tỉ giá (Nhân dân tệ / Việt nam đồng)',
  `quantity_buy` int(11) DEFAULT '0' COMMENT 'số lượng hàng người mua muốn đặt',
  `quantity_receive` int(11) DEFAULT '0' COMMENT 'số lượng hàng mua được',
  `opt_order_checking` int(11) DEFAULT '0' COMMENT 'lựa chọn hàng ký gửi (true/false)',
  `opt_auto_shipping` int(11) DEFAULT '0' COMMENT 'lựa chọn tự động giao hàng (true/false)',
  `opt_saving_shipping` int(11) DEFAULT '0' COMMENT 'lựa chọn giao hàng tiết kiệm (đợi nhiều hàng rồi giao 1 lượt) (true/false)',
  `opt_express_shipping` int(11) DEFAULT '0' COMMENT 'lựa chọn giao hàng nhanh (có hàng giao luôn) (true/false)',
  `opt_inventory` int(11) DEFAULT '0' COMMENT 'lựa chọn kiểm hàng (true/false)',
  `opt_wood_packing` int(11) DEFAULT '0' COMMENT 'lựa chọn đóng gỗ (true/false)',
  `opt_separate_wood_packing` int(11) DEFAULT '0' COMMENT 'lựa chọn đóng gỗ riêng (true/false)',
  `time_deposit` datetime DEFAULT NULL COMMENT 'thời điểm người mua đặt cọc',
  `time_bought` datetime DEFAULT NULL COMMENT 'thời điểm mình đã mua của nhà bán bên TQ',
  `time_seller_delivered` datetime DEFAULT NULL COMMENT 'thời điểm người bán bên TQ giao cho mình',
  `time_receive` datetime DEFAULT NULL COMMENT 'thời điểm mình đã nhận của người bán bên TQ',
  `time_transport` datetime DEFAULT NULL COMMENT 'thời điểm mình vận chuyển từ kho bên TQ về VN',
  `time_wait_ship` datetime DEFAULT NULL COMMENT 'thời điểm hàng về đến kho ở VN và chờ giao hàng',
  `time_request_ship` datetime DEFAULT NULL COMMENT 'thời điểm người mua hàng yêu cầu giao hàng',
  `time_shipping` datetime DEFAULT NULL COMMENT 'thời điểm người giao hàng bên mình đi giao hàng cho khách',
  `time_shipped_success` datetime DEFAULT NULL COMMENT 'thời điểm khách nhận được hàng',
  `time_lost` datetime DEFAULT NULL COMMENT 'thời điểm hàng bị thất lạc',
  `time_cancel` datetime DEFAULT NULL COMMENT 'thời điểm người mua hủy bỏ hàng',
  `is_delete` int(11) DEFAULT '0',
  `checked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
CREATE TABLE IF NOT EXISTS `partners` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` int(11) DEFAULT '0',
  `is_running` int(11) DEFAULT '1',
  `is_delete` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partner_transactions`
--

DROP TABLE IF EXISTS `partner_transactions`;
CREATE TABLE IF NOT EXISTS `partner_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `out_point` int(11) DEFAULT '0',
  `in_point` int(11) DEFAULT '0',
  `is_delete` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `point` decimal(15,2) DEFAULT '0.00',
  `is_delete` int(11) DEFAULT '0',
  `point_transaction` decimal(15,2) DEFAULT '0.00',
  `code_transaction` text COLLATE utf8mb4_unicode_ci,
  `new_column` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
CREATE TABLE IF NOT EXISTS `transports` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `packet_id` int(11) NOT NULL,
  `cod` smallint(6) DEFAULT '0',
  `cod_note` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `is_delete` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_transactions`
--

DROP TABLE IF EXISTS `type_transactions`;
CREATE TABLE IF NOT EXISTS `type_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_language` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `point` int(11) DEFAULT '0',
  `accept_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  `uid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vip_level` int(11) DEFAULT '0',
  `warehouse_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `partner_id`, `username`, `password`, `email`, `phone`, `language`, `point`, `accept_token`, `last_login`, `is_delete`, `uid`, `vip_level`, `warehouse_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'khaidang', '$2a$12$vMAEJaeusP8aBXUEQ/6.KepDoL9QtEpflzMqZJGEz2x7XWtTp6lhC', 'akhai7230@gmail.com', '0962597441', 'vie', 10000000, NULL, NULL, 0, '', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE IF NOT EXISTS `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
