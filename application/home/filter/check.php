<?php

namespace app\home\filter;

use gophp\helper\file;
use gophp\response;

class check
{

    public function run()
    {

        if(!file::exists(RUNTIME_PATH.'/install.lock')){

            response::redirect('install');exit;

        }

        $is_close = get_config('is_close');

        if($is_close){
            exit(get_config('close_msg'));
        }

        return true;
    }

}
