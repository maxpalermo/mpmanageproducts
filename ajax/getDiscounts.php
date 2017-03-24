<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$products = Tools::getValue("products");
$id_product_list = implode(",",$products);
$id_lang = Context::getContext()->language->id;

$db = Db::getInstance();
$query = new DbQueryCore();

$query
        ->select("sp.id_specific_price")
        ->select("sp.id_product as `product_id`")
        ->select("pl.name")
        ->select("sp.price")
        ->select("sp.from_quantity")
        ->select("sp.reduction")
        ->select("sp.reduction_type")
        ->select("sp.from")
        ->select("sp.to")
        ->from("specific_price","sp")
        ->innerJoin("product_lang", "pl", "pl.id_product=sp.id_product")
        ->where("sp.id_product in ($id_product_list)")
        ->orderBy("pl.name");

$result = $db->executeS($query);
$rows = "";
foreach($result as $record)
{
    $rows .= "<tr>"
                ."<td style='text-align: right;'><input type='checkbox' name='checkDiscount[]' value='" . $record['id_specific_price'] . "'> ". $record['id_specific_price'] . "</td>"
                ."<td style='text-align: right;'>" . $record['product_id'] . "</td>"
                ."<td style='min-width: 200px;'>" . $record['name'] . "</td>"
                ."<td style='text-align: right;'>" . $record['reduction'] . "</td>"
                ."<td>" . $record['reduction_type'] . "</td>"
                ."<td style='text-align: center;'>" . $record['from'] . "</td>"
                ."<td style='text-align: center;'>" . $record['to'] . "</td>"
            ."</tr>";
}
print $rows;
exit();