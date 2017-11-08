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
use gophp\db;
use gophp\helper\file;
use gophp\helper\url;
use gophp\schema;
use app;


class test {

    /**
     * 添加/编辑字段
     */
    public function index(){

        $schema = schema::instance();

        $a = strpos('doc_dbbak', 'dbbak1');



        dump($a);


    }


}