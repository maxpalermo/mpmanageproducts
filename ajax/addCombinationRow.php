<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$combinations = Tools::getValue("combinations");
$id_product   = Tools::getValue("id_product",'0');

$row = 
    "<tr>"
        ."<td>0</td>"
        ."<td>" . implode(";", $combinations) . "</td>"
        ."<td>$id_product</td>"
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
    ."</tr>";
print $row;
exit();