<?php
/**
 * 2017 mpSOFT
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 *  @author    mpSOFT <info@mpsoft.it>
 *  @copyright 2017 mpSOFT Massimiliano Palermo
 *  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of mpSOFT
 */

if (!defined('MP_MANAGEPRODUCTS_CLASSES_')) {
    define('MP_MANAGEPRODUCTS_CLASSES_', _PS_MODULE_DIR_ 
            . DIRECTORY_SEPARATOR . 'mpmanageproducts'
            . DIRECTORY_SEPARATOR . 'classes' . DIRECTORY_SEPARATOR);
}

if(!class_exists('DebugMessage')) {
    require_once MP_MANAGEPRODUCTS_CLASSES_ . "DebugMessage.php";
}

if(!class_exists('MpUtils')) {
    require_once MP_MANAGEPRODUCTS_CLASSES_ . "MpUtils.php";
}

class AdminMpManageProductsController extends ModuleAdminControllerCore {
    private $_lang;
    private $display_messages;
    private $option_features;
    private $option_attribute_groups;
    //debug
    private $debug;
    
    public function __construct()
    {
        $this->bootstrap = true;
        $this->context = Context::getContext();
        $this->_lang = $this->context->language->id;
        $this->name = 'adminmpmanageproducts'; 

        parent::__construct();

        $this->display_messages = new DebugMessageList();
        $this->debug = true;
        $this->smarty = Context::getContext()->smarty;
    }
    
    public function initToolbar()
    {
        parent::initToolbar();
        unset($this->toolbar_btn['new']);
    }
    
    public function initContent()
    {
        parent::initContent();
        $this->initToolbar();
        
        $categories = new HelperTreeCategories('associated-categories-tree', $this->l('Categories tree'));
        $categories                
                ->setUseCheckBox(1);
        $category_tree = $categories->render(); // To show categires select with checkboxes as on product category association page
        $this->smarty->assign('category_tree',$category_tree);
        
        $msg = new DebugMessage();
        $msg->setName(__FUNCTION__);
        $msg->setStatus(true);
        $msg->setCall(debug_backtrace()[1]['function']);
        $msg->addOutput('input_list_features', $this->option_features);
        $msg->addOutput('input_list_attribute_groups', $this->option_attribute_groups);
        $this->display_messages->add($msg);
   
        if ($this->debug) {
            $this->messages = $this->display_messages->displayMessages();
        } else {
            $this->messages = [];
        }
        
        $form   =  $this->smarty->fetch(_PS_MODULE_DIR_ . 'mpmanageproducts/views/templates/admin/form_manage.tpl');
        $script =  $this->smarty->fetch(_PS_MODULE_DIR_ . 'mpmanageproducts/views/templates/admin/script.tpl');
        
        $this->smarty->assign('content', $form . $script . $this->messages);
    }
    
    public function setMedia() {
        parent::setMedia();
        $this->addJqueryUI('ui.tabs');
        $this->addJS('https://cdnjs.cloudflare.com/ajax/libs/riot/3.4.0/riot+compiler.min.js');
    }
    
    private function getCarriers()
    {
        $db = Db::getInstance();
        $query = new DbQueryCore();
        $query->select('DISTINCT carrier_name')
                ->from($this->config_tablename)
                ->orderBy('carrier_name');
        $result = $db->executeS($query);
        $carriers = [];
        $carriers['select'] = [
                'id' => 'select',
                'value' => $this->l('Please, select a carrier')
            ];
        foreach ($result as $carrier)
        {
            $carriers[$carrier['carrier_name']] = [
                'id' => $carrier['carrier_name'],
                'value' => $carrier['carrier_name']
            ];
        }
        return $carriers;
    }
    
    private function getOrderStateName($id)
    {
        
        $orderStateLang = new OrderStateCore((int)$id);
        $state = $orderStateLang->getFieldByLang('name', $this->_lang);
        
        $this->messages[]['getOrderStateLang'] = [
            'on' => true,
            'call' => debug_backtrace()[1]['function'],
            'param' => $id,
            'return' => $state
        ];
        
        return $state;
    }
    
    private function getCarrierImportName($id)
    {
        $carriersImport = [
            $this->l('Please select'),
            $this->l('Delivered'),
            $this->l('Shipped')
        ];
        
        return $carriersImport[(int)$id];
    }
    
    public function getOrderStateByReference($order_reference)
    {
        $db = Db::getInstance();
        $sql = new DbQueryCore();
        $sql->select('current_state')
                ->from('orders')
                ->where('reference = \'' . pSQL($order_reference) . '\'');
        try {
            $value = $db->getValue($sql);
            $this->messages[]['getOrderStateByReference'] = [
                'on' => true,
                'call' => debug_backtrace()[1]['function'],
                'param' => $order_reference,
                'return' => 'order id: ' . $value,
                'sql' => (string)$sql
                ];
            return $value;
        } catch (Exception $ex) {
            $this->messages[]['getOrderStateByReference'] = [
                'on' => true,
                'call' => debug_backtrace()[1]['function'],
                'param' => $order_reference,
                'return' => 'error: ' . $ex->getMessage(),
                'sql' => (string)$sql
                ];
            return [];
        }
    }
    
    
    
    /**
     * Conver an array to <option> tag
     * @param array $array array of options
     * @return string option list
     */
    private function explode($array)
    {
        $items = [];
        if (is_array($array)) {
            foreach ($array as $item)
            {
                if (!empty($item)) {
                    $items[] = "<option value='" . $item . "'>" . $item . "</option>";
                }
            }
        } elseif (!empty($array)) {
            $items[] = "<option value='" . $array . "'>" . $array . "</option>";
        } else {
            return "--";
        }
        if (!empty($items)) {
            return "<select>" . implode(" ", $items) . "</select>";
        } else {
            return "--";
        } 
    }
    
    /**
     * Create an indexed array from array values or single string
     * @param mixed $array array or value
     * @return array indexed array
     */
    private function createArray($array)
    {
        $items = [];
        if (is_array($array)) {
            foreach ($array as $item)
            {
                if (!empty($item)) {
                    $items[] = $item;
                }
            }
        } elseif (!empty($array)) {
            $items[] = $array;
        } else {
            return [];
        }
        
        return $items;
    }
    
    
    
    private function productUpdate(ProductCore &$product, $productList)
    {
        $error = false;
        //import image
        if (!empty($productList['image_path'])) {
            $imagePath = $productList['image_path'];
            $chunks = explode(".",$imagePath);
            $format = end($chunks);
            
            if ($this->current_switch_import_image==1) {
                $image = new ImageCore();
                $image->cover=false;
                $image->force_id=false;
                $image->id=0;
                $image->id_image=0;
                $image->id_product = $product->id;
                $image->image_format = $format;
                $image->legend = $productList['product'];
                $image->position=0;
                $image->source_index='';
                $image->add();

                $imageTargetFolder = _PS_PROD_IMG_DIR_ . ImageCore::getImgFolderStatic($image->id);
                if (!file_exists($imageTargetFolder)) {
                    mkdir($imageTargetFolder, 0777, true);
                }
                $target = $imageTargetFolder . $image->id . '.' . $image->image_format;
                $copy = copy($imagePath, $target);
            }
        }
            
        //Update product fields
        
        if (!empty($productList['product'])) {
            $product->name[$this->_lang] = $productList['product'];
        }
        if ($this->current_manufacturer>0) {
            $product->id_manufacturer = $this->current_manufacturer;
        }
        if ($this->current_supplier>0) {
            $product->id_supplier = $this->current_supplier;
        }
        
        $this->messages[]['productUpdate CHECK OBJECT'] = [
            'on' => false,
            'call' => debug_backtrace()[1]['function'],
            'product' => htmlentities(print_r($product, 1)),
        ];
        
        try {
            $this->messages[]['productUpdate CALL $product->update'] = [
                'on' => true,
                'call' => debug_backtrace()[1]['function'],
                'product reference' => $product->reference,
                'product name' => $product->name,
                'product manufacturer' => $product->id_manufacturer,
                'product supplier' => $product->id_supplier,
                'status' => 'updating...'
            ];
            $product->update();
        } catch (Exception $exc) {
            $error = true;
            $this->messages[]['productUpdate -ERROR-'] = [
                'on' => true,
                'call' => debug_backtrace()[1]['function'],
                'product reference' => $product->reference,
                'product import reference' => $productList['product_id'],
                'error' => $exc->getMessage(),
                'product name' => $product->name,
                'getProductName' => $product->getProductName($product->id),
                'stack' => $exc->getTraceAsString(),
                //'product' => htmlentities(print_r($product, 1))
            ];      
        }
        
        //Update Attributes
        if ($this->current_color_attribute_group>0) {
            $this->updateAttribute($product, $productList, $this->current_color_attribute_group, true);
        }
        
        //Update product supplier
        if ($this->current_supplier>0) {
            $product_attributes = $product->getProductAttributesIds($product->id);
            if (is_array($product_attributes)) {
               foreach($product_attributes as $product_attribute_row_id) 
               {
                   $this->messages[]['productUpdate SUPPLIER'] = [
                       'on' => true,
                       'product attribute' => htmlentities(print_r($product_attribute_row_id, 1))
                   ];
                   $prod_suppliers = $this->getProductSuppliers($product->id,$product_attribute_row_id['id_product_attribute']);
                   if(is_array($prod_suppliers)) {
                       foreach($prod_suppliers as $prod_supplier_row_id)
                       {
                           $prod_supplier = new ProductSupplierCore($prod_supplier_row_id['id_product_supplier']);
                           $prod_supplier->id_supplier = $this->current_supplier;
                           $prod_supplier->product_supplier_reference = $product->reference;
                           try {
                               $prod_supplier->update();
                           } catch (Exception $exc) {
                               $this->messages[]['productUpdate SUPPLIERS'] = [
                                   'on' => true,
                                   'error' => $exc->getMessage(),
                               ];
                           }
                        }
                   }
               }
            }
        }
        
        //Messages
        $this->messages[]['productUpdate SUMMARY'] = [
            'on' => true,
            'call' => debug_backtrace()[1]['function'],
            'status' => $error==true?'ERROR DURING UPDATE':'UPDATE OK',
            'params' => [
                'product reference' => htmlentities($product->reference),
                'product import reference' => htmlentities($productList['product_id'])],
            'copy' => isset($copy)?$copy:'not set',
            'image copy' => $this->current_switch_import_image==1?'enabled':'disabled',
            'target' => isset($target)?$target:'not set',
            '$image' => isset($image)?htmlentities($image->legend):'not set'
            ];
    }
    
    private function productInsert($productList)
    {
        return $productList;
    }
    
    
    
    private function updateAttribute(&$product, &$productList, $attribute_group_id, $isColor = false)
    {
        if( $isColor) {
            $color = '';
            $colors = $productList['arr_colori'];
            if(is_array($colors)) {
                $color = $colors[0];
            } elseif ($colors!='--') {
                $color = $colors;
            }
            
            if (!empty($color)) {
                $row = $this->getAttributeByName($attribute_group_id,$color);
                if (!empty($row)) {
                    $id_attribute = $row['id_attribute'];
                    $color_html   = $row['color'];
                    $position     = $row['position'];
                } else {
                    $id_attribute = 0;
                    $color_html = '';
                    $position = -1;
                }
                
                $this->messages[]['updateAttribute'] = [
                    'on' => true,
                    'product' => $productList['product_id'],
                    'attribute_name' => $color,
                    'attribute_id' => $id_attribute!=0?$id_attribute:'not found',
                    'color' => $color_html!=''?$color_html:'not found',
                    'position' => $position!=-1?$position:'not found',
                ];
            }
        }
        $attrGrp = new AttributeGroupCore($attribute_group_id);
        $attr = new AttributeCore();
    }
    
    /**
     * Get id attribute looking for attribute name
     * @param int $attribute_group_id 
     * @param string $attribute_name
     * @return array associated array [id_attribute,color,position]
     */
    private function getAttributeByName($attribute_group_id, $attribute_name)
    {
        $db = Db::getInstance();
        $sql = new DbQueryCore();
        $sql->select('a.id_attribute')
                ->select('a.color')
                ->select('a.position')
                ->from('attribute','a')
                ->innerJoin('attribute_lang','al','al.id_attribute=a.id_attribute')
                ->where('al.id_lang='. (int)$this->_lang)
                ->where('al.name like \'%' . pSQL($attribute_name) . '%\'')
                ->where('a.id_attribute_group=' . pSQL($attribute_group_id));
        return $db->getRow($sql);
    }
    
    private function getProductSuppliers($product_id,$product_attribute_id)
    {
        $db = Db::getInstance();
        $sql = new DbQueryCore();
        $sql->select('id_product_supplier')
                ->from('product_supplier')
                ->where('id_product='. (int)$product_id)
                ->where('id_product_attribute=' . (int)$product_attribute_id);
        $result = $db->executeS($sql);
        $this->messages[]['getProductSuppliers'] = [
            'on' => true,
            'result' => htmlentities(print_r($result, 1)),
            'product id' => $product_id,
            'product_attribute_id' => $product_attribute_id,
        ];
        return $result;
    }
}
