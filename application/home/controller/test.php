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

         $create_data = app\db::map(1, $install_path);

         $a = schema::instance()->getFieldList('doc_apply');

         dump($create_data);exit;



    }


}