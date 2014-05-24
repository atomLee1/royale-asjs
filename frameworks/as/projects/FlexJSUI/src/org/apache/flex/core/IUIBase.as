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
package org.apache.flex.core
{
    /**
     *  The IUIBase interface is the basic interface for user interface components.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion FlexJS 0.0
     */
	public interface IUIBase extends IStrand
	{
        /**
         *  Each IUIBase has an element that is actually added to
         *  the platform's display list DOM.  It may not be the actual
         *  component itself.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
        function get element():Object;
        
        /**
         *  Called by parent components when the component is
         *  added via a call to addElement or addElementAt.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion FlexJS 0.0
         */
		function addedToParent():void;
		
		/**
		 *  The alpha or opacity in the range of 0 to 1.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		function get alpha():Number;
		function set alpha(value:Number):void;
		
		/**
		 *  The x co-ordinate or left side position of the bounding box.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		function get x():Number;
		function set x(value:Number):void;
		
		/**
		 *  The y co-ordinate or top position of the bounding box.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		function get y():Number;
		function set y(value:Number):void;
		
		/**
		 *  The width of the bounding box.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		function get width():Number;
		function set width(value:Number):void;
		
		/**
		 * The height of the bounding box.
		 */
		function get height():Number;
		function set height(value:Number):void;
	}
}