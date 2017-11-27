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

    /**
     * 添加/编辑字段
     */
    public function star_widget(){

        $url = 'https://api.github.com/repos/gouguoyin/phprap';

        $headers = array(
            'User-Agent:' . $_SERVER['HTTP_USER_AGENT'],
            'Content-type:application/x-www-form-urlencoded',
        );

        $curl = new curl($url, 'get', '', $headers);

        $html = 'document.write(\'';

        $html .=  <<<HTML
<span class="github-btn"><a class="gh-btn" href="https://github.com/twbs/bootstrap/" target="_blank" aria-label="Star on GitHub"><span class="gh-ico" aria-hidden="true"></span> <span class="gh-text">Star</span></a> <a class="gh-count" href="https://github.com/twbs/bootstrap/stargazers" target="_blank" aria-label="118,390 stargazers on GitHub" style="display: block;">118,390</a></span>
HTML;
        $html .= '\');';

        $expire = 604800;
        header ( 'Content-type: application/x-javascript' );
        header ( 'Cache-Control: max-age=' . $expire );
        header ( 'Accept-Ranges: bytes' );
        header ( 'Content-Length: ' . strlen ( $html ) );

        echo $html;

    }

    public function github()
    {
        $this->display('github');
    }


}