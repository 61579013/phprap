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

        $this->id = id_decode($this->action);

        $api = api::get_api_info($this->id);

        if(!$api){
            response::ajax(['code'=> 500, 'msg' => '该接口不存在']);
        }

    }

    // 获取接口详情
    public function __call($name, $arguments)
    {

        $api    = api::get_api_info($this->id);

        $api['method'] = api::get_method_list($api['method']);

        $project = api::get_project_info($this->id);

        // 获取项目环境域名
        $envs    = json_decode($project['envs'], true);

        foreach ($envs as $k => $env) {
            $envs[$k]['name'] = $env['name'];
            $envs[$k]['title'] = $env['title'];
            $envs[$k]['url'] = $env['domain'] . '/' . $api['uri'];
        }

        $encode_id = id_encode($api['id']);

        $mock = [
            'name' => 'mock',
            'title' => '虚拟地址',
            'url' => url("mock/$encode_id", '', true),
        ];

        array_unshift($envs, $mock);

        // 获取请求参数列表
        $request_fields = \app\field::get_field_list($this->id, 1);

        $methods = \app\api::get_method_list();

        $this->assign('api', $api);
        $this->assign('envs', $envs);
        $this->assign('methods', $methods);

        $this->assign('request_fields', $request_fields);


        $this->display('debug/index');

    }

}