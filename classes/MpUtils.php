<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of mpUtils
 *
 * @author imprendo
 */
class MpUtils {
    static function startsWith($string, $chunk)
    {
        return preg_match('#^' . $chunk . '#i', $string) === 1;
    }
    
    static function contains($string, $chunk)
    {
        return Tools::strpos($string,$chunk)===true;
    }
    
    static function removeFirstChar($string)
    {
        return $str = substr($string, 1);
    }
    
    static function productExistsByReference($reference)
    {
        $db = Db::getInstance();
        $sql = new DbQueryCore();
        $sql->select('count(*)')
                ->from('product')
                ->where("reference='" . pSQL($reference) . "'" );
        
        $result =  (bool)$db->getValue($sql);
        
        return $result;
    }
    
    /**
     * 
     * @param string $tablename tablename to get data
     * @param string $id field id
     * @param string $value field description
     * @param string $orderBy field order
     * @return array option list for select item
     */
    static function createOptionListFromTable($tablename,$id,$value,$orderBy)
    {
        $db = Db::getInstance();
        $sql = new DbQueryCore();
        $options = [];
        
        $sql->select($id)
                ->select($value)
                ->from($tablename)
                ->orderBy($orderBy);
        $result = $db->executeS($sql);
        $options[] = [
            'id' => 0,
            'value' => $this->l('Please select')
        ];
        foreach ($result as $row)
        {
            $options[] = [
                'id' => $row[$id],
                'value' => $row[$value]
            ];
        }
        
        return $options;
    }
    
    /**
     * Create a formatted array for option list
     * @param array $array array to read from
     * @param string $id key for id
     * @param string $value key for value
     * @return array option list array
     */
    static function createOptionListFromAssociatedArray($array,$id,$value)
    {
        $options = [];
        $options[] = [
            'id' => 0,
            'value' => $this->l('Please select')
        ];
        foreach ($array as $row)
        {
            $options[] = [
                'id' => $row[$id],
                'value' => $row[$value]
            ];
        }
        
        return $options;
    }
    
    /**
     * Create a formatted array for option list
     * @param array $array array to read from
     * @return array option list array
     */
    static function createOptionListFromArray($array, $firstRow = true, $capitalize = false)
    {
        $options = [];
        
        if ($firstRow) {
            $options[] = [
                'id' => 0,
                'value' => $this->l('Please select')
            ];
        }
        
        foreach ($array as $row)
        {
            if ($capitalize) {
                $row = Tools::strtoupper($row);
            }
            $option = ['id' => $row, 'value' => $row];
            $options[] = $option; 
        }

        return $options;
    }
    
    static function getProductByReference($reference)
    {
        $db = Db::getInstance();
        $sql = new DbQueryCore();
        $sql->select('id_product')
                ->from('product')
                ->where("reference='" . pSQL($reference) . "'" );
        $value = $db->getValue($sql);
        if ($value===false) {
            return null;
        } else {
            $product = new ProductCore($value);
            return $product;
        }
    }
    
    static function getAttributeGroups()
    {  
        $attrGroups = AttributeGroupCore::getAttributesGroups($this->_lang);
        return self::createOptionListFromAssociatedArray($attrGroups, 'id_attribute_group', 'name');
        
    }
    
    static function getFeatures()
    {
        $features = FeatureCore::getFeatures(Context::getContext()->language->id);
        return self::createOptionListFromAssociatedArray($features, 'id_feature', 'name');
    }
}
