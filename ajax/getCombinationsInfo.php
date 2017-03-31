<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$combinations = Tools::getValue("combinations");
$products = Tools::getValue("products");

if(Tools::strpos($combinations, ";")!==false)
{
    $combinations = str_replace(";", ",", $combinations);
}

if(Tools::strpos($products, ";")!==false)
{
    $products = str_replace(";", ",", $products);
}

$id_lang = Context::getContext()->language->id;

$product_name = getProducts($products, $id_lang);
$attribute_name = getAttributes($combinations, $id_lang);

$obj = new stdClass();
$obj->products = $product_name;
$obj->combinations = $attribute_name;

print Tools::jsonEncode($obj);
exit();


function getProducts($products,$lang)
{
    $db = Db::getInstance();
    $query = new DbQueryCore();

    $query
            ->select("name")
            ->from("product_lang")
            ->where("id_product in(" . $products . ")")
            ->where("id_lang = $lang")
            ->orderBy("name");

    $result = $db->executeS($query);
    $output = [];
    foreach($result as $record)
    {
        $output[] = "<li>" . $record['name'] . "</li>";
    }
    return "<div style='display: inline-block;'><ul>" . (implode("", $output)) . "</ul></div>";
}

function getAttributes($attributes,$lang)
{
    $db = Db::getInstance();
    $query = new DbQueryCore();

    $query
            ->select("name")
            ->from("attribute_lang")
            ->where("id_attribute in(" . $attributes . ")")
            ->where("id_lang = $lang")
            ->orderBy("name");

    $result = $db->executeS($query);
    $output = [];
    foreach($result as $record)
    {
        $output[] = "<li>" . $record['name'] . "</li>";
    }
    return "<div style='display: inline-block;'><ul>" . (implode("", $output)) . "</ul></div>";
}