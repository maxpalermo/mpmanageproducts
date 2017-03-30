<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$tablename  = Tools::getValue("tablename");
$db = Db::getInstance();

print $tablename;

switch ($tablename) {
    case 'product_attribute':
        $qry1 = "delete from " . _DB_PREFIX_ . "product_attribute_combination "
            . "where id_product_attribute not in ("
            . "select id_product_attribute from " . _DB_PREFIX_ . "product_attribute); ";
        $result1 = $db->execute($qry1);
        print "attribute_combination: " . $result1;
        
        $qry2 = "delete from " . _DB_PREFIX_ . "product_attribute_shop "
            . "where id_product_attribute not in ("
            . "select id_product_attribute from " . _DB_PREFIX_ . "product_attribute); ";
        $result2 = $db->execute($qry1);
        print "product_attribute_shop: " . $result2;
        
        break;

    default:
        break;
}


exit();