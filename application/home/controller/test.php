<?php

namespace app\home\controller;

use app\category;
use app\china;
use app\id;
use app\notify;
use app\statistics;
use app\tree;
use gophp\backup;
use gophp\config;
use gophp\controller;
use gophp\crypt;
use gophp\curl;
use gophp\db;
use gophp\helper\file;
use gophp\helper\url;
use gophp\reflect;
use gophp\request;
use gophp\schema;
use app;


class test extends controller {

    public function index()
    {

        $install_path = APP_PATH . '/install/data/db.sql';

        $_sql = file_get_contents($install_path);
        $_arr = array_filter(explode(';', $_sql));

        foreach ($_arr as $sql) {
            if(strpos($sql, 'CREATE TABLE') != false || strpos($sql, 'create table') != false){
                $create_data[] = $sql;
            }
        }

//        dump($create_data);

        $sql = <<<SQL
CREATE TABLE `doc_api` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `module_id` int(10) NOT NULL DEFAULT '0' COMMENT '模块id',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '接口名',
  `method` varchar(10) NOT NULL DEFAULT '' COMMENT '请求方式',
  `uri` varchar(250) NOT NULL DEFAULT '' COMMENT '接口地址',
  `intro` varchar(250) NOT NULL DEFAULT '' COMMENT '接口简介',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `module_id_index` (`module_id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='项目接口表'
SQL;


        $table_name = str_replace(["CREATE TABLE", "`"], '', explode('(', $sql)[0]);

        $a = end(explode(')', $sql));

        $b = explode('=', $a);

        $table_comment = str_replace("'", '', $b);

        dump($table_comment);

    }


}