<?php

namespace app\home\controller;

use app\api;
use app\field;
use gophp\controller;
use gophp\request;
use gophp\response;

class debug extends controller {

    public $id;

    // 获取接口id
    public function __construct()
    {


    }
    // 获取接口详情
    public function __call($name, $arguments)
    {

        $this->display('debug/index');

    }

}