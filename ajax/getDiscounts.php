<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$products = Tools::getValue("products");
if(empty($products)) {
    print "";
    exit();
}

$id_product_list = implode(",",$products);
$id_lang = Context::getContext()->language->id;

$db = Db::getInstance();
$query_discounts = new DbQueryCore();
$query_discount_values = new DbQueryCore();
$query_discount_types = new DbQueryCore();

//Get discounts value
$query_discount_values
        ->select("distinct reduction")
        ->from("specific_price")
        ->where("id_product in ($id_product_list)")
        ->orderBy("reduction");
$res_discount = $db->executeS($query_discount_values);
$rowsValue = "";
foreach($res_discount as $record)
{
    $rowsValue .= "<tr>"
                ."<td style='text-align: right;'>"
                    . "<input type='checkbox' "
                            . "name='checkDiscountValue[]' "
                            . "value='" . $record['reduction'] . "' "
                            . "onclick='checkColumn(4,this,\"table_discounts\");'>"
                . "</td>"
                ."<td style='text-align: right;'>" . $record['reduction'] . "</td>"
                ."</tr>";
}

//Get discounts type
$query_discount_types
        ->select("distinct reduction_type")
        ->from("specific_price")
        ->where("id_product in ($id_product_list)")
        ->orderBy("reduction_type");
$res_type = $db->executeS($query_discount_types);
$rowsType = "";
foreach($res_type as $record)
{
    $rowsType .= "<tr>"
                ."<td style='text-align: right;'>"
                    . "<input type='checkbox' "
                            . "name='checkDiscountValue[]' "
                            . "value='" . $record['reduction_type'] . "' "
                            . "onclick='checkColumn(5,this,\"table_discounts\");'>"
                . "</td>"
                ."<td style='text-align: right;'>" . $record['reduction_type'] . "</td>"
                ."</tr>";
}

$query_discounts
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

$result = $db->executeS($query_discounts);
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

$output = new stdClass();
$output->rowsDiscount = $rows;
$output->rowsValue    = $rowsValue;
$output->rowsType     = $rowsType;
        

print Tools::jsonEncode($output);
exit();