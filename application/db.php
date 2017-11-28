<?php

namespace app;

class db {

    /**
     * 数据字典
     */
    public static function map($project_id, $sql_path)
    {


        $sql_content = file_get_contents($sql_path);

        $sql_array   = array_filter(explode(';', $sql_content));

        $db = \gophp\db::instance();

        foreach ($sql_array as $k =>$v) {
            if(strpos($v, 'CREATE TABLE') != false || strpos($v, 'create table') != false){

                $old_table_name = str_replace(['CREATE TABLE','create table', '`'], '', explode('(', $v)[0]);
                $old_table_name = trim($old_table_name);
                $new_table_name = $old_table_name . '_' . $project_id;

                $query_sql = str_replace($old_table_name, $new_table_name, $v);

                $db->query("DROP TABLE IF EXISTS $new_table_name;");
//                $db->query($query_sql);

                ob_flush();
                flush();
            }
        }


        return $query_sql;

    }


}