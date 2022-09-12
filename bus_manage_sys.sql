/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : bus_manage_sys

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 11/07/2022 15:13:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录名',
  `pass_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录密码',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_info
-- ----------------------------
INSERT INTO `admin_info` VALUES (1, 'admin', '123', '2020-03-17 08:38:58');

-- ----------------------------
-- Table structure for advice_info
-- ----------------------------
DROP TABLE IF EXISTS `advice_info`;
CREATE TABLE `advice_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系姓名',
  `cel_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '反馈内容',
  `is_deal` int(11) NULL DEFAULT NULL COMMENT '是否已处理',
  `reply_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '回复内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '反馈用户',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户建议' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of advice_info
-- ----------------------------

-- ----------------------------
-- Table structure for banner_info
-- ----------------------------
DROP TABLE IF EXISTS `banner_info`;
CREATE TABLE `banner_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `banner_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner_info
-- ----------------------------
INSERT INTO `banner_info` VALUES (4, '', '2022-05-27 15:16:17');
INSERT INTO `banner_info` VALUES (5, '', '2022-05-27 15:16:35');
INSERT INTO `banner_info` VALUES (6, '', '2022-06-05 13:34:12');

-- ----------------------------
-- Table structure for bus_line_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_line_info`;
CREATE TABLE `bus_line_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `line_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '路线名',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '车票价格',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公交线路' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bus_line_info
-- ----------------------------
INSERT INTO `bus_line_info` VALUES (4, '1号线', 10.00, '2021-05-24 08:16:59');
INSERT INTO `bus_line_info` VALUES (5, '2号线', 5.00, '2021-05-24 10:44:20');
INSERT INTO `bus_line_info` VALUES (6, '3号线', 8.00, '2021-05-24 10:44:32');
INSERT INTO `bus_line_info` VALUES (7, '4号线', 7.00, '2021-05-24 10:44:50');

-- ----------------------------
-- Table structure for bus_line_msg_info
-- ----------------------------
DROP TABLE IF EXISTS `bus_line_msg_info`;
CREATE TABLE `bus_line_msg_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `line_id` int(11) NULL DEFAULT NULL COMMENT '所属路线',
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '车站排序',
  `station_id` int(11) NULL DEFAULT NULL COMMENT '当前车站',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '路线-车站关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bus_line_msg_info
-- ----------------------------
INSERT INTO `bus_line_msg_info` VALUES (4, 7, '1', 4, '2021-05-24 10:57:12');
INSERT INTO `bus_line_msg_info` VALUES (5, 7, '2', 5, '2021-05-24 10:57:23');

-- ----------------------------
-- Table structure for driver_info
-- ----------------------------
DROP TABLE IF EXISTS `driver_info`;
CREATE TABLE `driver_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `cel_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `driver_intro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '司机简介',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '司机' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of driver_info
-- ----------------------------
INSERT INTO `driver_info` VALUES (4, '张三', '13588888888', '司机简介', '2021-05-24 10:46:11');

-- ----------------------------
-- Table structure for news_info
-- ----------------------------
DROP TABLE IF EXISTS `news_info`;
CREATE TABLE `news_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '新闻内容',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '新闻' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news_info
-- ----------------------------
INSERT INTO `news_info` VALUES (4, '新闻标题', '<p>新闻内容<br></p>', '2021-05-24 10:45:20');

-- ----------------------------
-- Table structure for station_info
-- ----------------------------
DROP TABLE IF EXISTS `station_info`;
CREATE TABLE `station_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `station_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '车站名',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '车站' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of station_info
-- ----------------------------
INSERT INTO `station_info` VALUES (4, '塘厦站', '2021-05-24 10:55:06');
INSERT INTO `station_info` VALUES (5, '大学城站', '2021-05-24 10:55:46');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录名',
  `pass_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录密码',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `cel_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机号',
  `create_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (4, 'user', '123', '张三', '1358888888', '2021-05-24');

SET FOREIGN_KEY_CHECKS = 1;
