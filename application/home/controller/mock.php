<?php

namespace app\home\controller;

use app\api;
use app\field;
use gophp\controller;
use gophp\request;
use gophp\response;

class mock extends controller {

    public $id;

    // 获取接口id
    public function __construct()
    {

        $this->id = id_decode($this->action);

        $api = api::get_api_info($this->id);

        if(!$api){
            response::ajax(['code'=> 500, 'msg' => '该mock接口不存在']);
        }

    }

    // 获取接口详情
    public function __call($name, $arguments)
    {

        $api_id =  $this->id;

        $api    = api::get_api_info($this->id);

        $request_data   = [];

        if(request::isGet() && !in_array($api['method'], [1])){

            response::ajax(['code'=> 300, 'msg' => '非法请求方式[GET]']);

        }

        if(request::isPost() && !in_array($api['method'], [2])){

            response::ajax(['code'=> 300, 'msg' => '非法请求方式[POST]']);

        }

        if(request::isPut() && !in_array($api['method'], [3])){

            response::ajax(['code'=> 300, 'msg' => '非法请求方式[PUT]']);

        }

        switch ($_SERVER['REQUEST_METHOD']) {

            case 'GET':

                $request_data = $_GET;
                unset($request_data['r']);
                break;

            case 'POST':

                $request_data = $_POST;
                break;

            case 'PUT':

                parse_str(file_get_contents('php://input'), $request_data);
                break;
        }

        // 获取请求参数列表
        $request_fields = \app\field::get_field_list($api_id, 1);

        foreach ($request_fields as $k => $request_field) {

            $name  = $request_field['name'];
            $type  = $request_field['type'];
            $value = $request_data[$name];

            if($request_field['is_required'] && !isset($value)){

                response::ajax(['code'=> 301+$k, 'msg' => '缺失必要参数' . $name]);

            }

            if($type == 'string' && !is_string($value)){

                response::ajax(['code'=> 301+$k, 'msg' =>  $name . '字段类型必须是' . field::get_type_list($type)]);

            }

            if($type == 'int' && !is_numeric($value)){

                response::ajax(['code'=> 301+$k, 'msg' =>  $name . '字段类型必须是' . field::get_type_list($type)]);

            }

            if($type == 'float' && !is_float((floatval($value)))){

                response::ajax(['code'=> 301+$k, 'msg' =>  $name . '字段类型必须是' . field::get_type_list($type)]);

            }

            if($type == 'boolean' &&  in_array($value, ['true', 'false'])){

                response::ajax(['code'=> 301+$k, 'msg' =>  $name . '字段类型必须是' . field::get_type_list($type)]);

            }

            if($type == 'array' && !is_array($value)){

                response::ajax(['code'=> 301+$k, 'msg' =>  $name . '字段类型必须是' . field::get_type_list($type)]);

            }

            if($type == 'object' && !is_a($value)){

                response::ajax(['code'=> 301+$k, 'msg' =>  $name . '字段类型必须是' . field::get_type_list($type)]);

            }

            if($type == 'null' && !is_null($value)){

                response::ajax(['code'=> 301+$k, 'msg' =>  $name . '字段类型必须是' . field::get_type_list($type)]);

            }

            if($type == 'json' && is_null(json_decode($value))){

                response::ajax(['code'=> 301+$k, 'msg' =>  $name . '字段类型必须是' . field::get_type_list($type)]);

            }

        }

        $mock_data = field::get_mock_data($api_id);

        response::ajax($mock_data);

    }

}