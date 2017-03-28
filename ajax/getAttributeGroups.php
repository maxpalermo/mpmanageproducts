<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$id_lang = Context::getContext()->language->id;

$db = Db::getInstance();
$query = new DbQueryCore();

$query
        ->select("id_attribute_group")
        ->select("name")
        ->from("attribute_group_lang")
        ->where("id_lang = $id_lang")
        ->orderBy('name');

$result = $db->executeS($query);
$options = "";
foreach($result as $record)
{
    $options .= "<option value='" . $record["id_attribute_group"] . "'>". $record["name"] ."</option>";
}
print $options;
exit();