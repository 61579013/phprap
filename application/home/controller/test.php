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
use gophp\crypt;
use gophp\curl;
use gophp\db;
use gophp\helper\file;
use gophp\helper\url;
use gophp\reflect;
use gophp\request;
use gophp\schema;
use app;


class test {

    private $key;
    private $method;

    /**
     * 添加/编辑字段
     */
    public function index(){

        $aes = crypt::instance();

        $a = $aes->encrypt('hhhh');

        $b = $aes->decrypt('eyJpdiI6IlptUmhhMmx1Wld3N2FXNXFZV3BrYWc9PSIsInZhbHVlIjoiXC9zY2s4emcrV0hzRDQ2TzhnWGtWRVE9PSJ9');

        dump($a,$b);


    }



}