{*
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
*}
<style>
    .label-br
    {
        display: block;
        margin-bottom: 16px !important;
    }
    .table tbody tr:nth-child(odd) td
    {
        background-color: #FAFDFF !important;
    }
    .table tbody tr td
    {
        border: thin solid #EEEEEE;
    }
    .config-buttons:hover
    {
        color: #00aff0 !important;
    }
    a:hover
    {
        color: #0083c4;
        text-decoration: #0083c4;
        cursor: pointer;
    }
    i:hover
    {
        color: #0083c4;
        text-decoration: #0083c4;
        cursor: pointer;
    }
    .overlay
    {
        opacity:1;
        background-color:#ccc;
        position:fixed;
        width:100%;
        height:100%;
        top: 0;
        left: 0;
        z-index:1000;
        display: none;
        overflow-y: auto;
    }
    
    .inner-overlay 
    {
        display: block;
        margin: 0 auto;
        width: 80%;
        opacity: 1;
        position: relative;
        top: 50px;
        max-height: 80%;
        height: 80%;
    }
</style>

<div class="overlay" id="form_edit_row">
    <div class="inner-overlay">
        <div class='panel' id='panel-config'>
            <div class='panel-heading' style='overflow: hidden; height: auto !important;'>
                <img src='../modules/mpmanageproducts/views/img/config.png' alt='Config'>
                {l s='Edit combination Row' mod='mpmanageproducts'}
                <i class='icon-bookmark' style='margin: 20px; margin-right: 5px;'></i>
                <span id='span_product_name' style='color: #0083c4;'></span>               
                
                <i class='icon-code-fork' style='margin: 20px; margin-right: 5px;'></i>
                <span id='span_combination' style='color: #0083c4;'></span>
            </div> 
            <label class="control-label col-lg-2" >{l s='Row' mod='mpmanageproducts'}</label>
            <input type="text" id="row_index" value="" class="width-xl" readonly="readonly">
            <br>
            <label class="control-label col-lg-2" >{l s='Reference' mod='mpmanageproducts'}</label>
            <input type="text" id="row_reference" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='Supplier referenece' mod='mpmanageproducts'}</label>
            <input type="text" id="row_supplier_reference" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='Location' mod='mpmanageproducts'}</label>
            <input type="text" id="row_location" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='EAN13' mod='mpmanageproducts'}</label>
            <input type="text" id="row_ean_13" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='UPC' mod='mpmanageproducts'}</label>
            <input type="text" id="row_upc" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='Wholesale price' mod='mpmanageproducts'}</label>
            <input type="text" id="row_wholesale_price" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='Price' mod='mpmanageproducts'}</label>
            <input type="text" id="row_price" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='Ecotax' mod='mpmanageproducts'}</label>
            <input type="text" id="row_ecotax" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='Quantity' mod='mpmanageproducts'}</label>
            <input type="text" id="row_quantity" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='Weight' mod='mpmanageproducts'}</label>
            <input type="text" id="row_weight" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='Unit price' mod='mpmanageproducts'}</label>
            <input type="text" id="row_unit_price" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='Minimum quantity' mod='mpmanageproducts'}</label>
            <input type="text" id="row_min_quantity" value="" class="width-xl" >
            <br>
            <label class="control-label col-lg-2" >{l s='Available from' mod='mpmanageproducts'}</label>
            <input type="text" id="row_available" value="" class="width-xl" >
            <br>
            <div class='form-group'>
                <label class="control-label col-lg-2 "><span>{l s='Default ON' mod='mpmanageproduct'}</span></label>
                <div class="col-lg-9">
                    <input type='hidden' id='row_default' value='1'>
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" value="1" name="switch_default" id="switch_default_on" checked="checked" onclick='set_row_default_on(this);'>
                        <label for="switch_default_on">{l s='YES' mod='mpmanageproduct'}</label>
                        <input type="radio" value="0" name="switch_default" id="switch_default_off" onclick='set_row_default_off(this);'>
                        <label for="switch_default_off">{l s='NO' mod='mpmanageproduct'}</label>
                        <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <br>
            <div class='form-group'>
                <label class="control-label col-lg-2 "><span>{l s='Prices include Taxes?' mod='mpmanageproduct'}</span></label>
                <div class="col-lg-9">
                    <input type='hidden' id='row_price_tax' value='1'>
                    <span class="switch prestashop-switch fixed-width-lg">
                        <input type="radio" value="1" name="switch_price_tax" id="switch_price_tax_on" checked="checked" onclick='set_row_default_on(this);'>
                        <label for="switch_price_tax_on">{l s='YES' mod='mpmanageproduct'}</label>
                        <input type="radio" value="0" name="switch_price_tax" id="switch_price_tax_off" onclick='set_row_default_off(this);'>
                        <label for="switch_price_tax_off">{l s='NO' mod='mpmanageproduct'}</label>
                        <a class="slide-button btn"></a>
                    </span>
                </div>
            </div>
            <br style='clear: both;'>
            <br>
            <div class='panel-footer'>
                <button type="button" value="1" id="submit_row_save" class="btn btn-default pull-right" onclick="saveRow();">
                    <i class="process-icon-save"></i> 
                    {l s='Save' mod='mpmanageproducts'}
                </button> 
                <button type="button" value="1" id="submit_row_cancel" class="btn btn-default pull-right" onclick="$('#form_edit_row').fadeOut();">
                    <i class="process-icon-cancel"></i> 
                    {l s='Cancel' mod='mpmanageproducts'}
                </button> 
            </div>
        </div>
            
    </div>
</div>

<form class='defaultForm form-horizontal' method='post' id="form_manage_products">
    <div class='panel' id='panel-config'>
        <div class='panel-heading'>
            <img src='../modules/mpmanageproducts/views/img/config.png' alt='Config'>
            {l s='Configuration section' mod='mpmanageproducts'}
        </div>  
        <div class="form-wrapper">
            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1"><i class="icon-files-o"></i> {l s='Product by category' mod='mpmanageproducts'}</a></li>
                    <li><a href="#tabs-2"><i class="icon-dollar"></i> {l s='Product discount' mod='mpmanageproducts'}</a></li>
                    <li><a href="#tabs-3"><i class="icon-asterisk"></i> {l s='Product attributes' mod='mpmanageproducts'}</a></li>
                </ul>
                <div id="tabs-1">
                    <!-- ******************************
                         ** GET PRODUCTS BY CATEGORY **
                         ****************************** -->
                    <div class="form-wrapper">
                        <div class="form-group" id="div_tree_categories">
                            <p class='panel-heading' style="margin-top: 20px;">
                                <img src='../modules/mpmanageproducts/views/img/category.png' alt='Config'>
                                {l s='Product Categories' mod='mpmanageproducts'}
                            </p>  
                            {$category_tree}
                            <br>
                            <div>
                                <div style="display: table;">
                                    <div style="display: table-cell; vertical-align: middle;">
                                        <label class="control-label label-br" >{l s='Category' mod='mpmanageproducts'}</label>
                                        <input type="text" id="input_category" value="" class="width-xl" style="display: inline-block">
                                    </div>

                                    <div style="display: table-cell; vertical-align: middle; padding-left: 10px;">
                                        <input type="checkbox" id="input_check_category_by_id" value="0" style="display: inline-block">
                                        <label class="control-label label-br" style="display: inline-block">{l s='Search by id' mod='mpmanageproducts'}</label>
                                        <br>
                                        <input type="checkbox" id="input_check_category_clear" value="0" style="display: inline-block">
                                        <label class="control-label label-br" style="display: inline-block">{l s='New research' mod='mpmanageproducts'}</label>
                                    </div>

                                    <div style="display: table-cell; vertical-align: middle; padding-left: 10px;">
                                        <button type="button" value="1" id="submit_find_category" id="find_product" name="find_product" class="btn btn-default">
                                            <i class="icon-search"></i> 
                                            {l s='Find' mod='mpmanageproducts'}
                                        </button> 
                                    </div>
                                </div>
                            </div>    
                            <br style="clear: both;">
                            <label class="control-label label-br">{l s='Product associated' mod='mpmanageproducts'}</label>
                            <br>
                            <div style="float: left; margin-right: 10px;">
                                <select size="10" style='width: 300px;' id="input_list_products">

                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tabs-2">
                    <!-- ***********************
                         ** PRODUCT DISCOUNTS **
                         *********************** -->
                    <div class="form-wrapper">
                        <div class="form-group">
                            <p class='panel-heading' style="margin-top: 20px;">
                                <img src='../modules/mpmanageproducts/views/img/discount.png' alt='Config'>
                                {l s='Product discounts' mod='mpmanageproducts'}
                            </p>
                            <div id="tabs-discounts">
                                <ul>
                                    <li><a href="#tabs-discounts-1"><i class='icon-table'></i> {l s='Manage Discounts' mod='mpmanageproducts'}</a></li>
                                    <li><a href="#tabs-discounts-2"><i class='icon-plus-circle'></i> {l s='Add new discounts' mod='mpmanageproducts'}</a></li>                  
                                </ul>
                                <div id="tabs-discounts-1">
                                    <div>
                                        <p id='total_discounts_rows'>{l s='Total rows:' mod='mpmanageproducts'}</p>
                                        <table class='table' id='table_discounts' style='display: block; overflow-y: auto; height: 25em;'>
                                            <thead>
                                                <tr>
                                                    <th>id</th>
                                                    <th>{l s='id Product' mod='mpmanageproducts'}</th>
                                                    <th>{l s='Product' mod='mpmanageproducts'}</th>
                                                    <th>{l s='Discount' mod='mpmanageproducts'}</th>
                                                    <th>{l s='Type' mod='mpmanageproducts'}</th>
                                                    <th>{l s='From' mod='mpmanageproducts'}</th>
                                                    <th>{l s='To' mod='mpmanageproducts'}</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>

                                    <p class='panel-heading' style="margin-top: 20px;">
                                        <img src='../modules/mpmanageproducts/views/img/table.png' alt='table'>
                                        {l s='Discount Filters' mod='mpmanageproducts'}
                                    </p>  

                                    <div>
                                        <div style="float: left; margin-right: 20px;">
                                            <table class="table" id="table_discounts_values">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>{l s='Values' mod='mpmanageproducts'}</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="float: left; margin-right: 20px;">
                                            <table class="table" id="table_discounts_types">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>{l s='Types' mod='mpmanageproducts'}</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <br style='clear: both;'>
                                    
                                    <p class='panel-heading' style="margin-top: 20px;">
                                        <img src='../modules/mpmanageproducts/views/img/tools.png' alt='table'>
                                        {l s='Manage options' mod='mpmanageproducts'}
                                    </p>  
                                    
                                    <div>
                                        <button type="button" value="1" id="submit_check_all_discount" name="submit_check_all_discount" class="btn btn-default">
                                            <i class="icon-check"></i> 
                                            {l s='Check all' mod='mpmanageproducts'}
                                        </button> 
                                        <button type="button" value="1" id="submit_uncheck_all_discount" name="submit_uncheck_all_discount" class="btn btn-default">
                                            <i class="icon-check-empty"></i> 
                                            {l s='Uncheck all' mod='mpmanageproducts'}
                                        </button> 
                                        <button type="button" value="1" id="submit_delete_discounts" name="submit_delete_discounts" class="btn btn-default">
                                            <i class="icon-trash"></i> 
                                            {l s='Delete selected' mod='mpmanageproducts'}
                                        </button> 
                                    </div>
                                </div>
                                <div id="tabs-discounts-2">
                                    <!-- ************************
                                         *** ADD DISCOUNT TAB ***
                                         ************************
                                    -->
                                    <div>
                                        <label class="control-label label-br">{l s='Price' mod='mpmanageproducts'}</label>
                                        <input type="text" id="input_discount_price" value="" style='width: 200px; text-align: right;'>
                                        <br>
                                        <label class="control-label label-br">{l s='Minimum quantity' mod='mpmanageproducts'}</label>
                                        <input type="text" id="input_discount_quantity" value="" style='width: 200px; text-align: right;'>
                                        <br>
                                        <label class="control-label label-br">{l s='Reduction' mod='mpmanageproducts'}</label>
                                        <input type="text" id="input_discount_reduction" value="" style='width: 200px; text-align: right;'>
                                        <br>
                                        <label class="control-label label-br">{l s='Tax' mod='mpmanageproducts'}</label>
                                        <select id="input_discount_tax" style='width: auto;'>
                                            <option value='1'>{l s='Included' mod='mpmanageproducts'}</option>
                                            <option value='0'>{l s='Excluded' mod='mpmanageproducts'}</option>
                                        </select>
                                        <br>
                                        <label class="control-label label-br">{l s='Reduction type' mod='mpmanageproducts'}</label>
                                        <select id="input_discount_reduction_type" style='width: auto;'>
                                            <option value='percentage'>{l s='Percentage' mod='mpmanageproducts'}</option>
                                            <option value='amount'>{l s='Amount' mod='mpmanageproducts'}</option>
                                        </select>
                                        <br>
                                        <label class="control-label label-br">{l s='From date' mod='mpmanageproducts'}</label>
                                        <input type="text" readonly='readonly' id="input_discount_from" value="" style='width: 200px; text-align: center;'>
                                        <br>
                                        <label class="control-label label-br">{l s='To date' mod='mpmanageproducts'}</label>
                                        <input type="text" readonly='readonly' id="input_discount_to" value="" style='width: 200px; text-align: center;'>
                                        <br>
                                    </div>
                                    <!-- **************************
                                         *** TABLE LIST PRODUCT ***
                                        ***************************
                                    -->
                                    <p class='panel-heading' style="margin-top: 20px;">
                                        <img src='../modules/mpmanageproducts/views/img/table.png' alt='table'>
                                        {l s='Discount options' mod='mpmanageproducts'}
                                    </p>            
                                                
                                    <div style="float: left; margin-right: 20px;">
                                        <table class="table" id="table_discounts_products" style='display: block; overflow-y: auto; height: 10em;'>
                                            <thead>
                                                <tr>
                                                    <th style='text-align: right;'><input type='checkbox' id='input_checkbox_discount_products'></th>
                                                    <th>{l s='Types' mod='mpmanageproducts'}</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div> 
                                    <br style='clear: both;'>
                                                
                                    <p class='panel-heading' style="margin-top: 20px;">
                                        <img src='../modules/mpmanageproducts/views/img/tools.png' alt='table'>
                                        {l s='Discount options' mod='mpmanageproducts'}
                                    </p>  
                                    
                                    <div>
                                        <button type="button" value="1" id="submit_add_discount" name="submit_addl_discount" class="btn btn-default">
                                            <i class="icon-plus-sign"></i> 
                                            {l s='Add discount' mod='mpmanageproducts'}
                                        </button> 
                                    </div>    
                                </div>
                            </div>        
                        </div>
                                    
                    </div>
                </div>
                <div id="tabs-3">
                    <!-- *********************************
                         ** ATTRIBUTE COMBINATION ITEMS **
                         ********************************* -->
                    <div class="form-wrapper">
                        <div class="form-group">
                            <div id="tabs-combinations">
                                <ul>
                                    <li><a href="#tabs-combinations-1"><i class='icon-table'></i> {l s='Manage Combinations' mod='mpmanageproducts'}</a></li>
                                    <li><a href="#tabs-combinations-2"><i class='icon-plus-circle'></i> {l s='Add new combinations' mod='mpmanageproducts'}</a></li>                  
                                </ul>
                                <div id="tabs-combinations-1">
                                    <!-- ***************************
                                         *** MANAGE COMBINATIONS ***
                                         ***************************
                                    -->
                                    <div>
                                        <p class='panel-heading' style="margin-top: 20px;">
                                            <img src='../modules/mpmanageproducts/views/img/attribute.png' alt='Config'>
                                            {l s='Product combinations' mod='mpmanageproducts'}
                                        </p>
                                        <br>
                                        <p id='total_combinations_rows'>{l s='Total rows:' mod='mpmanageproducts'}</p>
                                        <table class='table' id='table_combinations' style='display: block; overflow-y: auto; height: 25em;'>
                                            <thead>
                                                <tr>
                                                    <th>id</th>
                                                    <th>{l s='Attribute' mod='mpmanageproducts'}</th>
                                                    <th>{l s='id Product' mod='mpmanageproducts'}</th>
                                                    <th>{l s='Product' mod='mpmanageproducts'}</th>
                                                    <th>{l s='Reference' mod='mpmanageproducts'}</th>
                                                    <th>{l s='EAN13' mod='mpmanageproducts'}</th>
                                                    <th>{l s='Price' mod='mpmanageproducts'}</th>
                                                    <th>{l s='Quantity' mod='mpmanageproducts'}</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                                        <div style="float: left; margin-right: 10px; border-right: 1px solid #eeeeee;">
                                            <p class='panel-heading' style="margin-top: 20px;">
                                                <img src='../modules/mpmanageproducts/views/img/table.png' alt='table'>
                                                {l s='Product List' mod='mpmanageproducts'}
                                            </p> 

                                            <div>
                                                <div style="float: left; margin-right: 20px;">
                                                    <table class="table" id="table_combinations_products" style='display: block; overflow-y: auto; height: 10em;'>
                                                        <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th>{l s='Products' mod='mpmanageproducts'}</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="float: left; padding-left: 10px;">
                                            <p class='panel-heading' style="margin-top: 20px;">
                                                <img src='../modules/mpmanageproducts/views/img/tools.png' alt='table'>
                                                {l s='Manage options' mod='mpmanageproducts'}
                                            </p>  

                                            <div>
                                                <button type="button" value="1" id="submit_check_all_combination" class="btn btn-default">
                                                    <i class="icon-check"></i> 
                                                    {l s='Check all' mod='mpmanageproducts'}
                                                </button> 
                                                <button type="button" value="1" id="submit_uncheck_all_combination" class="btn btn-default">
                                                    <i class="icon-check-empty"></i> 
                                                    {l s='Uncheck all' mod='mpmanageproducts'}
                                                </button> 
                                                <button type="button" value="1" id="submit_delete_combination" class="btn btn-default">
                                                    <i class="icon-trash"></i> 
                                                    {l s='Delete selected' mod='mpmanageproducts'}
                                                </button> 
                                            </div>
                                        </div>
                                    </div>
                                    <br style='clear: both;'>  
                                </div>
                                <br style='clear: both;'>    
                                <div id="tabs-combinations-2">
                                    <!-- ************************
                                         *** ADD COMBINATIONS ***
                                         ************************
                                    -->
                                    <div>
                                        <div style="display: inline-block; width: 32%; float: left; border-right: 1px solid #EEEEEE; padding-left: 10px;">
                                            <p class='panel-heading' style="margin-top: 20px;">
                                                <img src='../modules/mpmanageproducts/views/img/attribute.png' alt='Config'>
                                                {l s='Attribute list' mod='mpmanageproducts'}
                                                <select id="input_select_attribute" style="width: auto; display: inline-block; margin-left: 30px;">

                                                </select>
                                            <br>
                                            </p>
                                            <table class="table" id="table_list_attributes" style='display: block; overflow-y: auto; height: 20em; width: 98%;'>
                                                <thead>
                                                    <tr>
                                                        <th style='text-align: center;'><input type='checkbox' id='input_checkbox_list_attributes'></th>
                                                        <th style="display: none;"></th>
                                                        <th>{l s='Attribute' mod='mpmanageproducts'}</th>
                                                        <th style="display: none;"></th>
                                                        <th>{l s='Value' mod='mpmanageproducts'}</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                            <br>
                                            <div>
                                                <button type="button" value="1" id="submit_check_all_attribute_combination" name="submit_check_all_attribute_combination" class="btn btn-default">
                                                    <i class="icon-check"></i> 
                                                    {l s='Check all' mod='mpmanageproducts'}
                                                </button> 
                                                <button type="button" value="1" id="submit_uncheck_all_attribute_combination" name="submit_uncheck_all_attribute_combination" class="btn btn-default">
                                                    <i class="icon-check-empty"></i> 
                                                    {l s='Uncheck all' mod='mpmanageproducts'}
                                                </button> 
                                                <button type="button" value="1" id="submit_add_attribute_combination" name="submit_add_attribute_combination" class="btn btn-default">
                                                    <i class="icon-plus-circle"></i> 
                                                    {l s='Add selected' mod='mpmanageproducts'}
                                                </button>
                                            </div>
                                        </div>
                                        <div style="display: inline-block; width: 32%; float: left; border-right: 1px solid #EEEEEE; padding-left: 10px;">
                                            <p class='panel-heading' style="margin-top: 20px;">
                                                <img src='../modules/mpmanageproducts/views/img/attribute.png' alt='Config'>
                                                {l s='Attribute combinations' mod='mpmanageproducts'}
                                            </p>
                                            <table class="table" id="table_list_attribute_combinations" style='display: block; overflow-y: auto; height: 20em; width: 98%;'>
                                                <thead>
                                                    <tr>
                                                        <th style='text-align: right;'><input type='checkbox' id='input_checkbox_list_attribute_combination'></th>
                                                        <th>{l s='Attribute' mod='mpmanageproducts'}</th>
                                                        <th style="display: none;"></th>
                                                        <th>{l s='Value' mod='mpmanageproducts'}</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                            
                                        </div>
                                        <div style="display: inline-block; width: 32%; float: left; padding-left: 10px;">            
                                            <p class='panel-heading' style="margin-top: 20px;">
                                                <img src='../modules/mpmanageproducts/views/img/attribute.png' alt='Config'>
                                                {l s='List Products' mod='mpmanageproducts'}
                                            </p>
                                            <table class="table" id="table_list_products_combinations" style='display: block; overflow-y: auto; height: 20em; width: 98%;'>
                                                <thead>
                                                    <tr>
                                                        <th style='text-align: right;'><input type='checkbox' id='input_checkbox_product_combinations'></th>
                                                        <th>{l s='Product' mod='mpmanageproducts'}</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                            <br>
                                            <div>
                                                <button type="button" value="1" id="submit_clear_attribute_combination" class="btn btn-default">
                                                    <i class="icon-remove-circle"></i> 
                                                    {l s='Clear combinations' mod='mpmanageproducts'}
                                                </button>
                                                <button type="button" value="1" id="submit_create_combination" name="submit_create_combination" class="btn btn-default">
                                                    <i class="icon-code-fork"></i> 
                                                    {l s='Create combinations' mod='mpmanageproducts'}
                                                </button>
                                            </div>
                                        </div>
                                        <br style="clear: both;">
                                    </div>
                                    <br style="clear: both;">
                                    <div>
                                        <!--
                                        ***********************
                                        ** COMBINATION TABLE **
                                        ***********************
                                        -->
                                        <p class='panel-heading' style="margin-top: 20px;">
                                            <img src='../modules/mpmanageproducts/views/img/attribute.png' alt='Config'>
                                            {l s='list combinations' mod='mpmanageproducts'}
                                        </p>
                                        <table class="table" id="table_list_combinations" style='display: block; overflow-y: auto; height: 20em; width: 98%;'>
                                            <thead>
                                                <tr>
                                                    <th>combinations</th>
                                                    <th>id_product</th>
                                                    <th>reference</th>
                                                    <th>suppl ref</th>
                                                    <th>location</th>
                                                    <th>ean13</th>
                                                    <th>upc</th>
                                                    <th>wholesale_price</th>
                                                    <th>price</th>
                                                    <th>ecotax</th>
                                                    <th>qty</th>
                                                    <th>weight</th>
                                                    <th>unit_price</th>
                                                    <th>default_on</th>
                                                    <th>min_qty</th>
                                                    <th>available</th>
                                                    <th>tax included</th>
                                                    <th>actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                        <br>
                                        <div class='panel-footer'>
                                            <button type="button" value="1" id="submit_clear_table_list_combination" class="btn btn-default pull-right">
                                                <i class="process-icon-dropdown"></i> 
                                                {l s='Clear combinations' mod='mpmanageproducts'}
                                            </button>
                                            <button type="button" value="1" id="submit_save_table_list_combination" class="btn btn-default pull-right">
                                                <i class="process-icon-save"></i> 
                                                {l s='Save combinations' mod='mpmanageproducts'}
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    
        <div class='panel-footer'>
            
        </div>
                                
    </div>
</form>
                            
<script type="text/javascript">
    $(document).ready(function(){
        //DATEPICKER
        $("#input_discount_from").datepicker();
        $("#input_discount_from").datepicker("option","dateFormat","yy-mm-dd");
        $("#input_discount_to").datepicker();
        $("#input_discount_to").datepicker("option","dateFormat","yy-mm-dd");
        $("#row_available").datepicker();
        $("#row_available").datepicker("option","dateFormat","yy-mm-dd");
        
        //TABS
        $("#tabs").tabs();
        $("#tabs-discounts").tabs();
        $("#tabs-combinations").tabs();
        
        //Set Categories tree
        $('#associated-categories-tree').tree('expandAll').tree('collapseAll');
        
        //Manage Events
        $('#input_list_attribute_groups').on('change',function(){
            var id_attribute_group = $(this).val();
            $.ajax({
                method: 'POST',
                url   : '../modules/mpmanageproducts/ajax/getAttributes.php',
                data  : 
                    {
                        'id_attribute_group' : id_attribute_group
                    },
                success : function(response)
                    {
                        response = "<option value='0'>{l s='Please select' mod='mpmanageproducts'}</option>" + response;
                        $('#input_list_attributes').html(response);
                    }
            });
        });
        $("#check-all-associated-categories-tree").remove();
        $("#uncheck-all-associated-categories-tree").on('click',function(){
            console.log("unchecked");
        });
        $("#associated-categories-tree").on("click",function(){
            refreshTables();
        });
        $("#submit_find_category").on("click",function(){
            var checked = Number($("#input_check_category_by_id").is(":checked"));
            var value   = $("#input_category").val();
            $.ajax({
                method: 'POST',
                url   : '../modules/mpmanageproducts/ajax/getCategory.php',
                data  :
                        {
                            'category': value,
                            'checked' : checked
                        },
                success: function(response)
                        {
                            $("#input_list_products").html();
                            var obj = JSON.parse(response);
                            var arr = new Array();
                            obj.forEach(function(index,item){
                                arr.push(index.id_category);
                            });
                            console.log("array length: " + arr.length);
                            
                            if($("#input_check_category_clear").is(":checked")) {
                                $("input[name='categoryBox[]']").prop("checked",false);
                            }
                            
                            for(var i=0;i<arr.length;i++)
                            {
                                var currIdx = arr[i];
                                $("input[name='categoryBox[]']").each(function(){
                                    if(this.value===currIdx) {
                                        $(this).prop("checked",true);
                                        return;
                                    }
                                });
                            }
                            refreshTables();
                        }
            });
        });
        $("#submit_check_all_discount").on("click",function(){
            checkSelectAll($("#table_discounts tbody tr input[type='checkbox']"));
        });
        $("#submit_uncheck_all_discount").on("click",function(){
            uncheckSelectAll($("#table_discounts tbody tr input[type='checkbox']"));
        });
        $("#submit_delete_discounts").on("click",function(){
            var checkboxes = getCheckBoxesFromTable('table_discounts');
            deleteFromTable('specific_price','id_specific_price',checkboxes);
        });
        
        $("#submit_check_all_combination").on("click",function(){
            checkSelectAll($("#table_combinations tbody tr input[type='checkbox']"));
        });
        $("#submit_uncheck_all_combination").on("click",function(){
            uncheckSelectAll($("#table_combinations tbody tr input[type='checkbox']"));
        });
        $("#submit_delete_combination").on("click",function(){
            var checkboxes = getCheckBoxesFromTable('table_combinations');
            deleteCombinationsByID(checkboxes);
            //deleteFromTable('product_attribute','id_product_attribute',checkboxes,true);
        });
        
        $("#submit_add_discount").on("click",function(){
            if(confirm("{l s='This operation will add discounts for all product selected. Are you sure?' mod='mpmanageproducts'}")) {
                addDiscount();
            }
        });
        $("#input_checkbox_discount_products").on("click",function(){
            if($(this).is(":checked")) {
                checkSelectAll($("#table_discounts_products tbody tr input[type='checkbox']"));
            } else {
                uncheckSelectAll($("#table_discounts_products tbody tr input[type='checkbox']"));
            }
        });
        
        $("#submit_check_all_attribute_combination").on("click",function(){
            checkSelectAll($("#table_list_attributes tbody tr input[type='checkbox']"));
        });
        $("#submit_uncheck_all_attribute_combination").on("click",function(){
            uncheckSelectAll($("#table_list_attributes tbody tr input[type='checkbox']"));
        });
        $("#submit_add_attribute_combination").on("click",function(){
            var checkboxes = $("#table_list_attributes >tbody input[type='checkbox']:checked");
            addCombinations(checkboxes);
        });
        $("#submit_clear_attribute_combination").on("click",function(){
            clearTable('table_list_attribute_combinations');
            listAttributes();
        });
        
        $("#input_select_attribute").on("change",function(){
            $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/getAttributesList.php',
            data  :
                    {
                        'id_attribute_group' : this.value
                    },
            success: function(response)
                    {
                        $("#table_list_attributes tbody").html("");
                        $("#table_list_attributes tbody").html(response);
                    }
            });
        });
        
        $("#submit_create_combination").on("click",function(){
            var checkboxes = $("#table_list_attribute_combinations >tbody input[type='checkbox']:checked");
            var id_products = $("#table_list_products_combinations >tbody input[type='checkbox']:checked");
            var combinations = new Array(); //The length of array determines the combinations
            var cartesian = new Array();
            var list_attributes = new Array();
            
            $("#table_list_combinations tbody").html("");
            
            $(checkboxes).each(function(){ //Get unique id_attribute_group
                var row = $(this).parent().parent();
                var id_attribute_group = $(row).find("td:nth-child(2)").text();
                if(!isInArray(id_attribute_group,combinations)) {
                    combinations.push(id_attribute_group);
                }                
            });
            
            $(combinations).each(function(){ //divide values by array
                var id = Number(this);
                var subArray = new Array();
                $(checkboxes).each(function(){
                    var attrGroup = Number(this.value);
                    if(attrGroup===id) {
                        var attrValue = $(this).attr('id_attribute');
                        subArray.push(attrValue);
                    }
                });
                cartesian.push(subArray);
            });
            
            //Combine arrays
            list_attributes = cartesian_combination(cartesian);
            
            //Send Arrays to new Table combination row
            $(list_attributes).each(function(){
                addCombinationRow(this,id_products);
            });
        });
        
        $("#input_checkbox_list_attributes").on("click",function(){
            checkTable(
                $(this).is(":checked"),
                $("#table_list_attributes >tbody input[type='checkbox']"),
                'table_list_attributes');
        });
        
        $("#input_checkbox_product_combinations").on("click",function(){
            checkTable(
                $(this).is(":checked"),
                $("#table_list_products_combinations >tbody input[type='checkbox']"),
                'table_list_product_combinations');
        });
        
        $("#input_checkbox_list_attribute_combination").on("click",function(){
            checkTable(
                $(this).is(":checked"),
                $("#table_list_attribute_combinations >tbody input[type='checkbox']"),
                'table_list_attribute_combination');
        });
        
        $("#submit_clear_table_list_combination").on("click",function(){
            clearTable('table_list_combinations');
        });
        
        $("#submit_save_table_list_combination").on("click",function(){
            
            var rows = new Array();
            $("#table_list_combinations >tbody tr").each(function(){
                var row = new Array();
                row.push($(this).find("td:nth-child(1)").text()); // attributes
                row.push($(this).find("td:nth-child(2)").text()); // products
                row.push($(this).find("td:nth-child(3)").text()); // reference
                row.push($(this).find("td:nth-child(4)").text()); // supplier reference
                row.push($(this).find("td:nth-child(5)").text()); // location
                row.push($(this).find("td:nth-child(6)").text()); // ean13
                row.push($(this).find("td:nth-child(7)").text()); // upc
                row.push($(this).find("td:nth-child(8)").text()); // wholesale price
                row.push($(this).find("td:nth-child(9)").text()); // price
                row.push($(this).find("td:nth-child(10)").text()); // ecotax
                row.push($(this).find("td:nth-child(11)").text()); // quantity
                row.push($(this).find("td:nth-child(12)").text()); // weight
                row.push($(this).find("td:nth-child(13)").text()); // unit price
                row.push($(this).find("td:nth-child(14)").text()); // default on
                row.push($(this).find("td:nth-child(15)").text()); // min quantity
                row.push($(this).find("td:nth-child(16)").text()); // available
                row.push($(this).find("td:nth-child(17)").text()); // price included tax
                
                rows.push(row);
            });
            
            $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/addCombinations.php',
            data  :
                    {
                        'rows' : rows
                    },
            success: function(response)
                    {
                        alert(response);
                        $("#table_list_combinations >tbody").html("");
                    }
            });
        });
        
        $(document).on("dblclick", "#table_list_combinations tbody tr td", function(){
            editRow(this);
        });
    });
    
    // *****************
    // *** FUNCTIONS ***
    // *****************
    
    function set_row_default_on(elem)
    {
        var input = $(elem).parent().prev();
        $(input).val("1");
    }
    
    function set_row_default_off(elem)
    {
        var input = $(elem).parent().prev();
        $(input).val("0");
    }
    
    function switch_change(elem)
    {
        var switch_on  = String(elem).replace("row","switch") + "_on";
        var switch_off = String(elem).replace("row","switch") + "_off";
        
        console.log("switch id: " + elem);
        console.log("switch value: " + $("#" + elem).val());
        console.log("on value : " + switch_on);
        console.log("off value: " + switch_off);
        
        $("#" + switch_on).removeAttr("checked");
        $("#" + switch_off).removeAttr("checked");
        if($("#" + elem).val()==1) {
            $("#" + switch_on).attr("checked",true);
        } else {
            $("#" + switch_off).attr("checked",true);
        }
    }
    
    function checkTable(checked,checkbox,tablename)
    {
        console.log("checktable: " + tablename);
        console.log(checkbox);
        if(checked) {
            checkSelectAll($("#" + tablename + " tbody tr input[type='checkbox']"));
        } else {
            uncheckSelectAll($("#" + tablename + " tbody tr input[type='checkbox']"));
        }
    }
    
    function checkSelectAll(check)
    {
        $(check).each(function(){
            $(this).prop("checked",true);
        });
    }
    
    function uncheckSelectAll(check)
    {
        $(check).each(function(){
            $(this).prop("checked",false);
        });
    }
    
    function editRow(elem,cellIndex=0)
    {
        if(cellIndex==0) {
            cellIndex = Number($(elem).closest("td").index()) + 1;
        }
        
        if(cellIndex<3) {
            return false;
        }
        
        var $table = $(elem).closest('table');
        var $row = $(elem).closest('tr');
        var $cell = $($row).find("td:nth-child(" + cellIndex + ")");
        
        //Get cell content
        var content = $($cell).text();
        
        //Create inner input
        var innerInput = $('<input>', {
                    'id'    : 'innerInputCell',
                    'class' : 'input_editable',
                    'type'  : 'text',
                    'style' : 'cursor:pointer;font-weight:bold;',
                    'value' : content
                });
                    
        $(innerInput).on({
                    'blur'  : function()
                                {
                                    if(cellIndex!=16) {
                                        $(this).trigger('closeEditable');
                                    }
                                },
                    'keyup' : function(e) 
                                {
                                    if(e.which == '13'){ // enter
                                        $(this).trigger('nextCell');
                                    } else if(e.which == '27'){ // escape
                                        $(this).trigger('closeEditable');
                                    }
                                },
                    'keydown' : function(e)
                                {
                                    if(e.which == '9'){ // tab
                                        e.preventDefault();
                                        $(this).trigger('nextCell');
                                    } 
                                },
                    'closeEditable' : function()
                                {
                                    $cell.html(content);
                                },
                    'saveEditable'  : function()
                                {
                                    content = $(this).val();
                                    $(this).trigger('closeEditable');
                                },
                    'nextCell':function()
                                {
                                    var rowLength = $($row).children().length;
                                    var nextIndex = cellIndex + 1;
                                    console.log('nextcell, row.length: ' + rowLength);
                                    if(nextIndex < rowLength) {
                                        console.log('index:' + nextIndex);
                                        $(this).trigger('saveEditable');
                                        $cell = $($row).find("td:nth-child(" + nextIndex + ")");
                                        editRow($cell,nextIndex);
                                    } else {
                                        $(this).trigger('saveEditable');
                                        $(this).trigger('closeEditable');
                                    }
                                },
                    'focus' : function()
                                {
                                    if(cellIndex==16) {
                                        $(innerInput).datepicker({
                                            'dateFormat' : 'yy-mm-dd',
                                        });
                                        $(innerInput).datepicker("show");
                                    } else {
                                        $(this).select();
                                    }
                                },
                    'change' : function()
                                {
                                    if(cellIndex==16) {
                                        $(this).trigger('nextCell');
                                    }
                                }
                        
                    });
                    
                    $($cell).html("");
                    $($cell).append(innerInput);
                    
                    $(innerInput).focus();
                    
                    return;
                    
        var inner_cell = 
        $($cell).html('<input class="input_editable" type="text" value="' + content + '" />')
        .find('input')
        .trigger('focus')
        .on({
            'blur': function(){
                $(this).trigger('closeEditable');
            },
            'keyup':function(e){
                if(e.which == '13'){ // enter
                    $(this).trigger('saveEditable');
                } else if(e.which == '27'){ // escape
                    $(this).trigger('closeEditable');
                }
            },
            'keydown':function(e){
                if(e.which == '9'){ // tab
                    e.preventDefault();
                    $(this).trigger('nextCell');
                }
            },
            'closeEditable':function(){
                $cell.html(content);
            },
            'saveEditable':function(){
                content = $(this).val();
                $(this).trigger('closeEditable');
            },
            'nextCell':function(){
                var rowLength = $($row).children().length;
                var nextIndex = cellIndex + 1;
                console.log('nextcell, row.length: ' + rowLength);
                if(nextIndex < rowLength) {
                    console.log('index:' + nextIndex);
                    $(this).trigger('saveEditable');
                    $cell = $($row).find("td:nth-child(" + nextIndex + ")");
                    editRow($cell,nextIndex);
                }
            }
        })
        .select();
        
        console.log("innercell:" + $(inner_cell).html());
        
        if(cellIndex==16) {
            console.log("datepicker!!");
            $(inner_cell).datepicker();
            $(inner_cell).datepicker("option","dateFormat","yy-mm-dd");
        }
        
        return;
        
        var row = $(elem).parent().parent();
        var row_index = row.index();
        var arr_combinations = $(row).find("td:nth-child(1)").text();
        var arr_products = $(row).find("td:nth-child(2)").text();
        
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/getCombinationsInfo.php',
            data  :
                    {
                        'combinations': arr_combinations,
                        'products' : arr_products
                    },
            success: function(response)
                    {
                        var obj = JSON.parse(response);
                        $("#span_combination").html(obj.combinations);
                        $("#span_product_name").html(obj.products);
                    }
        });
        
        $("#row_index").val(row_index);
        $("#row_reference").val($(row).find("td:nth-child(3)").text());
        $("#row_supplier_reference").val($(row).find("td:nth-child(4)").text());
        $("#row_location").val($(row).find("td:nth-child(5)").text());
        $("#row_ean_13").val($(row).find("td:nth-child(6)").text());
        $("#row_upc").val($(row).find("td:nth-child(7)").text());
        $("#row_wholesale_price").val($(row).find("td:nth-child(8)").text());
        $("#row_price").val($(row).find("td:nth-child(9)").text());
        $("#row_ecotax").val($(row).find("td:nth-child(10)").text());
        $("#row_quantity").val($(row).find("td:nth-child(11)").text());
        $("#row_weight").val($(row).find("td:nth-child(12)").text());
        $("#row_unit_price").val($(row).find("td:nth-child(13)").text());
        $("#row_default").val($(row).find("td:nth-child(14)").text());
        switch_change("row_default");
        $("#row_min_quantity").val($(row).find("td:nth-child(15)").text());
        $("#row_available").val($(row).find("td:nth-child(16)").text());
        $("#row_price_tax").val($(row).find("td:nth-child(17)").text());
        switch_change("row_price_tax");
        
        $("#form_edit_row").fadeIn();
    }
    
    function saveRow()
    {
        var row_index = Number($("#row_index").val()) +1;
        var row = $("#table_list_combinations tbody tr:nth-child(" + row_index + ")");
        $(row).find("td:nth-child(3)").text($("#row_reference").val());
        $(row).find("td:nth-child(4)").text($("#row_supplier_reference").val());
        $(row).find("td:nth-child(5)").text($("#row_location").val());
        $(row).find("td:nth-child(6)").text($("#row_ean_13").val());
        $(row).find("td:nth-child(7)").text($("#row_upc").val());
        $(row).find("td:nth-child(8)").text($("#row_wholesale_price").val());
        $(row).find("td:nth-child(9)").text($("#row_price").val());
        $(row).find("td:nth-child(10)").text($("#row_ecotax").val());
        $(row).find("td:nth-child(11)").text($("#row_quantity").val());
        $(row).find("td:nth-child(12)").text($("#row_weight").val());
        $(row).find("td:nth-child(13)").text($("#row_unit_price").val());
        $(row).find("td:nth-child(14)").text($("#row_default").val());
        $(row).find("td:nth-child(15)").text($("#row_min_quantity").val());
        $(row).find("td:nth-child(16)").text($("#row_available").val());
        $(row).find("td:nth-child(17)").text($("#row_price_tax").val());
        
        $("#form_edit_row").fadeOut();
    }
    
    function deleteRow(elem)
    {
        var row = $(elem).parent().parent();
        $(row).remove();
    }
    
    function addFeature()
    {
        var id=$('#input_list_feature').val();
        var value=$('#input_list_feature option:selected').text();
        
        var id_header = $('#input_list_feature_header').val();
        var value_header = $('#input_list_feature_header option:selected').text();
        
        if(id==='0') {
            return;
        }
        
        if(id_header==='0') {
            return;
        }
        
        $row = createRow(id,value,id_header,value_header);
        
        $('#table_features tbody').append($row);
    }
    
    function addAttribute()
    {
        var id=$('#input_list_attributes').val();
        var value=$('#input_list_attributes option:selected').text();
        
        var id_header = $('#input_list_attribute_header').val();
        var value_header = $('#input_list_attribute_header option:selected').text();
        
        if(id==='0') {
            return;
        }
        
        if(id_header==='0') {
            return;
        }
        
        $row = createRow(id,value,id_header,value_header);
        
        $('#table_attributes tbody').append($row);
    }
    
    function createRow(id,value,id_header,value_header)
    {
        var output;
        output = "<tr>" +
                    "<td style='display: none;'>" + id + "</td>" +
                    "<td>" + value + "</td>" +
                    "<td style='display: none;'>" + id_header + "</td>" +
                    "<td>" + value_header + "</td>" +
                    "<td>" + createDeleteButton() + "</td>" +
                + "</tr>";
        return output;
    }
    
    function createDeleteButton()
    {
        return "<a onclick='javascript:deleteRow(this);'>" +
                    "<img src='../modules/mpmanageproducts/views/img/delete.png' style='margin-right: 10px;'>" +
                    "{l s='Delete' mod='mpmanageproducts'}" + 
                "</a>";
    }
    
    /*
     * MAIN PROCEDURE
     */
    function listProducts(checked)
    {
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/getProductsByCategory.php',
            data  :
                    {
                        'categories': checked
                    },
            success: function(response)
                    {
                        $('#input_list_products').html(response);
                        var id_products = new Array();
                        $('#input_list_products option').each(function(){ 
                            id_products.push(this.value);
                        });
                        listDiscounts(id_products);
                        listCombinations(id_products);
                        listProductsForDiscount('table_discounts_products');
                        listProductCombinations();
                        listAttributes();
                    }
        });
    }
    
    function listDiscounts(id_products)
    {
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/getDiscounts.php',
            data  :
                    {
                        'products': id_products
                    },
            success: function(response)
                    {
                        $('#table_discounts tbody').html("");
                        $('#table_discounts_values tbody').html("");
                        $('#table_discounts_types tbody').html("");
                        $("#total_discounts_rows").html("{l s='Total rows: ' mod='mpmanageproducts'} 0");
                         
                        try {
                            var objDiscounts = JSON.parse(response);
                        } catch(e) {
                            console.log(e);
                            return false;
                        }
                        
                        $('#table_discounts tbody').html(objDiscounts.rowsDiscount);
                        $('#table_discounts_values tbody').html(objDiscounts.rowsValue);
                        $('#table_discounts_types tbody').html(objDiscounts.rowsType);
                        $("#total_discounts_rows").html("{l s='Total rows: ' mod='mpmanageproducts'}" + $("#table_discounts tbody tr:last").index() +1);
                    }
        });
    }
    
    function listCombinations(id_products)
    {
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/getCombinations.php',
            data  :
                    {
                        'products': id_products
                    },
            success: function(response)
                    {
                        
                        $('#table_combinations tbody').html("");
                        $('#table_combinations_products tbody').html("");
                        $("#total_combinations_rows").html("{l s='Total rows: ' mod='mpmanageproducts'} 0");
                        
                        try {
                            var objCombinations = JSON.parse(response);
                        } catch(e) {
                            console.log(e);
                            return false;
                        }
                        
                        $('#table_combinations tbody').html(objCombinations.rows);
                        $('#table_combinations_products tbody').html(objCombinations.products);
                        $("#total_combinations_rows").html("{l s='Total rows: ' mod='mpmanageproducts'}" + $("#table_combinations tbody tr:last").index() +1);
                    }
        });
    }
    
    function listProductCombinations()
    {
        var options = $("#input_list_products option");
        var values = new Array();
        $(options).each(function(){
            values.push(this.value);
        });
        
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/getProducts.php',
            data  :
                    {
                        id_products : values
                    },
            success: function(response)
                    {
                        $("#table_list_products_combinations tbody").html(response);
                    }
        });
    }
    
    function listAttributes()
    {
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/getAttributeGroups.php',
            success: function(response)
                    {
                        $('#input_select_attribute').html("<option value='0'>{l s='Please select' mod='mpmanageproducts'}</option>");
                        $('#input_select_attribute').append(response);
                    }
        });
    }
    
    function listProductsForDiscount(tablename)
    {
        var products = getListFromSelect('input_list_products');
        $("#" + tablename + " tbody").html(products);
    }
    
    function deleteCombinations(products)
    {
        if(confirm("{l s='Delete selected items?' mod='mpmanageproducts'}")===false) {
            return false;
        }
        
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/deleteCombinationsByProductID.php',
            data  :
                    {
                        'products': products
                    },
            success: function(response)
                    {
                        refreshTables();
                        alert("{l s='Elements deleted.' mod='mpmanageproducts'}");
                    }
        });
    }
    
    function deleteCombinationsByID(product_attributes)
    {
        if(confirm("{l s='Delete selected items?' mod='mpmanageproducts'}")===false) {
            return false;
        }
        
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/deleteCombinationsByID.php',
            data  :
                    {
                        'product_attributes': product_attributes
                    },
            success: function(response)
                    {
                        refreshTables();
                        alert("{l s='Elements deleted.' mod='mpmanageproducts'}");
                    }
        });
    }
    
    function deleteFromTable(tablename,fieldname,values,clearDependency=false)
    {
        if(confirm("{l s='Delete selected items?' mod='mpmanageproducts'}")===false) {
            return false;
        }
        
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/deleteFromTableName.php',
            data  :
                    {
                        'tablename': tablename,
                        'fieldname': fieldname,
                        'values'   : values
                    },
            success: function(response)
                    {
                        if(clearDependency) {
                            clearRecordDependency(tablename);
                        }
                        refreshTables();
                    }
        });
    }
    
    function clearRecordDependency(tablename)
    {
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/clearDependency.php',
            data  :
                    {
                        'tablename': tablename,
                    },
            success: function(response)
                    {
                        console.log(response);
                    }
        });
    }
    
    function refreshTables()
    {
        var checked = new Array();
        $("input[name='categoryBox[]']:checked").each(function(){
            checked.push(this.value);
        });
        listProducts(checked);
    }
    
    function getCheckBoxesFromTable(tableID)
    {
        var checked = new Array();
        $("#" + tableID + " tbody tr input[type='checkbox']:checked").each(function(){
            console.log(this);
            checked.push(this.value);
        });
        
        console.log(checked);
        
        return checked;
    }
    
    function checkColumn(index,checkbox,tablename)
    {
        var checked = $(checkbox).is(":checked");
        var value   = $(checkbox).val();
        $("#" + tablename + " tbody tr").each(function(){
            var td_value = $(this).find("td:nth-child("+ index +")").text();
            if (value===td_value) { 
                $(this).find("td:nth-child(1) input[type='checkbox']").prop("checked",checked);
            }
        });
    }
    
    function isObject(obj) 
    {
        return obj === Object(obj);
    }
    
    function addDiscount()
    {
        var price          = $("#input_discount_price").val();
        var qty            = $("#input_discount_quantity").val();
        var reduction      = $("#input_discount_reduction").val()/100;
        var tax            = $("#input_discount_tax").val();
        var reduction_type = $("#input_discount_reduction_type").val();
        var from           = $("#input_discount_from").val();
        var to             = $("#input_discount_to").val();
        var products       = getCheckBoxesFromTable('table_discounts_products');
        
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/addDiscount.php',
            data  :
                    {
                        'price'          : price,
                        'quantity'       : qty,
                        'reduction'      : reduction,
                        'tax'            : tax,
                        'reduction_type' : reduction_type,
                        'from'           : from,
                        'to'             : to,
                        'products'       : products
                    },
            success: function(response)
                    {
                        console.log(response);
                        refreshTables();
                    }
        });
    }
    
    function getListFromSelect(id_select)
    {
        var rows = new Array();
        $("#" + id_select + " option").each(function(){
            var row = "<tr>"
                + "<td style='text-align: right;'>" + $(this).val() + " <input type='checkbox' name='checkDiscount[]' value='" +  $(this).val() + "'></td>"
                + "<td style='min-width: 200px;'>" + $(this).text() + "</td>";
            rows.push(row);
        });
        
        return rows.join("\n");
    }
    
    function addCombinations(checkboxes)
    {
        $(checkboxes).each(function(){
            var row = $(this).parent().parent();
            $("#table_list_attribute_combinations tbody").append(row);
        });
    }
    
    function clearTable(tablename)
    {
        $("#" + tablename + " >tbody").html("");
    }
    
    function isInArray(value, array) 
    {
        return array.indexOf(value) > -1;
    }
    
    function addCombinationRow(combinations,id_products)
    {
        var id_products_value = new Array();
        $(id_products).each(function(){
            id_products_value.push(this.value);
        });
        
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/addCombinationRow.php',
            data  :
                    {
                        'combinations' : combinations,
                        'id_products'  : id_products_value
                    },
            success: function(response)
                    {
                        console.log(response);
                        $("#table_list_combinations tbody").append(response);
                    }
        });
    }
    
    //+++++++++++++++++++++++++++++++++
    //++ COMBINATION FUNCTIONS       ++
    //++ Copyright 2012 Akseli Palén ++
    //+++++++++++++++++++++++++++++++++
    function cartesian_combination(array_container) 
    {
        var r = [];
        var arg = array_container;
        var max = arg.length-1;
        
        function helper(arr, i) {
            for (var j=0, l=arg[i].length; j<l; j++) {
                var a = arr.slice(0); // clone arr
                a.push(arg[i][j]);
                if (i===max)
                    r.push(a);
                else
                    helper(a, i+1);
            }
        }
        helper([], 0);
        return r;
    }
</script>