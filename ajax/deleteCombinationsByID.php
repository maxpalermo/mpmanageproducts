<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$product_attributes  = Tools::getValue("product_attributes");
$db = Db::getInstance();
$sql = new DbQueryCore();
$output = [];
if(empty($product_attributes)) {
    print "no values";
    exit();
}

foreach($product_attributes as $id_product_attribute)
{
    $comb = new CombinationCore($id_product_attribute);
    try {
        $delete = $comb->delete();
        $output[] = ['id_product'=>$comb->id_product, 'id_product_attribute'=>$id_product_attribute, 'status'=>$delete];
    } catch (Exception $exc) {
        $output[] = ['id_product'=>$comb->id_product, 'id_product_attribute'=>$id_product_attribute, 'status'=>'-1', 'error'=>$exc->getMessage()];
    }
}

print json_encode($output);
exit();