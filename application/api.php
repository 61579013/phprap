<?php

namespace app;

class api {

    /**
     * 根据模块id获取接口列表
     * @param $user_id
     */
    public static function get_api_info($api_id)
    {

        $api_id = $api_id ? $api_id : 0;

        return db('api')->find($api_id);

    }

    /**
     * 根据模块id获取接口列表
     * @param $user_id
     */
    public static function get_api_list($module_id)
    {

        return db('api')->show(false)->where('module_id', '=', $module_id)->findAll();

    }

    public static function get_method_list($method_id)
    {

        $method[1] = 'GET';
        $method[2] = 'POST';
        $method[3] = 'PUT';

        return $method_id ? $method[$method_id] : $method;

    }


    public static function get_project_info($api_id)
    {

        $api = db('api')->find($api_id);

        $module = module::get_module_info($api['module_id']);

        $project = project::get_project_info($module['project_id']);

        return $project;

    }

}