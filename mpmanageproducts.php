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

if (!defined('_PS_VERSION_')) {
    exit;
}

if (!defined('MP_MANAGEPRODUCTS_CLASSES_')) {
    define('MP_MANAGEPRODUCTS_CLASSES_', _PS_MODULE_DIR_ 
            . DIRECTORY_SEPARATOR . 'mpmanageproducts'
            . DIRECTORY_SEPARATOR . 'classes' . DIRECTORY_SEPARATOR);
}

if(!class_exists('DebugMessage')) {
    require_once MP_MANAGEPRODUCTS_CLASSES_ . "DebugMessage.php";
}

class MpManageProducts extends Module
{
    private $debug;
    private $messages;
    private $url;
    private $user;
    private $password;
    private $json_string;
    private $filename;
    private $excel_filename;
    protected $_lang;
    
    public function __construct()
    {
        $this->name = 'mpmanageproducts';
        $this->tab = 'administration';
        $this->version = '1.0.0';
        $this->author = 'mpsoft';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_); 
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('MP Manage products');
        $this->description = $this->l('Manage products for mass operations.');
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
        $this->_lang = ContextCore::getContext()->language->id;
        
        //field values
        $this->url = '';
        $this->user = '';
        $this->password = '';
        $this->json_string = '';
        $this->messages = new DebugMessageList();
        $this->debug = true;
    }
  
    public function install()
    {
        if (Shop::isFeatureActive()) {
            Shop::setContext(Shop::CONTEXT_ALL);
        }

        if (!parent::install() ||
            !$this->installTab()) {
            return false;
        }
            return true;
      }
      
    public function uninstall()
    {
      if (!parent::uninstall()) {
        return false;
      }
      return true;
    }
    
    public function installTab()
    {
            $tab = new Tab();
            $tab->active = 1;
            $tab->class_name = 'AdminMpManageProducts';
            $tab->name = array();
            foreach (Language::getLanguages(true) as $lang)
            {
                $tab->name[$lang['id_lang']] = 'MP Manage products';
            }
            $tab->id_parent = (int)Tab::getIdFromClassName('AdminCatalog');
            $tab->module = $this->name;
            return $tab->add();
    }

    public function uninstallTab()
    {
            $id_tab = (int)Tab::getIdFromClassName('AdminMpManageProducts');
            if ($id_tab)
            {
                $tab = new Tab($id_tab);
                return $tab->delete();
            }
            else
            {
                return false;
            }
    }
}