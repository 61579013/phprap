<?php

namespace app\admin\controller;

use gophp\helper\file;
use gophp\page;
use gophp\request;
use gophp\response;
use gophp\schema;

class db extends auth {

    public function index()
    {
        $db = \gophp\db::instance();

        $table_suffix = $db->suffix;
        $table_name   = $table_suffix .'dbbak';

        $sql   = "select * from $table_name order by id desc";

        $total = count($db->show(false)->query($sql));

        $pre_rows = 10;

        $page  = new page($total, $pre_rows);

        $dbbaks = $db->show(false)->query($sql, $pre_rows);

        $this->assign('page', $page);
        $this->assign('dbbaks', $dbbaks);

        $this->display('db/index');

    }

    /**
     * 备份数据
     */
    public function backup()
    {

        if(!request::isAjax()){

            response::ajax(['code' => 300, 'msg' => '非法请求方式']);

        }
        $schema = schema::instance();
        $tables = $schema->getTables();

        $path = RUNTIME_PATH . '/data/';

        $name = date('YmdHis') . '_all.sql';

        $file = $path . $name;

        $sql = '';

        foreach ($tables as $table) {

            // 如果存在则删除表
            $sql .= $schema->getDeleteTableSql($table) . ";\r\n";
            // 创建表结构
            $sql .= $schema->getCreateTableSql($table) . ";\r\n";
            // 插入数据
            $sql .= $schema->getInsertTableSql($table) . ";\r\n";

        }

        if(!file::create($file, $sql)){

            response::ajax(['code' => 301, 'msg' => '备份失败,请检查'.$path.'是否有可写权限']);

        }

        $size = file::getInfo($file,'size')/1024;

        $result = db('dbbak')->add(['file' => $name,'size' => $size]);

        if($result){

            response::ajax(['code' => 200, 'msg' => '备份成功!']);

        }

        response::ajax(['code' => 302, 'msg' => '备份失败!']);

    }

    /**
     * 下载数据
     */
    public function download()
    {

        $id = request::get('id', 0);

        $dbbak = db('dbbak')->find($id);

        $file = RUNTIME_PATH . '/data/' . $dbbak['file'];

        response::download($file);

    }

    /**
     * 删除文件
     */
    public function delete()
    {

        $id = request::post('id', 0);

        $dbbak = db('dbbak')->find($id);

        $file = RUNTIME_PATH . '/data/' . $dbbak['file'];

        if(!file::delete($file)){

            response::ajax(['code'=> 300, 'msg'=>'删除失败']);

        }

        $result = db('dbbak')->delete($id);

        if(!$result){

            response::ajax(['code'=> 301, 'msg'=>'删除失败']);

        }

        response::ajax(['code'=> 200, 'msg'=>'删除成功']);

    }

}