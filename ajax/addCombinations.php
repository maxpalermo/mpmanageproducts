<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$rows = Tools::getValue("rows");

print_r($rows);
exit();

foreach($rows as $row) 
{
    $products = explode(";",$row[1]);
    foreach($products as $product)
    {
        $objProduct = new ProductCore($product);
        $ean13 = substr($row[5], 1, 13);
        if($row[15]==1) {
            $tax = ($objProduct->tax_rate+100)/100;
            
            $wholesale_price = number_format($row[7] / $tax,6);
            $price           = number_format($row[8] / $tax,6);
            $ecotax          = number_format($row[9] / $tax,6);
            $unit_price      = number_format($row[12] / $tax,6);
            
            
            
        }
    }
    $comb = new CombinationCore();
    
    $comb->id_product = $combination['id_product'];
    $comb->reference = $$combination['reference'];
    $comb->supplier_reference = $combination['supplier_reference'];
    $comb->location = $combination['location'];
    $comb->ean13 = $combination['ean13'];
    $comb->upc = $combination['upc'];
    $comb->wholesale_price = $combination['wholesale_price'];
    $comb->price = $combination['price'];
    $comb->ecotax = $combination['ecotax'];
    $comb->quantity = $combination['quantity'];
    $comb->weight = $combination['weight'];
    $comb->unit_price_impact = $combination['unit_price_impact'];
    $comb->default_on = $combination['default_on'];
    $comb->minimal_quantity = $combination['minimal_quantity'];
    $comb->available_date = $combination['available_date'];
    
    try {
        $id = $comb->save();
        $comb->setAttributes($combination['id_attributes']); //Array of id attributes
        $add[] = $id;
    } catch (Exception $exc) {
        $add[] = $comb->id_product . ": (" . $exc->getCode()  . ") " . $exc->getMessage();
    }
}

print "Added " + count($add) + " combinations\n";
print_r($add);
exit();