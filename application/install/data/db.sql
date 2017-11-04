
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `doc_api`;
CREATE TABLE `doc_api` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `module_id` int(10) NOT NULL DEFAULT '0' COMMENT '模块id',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '接口名',
  `method` int(3) NOT NULL DEFAULT '2' COMMENT '请求方法，1:get 2:post 3:put',
  `uri` varchar(250) NOT NULL DEFAULT '' COMMENT '接口地址',
  `intro` varchar(250) NOT NULL DEFAULT '' COMMENT '接口简介',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `demo` text COMMENT '演示数据',
  PRIMARY KEY (`id`),
  KEY `module_id_index` (`module_id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目接口表';

DROP TABLE IF EXISTS `doc_apply`;
CREATE TABLE `doc_apply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `creater_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目创建者id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '申请用户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `add_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  KEY `creater_id` (`creater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请加入项目表';


DROP TABLE IF EXISTS `doc_config`;
CREATE TABLE `doc_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config` text NOT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置表';


BEGIN;
INSERT INTO `doc_config` VALUES ('1', '{\"name\":\"PHPRAP\\u63a5\\u53e3\\u6587\\u6863\\u7ba1\\u7406\\u7cfb\\u7edf\",\"keywords\":\"phprap,apidoc,api\\u6587\\u6863\\u7ba1\\u7406\",\"description\":\"PHPRAP\\uff0c\\u662f\\u4e00\\u4e2aPHP\\u8f7b\\u91cf\\u7ea7\\u5f00\\u6e90API\\u63a5\\u53e3\\u6587\\u6863\\u7ba1\\u7406\\u7cfb\\u7edf\\uff0c\\u81f4\\u529b\\u4e8e\\u51cf\\u5c11\\u524d\\u540e\\u7aef\\u6c9f\\u901a\\u6210\\u672c\\uff0c\\u63d0\\u9ad8\\u56e2\\u961f\\u534f\\u4f5c\\u5f00\\u53d1\\u6548\\u7387\\uff0c\\u6253\\u9020PHP\\u7248\\u7684RAP\\u3002\",\"copyright\":\"Copyright \\u00a9 2017 APIDOC\\u7248\\u6743\\u6240\\u6709\",\"email\":\"245629560@qq.com\",\"default_password\":\"123456\",\"is_close\":\"0\",\"close_msg\":\"\\u7cfb\\u7edf\\u5347\\u7ea7\\uff0c\\u6682\\u65f6\\u65e0\\u6cd5\\u8bbf\\u95ee\\uff0c\\u8bf7\\u7a0d\\u5019\\u518d\\u8bd5\\uff01\"}', '2017-10-30 22:32:12');
COMMIT;

DROP TABLE IF EXISTS `doc_dbbak`;
CREATE TABLE `doc_dbbak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file` varchar(250) NOT NULL,
  `size` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '大小，单位KB',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


BEGIN;
INSERT INTO `doc_dbbak` VALUES ('15', '20171030222916_all.sql', '10.00', '2017-10-30 22:29:16');
COMMIT;

DROP TABLE IF EXISTS `doc_field`;
CREATE TABLE `doc_field` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `api_id` int(10) NOT NULL DEFAULT '0' COMMENT '接口id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者用户id',
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '接口名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '接口标题',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '字段类型',
  `method` tinyint(3) NOT NULL DEFAULT '1' COMMENT '参数类型，1:请求字段 2:响应字段',
  `is_required` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否必传',
  `default_value` varchar(250) DEFAULT '' COMMENT '默认值',
  `intro` varchar(250) NOT NULL DEFAULT '' COMMENT '备注',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `api_id_index` (`api_id`),
  KEY `user_id_index` (`user_id`),
  KEY `parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目字段表';


DROP TABLE IF EXISTS `doc_login_log`;
CREATE TABLE `doc_login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名称',
  `user_email` varchar(50) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录ip',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '登录地址',
  `device` varchar(50) NOT NULL DEFAULT '' COMMENT '登录设备',
  `add_time` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录日志表';


DROP TABLE IF EXISTS `doc_member`;
CREATE TABLE `doc_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `project_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '项目权限',
  `module_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '权限',
  `api_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '接口权限',
  `member_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '成员权限',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`) USING BTREE,
  KEY `project_id_index` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目成员表';

-- ----------------------------
--  Table structure for `doc_module`
-- ----------------------------
DROP TABLE IF EXISTS `doc_module`;
CREATE TABLE `doc_module` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '模块名称',
  `intro` varchar(255) NOT NULL DEFAULT '' COMMENT '项目描述',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `project_id_index` (`project_id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='项目模块表';


DROP TABLE IF EXISTS `doc_notify`;
CREATE TABLE `doc_notify` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '申请者id',
  `user_name` varchar(250) NOT NULL DEFAULT '' COMMENT '用户名',
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `to_user_id` int(10) NOT NULL DEFAULT '0' COMMENT '通知者id',
  `type` varchar(10) NOT NULL,
  `message` varchar(250) NOT NULL DEFAULT '',
  `is_readed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否读过',
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `to_user_id` (`to_user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息通知表';

DROP TABLE IF EXISTS `doc_project`;
CREATE TABLE `doc_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `title` varchar(255) NOT NULL COMMENT '项目标题',
  `intro` varchar(255) NOT NULL COMMENT '项目描述',
  `envs` text NOT NULL COMMENT '环境域名,json字符串',
  `allow_search` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否允许被搜索到',
  `add_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sort` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目表';

DROP TABLE IF EXISTS `doc_project_log`;
CREATE TABLE `doc_project_log` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `project_id` int(1) NOT NULL DEFAULT '0' COMMENT '项目id',
  `user_id` int(10) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL COMMENT '操作类型',
  `object` varchar(20) NOT NULL,
  `content` text NOT NULL COMMENT '对象',
  `add_time` datetime NOT NULL,
  `project_title` varchar(200) DEFAULT NULL,
  `module_title` varchar(50) DEFAULT NULL,
  `api_name` varchar(200) DEFAULT NULL,
  `field_name` varchar(200) DEFAULT NULL,
  `member_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `doc_user`;
CREATE TABLE `doc_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1:用户 2:管理员',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `ip` varchar(250) NOT NULL DEFAULT '' COMMENT '注册ip',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '注册地址',
  `device` varchar(255) NOT NULL DEFAULT '' COMMENT '登录设备',
  `add_time` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='会员表';

DROP TABLE IF EXISTS `doc_api`;
CREATE TABLE `doc_api` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `module_id` int(10) NOT NULL DEFAULT '0' COMMENT '模块id',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '接口名',
  `method` int(3) NOT NULL DEFAULT '2' COMMENT '请求方法，1:get 2:post 3:put',
  `uri` varchar(250) NOT NULL DEFAULT '' COMMENT '接口地址',
  `intro` varchar(250) NOT NULL DEFAULT '' COMMENT '接口简介',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `demo` text COMMENT '演示数据',
  PRIMARY KEY (`id`),
  KEY `module_id_index` (`module_id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='项目接口表';

DROP TABLE IF EXISTS `doc_apply`;
CREATE TABLE `doc_apply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `creater_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目创建者id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '申请用户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `add_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  KEY `creater_id` (`creater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请加入项目表';

DROP TABLE IF EXISTS `doc_config`;
CREATE TABLE `doc_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config` text NOT NULL,
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

BEGIN;
INSERT INTO `doc_config` VALUES ('1', '{\"name\":\"PHPRAP\\u63a5\\u53e3\\u6587\\u6863\\u7ba1\\u7406\\u7cfb\\u7edf\",\"keywords\":\"phprap,apidoc,api\\u6587\\u6863\\u7ba1\\u7406\",\"description\":\"PHPRAP\\uff0c\\u662f\\u4e00\\u4e2aPHP\\u8f7b\\u91cf\\u7ea7\\u5f00\\u6e90API\\u63a5\\u53e3\\u6587\\u6863\\u7ba1\\u7406\\u7cfb\\u7edf\\uff0c\\u81f4\\u529b\\u4e8e\\u51cf\\u5c11\\u524d\\u540e\\u7aef\\u6c9f\\u901a\\u6210\\u672c\\uff0c\\u63d0\\u9ad8\\u56e2\\u961f\\u534f\\u4f5c\\u5f00\\u53d1\\u6548\\u7387\\uff0c\\u6253\\u9020PHP\\u7248\\u7684RAP\\u3002\",\"copyright\":\"Copyright \\u00a9 2017 APIDOC\\u7248\\u6743\\u6240\\u6709\",\"email\":\"245629560@qq.com\",\"default_password\":\"123456\",\"is_close\":\"0\",\"close_msg\":\"\\u7cfb\\u7edf\\u5347\\u7ea7\\uff0c\\u6682\\u65f6\\u65e0\\u6cd5\\u8bbf\\u95ee\\uff0c\\u8bf7\\u7a0d\\u5019\\u518d\\u8bd5\\uff01\"}', '2017-10-30 22:32:12');
COMMIT;

DROP TABLE IF EXISTS `doc_dbbak`;
CREATE TABLE `doc_dbbak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file` varchar(250) NOT NULL,
  `size` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '大小，单位KB',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `doc_field`;
CREATE TABLE `doc_field` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `api_id` int(10) NOT NULL DEFAULT '0' COMMENT '接口id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者用户id',
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '接口名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '接口标题',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '字段类型',
  `method` tinyint(3) NOT NULL DEFAULT '1' COMMENT '参数类型，1:请求字段 2:响应字段',
  `is_required` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否必传',
  `default_value` varchar(250) NOT NULL DEFAULT '' COMMENT '默认值',
  `intro` varchar(250) NOT NULL DEFAULT '' COMMENT '备注',
  `mock` varchar(200) NOT NULL DEFAULT '' COMMENT 'mock规则',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `api_id_index` (`api_id`),
  KEY `user_id_index` (`user_id`),
  KEY `parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='项目字段表';

BEGIN;
INSERT INTO `doc_field` VALUES ('1', '1', '3', '0', 'code', '状态码', 'number', '2', '0', '293', '', 'number|200-300', '2017-11-01 02:07:50'), ('3', '1', '3', '0', 'msg', '错误信息', 'string', '2', '0', 'Zf86W20VllJNAq5aYLtP', '', 'string|20', '2017-11-03 16:52:02'), ('4', '1', '3', '0', 'data', '数据实体', 'array', '2', '0', '', '', '', '2017-11-03 17:12:54'), ('5', '1', '3', '4', 'name', '名字', 'string', '2', '0', '广天辉', '', 'cn_name', '2017-11-03 17:13:07'), ('6', '1', '3', '4', 'title', '标题', 'string', '2', '0', '魅族 魅蓝 6 全网通公开版 2GB+16GB 磨砂黑 移动联通电信4G手机 双卡双待', '', 'goods|name', '2017-11-03 17:39:51');
COMMIT;

DROP TABLE IF EXISTS `doc_login_log`;
CREATE TABLE `doc_login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名称',
  `user_email` varchar(50) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录ip',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '登录地址',
  `device` varchar(50) NOT NULL DEFAULT '' COMMENT '登录设备',
  `add_time` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='登录日志表';


DROP TABLE IF EXISTS `doc_member`;
CREATE TABLE `doc_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `project_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '项目权限',
  `module_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '权限',
  `api_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '接口权限',
  `member_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '成员权限',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`) USING BTREE,
  KEY `project_id_index` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目成员表';


DROP TABLE IF EXISTS `doc_module`;
CREATE TABLE `doc_module` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '模块名称',
  `intro` varchar(255) NOT NULL DEFAULT '' COMMENT '项目描述',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `project_id_index` (`project_id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='项目模块表';

DROP TABLE IF EXISTS `doc_notify`;
CREATE TABLE `doc_notify` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '申请者id',
  `user_name` varchar(250) NOT NULL DEFAULT '' COMMENT '用户名',
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `to_user_id` int(10) NOT NULL DEFAULT '0' COMMENT '通知者id',
  `type` varchar(10) NOT NULL,
  `message` varchar(250) NOT NULL DEFAULT '',
  `is_readed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否读过',
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `to_user_id` (`to_user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息通知表';

DROP TABLE IF EXISTS `doc_project`;
CREATE TABLE `doc_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `title` varchar(255) NOT NULL COMMENT '项目标题',
  `intro` varchar(255) NOT NULL COMMENT '项目描述',
  `envs` text NOT NULL COMMENT '环境域名,json字符串',
  `allow_search` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否允许被搜索到',
  `add_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sort` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='项目表';

DROP TABLE IF EXISTS `doc_project_log`;
CREATE TABLE `doc_project_log` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `project_id` int(1) NOT NULL DEFAULT '0' COMMENT '项目id',
  `user_id` int(10) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL COMMENT '操作类型',
  `object` varchar(20) NOT NULL,
  `content` text NOT NULL COMMENT '对象',
  `add_time` datetime NOT NULL,
  `project_title` varchar(200) DEFAULT NULL,
  `module_title` varchar(50) DEFAULT NULL,
  `api_name` varchar(200) DEFAULT NULL,
  `field_name` varchar(200) DEFAULT NULL,
  `member_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `doc_user`;
CREATE TABLE `doc_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1:用户 2:管理员',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `ip` varchar(250) NOT NULL DEFAULT '' COMMENT '注册ip',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '注册地址',
  `device` varchar(255) NOT NULL DEFAULT '' COMMENT '登录设备',
  `add_time` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='会员表';

SET FOREIGN_KEY_CHECKS = 1;
