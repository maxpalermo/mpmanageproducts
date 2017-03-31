<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$category = Tools::getValue("category");
$checked  = (int)Tools::getValue("checked");
$id_lang = Context::getContext()->language->id;

$db = Db::getInstance();
$query = new DbQueryCore();

$query
        ->select("id_category")
        ->from("category_lang");
if($checked) {
    //Search by id
    $query->where("id_category in ($category)");
} else {
    $category = addslashes($category);
    $query
            ->where("name like '%$category%'")
            ->where("id_lang=$id_lang");
}

$result = $db->executeS($query);

print Tools::jsonEncode($result);
exit();