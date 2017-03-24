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
        text-decoration: #0083c4;
        cursor: pointer;
    }
</style>

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
                            <p class='panel-heading' style="margin-top: 20px; margin-left: 10px;">
                                <img src='../modules/mpmanageproducts/views/img/category.png' alt='Config'>
                                {l s='Product Categories' mod='mpmanageproducts'}
                            </p>  
                            {$category_tree}
                            <br>
                            <div>
                                <label class="control-label label-br" style="display: inline-block;">{l s='Category' mod='mpmanageproducts'}</label>
                                <input type="text" id="input_category" value="" class="width-xl" style="display: inline-block">
                                <input type="checkbox" id="input_check_category_by_id" value="0" style="display: inline-block">
                                <label class="control-label label-br" style="display: inline-block">{l s='Search by id' mod='mpmanageproducts'}</label>
                                <button type="button" value="1" id="submit_find_category" id="find_product" name="find_product" class="btn btn-default">
                                    <i class="icon-search"></i> 
                                    {l s='Find' mod='mpmanageproducts'}
                                </button> 
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
                            <div>
                                <p class='panel-heading' style="margin-top: 20px; margin-left: 10px;">
                                    <img src='../modules/mpmanageproducts/views/img/discount.png' alt='Config'>
                                    {l s='Product discounts' mod='mpmanageproducts'}
                                </p>  
                                <table class='table' id='table_discounts'>
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
                        </div>
                        <br style='clear: both;'>
                        <div class="panel">
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
                </div>
                <div id="tabs-3">
                    <!-- *********************************
                         ** ATTRIBUTE COMBINATION ITEMS **
                         ********************************* -->
                    <div class="form-wrapper">
                        <div class="form-group">
                            <div>
                                <p class='panel-heading' style="margin-top: 20px; margin-left: 10px;">
                                    <img src='../modules/mpmanageproducts/views/img/attribute.png' alt='Config'>
                                    {l s='Product combinations' mod='mpmanageproducts'}
                                </p>  
                                <table class='table' id='table_combinations'>
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
                        </div>
                        <br style='clear: both;'>
                        <div class="panel">
                            <button type="button" value="1" id="submit_check_all_combination" name="submit_check_all_discount" class="btn btn-default">
                                <i class="icon-check"></i> 
                                {l s='Check all' mod='mpmanageproducts'}
                            </button> 
                            <button type="button" value="1" id="submit_uncheck_all_combination" name="submit_uncheck_all_discount" class="btn btn-default">
                                <i class="icon-check-empty"></i> 
                                {l s='Uncheck all' mod='mpmanageproducts'}
                            </button> 
                            <button type="button" value="1" id="submit_delete_combination" name="submit_delete_discounts" class="btn btn-default">
                                <i class="icon-trash"></i> 
                                {l s='Delete selected' mod='mpmanageproducts'}
                            </button> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    
        <div class='panel-footer'>
            <button type="submit" value="1" id="submit_config" name="submit_config" class="btn btn-default pull-right">
                <i class="process-icon-configure"></i> Import
            </button>
        </div>
                                
    </div>
</form>
                            
<script type="text/javascript">
    $(document).ready(function(){
        $("#tabs").tabs();
        $('#associated-categories-tree').tree('expandAll').tree('collapseAll');
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
                            var obj = JSON.parse(response);
                            var arr = new Array();
                            obj.forEach(function(index,item){
                                arr.push(index.id_category);
                            });
                            
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
        
    });
    
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
                        $('#table_discounts tbody').html(response);
                        
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
                        $('#table_combinations tbody').html(response);
                        
                    }
        });
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
    
    function deleteFromTable(tablename,fieldname,values)
    {
        $.ajax({
            method: 'POST',
            url   : '../modules/mpmanageproducts/ajax/deleteFromTableName.php',
            data  :
                    {
                        'tablename': tablename,
                        'fieldname': fieldname,
                        'values'   : values,
                    },
            success: function(response)
                    {
                        refreshTables();
                        
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
</script>