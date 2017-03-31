<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$id_lang = Context::getContext()->language->id;
$id_attribute_group = (int)Tools::getValue('id_attribute_group');

$db = Db::getInstance();
$query = new DbQueryCore();

$query
        ->select("ag.id_attribute_group")
        ->select("ag.name as `attribute_name`")
        ->select("a.id_attribute")
        ->select("a.color")
        ->select("a.position")
        ->select("al.name as `attribute_value`")
        ->from("attribute_group_lang","`ag`")
        ->innerJoin("attribute", "`a`", "a.id_attribute_group=ag.id_attribute_group")
        ->innerJoin('attribute_lang','`al`','al.id_attribute=a.id_attribute')
        ->where("ag.id_lang=$id_lang")
        ->where("al.id_lang=$id_lang")
        ->where("ag.id_attribute_group=$id_attribute_group")
        ->orderBy("ag.name")
        ->orderBy("al.name")
        ->orderBy("a.position");

$result     = $db->executeS($query);
$rows       = [];
$td         = [];
$current_id = 0;

foreach($result as $record)
{
    $td=[];
    $td['check']= "<td><input type='checkbox' name='checkListAttribute[]' "
            . "value='" . $record['id_attribute_group'] . "' "
            . "id_attribute='" . $record['id_attribute'] . "'>"
            . "</td>";
    $td['id_attribute_group'] = "<td style='display: none;'>" . $record['id_attribute_group'] ."</td>";
    $td['attribute_name'] = "<td><strong>" . $record['attribute_name'] . "</strong></td>";
    $td['id_attribute'] = "<td style='display: none;'>" . $record['id_attribute'] . "</td>";
    $td['attribute_value'] = "<td>" . $record['attribute_value'] . "</td>";
    if (empty($record['color'])) {
        $td['color'] = "<td></td>";
    } else {
        $td['color'] = "<td style='width: 32px; background-color: " . $record['color'] . "'></td>";
    }
    
    $rows[] = "<tr>" . implode("\n", $td) . "</tr>";
}

print implode("\n",$rows);
exit();