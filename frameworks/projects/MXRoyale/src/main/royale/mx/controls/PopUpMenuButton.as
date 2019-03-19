////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////

package mx.controls
{

import mx.collections.CursorBookmark;
import mx.collections.ICollectionView;
import mx.collections.IViewCursor;
import mx.controls.listClasses.IListItemRenderer;
import mx.controls.treeClasses.DefaultDataDescriptor;
import mx.core.IUIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.ListEvent;
import mx.events.MenuEvent;
import mx.events.MouseEvent;
import mx.managers.PopUpManager;

import org.apache.royale.events.Event;

use namespace mx_internal;

//--------------------------------------
//  Events
//-------------------------------------- 

/**
 *  Dispatched when a user selects an item from the pop-up menu.
 *
 *  @eventType mx.events.MenuEvent.ITEM_CLICK
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
[Event(name="itemClick", type="mx.events.MenuEvent")]

/**
 *  The PopUpMenuButton control creates a PopUpButton control with a main
 *  sub-button and a secondary sub-button.
 *  Clicking on the secondary (right) sub-button drops down a menu that
 *  can be popluated through a <code>dataProvider</code> property. 
 *  Unlike the Menu and MenuBar controls, the PopUpMenuButton control 
 *  supports only a single-level menu. This means that the menu cannot contain
 *  cascading submenus.
 * 
 *  <p>The main sub-button of the PopUpMenuButton control can have a 
 *     text label, an icon, or both on its face.
 *     When a user selects an item from the drop-down menu or clicks 
 *     the main button of the PopUpMenuButton control, the control 
 *     dispatches an <code>itemClick</code> event.
 *     When a user clicks the main button of the 
 *     control, the control also dispatches a <code>click</code> event. 
 *     You can customize the look of a PopUpMenuButton control.</p>
 *
 *  <p>The PopUpMenuButton control has the following sizing 
 *     characteristics:</p>
 *     <table class="innertable">
 *        <tr>
 *           <th>Characteristic</th>
 *           <th>Description</th>
 *        </tr>
 *        <tr>
 *           <td>Default size</td>
 *           <td>Sufficient to accommodate the label and any icon on 
 *               the main button, and the icon on the pop-up button. 
 *               The control does not reserve space for the menu.</td>
 *        </tr>
 *        <tr>
 *           <td>Minimum size</td>
 *           <td>0 pixels.</td>
 *        </tr>
 *        <tr>
 *           <td>Maximum size</td>
 *           <td>10000 by 10000.</td>
 *        </tr>
 *     </table>
 *
 *  @mxml
 *  
 *  <p>The <code>&lt;mx:PopUpMenuButton&gt;</code> tag inherits all of the tag
 *  attributes of its superclass, and adds the following tag attributes:</p>
 *  
 *  <pre>
 *  &lt;mx:PopUpMenuButton
 *    <strong>Properties</strong>
 *    dataDescriptor="<i>instance of DefaultDataDescriptor</i>"
 *    dataProvider="undefined"
 *    iconField="icon"
 *    iconFunction="undefined"
 *    labelField="label"
 *    labelFunction="undefined"
 *    showRoot="false|true"
 *    &nbsp;
 *    <strong>Event</strong>
 *    change=<i>No default</i>
 *  /&gt;
 *  </pre>
 *
 *  @includeExample examples/PopUpButtonMenuExample.mxml
 *
 *  @see mx.controls.Menu
 *  @see mx.controls.MenuBar
 *
 *  @tiptext Provides ability to pop up a menu and act as a button
 *  @helpid 3441
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
public class PopUpMenuButton extends PopUpButton
{
    //include "../core/Version.as";

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function PopUpMenuButton()
    {
        super();
    }

    //--------------------------------------------------------------------------
    // dataProvider
    //--------------------------------------------------------------------------
    
    /**
     *  @private
     *  Storage for dataProvider property.
     */
    private var _dataProvider:Object = null;
    
    [Bindable("collectionChange")]
    [Inspectable(category="Data", defaultValue="null")]
    
    /**
     *  DataProvider for popUpMenu.
     *
     *  @default null
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get dataProvider():Object
    {
        //if (popUpMenu)
        //    return Menu(popUpMenu).dataProvider;
        return _dataProvider;
    }
    
    /**
     *  @private
     */
    public function set dataProvider(value:Object):void
    {
        _dataProvider = value;
        //dataProviderChanged = true;
        
        //invalidateProperties();     
    }
    
    //--------------------------------------------------------------------------
    //  labelField
    //--------------------------------------------------------------------------
    
    /**
     *  @private
     *  Storage for the labelField property.
     */
    private var _labelField:String = "label";
    
    [Bindable("labelFieldChanged")]
    [Inspectable(category="Data", defaultValue="label")]
    
    /**
     *  Name of the field in the <code>dataProvider</code> Array that contains the text to
     *  show for each menu item.
     *  The <code>labelFunction</code> property, if set, overrides this property.
     *  If the data provider is an Array of Strings, Flex uses each String
     *  value as the label.
     *  If the data provider is an E4X XML object, you must set this property
     *  explicitly; for example, use &#064;label to specify the <code>label</code> attribute.
     *
     *  @default "label"
     *  
     *  @langversion 3.0
     *  @playerversion Flash 9
     *  @playerversion AIR 1.1
     *  @productversion Flex 3
     */
    public function get labelField():String
    {
        return _labelField;
    }
    
    /**
     *  @private
     */
    public function set labelField(value:String):void
    {
        if (_labelField != value)
        {
            _labelField = value;
            
            //if (popUpMenu)
            //    popUpMenu.labelField = _labelField;
            
            dispatchEvent(new Event("labelFieldChanged"));
        }
    }

	}

}
