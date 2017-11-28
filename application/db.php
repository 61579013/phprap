<?php

namespace app;

class db {

    /**
     * 数据字典
     */
    public static function map($project_id, $sql_path)
    {


        $sql_content = file_get_contents($sql_path);

        $sql_array  = array_filter(explode(';', $sql_content));

        foreach ($sql_array as $sql) {
            if(strpos($sql, 'CREATE TABLE') != false || strpos($sql, 'create table') != false){

                $table_name = str_replace('CREATE TABLE', '', explode('(', $sql)[0]);
                $a[] = str_replace($table_name, 'oooooo', $sql);
            }
        }


        return $table_name;

    }


}