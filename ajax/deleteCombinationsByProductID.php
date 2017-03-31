<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$products  = Tools::getValue("products");
$db = Db::getInstance();
$sql = new DbQueryCore();
$output = [];
if(empty($products)) {
    print "no values";
    exit();
}

foreach ($products as $product)
{
    $sql = new DbQueryCore();
    $sql
            ->select('id_product_attribute')
            ->from('product_attribute')
            ->where('id_product=' . $product);
    $result = $db->executeS($sql);
    foreach($result as $id_product_attribute)
    {
        $comb = new CombinationCore($id_product_attribute);
        try {
            $delete = $comb->delete();
            $output[] = ['id_product'=>$product, 'id_product_attribute'=>$id_product_attribute, 'status'=>$delete];
        } catch (Exception $exc) {
            $output[] = ['id_product'=>$product, 'id_product_attribute'=>$id_product_attribute, 'status'=>'-1', 'error'=>$exc->getMessage()];
        }
    }
}

print json_encode($output);
exit();