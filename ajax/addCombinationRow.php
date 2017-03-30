<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$combinations = Tools::getValue("combinations");
$id_products  = Tools::getValue("id_products");

if(empty($combinations) ||empty($id_products)) {
    print "no values";
    exit();
}

$actions = "<i class='icon-edit' onclick='editRow(this,3);'></i>  " 
    . "<i class='icon-remove' onclick='deleteRow(this);'>"; 

$row = 
    "<tr>"
        ."<td>" . implode(";", $combinations) . "</td>"
        ."<td>" . implode(";", $id_products) . "</td>"
        ."<td></td>"
        ."<td></td>"
        ."<td></td>"
        ."<td></td>"
        ."<td></td>"
        ."<td style='text-align: right;'>0.000000</td>"
        ."<td style='text-align: right;'>0.000000</td>"
        ."<td></td>"
        ."<td style='text-align: right;'>0</td>"
        ."<td style='text-align: right;'>0.00</td>"
        ."<td style='text-align: right;'>0.000000</td>"
        ."<td></td>"
        ."<td style='text-align: right;'>0</td>"
        ."<td style='text-align: right;'>0000-00-00 00:00:00</td>"
        ."<td></td>"
        ."<td style='text-align: center;'>" . $actions . "</td>"
    ."</tr>";
print $row;
exit();