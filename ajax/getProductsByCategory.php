<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$categories = Tools::getValue("categories");
if(empty($categories)) {
    return "<option value='0'>-------</option>";
}

$list_categories = implode(",",$categories);
$id_lang = Context::getContext()->language->id;

$db = Db::getInstance();
$query = new DbQueryCore();

$query
        ->select("pl.id_product")
        ->select("pl.name")
        ->from("product_lang","`pl`")
        ->innerJoin('category_product','`cp`','cp.id_product=pl.id_product')
        ->where("cp.id_category in(" . $list_categories . ")")
        ->where("pl.id_lang = $id_lang")
        ->orderBy('pl.name');

$result = $db->executeS($query);
$options = "";
foreach($result as $record)
{
    $options .= "<option value='" . $record["id_product"] . "'>". $record["name"] ."</option>";
}
print $options;
exit();