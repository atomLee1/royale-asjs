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
package org.apache.flex.mdl
{
	import org.apache.flex.core.ContainerBase;
    
    COMPILE::JS
    {
        import org.apache.flex.core.WrappedHTMLElement;
    }
    
	/**
	 *  The Header class is a Container component capable of parenting other
	 *  components 
	 *
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion FlexJS 0.0
	 */
	public class Header extends ContainerBase
	{
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function Header()
		{
			super();

			className = ""; //set to empty string avoid 'undefined' output when no class selector is assigned by user;
		}
		
        /**
         * @flexjsignorecoercion org.apache.flex.core.WrappedHTMLElement
         */
        COMPILE::JS
        override protected function createElement():WrappedHTMLElement
        {
			typeNames = "mdl-layout__header";

            element = document.createElement('header') as WrappedHTMLElement;
            element.className = typeNames;
            
			positioner = element;
            
            // absolute positioned children need a non-null
            // position value in the parent.  It might
            // get set to 'absolute' if the container is
            // also absolutely positioned
            element.flexjs_wrapper = this;

            return element;
        }
		
		protected var _transparent:Boolean;
        /**
		 *  A boolean flag to activate "mdl-transparent--Xdp" effect selector.
		 *  Assigns variable transparent depths (0, 2, 3, 4, 6, 8, or 16) to card
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
        public function get transparent():Boolean
        {
            return _transparent;
        }
        public function set transparent(value:Boolean):void
        {
			_transparent = value;

			className += (_transparent ? " mdl-layout__header--transparent" : "");
        }
	}
}
