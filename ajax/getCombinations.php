<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$products = Tools::getValue("products");
if (empty($products)) {
    print "";
    exit();
}
$id_product_list = implode(",",$products);
$id_lang = Context::getContext()->language->id;

$db = Db::getInstance();
$query = new DbQueryCore();

$query
        ->select("pa.id_product_attribute")
        ->select("al.name as `attribute_name`")
        ->select("pa.id_product as `product_id`")
        ->select("pl.name as `product_name`")
        ->select("pa.reference")
        ->select("pa.ean13")
        ->select("pa.price")
        ->select("pa.quantity")
        ->from("product_attribute","pa")
        ->innerJoin("product_lang", "pl", "pl.id_product=pa.id_product")
        ->innerJoin('product_attribute_combination','pac','pac.id_product_attribute=pa.id_product_attribute')
        ->innerJoin('attribute_lang','al','al.id_attribute=pac.id_attribute')
        ->where("pa.id_product in ($id_product_list)")
        ->where("al.id_lang=$id_lang")
        ->orderBy("pa.id_product_attribute")
        ->orderBy("pl.name")
        ->orderBy("pac.id_attribute");

$result     = $db->executeS($query);
$rows       = [];
$td         = [];
$current_id = 0;

if(empty($result)) {
    print json_encode(['resultset'=>'empty']);
    exit();
}

foreach($result as $record)
{
    if($current_id==0) {
        $current_id = $record['id_product_attribute'];
        $td = [];
        $td['id_product_attribute'] = $current_id;
        $td['attribute_name'] = $record['attribute_name'];
        $td['product_id'] = $record['product_id'];
        $td['product_name'] = $record['product_name'];
        $td['reference'] = $record['reference'];
        $td['ean13'] = $record['ean13'];
        $td['price'] = $record['price'];
        if($record['quantity']<0) {
            $td['quantity'] = "<strong style='color: red;'>" . $record['quantity'] . "</strong>";
        } else {
            $td['quantity'] = $record['quantity'];
        }
        
        //Add product to list
        $products_list[$td['product_id']] = ['id'=>$td['product_id'], 'name'=>$td['product_name']];
        
    } elseif ($current_id==$record['id_product_attribute']) {
        $td['attribute_name'] .= " " . $record['attribute_name'];
    } elseif ($current_id!=$record['id_product_attribute']) {
        $rows[] = "<tr>"
                ."<td style='text-align: right;'>" . $td['id_product_attribute'] . " <input type='checkbox' name='checkDiscount[]' value='" . $td['id_product_attribute'] . "'> ". "</td>"
                ."<td style='min-width: 200px;'>" . $td['attribute_name'] . "</td>"
                ."<td style='text-align: right;'>" . $td['product_id'] . "</td>"
                ."<td style='min-width: 200px;'>" . $td['product_name'] . "</td>"
                ."<td style='text-align: left;'>" . $td['reference'] . "</td>"
                ."<td>" . $td['ean13'] . "</td>"
                ."<td style='text-align: right;'>" . $td['price'] . "</td>"
                ."<td style='text-align: right;'>" . $td['quantity'] . "</td>"
            ."</tr>";
        
        $current_id = $record['id_product_attribute'];
        $td = [];
        $td['id_product_attribute'] = $current_id;
        $td['attribute_name'] = $record['attribute_name'];
        $td['product_id'] = $record['product_id'];
        $td['product_name'] = $record['product_name'];
        $td['reference'] = $record['reference'];
        $td['ean13'] = $record['ean13'];
        $td['price'] = $record['price'];
        if($record['quantity']<0) {
            $td['quantity'] = "<strong style='color: red;'>" . $record['quantity'] . "</strong>";
        } else {
            $td['quantity'] = $record['quantity'];
        }    
        //Add product to list
        $products_list[$td['product_id']] = ['id'=>$td['product_id'], 'name'=>$td['product_name']];
    }
}

$rows[] = "<tr>"
    ."<td style='text-align: right;'>" . $td['id_product_attribute'] . " <input type='checkbox' name='checkDiscount[]' value='" . $td['id_product_attribute'] . "'> ". "</td>"
    ."<td style='min-width: 200px;'>" . $td['attribute_name'] . "</td>"
    ."<td style='text-align: right;'>" . $td['product_id'] . "</td>"
    ."<td style='min-width: 200px;'>" . $td['product_name'] . "</td>"
    ."<td style='text-align: left;'>" . $td['reference'] . "</td>"
    ."<td>" . $td['ean13'] . "</td>"
    ."<td style='text-align: right;'>" . $td['price'] . "</td>"
    ."<td style='text-align: right;'>" . $td['quantity'] . "</td>"
."</tr>";

$product_rows = [];
foreach($products_list as $product)
{
    $product_rows[] = "<tr>"
                ."<td style='text-align: right;'>"
                    . $product['id'] . " "
                    . "<input type='checkbox' "
                            . "name='checkCombinationProduct[]' "
                            . "value='" . $product['id'] . "' "
                            . "onclick='checkColumn(3,this,\"table_combinations\");'>"
                . "</td>"
                ."<td style='text-align: left;'>" . $product['name'] . "</td>"
                ."</tr>";
}

$output = new stdClass();
$output->rows = implode("\n",$rows);
$output->products = implode("\n",$product_rows);
print Tools::jsonEncode($output);
exit();