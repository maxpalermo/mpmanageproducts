<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$rows = Tools::getValue("rows");

if(empty($rows)) {
    print "no values";
    exit();
}

$json = Tools::jsonEncode($rows);
$filename = dirname(__FILE__) . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . "pattern.pat";
        
$result = file_put_contents($filename, $json);

print "result: " . $result . " => " . $json;
exit();