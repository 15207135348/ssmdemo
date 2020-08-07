CREATE DATABASE IF NOT EXISTS `ssmdemo` DEFAULT CHARACTER SET utf8;

USE `ssmdemo`;


-- 员工表
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`
(
  `id`              int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username`        varchar(20) DEFAULT NULL COMMENT '工号',
  `password`        varchar(30) DEFAULT NULL COMMENT '密码',

  `name`            varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `born_at`         date DEFAULT NULL COMMENT '出生日期',
  `gender`          tinyint DEFAULT NULL COMMENT '性别，1男，0女',
  `phone`           varchar(11) DEFAULT NULL COMMENT '电话号码',
  `email`           varchar(30) DEFAULT NULL COMMENT '邮箱',
  `position`        varchar(30) DEFAULT NULL COMMENT '职位',

  `department_id`   int(20)  DEFAULT NULL COMMENT '部门ID',
  `role_id`         int(20)     DEFAULT NULL COMMENT '角色ID',

  `create_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  KEY `role_id` (`role_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;

-- 部门表
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `id`              int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name`      varchar(10) NOT NULL COMMENT '部门名',
  `desc`      varchar(100) NOT NULL COMMENT '部门描述',
  `manager`   int(20) NOT NULL COMMENT '部门主管的员工ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='部门表';


-- 角色表
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id`   int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(10) NOT NULL COMMENT '角色名称',
  `desc` varchar(100) NOT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 初始化角色
INSERT INTO `t_role` (`id`, `name`, `desc`)
VALUES
  (1001, '系统管理员', '最高权限'),
  (1002, '管理员', '管理员权限'),
  (1003, '普通员工', '普通权限');


-- 角色权限关联表
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id`            int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_id`       int(20) NOT NULL COMMENT '角色ID',
  `permission_id` int(20) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `permission_id` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';

-- 权限表
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id`            int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name`      varchar(10) NOT NULL COMMENT '权限名称',
  `url`       int(20) NOT NULL COMMENT '页面URL/行为URL/数据URL',
  `desc`      varchar(100) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='权限表';


-- 角色权限关联表
DROP TABLE IF EXISTS `t_attendance_record`;
CREATE TABLE `t_attendance_record` (
  `id`              int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `punch_type`      smallint(4) NOT NULL COMMENT '打卡类型, 1上班打卡，2下班打卡',
  `punch_time`      timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `employee_id`      int(20) NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='角色权限关联表';


-- 用户人脸信息表
DROP TABLE IF EXISTS `t_face_info`;
CREATE TABLE `t_face_info`
(
  `id`              int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `face_id`         varchar(50) DEFAULT NULL COMMENT '人脸唯一Id',
  `face_feature`    varchar(4096) DEFAULT NULL COMMENT '人脸信息编码',
  `base64_image`    LONGTEXT DEFAULT NULL COMMENT '标准照片的base64编码',
  `username`        varchar(20) DEFAULT NULL COMMENT '工号',

  `create_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `face_id` (`face_id`),
  KEY `username` (`username`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8;
