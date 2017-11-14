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
use gophp\curl;
use gophp\db;
use gophp\helper\file;
use gophp\helper\url;
use gophp\request;
use gophp\schema;
use app;


class test {

    /**
     * 添加/编辑字段
     */
    public function index(){

        $url = 'http://demo.gouguoyin.cn/mock/FzxxmyQzxV.html';
        $method = 'GET';

        $curl = new curl($url, $method);



        $a = $curl->getBody();

//        $b = request::curl('http://cms.juzifenqi.com/api/page/list.php','get');

        dump($a);


    }


}