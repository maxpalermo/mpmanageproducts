<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once(dirname(__FILE__).'/../../../config/config.inc.php');
require_once(dirname(__FILE__).'/../../../init.php');

$tablename  = Tools::getValue("tablename");
$fieldname  = Tools::getValue("fieldname");
$values     = Tools::getValue("values");

if(empty($values)) {
    print "no values";
    exit();
}

$value_list = implode(",", $values);
$id_lang    = Context::getContext()->language->id;

$db = Db::getInstance();
$query = $fieldname . ' in (' . $value_list . ')';

$result = $db->delete($tablename, $query);

print "query:" . $query;
print "\ndeleted: " . $result;
exit();