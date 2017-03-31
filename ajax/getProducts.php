<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$id_products = Tools::getValue("id_products");
if (empty($id_products)) {
    print "getProducts: No values";
    exit();
}
$id_lang = Context::getContext()->language->id;

$db = Db::getInstance();
$query = new DbQueryCore();

$query
        ->select("id_product")
        ->select("name")
        ->from("product_lang")
        ->where("id_product in(" . implode(",",$id_products) . ")")
        ->where("id_lang = $id_lang")
        ->orderBy('name');

$result = $db->executeS($query);
$rows = "";
foreach($result as $record)
{
    $rows .=
            "<tr>"
            ."<td><input type='checkbox' name='checkrow[]' value='" . $record['id_product'] . "'</td>"
            ."<td>" . $record['name'] . "</td>"
            ."</tr>" . PHP_EOL;
}
print $rows;
exit();