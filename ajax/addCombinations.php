<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$rows = Tools::getValue("rows");

foreach($rows as $row) 
{
    $products = explode(";",$row[1]);
    foreach($products as $product)
    {
        $objProduct = new ProductCore($product);
        $tax_rule   = new TaxCore();
        $tax_rate   = $tax_rule->getTaxIdByName($objProduct->tax_name);
        
        
        $attributes = explode(";", $row[0]);
        $reference  = substr($row[2], 0, 32);
        $supp_ref   = substr($row[3], 0, 32);
        $location   = substr($row[4], 0, 64);
        $ean13      = substr($row[5], 0, 13);
        $upc        = substr($row[6], 0, 12);
        $quantity   = (int)$row[10];
        $weight     = (float)$row[11];
        $default    = (bool)$row[13];
        $min_qty    = (int)$row[14];
        $available  = $row[15];
        $tax_incl   = (bool)$row[16];
                
        if($tax_incl) { //Tax included
            $tax = ((float)$tax_rate+100)/100;
            
            $wholesale_price = number_format((float)$row[7] / (float)$tax, 6);
            $price           = number_format((float)$row[8] / (float)$tax, 6);
            $ecotax          = number_format((float)$row[9] / (float)$tax, 6);
            $unit_price      = number_format((float)$row[12] / (float)$tax, 6);
        } else {
            $wholesale_price = number_format((float)$row[7], 6);
            $price           = number_format((float)$row[8], 6);
            $ecotax          = number_format((float)$row[9], 6);
            $unit_price      = number_format((float)$row[12], 6);
        }
        
        $comb = new CombinationCore();
        
        $comb->id_product = $product;
        $comb->reference = $reference;
        $comb->supplier_reference = $supp_ref;
        $comb->location = $location;
        $comb->ean13 = $ean13;
        $comb->upc = $upc;
        $comb->wholesale_price = $wholesale_price;
        $comb->price = $price;
        $comb->ecotax = $ecotax;
        $comb->quantity = $quantity;
        $comb->weight = $weight;
        $comb->unit_price_impact = $unit_price;
        $comb->default_on = $default;
        $comb->minimal_quantity = $min_qty;
        $comb->available_date = $available;
        
        if($default) { //Delete current default_on to avoid sql error duplicate-key
            $db=Db::getInstance();
            try {
                $db->update("product_attribute", ["default_on" => NULL], "id_product = $product and default_on is NOT NULL", 0, true);
                $db->update("product_attribute_shop", ["default_on" => NULL], "id_product = $product and default_on is NOT NULL", 0, true);
            } catch (Exception $exc) {
                $add[] = ['id_product'=>$comb->id_product, 'result'=>-1, 'code'=>$exc->getCode(), 'message'=>$exc->getMessage()]; 
            }
        }
        
        try {
            $id = $comb->save();
            $comb->setAttributes($attributes); //Array of id attributes
            $add[] = ['id_product'=>$comb->id_product, 'tax_rate'=>$tax_rate, 'result'=>$id];
        } catch (Exception $exc) {
            $add[] = ['id_product'=>$comb->id_product, 'result'=>-1, 'tax_rate'=>$objProduct->tax_rate, 'code'=>$exc->getCode(), 'message'=>$exc->getMessage()]; 
        }
        
    }
}

print Tools::jsonEncode($add);
exit();