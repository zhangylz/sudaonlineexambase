/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80014
 Source Host           : localhost:3306
 Source Schema         : quartz

 Target Server Type    : MySQL
 Target Server Version : 80014
 File Encoding         : 65001

 Date: 10/05/2019 18:51:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', '20180621-0954071557236851793', 1557315402143, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', NULL, 1552371570000, -1, 5, 'PAUSED', 'CRON', 1552371562000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000130740001317800);
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '__TASK_CLASS_NAME__2', 'DEFAULT', NULL, 1552371580000, -1, 5, 'PAUSED', 'CRON', 1552371562000, 0, NULL, 0, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000130740001317800);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_course
-- ----------------------------
DROP TABLE IF EXISTS `sys_course`;
CREATE TABLE `sys_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '课程名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_course
-- ----------------------------
INSERT INTO `sys_course` VALUES (1, '计算机');
INSERT INTO `sys_course` VALUES (2, '数学');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '春燕科技', 0, '张延磊', '17351098691', '549545303@qq.com', '0', '0', 'admin', '2018-01-16 11:33:00', 'admin', '2019-03-28 13:42:39');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '管理部', 1, '张延磊', '17351098691', '549545303@qq.com', '0', '0', 'admin', '2018-01-16 11:33:00', 'admin', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '教学部', 2, '张延磊', '17351098691', '549545303@qq.com', '0', '0', 'admin', '2018-01-16 11:33:00', 'admin', '2019-03-28 13:42:39');
INSERT INTO `sys_dept` VALUES (103, 100, '0,100', '学生部', 3, '张延磊', '17351098691', '549545303@qq.com', '0', '0', 'admin', '2018-01-16 11:33:00', 'admin', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '研发部门', 1, '张延磊', '17351098691', '549545303@qq.com', '0', '0', 'admin', '2018-01-16 11:33:00', 'admin', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (200, 103, '0,100,103', '班级01', 1, '张延磊', '17351098691', '549545303@qq.com', '0', '0', 'js', '2019-03-30 18:05:03', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (24, 8, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (25, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '计算机', '1', 'sys_course_name', '', 'default', 'Y', '0', 'admin', '2019-04-11 14:39:59', 'admin', '2019-04-11 14:49:10', '');
INSERT INTO `sys_dict_data` VALUES (101, 2, '数学', '2', 'sys_course_name', '', 'default', 'Y', '0', 'admin', '2019-04-11 14:40:21', 'admin', '2019-04-11 14:49:16', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (6, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (8, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (9, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '课程名称', 'sys_course_name', '0', 'admin', '2019-04-11 14:38:30', '', NULL, '用户 标识 课程id');

-- ----------------------------
-- Table structure for sys_exam_list
-- ----------------------------
DROP TABLE IF EXISTS `sys_exam_list`;
CREATE TABLE `sys_exam_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试名称',
  `startTime` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `endTIme` datetime(0) NULL DEFAULT NULL COMMENT '截止时间',
  `status` bigint(1) NULL DEFAULT NULL COMMENT '0:off 1:on',
  `courseId` int(11) NULL DEFAULT NULL COMMENT '课程Id',
  `questions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题集(默认10题)',
  `answers` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'answer',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_exam_list
-- ----------------------------
INSERT INTO `sys_exam_list` VALUES (16, '计算机', '2019-04-27 08:00:00', '2019-05-06 08:00:00', 1, 1, '1|2|3|8|9|10|12|13|17|19', 'C|D|A|A|C|B|C|B|D|C');

-- ----------------------------
-- Table structure for sys_exam_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_exam_record`;
CREATE TABLE `sys_exam_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户Id',
  `exam_id` int(11) NOT NULL COMMENT '考试Id',
  `score` int(11) NULL DEFAULT NULL COMMENT '分数',
  `record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答题记录',
  `flag` int(1) NULL DEFAULT NULL COMMENT '1:完成 0:未开始',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_exam_record
-- ----------------------------
INSERT INTO `sys_exam_record` VALUES (35, 1, 16, 10, 'C|N|N|N|N|N|N|N|N|N', NULL);
INSERT INTO `sys_exam_record` VALUES (36, 100, 16, 70, 'C|D|A|A|C|D|C|B|B|D', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '0', '1', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-11 10:58:38', '');
INSERT INTO `sys_job` VALUES (2, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '0', '1', '1', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-11 10:58:36', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:53:30');
INSERT INTO `sys_job_log` VALUES (2, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：2毫秒', '0', '', '2019-04-11 10:53:35');
INSERT INTO `sys_job_log` VALUES (3, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:53:40');
INSERT INTO `sys_job_log` VALUES (4, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:53:40');
INSERT INTO `sys_job_log` VALUES (5, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:53:44');
INSERT INTO `sys_job_log` VALUES (6, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:53:50');
INSERT INTO `sys_job_log` VALUES (7, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:54:00');
INSERT INTO `sys_job_log` VALUES (8, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:54:00');
INSERT INTO `sys_job_log` VALUES (9, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:54:10');
INSERT INTO `sys_job_log` VALUES (10, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:54:20');
INSERT INTO `sys_job_log` VALUES (11, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:54:20');
INSERT INTO `sys_job_log` VALUES (12, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：2毫秒', '0', '', '2019-04-11 10:54:29');
INSERT INTO `sys_job_log` VALUES (13, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:54:30');
INSERT INTO `sys_job_log` VALUES (14, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:54:36');
INSERT INTO `sys_job_log` VALUES (15, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:54:40');
INSERT INTO `sys_job_log` VALUES (16, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:54:40');
INSERT INTO `sys_job_log` VALUES (17, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:54:50');
INSERT INTO `sys_job_log` VALUES (18, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:55:00');
INSERT INTO `sys_job_log` VALUES (19, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:55:00');
INSERT INTO `sys_job_log` VALUES (20, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:55:10');
INSERT INTO `sys_job_log` VALUES (21, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:55:20');
INSERT INTO `sys_job_log` VALUES (22, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:55:20');
INSERT INTO `sys_job_log` VALUES (23, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:55:30');
INSERT INTO `sys_job_log` VALUES (24, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：2毫秒', '0', '', '2019-04-11 10:55:40');
INSERT INTO `sys_job_log` VALUES (25, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:55:40');
INSERT INTO `sys_job_log` VALUES (26, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:55:50');
INSERT INTO `sys_job_log` VALUES (27, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:56:00');
INSERT INTO `sys_job_log` VALUES (28, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:56:00');
INSERT INTO `sys_job_log` VALUES (29, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:56:10');
INSERT INTO `sys_job_log` VALUES (30, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:56:20');
INSERT INTO `sys_job_log` VALUES (31, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:56:20');
INSERT INTO `sys_job_log` VALUES (32, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:56:30');
INSERT INTO `sys_job_log` VALUES (33, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:56:40');
INSERT INTO `sys_job_log` VALUES (34, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:56:40');
INSERT INTO `sys_job_log` VALUES (35, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：2毫秒', '0', '', '2019-04-11 10:56:50');
INSERT INTO `sys_job_log` VALUES (36, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:57:00');
INSERT INTO `sys_job_log` VALUES (37, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:57:00');
INSERT INTO `sys_job_log` VALUES (38, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:57:10');
INSERT INTO `sys_job_log` VALUES (39, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:57:20');
INSERT INTO `sys_job_log` VALUES (40, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:57:20');
INSERT INTO `sys_job_log` VALUES (41, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:57:30');
INSERT INTO `sys_job_log` VALUES (42, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:57:40');
INSERT INTO `sys_job_log` VALUES (43, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:57:40');
INSERT INTO `sys_job_log` VALUES (44, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：2毫秒', '0', '', '2019-04-11 10:57:50');
INSERT INTO `sys_job_log` VALUES (45, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：3毫秒', '0', '', '2019-04-11 10:58:00');
INSERT INTO `sys_job_log` VALUES (46, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:58:00');
INSERT INTO `sys_job_log` VALUES (47, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：0毫秒', '0', '', '2019-04-11 10:58:10');
INSERT INTO `sys_job_log` VALUES (48, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:58:20');
INSERT INTO `sys_job_log` VALUES (49, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:58:20');
INSERT INTO `sys_job_log` VALUES (50, 'ryTask', '系统默认（无参）', 'ryNoParams', NULL, 'ryTask 总共耗时：1毫秒', '0', '', '2019-04-11 10:58:30');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 401 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 10:20:39');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-27 11:16:39');
INSERT INTO `sys_logininfor` VALUES (102, 'student', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-27 11:16:45');
INSERT INTO `sys_logininfor` VALUES (103, 'student', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误2次', '2019-03-27 11:16:50');
INSERT INTO `sys_logininfor` VALUES (104, 'teacher', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-27 11:17:18');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-27 11:18:34');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-27 11:18:49');
INSERT INTO `sys_logininfor` VALUES (107, 'student', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误3次', '2019-03-27 11:18:56');
INSERT INTO `sys_logininfor` VALUES (108, 'student', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-28 11:06:32');
INSERT INTO `sys_logininfor` VALUES (109, 'student', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-28 11:44:18');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-28 11:45:17');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误2次', '2019-03-28 11:45:21');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误3次', '2019-03-28 11:45:30');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误4次', '2019-03-28 11:45:36');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 11:45:54');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 11:47:11');
INSERT INTO `sys_logininfor` VALUES (116, 'student', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-28 11:47:18');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 11:47:46');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 11:50:18');
INSERT INTO `sys_logininfor` VALUES (119, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 11:50:24');
INSERT INTO `sys_logininfor` VALUES (120, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 11:50:29');
INSERT INTO `sys_logininfor` VALUES (121, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 11:50:33');
INSERT INTO `sys_logininfor` VALUES (122, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 12:58:16');
INSERT INTO `sys_logininfor` VALUES (123, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 12:59:19');
INSERT INTO `sys_logininfor` VALUES (124, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 12:59:24');
INSERT INTO `sys_logininfor` VALUES (125, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 12:59:53');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 13:30:52');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 13:44:34');
INSERT INTO `sys_logininfor` VALUES (128, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 13:44:40');
INSERT INTO `sys_logininfor` VALUES (129, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 13:44:56');
INSERT INTO `sys_logininfor` VALUES (130, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 13:45:02');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 15:04:16');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 15:44:10');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 15:44:18');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 15:55:23');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 19:59:41');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 20:18:57');
INSERT INTO `sys_logininfor` VALUES (137, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 20:19:01');
INSERT INTO `sys_logininfor` VALUES (138, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 20:19:10');
INSERT INTO `sys_logininfor` VALUES (139, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 20:19:13');
INSERT INTO `sys_logininfor` VALUES (140, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-28 20:19:18');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 20:19:20');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-28 20:46:20');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-29 14:12:35');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 14:12:40');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-29 14:12:49');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-29 14:12:50');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 14:12:56');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-29 14:41:24');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-29 14:41:26');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 14:41:31');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-29 14:56:58');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-29 14:56:59');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 14:57:03');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 14:59:19');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 15:04:27');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-29 15:16:11');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 15:16:17');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-29 15:17:08');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-29 15:17:09');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 15:17:13');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-29 15:18:12');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-29 20:13:25');
INSERT INTO `sys_logininfor` VALUES (163, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 20:13:33');
INSERT INTO `sys_logininfor` VALUES (164, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-29 20:13:37');
INSERT INTO `sys_logininfor` VALUES (165, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 20:13:44');
INSERT INTO `sys_logininfor` VALUES (166, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-29 20:47:01');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 20:47:06');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-29 20:49:30');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 20:49:34');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-29 20:49:42');
INSERT INTO `sys_logininfor` VALUES (171, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 20:49:47');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 20:51:39');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-29 20:51:57');
INSERT INTO `sys_logininfor` VALUES (174, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 20:52:03');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-29 20:53:54');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-29 20:53:57');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:01:17');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 16:01:27');
INSERT INTO `sys_logininfor` VALUES (179, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:01:40');
INSERT INTO `sys_logininfor` VALUES (180, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 16:04:23');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:04:29');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:13:46');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-30 16:32:48');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:32:54');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 16:34:50');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:35:34');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:42:54');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 16:43:44');
INSERT INTO `sys_logininfor` VALUES (189, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-30 16:43:52');
INSERT INTO `sys_logininfor` VALUES (190, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:44:03');
INSERT INTO `sys_logininfor` VALUES (191, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 16:45:18');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:45:24');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 16:45:31');
INSERT INTO `sys_logininfor` VALUES (194, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:45:40');
INSERT INTO `sys_logininfor` VALUES (195, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 16:46:33');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:46:43');
INSERT INTO `sys_logininfor` VALUES (197, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-30 16:47:13');
INSERT INTO `sys_logininfor` VALUES (198, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:47:20');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:50:37');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 16:56:59');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:01:09');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 17:02:03');
INSERT INTO `sys_logininfor` VALUES (203, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:02:16');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:17:17');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:31:51');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:33:47');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:37:54');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:38:53');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:40:29');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:58:02');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:59:05');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 17:59:16');
INSERT INTO `sys_logininfor` VALUES (213, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-30 17:59:28');
INSERT INTO `sys_logininfor` VALUES (214, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 17:59:34');
INSERT INTO `sys_logininfor` VALUES (215, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:07:33');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:07:39');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:08:19');
INSERT INTO `sys_logininfor` VALUES (218, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:08:33');
INSERT INTO `sys_logininfor` VALUES (219, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:09:06');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:09:13');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:10:24');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:10:37');
INSERT INTO `sys_logininfor` VALUES (223, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:10:50');
INSERT INTO `sys_logininfor` VALUES (224, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:11:12');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:11:19');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:15:14');
INSERT INTO `sys_logininfor` VALUES (227, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:15:29');
INSERT INTO `sys_logininfor` VALUES (228, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:15:48');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:15:54');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:18:39');
INSERT INTO `sys_logininfor` VALUES (231, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:18:54');
INSERT INTO `sys_logininfor` VALUES (232, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:22:35');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:22:42');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:33:10');
INSERT INTO `sys_logininfor` VALUES (235, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-30 18:33:13');
INSERT INTO `sys_logininfor` VALUES (236, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:33:21');
INSERT INTO `sys_logininfor` VALUES (237, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:33:42');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-30 18:33:43');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:33:48');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 18:34:34');
INSERT INTO `sys_logininfor` VALUES (241, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 18:34:47');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 21:50:27');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 21:51:07');
INSERT INTO `sys_logininfor` VALUES (244, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-30 21:51:13');
INSERT INTO `sys_logininfor` VALUES (245, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 21:51:20');
INSERT INTO `sys_logininfor` VALUES (246, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 21:51:35');
INSERT INTO `sys_logininfor` VALUES (247, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-30 21:51:42');
INSERT INTO `sys_logininfor` VALUES (248, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 21:51:48');
INSERT INTO `sys_logininfor` VALUES (249, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-03-30 21:52:26');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-30 21:52:33');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-03-31 12:19:41');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-03-31 12:19:46');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 11:13:09');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-02 11:13:28');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-02 11:13:36');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 11:13:44');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-02 11:13:47');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-02 11:39:03');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-04 10:06:15');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-13 22:17:55');
INSERT INTO `sys_logininfor` VALUES (261, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-13 22:18:13');
INSERT INTO `sys_logininfor` VALUES (262, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-13 22:18:18');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-13 22:18:28');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-13 22:19:02');
INSERT INTO `sys_logininfor` VALUES (265, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-13 22:19:20');
INSERT INTO `sys_logininfor` VALUES (266, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-13 22:19:26');
INSERT INTO `sys_logininfor` VALUES (267, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-13 22:19:55');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-13 22:20:05');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-13 22:20:30');
INSERT INTO `sys_logininfor` VALUES (270, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-13 22:20:55');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:01:44');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-25 19:16:45');
INSERT INTO `sys_logininfor` VALUES (273, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-25 19:16:50');
INSERT INTO `sys_logininfor` VALUES (274, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:16:57');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:19:59');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-25 19:20:28');
INSERT INTO `sys_logininfor` VALUES (277, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:20:36');
INSERT INTO `sys_logininfor` VALUES (278, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:21:51');
INSERT INTO `sys_logininfor` VALUES (279, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-25 19:22:38');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:22:47');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:27:14');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:27:34');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:37:06');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-25 19:40:17');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:40:20');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:44:47');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:47:32');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-25 19:48:41');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:48:46');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:50:52');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-25 19:51:25');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:51:30');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:53:14');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 19:56:08');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:00:12');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:01:03');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:10:04');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-25 20:12:05');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:12:08');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:18:28');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:22:35');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-25 20:32:03');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:32:06');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:35:39');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:37:04');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:38:30');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-25 20:39:56');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:39:59');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:41:13');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:44:04');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:45:01');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:46:48');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:47:03');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:50:40');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:51:53');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:54:33');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:56:10');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-04-25 20:57:34');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 20:57:41');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 21:00:55');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-25 21:02:45');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 21:02:53');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 21:06:35');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-25 21:08:28');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-26 09:46:50');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 09:46:54');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-04-26 09:48:42');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误2次', '2019-04-26 09:48:47');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 09:48:56');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 10:09:09');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 10:09:58');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 10:12:21');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 10:14:48');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 12:50:36');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 12:52:23');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:01:40');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:03:52');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:28:23');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-26 13:29:04');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:29:07');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-26 13:33:21');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:33:25');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-26 13:34:50');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:34:53');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:35:44');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-26 13:37:00');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:37:04');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:37:30');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:40:41');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:45:49');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-26 13:52:36');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:52:40');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-26 13:56:54');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 13:56:57');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 14:52:55');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 15:16:57');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 15:20:50');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '密码输入错误1次', '2019-04-26 15:22:34');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-26 15:22:37');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 15:22:42');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 15:24:55');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-26 15:32:10');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-27 14:51:59');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 14:52:13');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 14:53:43');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-27 15:03:15');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 15:03:19');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-27 15:05:43');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 15:05:47');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 15:07:58');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-27 15:11:49');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 15:11:53');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 15:14:29');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 15:17:12');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-27 15:35:23');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 15:35:28');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 15:38:52');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 15:47:08');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-27 16:01:00');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 16:01:05');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 16:03:02');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 16:04:16');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 16:05:57');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 16:08:03');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 16:11:02');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 19:50:07');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '1', '验证码错误', '2019-04-27 20:50:51');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 20:50:56');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-27 22:02:00');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-28 10:44:51');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-28 15:28:04');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-28 15:35:01');
INSERT INTO `sys_logininfor` VALUES (393, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-28 15:35:11');
INSERT INTO `sys_logininfor` VALUES (394, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-28 15:55:21');
INSERT INTO `sys_logininfor` VALUES (395, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-28 15:55:29');
INSERT INTO `sys_logininfor` VALUES (396, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-28 16:01:18');
INSERT INTO `sys_logininfor` VALUES (397, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-28 16:01:27');
INSERT INTO `sys_logininfor` VALUES (398, 'js', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-28 16:08:29');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-28 16:08:38');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-04-28 16:16:51');
INSERT INTO `sys_logininfor` VALUES (401, 'stu', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-04-28 16:16:59');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2020 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务详细', 110, 6, '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务导出', 110, 7, '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成查询', 114, 1, '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成代码', 114, 2, '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2001, '考试信息', 0, 5, '#', 'M', '0', '', '#', 'admin', '2019-03-28 13:33:56', 'admin', '2019-03-28 13:41:20', '');
INSERT INTO `sys_menu` VALUES (2003, '考试列表', 2001, 2, '/system/examList', 'C', '0', 'system:examList:view', '#', 'admin', '2019-03-28 13:35:28', 'admin', '2019-03-29 15:15:23', '');
INSERT INTO `sys_menu` VALUES (2004, '试题库', 0, 4, '#', 'M', '0', '', '#', 'admin', '2019-03-28 13:39:38', 'admin', '2019-03-28 13:41:11', '');
INSERT INTO `sys_menu` VALUES (2005, '计算机', 2004, 1, '/system/tbSubject', 'C', '0', 'system:tbSubject:view', 'fa fa-calculator', 'admin', '2019-03-28 13:40:09', 'admin', '2019-04-11 11:17:40', '');
INSERT INTO `sys_menu` VALUES (2007, '成绩', 2001, 1, '/system/examRecord', 'C', '0', 'system:examRecord:view', '#', 'admin', '2019-03-29 14:27:18', 'admin', '2019-04-13 16:34:55', '');
INSERT INTO `sys_menu` VALUES (2008, '题目列表', 2005, 1, '/system/tbSubject/list', 'F', '0', 'system:tbSubject:list', '#', 'admin', '2019-03-30 18:30:50', 'admin', '2019-04-11 13:47:35', '');
INSERT INTO `sys_menu` VALUES (2009, '计算机', 2003, 1, '/system/examList/list', 'F', '0', 'system:examList:list', '#', 'admin', '2019-03-30 18:32:23', 'admin', '2019-03-30 18:34:26', '');
INSERT INTO `sys_menu` VALUES (2010, '数学', 2004, 2, '/system/tbSubject/2', 'C', '0', 'system:tbSubject:view2', '#', 'admin', '2019-04-11 13:36:03', 'admin', '2019-04-11 14:05:01', '');
INSERT INTO `sys_menu` VALUES (2011, '题目列表', 2010, 1, '/system/tbSubject/list2', 'F', '0', 'system:tbSubject:list2', '#', 'admin', '2019-04-11 13:36:52', 'admin', '2019-04-11 13:47:43', '');
INSERT INTO `sys_menu` VALUES (2012, '列表', 2007, 1, '/system/examRecord/list', 'F', '0', 'system:examRecord:list', '#', 'admin', '2019-04-13 16:36:28', 'admin', '2019-04-13 16:37:51', '');
INSERT INTO `sys_menu` VALUES (2015, '考试信息(学生)', 0, 6, '#', 'M', '0', '', 'fa fa-bar-chart-o', 'admin', '2019-04-25 19:08:19', 'admin', '2019-04-25 19:10:35', '');
INSERT INTO `sys_menu` VALUES (2016, '考试列表', 2015, 1, '/system/examList/student', 'C', '0', 'system:examList:view:student', '#', 'admin', '2019-04-25 19:10:59', 'admin', '2019-04-25 19:20:15', '');
INSERT INTO `sys_menu` VALUES (2017, '计算机', 2016, 1, '/system/examList/list/student', 'F', '0', 'system:examList:list:student', '#', 'admin', '2019-04-25 19:13:50', 'admin', '2019-04-25 19:26:15', '');
INSERT INTO `sys_menu` VALUES (2019, '在线考试', 2015, 2, '/system/examList/getDetailPaper', 'C', '0', 'system:examList:view:student', 'fa fa-bank', 'admin', '2019-04-26 13:07:51', 'admin', '2019-04-26 13:10:51', '');
INSERT INTO `sys_menu` VALUES (2020, '考试中', 2019, 1, '/system/examList/getDetailPaper', 'F', '0', 'system:examList:view:student', '#', 'admin', '2019-04-26 13:09:19', 'admin', '2019-04-26 13:09:26', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2019/1/15 在线考试系统 进入研发状态了', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-27 10:29:57', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 315 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '在线用户', 7, 'com.ruoyi.project.monitor.online.controller.UserOnlineController.forceLogout()', 1, 'admin', '研发部门', '/monitor/online/forceLogout', '127.0.0.1', '内网IP', '{\"sessionId\":[\"5d928226-0e6b-4a0b-af9a-720224eccfc9\"]}', 0, NULL, '2019-03-27 10:20:56');
INSERT INTO `sys_oper_log` VALUES (101, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.update()', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"dept.deptName\":[\"研发部门\"],\"userName\":[\"张延磊\"],\"email\":[\"549545303@qq.com\"],\"phonenumber\":[\"17351098691\"],\"sex\":[\"0\"]}', 0, NULL, '2019-03-27 10:27:03');
INSERT INTO `sys_oper_log` VALUES (102, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-03-27 10:27:18');
INSERT INTO `sys_oper_log` VALUES (103, '重置密码', 2, 'com.ruoyi.project.system.user.controller.ProfileController.resetPwd()', 1, 'admin', '研发部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"oldPassword\":[\"admin123\"],\"newPassword\":[\"123456\"],\"confirm\":[\"123456\"]}', 0, NULL, '2019-03-27 10:27:32');
INSERT INTO `sys_oper_log` VALUES (104, '通知公告', 3, 'com.ruoyi.project.system.notice.controller.NoticeController.remove()', 1, 'admin', '研发部门', '/system/notice/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', 0, NULL, '2019-03-27 10:29:18');
INSERT INTO `sys_oper_log` VALUES (105, '通知公告', 2, 'com.ruoyi.project.system.notice.controller.NoticeController.editSave()', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2019/1/15 在线考试系统 进入研发状态了\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"新版本内容\"],\"status\":[\"0\"]}', 0, NULL, '2019-03-27 10:29:57');
INSERT INTO `sys_oper_log` VALUES (106, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"104\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', 0, NULL, '2019-03-27 10:44:54');
INSERT INTO `sys_oper_log` VALUES (107, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"104\"],\"userName\":[\"张延磊\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"17351098691\"],\"email\":[\"549545303@qq.com\"],\"loginName\":[\"admin\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', 0, NULL, '2019-03-27 10:45:03');
INSERT INTO `sys_oper_log` VALUES (108, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"104\"],\"userName\":[\"张延磊\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"17351098691\"],\"email\":[\"549545303@qq.com\"],\"loginName\":[\"admin\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', 0, NULL, '2019-03-27 10:45:05');
INSERT INTO `sys_oper_log` VALUES (109, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"2\"],\"deptId\":[\"104\"],\"userName\":[\"若依\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15666666666\"],\"email\":[\"ry@qq.com\"],\"loginName\":[\"ry\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"测试员\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', 0, NULL, '2019-03-27 10:45:10');
INSERT INTO `sys_oper_log` VALUES (110, '用户管理', 3, 'com.ruoyi.project.system.user.controller.UserController.remove()', 1, 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', 0, NULL, '2019-03-27 10:45:19');
INSERT INTO `sys_oper_log` VALUES (111, '岗位管理', 2, 'com.ruoyi.project.system.post.controller.PostController.editSave()', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"1\"],\"postName\":[\"架构师\"],\"postCode\":[\"frameworker\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-03-27 10:56:59');
INSERT INTO `sys_oper_log` VALUES (112, '岗位管理', 2, 'com.ruoyi.project.system.post.controller.PostController.editSave()', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"2\"],\"postName\":[\"项目经理\"],\"postCode\":[\"se\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-03-27 10:57:04');
INSERT INTO `sys_oper_log` VALUES (113, '岗位管理', 2, 'com.ruoyi.project.system.post.controller.PostController.editSave()', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"3\"],\"postName\":[\"教师\"],\"postCode\":[\"teacher\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-03-27 11:14:43');
INSERT INTO `sys_oper_log` VALUES (114, '岗位管理', 2, 'com.ruoyi.project.system.post.controller.PostController.editSave()', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"学生\"],\"postCode\":[\"student\"],\"postSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-03-27 11:14:54');
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 1, 'com.ruoyi.project.system.role.controller.RoleController.addSave()', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', 0, NULL, '2019-03-27 11:16:12');
INSERT INTO `sys_oper_log` VALUES (116, '角色管理', 1, 'com.ruoyi.project.system.role.controller.RoleController.addSave()', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"\"]}', 0, NULL, '2019-03-27 11:16:27');
INSERT INTO `sys_oper_log` VALUES (117, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"31\"],\"deptId\":[\"103\"],\"userName\":[\"张延磊\"],\"dept.deptName\":[\"学生部\"],\"phonenumber\":[\"17351098691\"],\"email\":[\"549545303@qq.com\"],\"loginName\":[\"student\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"student\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"4\"]}', 0, NULL, '2019-03-28 11:46:15');
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"21\"],\"deptId\":[\"102\"],\"userName\":[\"张延磊\"],\"dept.deptName\":[\"教学部\"],\"phonenumber\":[\"17351098691\"],\"email\":[\"549545303@qq.com\"],\"loginName\":[\"teacher\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"teacher\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"3\"]}', 0, NULL, '2019-03-28 11:46:24');
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 3, 'com.ruoyi.project.system.user.controller.UserController.remove()', 1, 'admin', '研发部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"21,31\"]}', 0, NULL, '2019-03-28 11:48:30');
INSERT INTO `sys_oper_log` VALUES (120, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"stu\"],\"deptName\":[\"学生部\"],\"phonenumber\":[\"13912604119\"],\"email\":[\"123@qq.com\"],\"loginName\":[\"stu\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"4\"]}', 0, NULL, '2019-03-28 11:49:28');
INSERT INTO `sys_oper_log` VALUES (121, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"userName\":[\"js\"],\"deptName\":[\"教学部\"],\"phonenumber\":[\"13064970930\"],\"email\":[\"11@qq.com\"],\"loginName\":[\"js\"],\"password\":[\"123456\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"3\"]}', 0, NULL, '2019-03-28 11:50:15');
INSERT INTO `sys_oper_log` VALUES (122, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 1, 'stu', '学生部', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-03-28 12:59:11');
INSERT INTO `sys_oper_log` VALUES (123, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 1, 'js', '教学部', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-03-28 12:59:42');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"1\"],\"menuType\":[\"M\"],\"menuName\":[\"考试信息\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-file-excel-o\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:32:26');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-03-28 13:33:31');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"考试信息\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:33:56');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"试题库\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:34:19');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"考试信息\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:34:34');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"试题库\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:34:44');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"考试信息\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:34:55');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"M\"],\"menuName\":[\"成绩\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:35:28');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"数学\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-trophy\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:36:17');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-03-28 13:39:15');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"试题库\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:39:38');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2004\"],\"menuType\":[\"M\"],\"menuName\":[\"数学\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:40:09');
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.ruleSave()', 1, 'admin', '研发部门', '/system/role/rule', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', 0, NULL, '2019-03-28 13:40:44');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2004\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"试题库\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:41:11');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"考试信息\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:41:20');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"数学\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:41:35');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"成绩\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-28 13:41:50');
INSERT INTO `sys_oper_log` VALUES (141, '部门管理', 2, 'com.ruoyi.project.system.dept.controller.DeptController.editSave()', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"春燕科技\"],\"deptName\":[\"教学部\"],\"orderNum\":[\"2\"],\"leader\":[\"张延磊\"],\"phone\":[\"17351098691\"],\"email\":[\"549545303@qq.com\"],\"status\":[\"0\"]}', 0, NULL, '2019-03-28 13:42:39');
INSERT INTO `sys_oper_log` VALUES (142, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"103\"],\"userName\":[\"stu\"],\"dept.deptName\":[\"学生部\"],\"phonenumber\":[\"13912604119\"],\"email\":[\"123@qq.com\"],\"loginName\":[\"stu\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"4\"]}', 0, NULL, '2019-03-28 13:42:51');
INSERT INTO `sys_oper_log` VALUES (143, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"101\"],\"deptId\":[\"102\"],\"userName\":[\"js\"],\"dept.deptName\":[\"教学部\"],\"phonenumber\":[\"13064970930\"],\"email\":[\"11@qq.com\"],\"loginName\":[\"js\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"3\"]}', 0, NULL, '2019-03-28 13:43:35');
INSERT INTO `sys_oper_log` VALUES (144, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,2004,2005,2001,2003\"]}', 0, NULL, '2019-03-28 13:43:58');
INSERT INTO `sys_oper_log` VALUES (145, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"学生\"],\"menuIds\":[\"2001,2003\"]}', 0, NULL, '2019-03-28 13:44:04');
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115\"]}', 0, NULL, '2019-03-28 13:44:13');
INSERT INTO `sys_oper_log` VALUES (147, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2004,2005,2001,2003\"]}', 0, NULL, '2019-03-28 13:44:24');
INSERT INTO `sys_oper_log` VALUES (148, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,2004,2005,2001,2003\"]}', 0, NULL, '2019-03-28 20:20:06');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_tb_subject', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-03-29 14:13:32');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"题目列表\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-29 14:25:38');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"考试列表\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-29 14:26:07');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"C\"],\"menuName\":[\"成绩\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-29 14:26:42');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2006', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-03-29 14:26:53');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"成绩\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-29 14:27:18');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-29 14:27:50');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-29 14:28:34');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject\"],\"perms\":[\"system:tbSubject:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-29 14:28:57');
INSERT INTO `sys_oper_log` VALUES (158, '试题库', 2, 'com.ruoyi.project.system.tbSubject.controller.TbSubjectController.editSave()', 1, 'admin', '研发部门', '/system/tbSubject/edit', '127.0.0.1', '内网IP', '{\"subjectID\":[\"1\"],\"subjectTitle\":[\"下列十进制数中最大的数是( )。\"],\"subjectOptionA\":[\"1\"],\"subjectOptionB\":[\"2\"],\"subjectOptionC\":[\"6\"],\"subjectOptionD\":[\"1\"],\"subjectAnswer\":[\"C\"],\"subjectParse\":[\"不会说不过去了\"]}', 0, NULL, '2019-03-29 14:30:25');
INSERT INTO `sys_oper_log` VALUES (159, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2004,2005,2001,2003\"]}', 0, NULL, '2019-03-29 14:50:50');
INSERT INTO `sys_oper_log` VALUES (160, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"103\"],\"userName\":[\"stu\"],\"dept.deptName\":[\"学生部\"],\"phonenumber\":[\"13912604119\"],\"email\":[\"123@qq.com\"],\"loginName\":[\"stu\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"4\"]}', 0, NULL, '2019-03-29 14:51:07');
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_exam_list', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-03-29 15:05:53');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"考试列表\"],\"url\":[\"/system/examList\"],\"perms\":[\"system:examList:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-29 15:15:23');
INSERT INTO `sys_oper_log` VALUES (163, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2004,2005,2001,2003\"]}', 0, NULL, '2019-03-30 16:04:51');
INSERT INTO `sys_oper_log` VALUES (164, '部门管理', 1, 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', 1, 'js', '教学部', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"103\"],\"deptName\":[\"班级01\"],\"orderNum\":[\"1\"],\"leader\":[\"张延磊\"],\"phone\":[\"17351098691\"],\"email\":[\"549545303@qq.com\"],\"status\":[\"0\"]}', 0, NULL, '2019-03-30 18:05:03');
INSERT INTO `sys_oper_log` VALUES (165, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 1, 'js', '教学部', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"200\"],\"userName\":[\"张三\"],\"deptName\":[\"班级01\"],\"phonenumber\":[\"17610356896\"],\"email\":[\"123456@qq.com\"],\"loginName\":[\"stu1\"],\"password\":[\"123456\"],\"sex\":[\"1\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"4\"]}', 0, NULL, '2019-03-30 18:06:08');
INSERT INTO `sys_oper_log` VALUES (166, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'js', '教学部', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"103\"],\"userName\":[\"stu\"],\"dept.deptName\":[\"学生部\"],\"phonenumber\":[\"13912604119\"],\"email\":[\"123@qq.com\"],\"loginName\":[\"stu\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"4\"]}', 0, NULL, '2019-03-30 18:06:19');
INSERT INTO `sys_oper_log` VALUES (167, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2004,2005,2001,2007,2003\"]}', 0, NULL, '2019-03-30 18:07:59');
INSERT INTO `sys_oper_log` VALUES (168, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"学生\"],\"menuIds\":[\"2001,2007,2003\"]}', 0, NULL, '2019-03-30 18:08:16');
INSERT INTO `sys_oper_log` VALUES (169, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2004,2005,2001,2003\"]}', 0, NULL, '2019-03-30 18:09:28');
INSERT INTO `sys_oper_log` VALUES (170, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.ruleSave()', 1, 'admin', '研发部门', '/system/role/rule', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', 0, NULL, '2019-03-30 18:09:36');
INSERT INTO `sys_oper_log` VALUES (171, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"101\"],\"deptId\":[\"102\"],\"userName\":[\"js\"],\"dept.deptName\":[\"教学部\"],\"phonenumber\":[\"13064970930\"],\"email\":[\"11@qq.com\"],\"loginName\":[\"js\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"3\"]}', 0, NULL, '2019-03-30 18:09:50');
INSERT INTO `sys_oper_log` VALUES (172, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"deptId\":[\"200\"],\"userName\":[\"stu\"],\"dept.deptName\":[\"班级01\"],\"phonenumber\":[\"13912604119\"],\"email\":[\"123@qq.com\"],\"loginName\":[\"stu\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"4\"]}', 0, NULL, '2019-03-30 18:12:10');
INSERT INTO `sys_oper_log` VALUES (173, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2004,2005,2001,2007,2003\"]}', 0, NULL, '2019-03-30 18:12:59');
INSERT INTO `sys_oper_log` VALUES (174, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2004,2005,2001,2003\"]}', 0, NULL, '2019-03-30 18:16:29');
INSERT INTO `sys_oper_log` VALUES (175, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2004,2005,2001,2003\"]}', 0, NULL, '2019-03-30 18:16:39');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"计算机\"],\"url\":[\"/system/tbSubject\"],\"perms\":[\"system:tbSubject:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-30 18:28:52');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-30 18:30:50');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"C\"],\"menuName\":[\"计算机\"],\"url\":[\"/system/examList/list\"],\"perms\":[\"system:examList:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-30 18:32:23');
INSERT INTO `sys_oper_log` VALUES (179, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2004,2005,2008,2001,2003,2009\"]}', 0, NULL, '2019-03-30 18:33:06');
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-30 18:34:14');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"计算机\"],\"url\":[\"/system/examList/list\"],\"perms\":[\"system:examList:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-03-30 18:34:26');
INSERT INTO `sys_oper_log` VALUES (182, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"学生\"],\"menuIds\":[\"2001,2003,2009\"]}', 0, NULL, '2019-03-30 21:52:44');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-04 11:19:52');
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_course,sys_tb_subject\"]}', 0, NULL, '2019-04-08 13:33:03');
INSERT INTO `sys_oper_log` VALUES (185, '定时任务', 2, 'com.ruoyi.project.monitor.job.controller.JobController.changeStatus()', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"1\"],\"status\":[\"0\"]}', 0, NULL, '2019-04-11 10:53:26');
INSERT INTO `sys_oper_log` VALUES (186, '定时任务', 2, 'com.ruoyi.project.monitor.job.controller.JobController.changeStatus()', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"2\"],\"status\":[\"0\"]}', 0, NULL, '2019-04-11 10:53:29');
INSERT INTO `sys_oper_log` VALUES (187, '定时任务', 2, 'com.ruoyi.project.monitor.job.controller.JobController.run()', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"1\"]}', 0, NULL, '2019-04-11 10:53:35');
INSERT INTO `sys_oper_log` VALUES (188, '定时任务', 2, 'com.ruoyi.project.monitor.job.controller.JobController.run()', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"2\"]}', 0, NULL, '2019-04-11 10:53:44');
INSERT INTO `sys_oper_log` VALUES (189, '定时任务', 2, 'com.ruoyi.project.monitor.job.controller.JobController.run()', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"1\"]}', 0, NULL, '2019-04-11 10:54:29');
INSERT INTO `sys_oper_log` VALUES (190, '定时任务', 2, 'com.ruoyi.project.monitor.job.controller.JobController.run()', 1, 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobId\":[\"2\"]}', 0, NULL, '2019-04-11 10:54:36');
INSERT INTO `sys_oper_log` VALUES (191, '定时任务', 2, 'com.ruoyi.project.monitor.job.controller.JobController.changeStatus()', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"2\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 10:58:36');
INSERT INTO `sys_oper_log` VALUES (192, '定时任务', 2, 'com.ruoyi.project.monitor.job.controller.JobController.changeStatus()', 1, 'admin', '研发部门', '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":[\"1\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 10:58:38');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"计算机\"],\"url\":[\"/system/tbSubject/1\"],\"perms\":[\"system:tbSubject:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 11:14:50');
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 11:15:28');
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"计算机\"],\"url\":[\"/system/tbSubject\"],\"perms\":[\"system:tbSubject:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 11:17:40');
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list/1\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:31:03');
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"数学\"],\"url\":[\"/system/tbSubject\"],\"perms\":[\"system:tbSubject:view\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:36:03');
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"数学\"],\"url\":[\"/system/tbSubject\"],\"perms\":[\"system:tbSubject:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:36:20');
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2010\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"\"],\"perms\":[\"/system/tbSubject\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:36:52');
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"#\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:37:57');
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list/1\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:39:21');
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list/2\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:39:52');
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list/2\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:40:00');
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list/1\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:41:29');
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list/1\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:41:49');
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list/2\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:42:00');
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:46:15');
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"C\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list2\"],\"perms\":[\"system:tbSubject:list2\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:46:34');
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list\"],\"perms\":[\"system:tbSubject:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:47:35');
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2010\"],\"menuType\":[\"F\"],\"menuName\":[\"题目列表\"],\"url\":[\"/system/tbSubject/list2\"],\"perms\":[\"system:tbSubject:list2\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 13:47:43');
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"2004\"],\"menuType\":[\"C\"],\"menuName\":[\"数学\"],\"url\":[\"/system/tbSubject/2\"],\"perms\":[\"system:tbSubject:view2\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-11 14:05:01');
INSERT INTO `sys_oper_log` VALUES (212, '试题库', 1, 'com.ruoyi.project.system.tbSubject.controller.TbSubjectController.addSave()', 1, 'admin', '研发部门', '/system/tbSubject/add', '127.0.0.1', '内网IP', '{\"subjectTitle\":[\"1+1=?\"],\"subjectOptionA\":[\"2\"],\"subjectOptionB\":[\"10\"],\"subjectOptionC\":[\"5\"],\"subjectOptionD\":[\"6\"],\"subjectAnswer\":[\"A\"],\"subjectParse\":[\"2，10在二进制下是正确的\"],\"courseId\":[\"2\"]}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`quartz`.`sys_tb_subject`, CONSTRAINT `courseId` FOREIGN KEY (`courseId`) REFERENCES `sys_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may involve com.ruoyi.project.system.tbSubject.mapper.TbSubjectMapper.insertTbSubject-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_tb_subject    ( subjectTitle,    subjectOptionA,    subjectOptionB,    subjectOptionC,    subjectOptionD,    subjectAnswer,    subjectParse,    courseId )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`quartz`.`sys_tb_subject`, CONSTRAINT `courseId` FOREIGN KEY (`courseId`) REFERENCES `sys_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot add or update a child row: a foreign key constraint fails (`quartz`.`sys_tb_subject`, CONSTRAINT `courseId` FOREIGN KEY (`courseId`) REFERENCES `sys_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`quartz`.`sys_tb_subject`, CONSTRAINT `courseId` FOREIGN KEY (`courseId`) REFERENCES `sys_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)', '2019-04-11 14:08:25');
INSERT INTO `sys_oper_log` VALUES (213, '试题库', 1, 'com.ruoyi.project.system.tbSubject.controller.TbSubjectController.addSave()', 1, 'admin', '研发部门', '/system/tbSubject/add', '127.0.0.1', '内网IP', '{\"subjectTitle\":[\"1+1=?\"],\"subjectOptionA\":[\"2\"],\"subjectOptionB\":[\"10\"],\"subjectOptionC\":[\"5\"],\"subjectOptionD\":[\"6\"],\"subjectAnswer\":[\"A\"],\"subjectParse\":[\"2，10在二进制下是正确的\"],\"courseId\":[\"2\"]}', 0, NULL, '2019-04-11 14:10:16');
INSERT INTO `sys_oper_log` VALUES (214, '考试列', 3, 'com.ruoyi.project.system.examList.controller.ExamListController.remove()', 1, 'admin', '研发部门', '/system/examList/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', 0, NULL, '2019-04-11 14:28:45');
INSERT INTO `sys_oper_log` VALUES (215, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"课程名称\"],\"dictType\":[\"sys_course_name\"],\"status\":[\"0\"],\"remark\":[\"用户 标识 课程id\"]}', 0, NULL, '2019-04-11 14:38:30');
INSERT INTO `sys_oper_log` VALUES (216, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"计算机\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_course_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-04-11 14:39:59');
INSERT INTO `sys_oper_log` VALUES (217, '字典数据', 1, 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"数学\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_course_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-04-11 14:40:21');
INSERT INTO `sys_oper_log` VALUES (218, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"sex\":[\"1\"],\"startTime\":[\"2019年5月12日 08:00:00\"],\"endTIme\":[\"2019年5月13日 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 14:42:49');
INSERT INTO `sys_oper_log` VALUES (219, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"数学\"],\"dictValue\":[\"数学\"],\"dictType\":[\"sys_course_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-04-11 14:44:24');
INSERT INTO `sys_oper_log` VALUES (220, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"计算机\"],\"dictValue\":[\"计算机\"],\"dictType\":[\"sys_course_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-04-11 14:44:33');
INSERT INTO `sys_oper_log` VALUES (221, '考试列', 3, 'com.ruoyi.project.system.examList.controller.ExamListController.remove()', 1, 'admin', '研发部门', '/system/examList/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', 0, NULL, '2019-04-11 14:44:48');
INSERT INTO `sys_oper_log` VALUES (222, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"sex\":[\"计算机\"],\"startTime\":[\"2019年5月12日 08:00:00\"],\"endTIme\":[\"2019年5月12日 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 14:44:57');
INSERT INTO `sys_oper_log` VALUES (223, '考试列', 2, 'com.ruoyi.project.system.examList.controller.ExamListController.editSave()', 1, 'admin', '研发部门', '/system/examList/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"js\"],\"startTime\":[\"11\"],\"endTIme\":[\"22\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 14:45:44');
INSERT INTO `sys_oper_log` VALUES (224, '考试列', 2, 'com.ruoyi.project.system.examList.controller.ExamListController.editSave()', 1, 'admin', '研发部门', '/system/examList/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"name\":[\"js\"],\"startTime\":[\"2019/05/06 08:00:00\"],\"endTIme\":[\"2019/05/06 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 14:46:05');
INSERT INTO `sys_oper_log` VALUES (225, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"sex\":[\"计算机\"],\"startTime\":[\"\"],\"endTIme\":[\"\"],\"status\":[\"\"]}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\r\n### The error may involve com.ruoyi.project.system.examList.mapper.ExamListMapper.insertExamList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_exam_list\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1', '2019-04-11 14:46:13');
INSERT INTO `sys_oper_log` VALUES (226, '考试列', 3, 'com.ruoyi.project.system.examList.controller.ExamListController.remove()', 1, 'admin', '研发部门', '/system/examList/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', 0, NULL, '2019-04-11 14:46:21');
INSERT INTO `sys_oper_log` VALUES (227, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"sex\":[\"计算机\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 14:46:48');
INSERT INTO `sys_oper_log` VALUES (228, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"数学\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_course_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-04-11 14:48:40');
INSERT INTO `sys_oper_log` VALUES (229, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"数学\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_course_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-04-11 14:48:47');
INSERT INTO `sys_oper_log` VALUES (230, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"计算机\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_course_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-04-11 14:49:10');
INSERT INTO `sys_oper_log` VALUES (231, '字典数据', 2, 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', 1, 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"101\"],\"dictLabel\":[\"数学\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_course_name\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', 0, NULL, '2019-04-11 14:49:16');
INSERT INTO `sys_oper_log` VALUES (232, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"sex\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"0\"]}', 0, NULL, '2019-04-11 14:53:56');
INSERT INTO `sys_oper_log` VALUES (233, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"0\"]}', 0, NULL, '2019-04-11 14:54:43');
INSERT INTO `sys_oper_log` VALUES (234, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 15:00:38');
INSERT INTO `sys_oper_log` VALUES (235, '考试列', 3, 'com.ruoyi.project.system.examList.controller.ExamListController.remove()', 1, 'admin', '研发部门', '/system/examList/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4,5,6,7\"]}', 0, NULL, '2019-04-11 15:05:31');
INSERT INTO `sys_oper_log` VALUES (236, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 1, '', '2019-04-11 15:05:41');
INSERT INTO `sys_oper_log` VALUES (237, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 1, '', '2019-04-11 15:07:13');
INSERT INTO `sys_oper_log` VALUES (238, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 1, '', '2019-04-11 15:08:55');
INSERT INTO `sys_oper_log` VALUES (239, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 1, '', '2019-04-11 15:13:35');
INSERT INTO `sys_oper_log` VALUES (240, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 1, '', '2019-04-11 15:15:24');
INSERT INTO `sys_oper_log` VALUES (241, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 15:16:32');
INSERT INTO `sys_oper_log` VALUES (242, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 15:17:16');
INSERT INTO `sys_oper_log` VALUES (243, '考试列', 3, 'com.ruoyi.project.system.examList.controller.ExamListController.remove()', 1, 'admin', '研发部门', '/system/examList/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8,9\"]}', 0, NULL, '2019-04-11 15:17:24');
INSERT INTO `sys_oper_log` VALUES (244, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"2\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 15:17:31');
INSERT INTO `sys_oper_log` VALUES (245, '考试列', 3, 'com.ruoyi.project.system.examList.controller.ExamListController.remove()', 1, 'admin', '研发部门', '/system/examList/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', 0, NULL, '2019-04-11 15:17:37');
INSERT INTO `sys_oper_log` VALUES (246, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 15:24:16');
INSERT INTO `sys_oper_log` VALUES (247, '考试列', 3, 'com.ruoyi.project.system.examList.controller.ExamListController.remove()', 1, 'admin', '研发部门', '/system/examList/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"11\"]}', 0, NULL, '2019-04-11 16:01:21');
INSERT INTO `sys_oper_log` VALUES (248, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 16:01:27');
INSERT INTO `sys_oper_log` VALUES (249, '考试列', 3, 'com.ruoyi.project.system.examList.controller.ExamListController.remove()', 1, 'admin', '研发部门', '/system/examList/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"12\"]}', 0, NULL, '2019-04-11 16:04:08');
INSERT INTO `sys_oper_log` VALUES (250, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'questions\' at row 1\r\n### The error may involve com.ruoyi.project.system.examList.mapper.ExamListMapper.insertExamList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_exam_list    ( name,    startTime,    endTIme,    status,             courseId,             questions )           values ( ?,    ?,    ?,    ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'questions\' at row 1\n; Data truncation: Data too long for column \'questions\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'questions\' at row 1', '2019-04-11 16:04:14');
INSERT INTO `sys_oper_log` VALUES (251, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'questions\' at row 1\r\n### The error may involve com.ruoyi.project.system.examList.mapper.ExamListMapper.insertExamList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_exam_list    ( name,    startTime,    endTIme,    status,             courseId,             questions )           values ( ?,    ?,    ?,    ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'questions\' at row 1\n; Data truncation: Data too long for column \'questions\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'questions\' at row 1', '2019-04-11 16:06:42');
INSERT INTO `sys_oper_log` VALUES (252, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/5/12 08:00:00\"],\"endTIme\":[\"2019/5/12 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-11 16:07:01');
INSERT INTO `sys_oper_log` VALUES (253, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_exam_record', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-04-13 16:27:24');
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"成绩\"],\"url\":[\"/system/examRecord\"],\"perms\":[\"system:examRecord:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-13 16:34:39');
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"成绩\"],\"url\":[\"/system/examRecord\"],\"perms\":[\"system:examRecord:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-13 16:34:55');
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"列表\"],\"url\":[\"\"],\"perms\":[\"system:examRecord:list\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-13 16:36:28');
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2007\"],\"menuType\":[\"C\"],\"menuName\":[\"列表\"],\"url\":[\"/system/examRecord/list\"],\"perms\":[\"system:examRecord:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-13 16:37:37');
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"列表\"],\"url\":[\"/system/examRecord/list\"],\"perms\":[\"system:examRecord:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-13 16:37:51');
INSERT INTO `sys_oper_log` VALUES (259, '考试记录', 1, 'com.ruoyi.project.system.examRecord.controller.ExamRecordController.addSave()', 1, 'admin', '研发部门', '/system/examRecord/add', '127.0.0.1', '内网IP', '{\"userId\":[\"111222\"],\"examId\":[\"123\"],\"score\":[\"60\"],\"record\":[\"AAAAAA\"]}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.examRecord.mapper.ExamRecordMapper.insertExamRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_exam_record    ( user_id,    exam_id,    score,    record )           values ( ?,    ?,    ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2019-04-13 16:40:03');
INSERT INTO `sys_oper_log` VALUES (260, '考试记录', 1, 'com.ruoyi.project.system.examRecord.controller.ExamRecordController.addSave()', 1, 'admin', '研发部门', '/system/examRecord/add', '127.0.0.1', '内网IP', '{\"userId\":[\"111\"],\"examId\":[\"1111\"],\"score\":[\"1000\"],\"record\":[\"aaaaa\"]}', 0, NULL, '2019-04-13 16:40:49');
INSERT INTO `sys_oper_log` VALUES (261, '考试记录', 1, 'com.ruoyi.project.system.examRecord.controller.ExamRecordController.addSave()', 1, 'admin', '研发部门', '/system/examRecord/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"examId\":[\"13\"],\"score\":[\"100\"],\"record\":[\"aaaaa\"]}', 0, NULL, '2019-04-13 20:29:57');
INSERT INTO `sys_oper_log` VALUES (262, '考试记录', 1, 'com.ruoyi.project.system.examRecord.controller.ExamRecordController.addSave()', 1, 'admin', '研发部门', '/system/examRecord/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"examId\":[\"13\"],\"score\":[\"\"],\"record\":[\"\"]}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'record\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.system.examRecord.mapper.ExamRecordMapper.insertExamRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_exam_record    ( user_id,    exam_id )           values ( ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'record\' doesn\'t have a default value\n; Field \'record\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'record\' doesn\'t have a default value', '2019-04-13 20:34:02');
INSERT INTO `sys_oper_log` VALUES (263, '考试记录', 1, 'com.ruoyi.project.system.examRecord.controller.ExamRecordController.addSave()', 1, 'admin', '研发部门', '/system/examRecord/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"examId\":[\"13\"],\"score\":[\"\"],\"record\":[\"\"]}', 0, NULL, '2019-04-13 20:34:53');
INSERT INTO `sys_oper_log` VALUES (264, '考试记录', 1, 'com.ruoyi.project.system.examRecord.controller.ExamRecordController.addSave()', 1, 'admin', '研发部门', '/system/examRecord/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"examId\":[\"13\"],\"score\":[\"\"],\"record\":[\"\"]}', 0, NULL, '2019-04-13 20:45:36');
INSERT INTO `sys_oper_log` VALUES (265, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"学生\"],\"menuIds\":[\"2001,2007,2012,2003,2009\"]}', 0, NULL, '2019-04-13 22:18:57');
INSERT INTO `sys_oper_log` VALUES (266, '考试记录', 1, 'com.ruoyi.project.system.examRecord.controller.ExamRecordController.addSave()', 1, 'admin', '研发部门', '/system/examRecord/add', '127.0.0.1', '内网IP', '{\"userId\":[\"100\"],\"examId\":[\"13\"],\"score\":[\"100\"],\"record\":[\"aaaaa\"]}', 0, NULL, '2019-04-13 22:20:23');
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2009\"],\"menuType\":[\"F\"],\"menuName\":[\"计算机(学生使用)\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:02:37');
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2013', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-04-25 19:03:10');
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2003\"],\"menuType\":[\"F\"],\"menuName\":[\"计算机(学生使用)\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:03:36');
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2014', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-04-25 19:07:13');
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"考试信息(学生)\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bar-chart-o\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:08:19');
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"考试信息(学生)\"],\"url\":[\"/system/examList\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bar-chart-o\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:09:23');
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"考试信息(学生)\"],\"url\":[\"/system/examList\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bar-chart-o\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:10:02');
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"考试信息(学生)\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bar-chart-o\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:10:14');
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"考试信息(学生)\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bar-chart-o\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:10:22');
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"考试信息(学生)\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-bar-chart-o\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:10:35');
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2015\"],\"menuType\":[\"F\"],\"menuName\":[\"计算机\"],\"url\":[\"\"],\"perms\":[\"/system/examList\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:10:59');
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2015\"],\"menuType\":[\"C\"],\"menuName\":[\"计算机\"],\"url\":[\"#\"],\"perms\":[\"/system/examList\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:11:17');
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2015\"],\"menuType\":[\"C\"],\"menuName\":[\"计算机\"],\"url\":[\"/system/examList\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:12:02');
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2015\"],\"menuType\":[\"C\"],\"menuName\":[\"考试列表\"],\"url\":[\"/system/examList\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:12:29');
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2016\"],\"menuType\":[\"C\"],\"menuName\":[\"计算机\"],\"url\":[\"/system/examList/list\"],\"perms\":[\"system:examList:list:student\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:13:50');
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2017\"],\"parentId\":[\"2016\"],\"menuType\":[\"F\"],\"menuName\":[\"计算机\"],\"url\":[\"/system/examList/list\"],\"perms\":[\"system:examList:list:student\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:14:10');
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2017\"],\"parentId\":[\"2016\"],\"menuType\":[\"C\"],\"menuName\":[\"计算机\"],\"url\":[\"/system/examList/list/student\"],\"perms\":[\"system:examList:list:student\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:14:37');
INSERT INTO `sys_oper_log` VALUES (284, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2004,2005,2008,2001,2003,2009\"]}', 0, NULL, '2019-04-25 19:16:31');
INSERT INTO `sys_oper_log` VALUES (285, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"学生\"],\"menuIds\":[\"2015,2016,2017\"]}', 0, NULL, '2019-04-25 19:16:40');
INSERT INTO `sys_oper_log` VALUES (286, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2016\"],\"parentId\":[\"2015\"],\"menuType\":[\"C\"],\"menuName\":[\"考试列表\"],\"url\":[\"/system/examList/student\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:20:15');
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2017\"],\"parentId\":[\"2016\"],\"menuType\":[\"F\"],\"menuName\":[\"计算机\"],\"url\":[\"/system/examList/list/student\"],\"perms\":[\"system:examList:list:student\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 19:26:15');
INSERT INTO `sys_oper_log` VALUES (288, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"paperId\":[\"13\"],\"postIds\":[\"13\"]}', 1, 'null', '2019-04-25 20:54:37');
INSERT INTO `sys_oper_log` VALUES (289, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2016\"],\"menuType\":[\"F\"],\"menuName\":[\"考试(学生)\"],\"url\":[\"\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 20:59:07');
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"2016\"],\"menuType\":[\"C\"],\"menuName\":[\"考试(学生)\"],\"url\":[\"/system/examList/getDetailPaper\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-25 20:59:55');
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"2016\"],\"menuType\":[\"F\"],\"menuName\":[\"考试(学生)\"],\"url\":[\"/system/examList/getDetailPaper\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', 0, NULL, '2019-04-25 21:00:11');
INSERT INTO `sys_oper_log` VALUES (292, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"学生\"],\"menuIds\":[\"2015,2016,2017,2018\"]}', 0, NULL, '2019-04-25 21:00:24');
INSERT INTO `sys_oper_log` VALUES (293, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2004,2005,2001,2003,2015,2016,2017,2018\"]}', 0, NULL, '2019-04-25 21:02:34');
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"2016\"],\"menuType\":[\"F\"],\"menuName\":[\"考试(学生)\"],\"url\":[\"/system/examList/getDetailPaper\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-26 13:04:39');
INSERT INTO `sys_oper_log` VALUES (295, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2018', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-04-26 13:05:43');
INSERT INTO `sys_oper_log` VALUES (296, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"2016\"],\"menuType\":[\"C\"],\"menuName\":[\"考试(学生)\"],\"url\":[\"/system/examList/getDetailPaper\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-26 13:05:56');
INSERT INTO `sys_oper_log` VALUES (297, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2018', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-04-26 13:06:05');
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2018\"],\"parentId\":[\"2016\"],\"menuType\":[\"M\"],\"menuName\":[\"考试(学生)\"],\"url\":[\"/system/examList/getDetailPaper\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-26 13:06:19');
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2018', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-04-26 13:06:27');
INSERT INTO `sys_oper_log` VALUES (300, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"学生\"],\"menuIds\":[\"2015,2016,2017\"]}', 0, NULL, '2019-04-26 13:06:43');
INSERT INTO `sys_oper_log` VALUES (301, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2004,2005,2001,2003,2015,2016,2017\"]}', 0, NULL, '2019-04-26 13:06:49');
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '研发部门', '/system/menu/remove/2018', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-04-26 13:07:00');
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2015\"],\"menuType\":[\"M\"],\"menuName\":[\"在线考试\"],\"url\":[\"/system/examList\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-26 13:07:51');
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"考试中\"],\"url\":[\"/system/examList/getDetailPaper\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-26 13:09:19');
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2020\"],\"parentId\":[\"2019\"],\"menuType\":[\"F\"],\"menuName\":[\"考试中\"],\"url\":[\"/system/examList/getDetailPaper\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-26 13:09:26');
INSERT INTO `sys_oper_log` VALUES (306, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057,115,2004,2005,2001,2003,2015,2016,2017,2019,2020\"]}', 0, NULL, '2019-04-26 13:09:47');
INSERT INTO `sys_oper_log` VALUES (307, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"101\"],\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"学生\"],\"menuIds\":[\"2015,2016,2017,2019,2020\"]}', 0, NULL, '2019-04-26 13:09:53');
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2015\"],\"menuType\":[\"C\"],\"menuName\":[\"在线考试\"],\"url\":[\"/system/examList/getDetailPaper\"],\"perms\":[\"system:examList:view:student\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', 0, NULL, '2019-04-26 13:10:52');
INSERT INTO `sys_oper_log` VALUES (309, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.update()', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"dept.deptName\":[\"研发部门\"],\"userName\":[\"张延磊\"],\"email\":[\"549545303@qq.com\"],\"phonenumber\":[\"17351098691\"],\"sex\":[\"1\"]}', 0, NULL, '2019-04-26 17:04:41');
INSERT INTO `sys_oper_log` VALUES (310, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/4/27 08:00:00\"],\"endTIme\":[\"2020/4/27 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-27 15:36:07');
INSERT INTO `sys_oper_log` VALUES (311, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/4/12 08:00:00\"],\"endTIme\":[\"2020/05/06 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-27 15:39:17');
INSERT INTO `sys_oper_log` VALUES (312, '考试列', 3, 'com.ruoyi.project.system.examList.controller.ExamListController.remove()', 1, 'admin', '研发部门', '/system/examList/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"13,14\"]}', 0, NULL, '2019-04-27 15:39:32');
INSERT INTO `sys_oper_log` VALUES (313, '考试列', 1, 'com.ruoyi.project.system.examList.controller.ExamListController.addSave()', 1, 'admin', '研发部门', '/system/examList/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"startTime\":[\"2019/4/27 08:00:00\"],\"endTIme\":[\"2019/05/06 08:00:00\"],\"status\":[\"1\"]}', 0, NULL, '2019-04-27 15:47:23');
INSERT INTO `sys_oper_log` VALUES (314, '考试列', 3, 'com.ruoyi.project.system.examList.controller.ExamListController.remove()', 1, 'admin', '研发部门', '/system/examList/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"15\"]}', 0, NULL, '2019-04-27 15:47:51');
INSERT INTO `sys_oper_log` VALUES (315, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"100\"],\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"老师\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,2004,2005,2008,2010,2011,2001,2003,2009\"]}', 0, NULL, '2019-04-28 16:08:58');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'frameworker', '架构师', 1, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-27 10:56:59', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-27 10:57:04', '');
INSERT INTO `sys_post` VALUES (3, 'teacher', '教师', 3, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-27 11:14:43', '');
INSERT INTO `sys_post` VALUES (4, 'student', '学生', 4, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-27 11:14:54', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-26 13:09:47', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-28 13:44:13', '普通角色');
INSERT INTO `sys_role` VALUES (100, '教师', 'teacher', 3, '1', '0', '0', 'admin', '2019-03-27 11:16:12', 'admin', '2019-04-28 16:08:58', '老师');
INSERT INTO `sys_role` VALUES (101, '学生', 'student', 4, '1', '0', '0', 'admin', '2019-03-27 11:16:27', 'admin', '2019-04-26 13:09:53', '学生');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104);
INSERT INTO `sys_role_menu` VALUES (1, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 107);
INSERT INTO `sys_role_menu` VALUES (1, 108);
INSERT INTO `sys_role_menu` VALUES (1, 109);
INSERT INTO `sys_role_menu` VALUES (1, 110);
INSERT INTO `sys_role_menu` VALUES (1, 111);
INSERT INTO `sys_role_menu` VALUES (1, 112);
INSERT INTO `sys_role_menu` VALUES (1, 113);
INSERT INTO `sys_role_menu` VALUES (1, 114);
INSERT INTO `sys_role_menu` VALUES (1, 115);
INSERT INTO `sys_role_menu` VALUES (1, 500);
INSERT INTO `sys_role_menu` VALUES (1, 501);
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1001);
INSERT INTO `sys_role_menu` VALUES (1, 1002);
INSERT INTO `sys_role_menu` VALUES (1, 1003);
INSERT INTO `sys_role_menu` VALUES (1, 1004);
INSERT INTO `sys_role_menu` VALUES (1, 1005);
INSERT INTO `sys_role_menu` VALUES (1, 1006);
INSERT INTO `sys_role_menu` VALUES (1, 1007);
INSERT INTO `sys_role_menu` VALUES (1, 1008);
INSERT INTO `sys_role_menu` VALUES (1, 1009);
INSERT INTO `sys_role_menu` VALUES (1, 1010);
INSERT INTO `sys_role_menu` VALUES (1, 1011);
INSERT INTO `sys_role_menu` VALUES (1, 1012);
INSERT INTO `sys_role_menu` VALUES (1, 1013);
INSERT INTO `sys_role_menu` VALUES (1, 1014);
INSERT INTO `sys_role_menu` VALUES (1, 1015);
INSERT INTO `sys_role_menu` VALUES (1, 1016);
INSERT INTO `sys_role_menu` VALUES (1, 1017);
INSERT INTO `sys_role_menu` VALUES (1, 1018);
INSERT INTO `sys_role_menu` VALUES (1, 1019);
INSERT INTO `sys_role_menu` VALUES (1, 1020);
INSERT INTO `sys_role_menu` VALUES (1, 1021);
INSERT INTO `sys_role_menu` VALUES (1, 1022);
INSERT INTO `sys_role_menu` VALUES (1, 1023);
INSERT INTO `sys_role_menu` VALUES (1, 1024);
INSERT INTO `sys_role_menu` VALUES (1, 1025);
INSERT INTO `sys_role_menu` VALUES (1, 1026);
INSERT INTO `sys_role_menu` VALUES (1, 1027);
INSERT INTO `sys_role_menu` VALUES (1, 1028);
INSERT INTO `sys_role_menu` VALUES (1, 1029);
INSERT INTO `sys_role_menu` VALUES (1, 1030);
INSERT INTO `sys_role_menu` VALUES (1, 1031);
INSERT INTO `sys_role_menu` VALUES (1, 1032);
INSERT INTO `sys_role_menu` VALUES (1, 1033);
INSERT INTO `sys_role_menu` VALUES (1, 1034);
INSERT INTO `sys_role_menu` VALUES (1, 1035);
INSERT INTO `sys_role_menu` VALUES (1, 1036);
INSERT INTO `sys_role_menu` VALUES (1, 1037);
INSERT INTO `sys_role_menu` VALUES (1, 1038);
INSERT INTO `sys_role_menu` VALUES (1, 1039);
INSERT INTO `sys_role_menu` VALUES (1, 1040);
INSERT INTO `sys_role_menu` VALUES (1, 1041);
INSERT INTO `sys_role_menu` VALUES (1, 1042);
INSERT INTO `sys_role_menu` VALUES (1, 1043);
INSERT INTO `sys_role_menu` VALUES (1, 1044);
INSERT INTO `sys_role_menu` VALUES (1, 1045);
INSERT INTO `sys_role_menu` VALUES (1, 1046);
INSERT INTO `sys_role_menu` VALUES (1, 1047);
INSERT INTO `sys_role_menu` VALUES (1, 1048);
INSERT INTO `sys_role_menu` VALUES (1, 1049);
INSERT INTO `sys_role_menu` VALUES (1, 1050);
INSERT INTO `sys_role_menu` VALUES (1, 1051);
INSERT INTO `sys_role_menu` VALUES (1, 1052);
INSERT INTO `sys_role_menu` VALUES (1, 1053);
INSERT INTO `sys_role_menu` VALUES (1, 1054);
INSERT INTO `sys_role_menu` VALUES (1, 1055);
INSERT INTO `sys_role_menu` VALUES (1, 1056);
INSERT INTO `sys_role_menu` VALUES (1, 1057);
INSERT INTO `sys_role_menu` VALUES (1, 2001);
INSERT INTO `sys_role_menu` VALUES (1, 2003);
INSERT INTO `sys_role_menu` VALUES (1, 2004);
INSERT INTO `sys_role_menu` VALUES (1, 2005);
INSERT INTO `sys_role_menu` VALUES (1, 2015);
INSERT INTO `sys_role_menu` VALUES (1, 2016);
INSERT INTO `sys_role_menu` VALUES (1, 2017);
INSERT INTO `sys_role_menu` VALUES (1, 2019);
INSERT INTO `sys_role_menu` VALUES (1, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (101, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2016);
INSERT INTO `sys_role_menu` VALUES (101, 2017);
INSERT INTO `sys_role_menu` VALUES (101, 2019);
INSERT INTO `sys_role_menu` VALUES (101, 2020);

-- ----------------------------
-- Table structure for sys_tb_subject
-- ----------------------------
DROP TABLE IF EXISTS `sys_tb_subject`;
CREATE TABLE `sys_tb_subject`  (
  `subjectID` int(11) NOT NULL AUTO_INCREMENT COMMENT '题号',
  `subjectTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试题标题',
  `subjectOptionA` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项A',
  `subjectOptionB` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项B',
  `subjectOptionC` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项C',
  `subjectOptionD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项D',
  `subjectAnswer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案',
  `subjectParse` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解析',
  `courseId` int(11) NULL DEFAULT NULL COMMENT '课程ID',
  PRIMARY KEY (`subjectID`) USING BTREE,
  INDEX `courseId`(`courseId`) USING BTREE,
  CONSTRAINT `courseId` FOREIGN KEY (`courseId`) REFERENCES `sys_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试题库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_tb_subject
-- ----------------------------
INSERT INTO `sys_tb_subject` VALUES (1, '下列十进制数中最大的数是( )。', '1', '2', '6', '1', 'C', '不会说不过去了', 1);
INSERT INTO `sys_tb_subject` VALUES (2, '下列各进制数中最大的数是( )。', '227O', '1FFH', '1010001B', '789D', 'D', NULL, 1);
INSERT INTO `sys_tb_subject` VALUES (3, '( )不是微型计算机必须的工作环境。', '恒温', '良好的接地线路', '远离强磁场', '稳定的电源电压', 'A', NULL, 1);
INSERT INTO `sys_tb_subject` VALUES (4, '( )不是文件。', '设备', '文档', '应用程序', '窗口', 'D', '窗口不是文件', 1);
INSERT INTO `sys_tb_subject` VALUES (5, '( )不属于Word2003的文档打开方式。', '读写方式', '只读方式', '备份方式', '系统方式', 'D', '系统方式不是Word2003的文档打开方式。', 1);
INSERT INTO `sys_tb_subject` VALUES (6, '( )菜单中含有设置字体的命令。', '格式', '编辑', '视图', '工具', 'A', NULL, 1);
INSERT INTO `sys_tb_subject` VALUES (8, '( )的功能是将计算机外部的信息送入计算机。', '输入设备', '输出设备', '软盘', '电源线', 'A', '', 1);
INSERT INTO `sys_tb_subject` VALUES (9, '( )的主要功能是使用户的计算机与远程主机相连，从而成为远程主机的终端。', 'E-mail', 'FTP', 'Telnet', 'BBS', 'C', '', 1);
INSERT INTO `sys_tb_subject` VALUES (10, '( )视图方式可对文档不进行分页处理。', '普通', '联机版式', '页面视图', '大纲', 'B', '', 1);
INSERT INTO `sys_tb_subject` VALUES (12, '( )是微型计算机的外存。 ', 'RAM', 'ROM', '磁盘', '虚拟盘', 'C', '', 1);
INSERT INTO `sys_tb_subject` VALUES (13, '( )是用来存储程序及数据的装置。', '输入设备', '存储器', '控制器', '输出设备', 'B', '', 1);
INSERT INTO `sys_tb_subject` VALUES (14, 'NOVELLNETWARE是( )', '网络操作系统', '通用操作系统', '实时操作系统', '分时操作系统', 'A', '', 1);
INSERT INTO `sys_tb_subject` VALUES (15, '预防计算机病毒的手段，错误的是( )。', '要经常地对硬盘上的文件进行备份', '凡不需要再写入数据的磁盘都应有写保护', '将所有的.COM和.EXE文件赋以“只读”属性', '对磁盘进行清洗', 'D', '', 1);
INSERT INTO `sys_tb_subject` VALUES (16, '“32位微型计算机”中的32指的是( )', '微机型号', '内存容量', '存储单位', '机器字长', 'D', '', 1);
INSERT INTO `sys_tb_subject` VALUES (17, '“奔腾”微型计算机采用的微处理器的型号是( )', '80286', '80386', '80486', '80586', 'D', '', 1);
INSERT INTO `sys_tb_subject` VALUES (18, '“画图”程序是WINDOWS98的一个附件程序，能进行简单的图形处理，产生的文件为位图文件，扩展名为( )。', 'BMP', 'CRH', 'EXE', 'GPH', 'A', '', 1);
INSERT INTO `sys_tb_subject` VALUES (19, '“开始”菜单中，注销命令将( )。', '关闭系统', '关闭当前窗口上的程序', '关闭所有打开的程序', '以上都不对', 'C', '', 1);
INSERT INTO `sys_tb_subject` VALUES (20, '“文件”下拉菜单底部所显示的文件名是( )。', '扩展名为DOC的全部文件', '正要打印的文件名', '正在使用的文件名', '最近被Word处理过的文档', 'D', '', 1);
INSERT INTO `sys_tb_subject` VALUES (21, '“溢出”一般是指计算机在运算过程中产生的( )。', '数据量超过了内存量', '文件个数超过了磁盘目录区规定的范围', '数超过了机器的位所表示的范围', '数超过了变量的表示范围', 'C', '', 1);
INSERT INTO `sys_tb_subject` VALUES (22, '《计算机软件条例》中所称的计算机软件(简称软件)是指( )。', '计算机程序', '源程序和目标程序', '源程序', '计算机程序及其有关文档', 'D', '', 1);
INSERT INTO `sys_tb_subject` VALUES (23, '10BaseF的含义是( )。', '10Mbps的宽带光纤网络', '10Mbps的基带同轴电缆网络', '10Mbps的基带光纤网络', '10Mbps的宽带同轴电缆网络', 'C', '', 1);
INSERT INTO `sys_tb_subject` VALUES (24, '在微机中，主机由微处理器与( )组成。', '运算器', '磁盘存储器', '软盘存储器', '内存储器', 'D', '', 1);
INSERT INTO `sys_tb_subject` VALUES (25, '1MB的存储容量相当于( )。', '一百万个字节', '2的10次方个字节', '2的20次方个字节', '1000KB', 'C', '', 1);
INSERT INTO `sys_tb_subject` VALUES (26, '1nternet的分层结构是由( )这个四层组成。', ' 应用层、传输层、通信子网层和物理层', '应用层、表示层、传输层和网络层', '物理层、数据链路层、网络层和传输层', '网络接口层、网络层、传输层和应用层', 'D', '', 1);
INSERT INTO `sys_tb_subject` VALUES (27, 'WindowsXP中改变窗口的大小时，应操作( )。', '窗口的四角或四边', '窗口右上角的按钮', '窗口的标题栏', '窗口左上角的控制栏', 'A', '', 1);
INSERT INTO `sys_tb_subject` VALUES (28, '在WindowsXP操作系统中，对话框的大小是( )。', '可变的', '可任意设置的', '固定的', '与不同的操作有关的', 'D', '', 1);
INSERT INTO `sys_tb_subject` VALUES (31, '1+1=?', '2', '10', '5', '6', 'A', '2，10在二进制下是正确的', 2);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 104, 'admin', '张延磊', '00', '549545303@qq.com', '17351098691', '1', '2019/03/27/c9a3ae5c4790cf3a46fd6f721f46f36b.jpg', 'a3ea1480d14f688070ea58322a6f9863', '1b123d', '0', '0', '127.0.0.1', '2019-04-28 16:08:38', 'admin', '2018-03-16 11:33:00', 'admin', '2019-04-28 16:08:38', '管理员');
INSERT INTO `sys_user` VALUES (21, 102, 'teacher', '张延磊', '11', '549545303@qq.com', '17351098691', '0', '', 'a3ea1480d14f688070ea58322a6f9863', '1b123d', '0', '2', '127.0.0.1', '2019-03-27 10:20:39', 'admin', '2018-03-27 10:51:00', 'admin', '2019-03-28 11:46:24', 'teacher');
INSERT INTO `sys_user` VALUES (31, 103, 'student', '张延磊', '11', '549545303@qq.com', '17351098691', '0', '', 'a3ea1480d14f688070ea58322a6f9863', '1b123d', '0', '2', '127.0.0.1', '2019-03-27 10:20:39', 'admin', '2018-03-27 10:51:00', 'admin', '2019-03-28 11:46:15', 'student');
INSERT INTO `sys_user` VALUES (100, 200, 'stu', 'stu', '11', '123@qq.com', '13912604119', '0', '2019/03/28/40a6a76d9ac96e19cd7711f744c32358.jpg', '0917f16395fc4d1ce12817e1d3ede86b', '299ea1', '0', '0', '127.0.0.1', '2019-04-28 16:17:00', 'admin', '2019-03-28 11:49:28', 'admin', '2019-04-28 16:16:59', '');
INSERT INTO `sys_user` VALUES (101, 102, 'js', 'js', '11', '11@qq.com', '13064970930', '0', '2019/03/28/57400e08a225d182fa6c899fdc8a7402.jpg', '73691c00302da167aed3df8d2144d8b4', 'facf69', '0', '0', '127.0.0.1', '2019-04-28 16:01:27', 'admin', '2019-03-28 11:50:15', 'admin', '2019-04-28 16:01:27', '');
INSERT INTO `sys_user` VALUES (102, 200, 'stu1', '张三', '00', '123456@qq.com', '17610356896', '1', '', 'ff00723abc5582df6eda72a537c44e7f', '649763', '0', '0', '', NULL, 'js', '2019-03-30 18:06:08', '', NULL, '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (21, 3);
INSERT INTO `sys_user_post` VALUES (31, 4);
INSERT INTO `sys_user_post` VALUES (100, 4);
INSERT INTO `sys_user_post` VALUES (101, 3);
INSERT INTO `sys_user_post` VALUES (102, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (21, 100);
INSERT INTO `sys_user_role` VALUES (31, 101);
INSERT INTO `sys_user_role` VALUES (100, 101);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 101);

SET FOREIGN_KEY_CHECKS = 1;
