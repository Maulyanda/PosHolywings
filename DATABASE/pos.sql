/*
 Navicat Premium Data Transfer

 Source Server         : My-Mysql
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : pos

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 20/08/2021 17:01:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `nomor_handphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`nomor_handphone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('08111361613', 'Nanda', 'Aceh', '2021-08-20 09:38:22', '2021-08-20 09:38:22');
INSERT INTO `customers` VALUES ('082118819881', 'MAULYANDA', 'IPDN BANDUNG', '2021-08-20 02:03:49', '2021-08-20 02:03:49');

-- ----------------------------
-- Table structure for detail_transaksis
-- ----------------------------
DROP TABLE IF EXISTS `detail_transaksis`;
CREATE TABLE `detail_transaksis`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_item` int NOT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_hraga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_transaksis
-- ----------------------------
INSERT INTO `detail_transaksis` VALUES (1, 'TRX-20082021000001', 1, '3', '360000', '2021-08-20 09:05:51', '2021-08-20 09:05:51');
INSERT INTO `detail_transaksis` VALUES (2, 'TRX-20082021000001', 2, '2', '240000', '2021-08-20 09:05:51', '2021-08-20 09:05:51');
INSERT INTO `detail_transaksis` VALUES (3, 'TRX-20082021000002', 1, '3', '360000', '2021-08-20 09:06:52', '2021-08-20 09:06:52');
INSERT INTO `detail_transaksis` VALUES (4, 'TRX-20082021000002', 2, '2', '240000', '2021-08-20 09:06:52', '2021-08-20 09:06:52');
INSERT INTO `detail_transaksis` VALUES (5, 'TRX-20082021000003', 1, '3', '360000', '2021-08-20 09:07:24', '2021-08-20 09:07:24');
INSERT INTO `detail_transaksis` VALUES (6, 'TRX-20082021000003', 2, '2', '240000', '2021-08-20 09:07:24', '2021-08-20 09:07:24');
INSERT INTO `detail_transaksis` VALUES (7, 'TRX-20082021000004', 1, '2', '240000', '2021-08-20 09:43:14', '2021-08-20 09:43:14');
INSERT INTO `detail_transaksis` VALUES (8, 'TRX-20082021000004', 3, '3', '9000000', '2021-08-20 09:43:14', '2021-08-20 09:43:14');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku_kode_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, 'LOGITECH ASUS', 'PRD-MOUSE-1', '120000', NULL, NULL);
INSERT INTO `items` VALUES (2, 'LOGITECH RAZER', 'PRD-MOUSE-2', '120000', NULL, NULL);
INSERT INTO `items` VALUES (3, 'Monitor LG', 'PRD-MONITOR-1', '3000000', '2021-08-20 09:40:25', '2021-08-20 09:40:25');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (2, '2021_08_19_152952_create_items_table', 1);
INSERT INTO `migrations` VALUES (3, '2021_08_19_154046_create_customers_table', 2);
INSERT INTO `migrations` VALUES (4, '2021_08_19_154403_create_transaksis_table', 3);
INSERT INTO `migrations` VALUES (5, '2021_08_19_181134_create_transakses_table', 4);
INSERT INTO `migrations` VALUES (6, '2021_08_20_074956_detail_transaksi', 5);
INSERT INTO `migrations` VALUES (7, '2021_08_20_075620_create_detail_transaksis_table', 6);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for transaksis
-- ----------------------------
DROP TABLE IF EXISTS `transaksis`;
CREATE TABLE `transaksis`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_handphone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksis
-- ----------------------------
INSERT INTO `transaksis` VALUES (1, 'TRX-20082021000001', '082118819881', '2021-08-20 09:05:51', '2021-08-20 09:05:51');
INSERT INTO `transaksis` VALUES (2, 'TRX-20082021000002', '082118819881', '2021-08-20 09:06:52', '2021-08-20 09:06:52');
INSERT INTO `transaksis` VALUES (3, 'TRX-20082021000003', '082118819881', '2021-08-20 09:07:24', '2021-08-20 09:07:24');
INSERT INTO `transaksis` VALUES (4, 'TRX-20082021000004', '08111361613', '2021-08-20 09:43:14', '2021-08-20 09:43:14');

SET FOREIGN_KEY_CHECKS = 1;
