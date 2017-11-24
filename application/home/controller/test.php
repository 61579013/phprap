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

    private $key;
    private $method;

    /**
     * 添加/编辑字段
     */
    public function index(){

        $url = 'https://api.github.com/repos/gouguoyin/phprap';


        dump($a,$b);


    }


}