<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$price = Tools::getValue("price");
$quantity = Tools::getValue("quantity");
$reduction = Tools::getValue("reduction");
$tax = Tools::getValue("tax");
$reduction_type = Tools::getValue("reduction_type");
$from = Tools::getValue("from");
$to = Tools::getValue("to");
$products = Tools::getValue("products");
if(empty($products)) {
    print "No products";
    exit();
}

if ($price==0) {
    $price = -1;
}

if ($quantity<0) {
    $quantity = 0;
}

if ($from=="") {
    $from = '0';
}

if ($to=="") {
    $to = '0';
}

$id_lang = Context::getContext()->language->id;

foreach($products as $product) 
{
    $discount = new SpecificPriceCore();
    $discount->id_cart=0;
    $discount->id_product = $product;
    $discount->id_product_attribute = 0;
    $discount->id_shop = 0;
    $discount->id_shop_group = 0;
    $discount->id_currency = 0;
    $discount->id_country = 0;
    $discount->id_group = 0;
    $discount->id_customer = 0;
    $discount->price = $price;
    $discount->from_quantity = $quantity;
    $discount->reduction = $reduction;
    $discount->reduction_tax = $tax;
    $discount->reduction_type = $reduction_type;
    $discount->from = $from;
    $discount->to = $to;
    
    try {
        $add[] = $discount->add();
    } catch (Exception $exc) {
        $add[] = $product . ": (" . $exc->getCode()  . ") " . $exc->getMessage();
    }
}

print "Added " + count($add) + " discounts\n";
print_r($add);
exit();


function validateDate($date, $format = 'Y-m-d H:i:s')
{
    $d = DateTime::createFromFormat($format, $date);
    return $d && $d->format($format) == $date;
}