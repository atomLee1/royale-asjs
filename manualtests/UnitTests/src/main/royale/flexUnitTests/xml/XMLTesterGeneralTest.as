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
package flexUnitTests.xml
{
    
    
    import flexunit.framework.Assert;
    
    import org.apache.royale.reflection.*;
    
    
    public class XMLTesterGeneralTest
    {
        
        private var xmlStr:String;
        
        private var quotedXML:XML;
        
        private var xml:XML;
        private var text:String;
        private var xml2:XML;
        
        
        [Before]
        public function setUp():void
        {
            xmlStr = '<?xml version="1.0" encoding="UTF-8" ?>' +
                    '<catalog xmlns:fx="http://ns.adobe.com/mxml/2009"' +
                    '              xmlns:dac="com.printui.view.components.DesignAreaComponents.*">' +
                    '<' + '!' + '-' + '- just a comment -' + '-' + '>' +
                    '<?bla fud?>' +
                    '   bla bla<product description="Cardigan Sweater" product_image="cardigan.jpg">' +
                    '      <fx:catalog_item gender="Men\'s" fx:foo="bah">' +
                    '         <item_number>QWZ5671</item_number>' +
                    '         <price>39.95</price>' +
                    '         <size description="Medium">' +
                    '            <color_swatch image="red_cardigan.jpg">Red</color_swatch>' +
                    '            <color_swatch image="burgundy_cardigan.jpg">Burgundy</color_swatch>' +
                    '         </size>' +
                    '         <size description="Large">' +
                    '            <color_swatch image="red_cardigan.jpg">Red</color_swatch>' +
                    '            <color_swatch image="burgundy_cardigan.jpg">Burgundy</color_swatch>' +
                    '         </size>' +
                    '      </fx:catalog_item>' +
                    '      <script>   <![CDATA[private function onStylesLoaded(ev:Event):void {currentState = "normal";facade = ApplicationFacade.getInstance();facade.notifyObservers(new Notification(ApplicationFacade.CMD_STARTUP, this));}  ]' + ']>   </script>' +
                    '      <catalog_item gender="Women\'s">' +
                    '         <item_number>RRX9856</item_number>' +
                    '         <price>42.50</price>' +
                    '         <size description="Small">' +
                    '            <color_swatch image="red_cardigan.jpg">Red</color_swatch>' +
                    '            <color_swatch image="navy_cardigan.jpg">Navy</color_swatch>' +
                    '            <color_swatch image="burgundy_cardigan.jpg">Burgundy</color_swatch>' +
                    '         </size>' +
                    '         <size description="Medium">' +
                    '            <color_swatch image="red_cardigan.jpg">Red</color_swatch>' +
                    '            <color_swatch image="navy_cardigan.jpg">Navy</color_swatch>' +
                    '            <color_swatch image="burgundy_cardigan.jpg">Burgundy</color_swatch>' +
                    '            <color_swatch image="black_cardigan.jpg">Black</color_swatch>' +
                    '         </size>' +
                    '         <size description="Large">' +
                    '            <color_swatch image="navy_cardigan.jpg">Navy</color_swatch>' +
                    '            <color_swatch image="black_cardigan.jpg">Black</color_swatch>' +
                    '         </size>' +
                    '         <size description="Extra Large">' +
                    '            <color_swatch image="burgundy_cardigan.jpg">Burgundy</color_swatch>' +
                    '            <color_swatch image="black_cardigan.jpg">Black</color_swatch>' +
                    '         </size>' +
                    '      </catalog_item>' +
                    '   </product>' +
                    '</catalog>';
            
            quotedXML = <root title="That's Entertainment"/>;
            xml = new XML(xmlStr);
            text = "hi";
            xml2 = new XML('<root xmlns:fz="http://ns.adobe.com/mxml/2009"><a><b/></a><a name="fred"/><a>hi<b>yeah!</b></a><a name="frank"/><c/></root>');
            
        }
        
        [After]
        public function tearDown():void
        {
            xmlStr = null;
            quotedXML = null;
            xml = null;
            text = null;
            xml2 = null;
        }
        
        [BeforeClass]
        public static function setUpBeforeClass():void
        {
        }
        
        [AfterClass]
        public static function tearDownAfterClass():void
        {
        }
        
        
        [Test]
        public function testSimpleAttributes():void
        {
            var args:Array;
            var j:int;
            var m:int;
            var list1:XMLList;
            var list2:XMLList;
            var list3:XMLList;
            var list4:XMLList;
            var xml1:XML = <foo baz="true"/>;
            Assert.assertTrue('<foo baz="true"/> should have attribute @baz', xml1.hasOwnProperty("@baz"));
            Assert.assertFalse('<foo baz="true"/> should not have attribute @foo', xml1.hasOwnProperty("@foo"));
            Assert.assertFalse('<foo baz="true"/> should not have attribute baz', xml1.hasOwnProperty("baz"));
            Assert.assertTrue('<foo baz="true"/> toXMLString should be <foo baz="true"/>', xml1.toXMLString() == '<foo baz="true"/>');
            
            var baz:XMLList = xml1.@baz;
            trace("baz: " + xml1.@baz.toString() + " //true");
        }
        
        
        [Test]
        public function testSimpleXMLList():void
        {
            var xml1:XML = <foo baz="true"/>;
            
            Assert.assertTrue('toString value should be "true" ', xml1.@baz.toString() == "true");
            var xml3:XML = <root/>;
            xml3.bar.baz = "baz";
            xml3.foo.@boo = "boo";
            trace(xml3.bar.baz)
            Assert.assertEquals('toString value should be "baz" ', xml3.bar.baz.toString(), "baz");
            Assert.assertEquals('toString value should be "boo" ', xml3.foo.@boo.toString(), "boo");
            
            
            //trace("baz: " + xml1.@baz.toString() + " //true");
            
            //trace("baz? " + xml3.bar.baz);
            //	trace("boo? " + xml3.foo.@boo);
            var ampXML:XML = new XML("<Content>Bat & Ball</Content>");
            var amp2XML:XML = new XML("<Content>Bat &amp; Ball</Content>");
            Assert.assertEquals('escaped ampersands should be equal" ', ampXML.toXMLString(), amp2XML.toXMLString());
            
            Assert.assertTrue("ampersand should not be escaped", ampXML.toString().indexOf("&amp;") == -1);
            //	trace(ampXML.toXMLString());
            //	trace(amp2XML.toXMLString());
            //	trace("escaped ampersands should be equal? " + (ampXML.toXMLString() == amp2XML.toXMLString()));
            //	trace("ampersand should not be escaped: " + ampXML.toString());
            
            var newContent:XML = <Content/>;
            newContent.Properties.Leading.@type = "string";
            newContent.Properties.Leading = 36;
            
            
            trace("Leading should be @type=string: " + (newContent.Properties.Leading.@type == "string"));
            Assert.assertEquals("Leading should be @type=string", newContent.Properties.Leading.@type, "string");
            trace("Leading should be 36: " + newContent.Properties.Leading);
            Assert.assertStrictlyEquals("Leading should be 36", newContent.Properties.Leading.toString(), "36");
            
            newContent.Properties.Leading = 72;
            trace("Leading should be 72: " + newContent.Properties.Leading);
            Assert.assertStrictlyEquals("Leading should be 72", newContent.Properties.Leading.toString(), "72");
            
        }
        
        
        [Test]
        public function testXMLMethods1():void
        {
            var xml1:XML = <foo baz="true"/>;
            var child:XML = <pop>
                <child name="Sam"/>
            </pop>;
            xml1.appendChild(child);
            child = <pop>
                <child name="George"/>
            </pop>;
            xml1.appendChild(child);
            
            Assert.assertTrue('unexpected child result', xml1.pop[0].child.@name.toString() == 'Sam');
            Assert.assertTrue('unexpected child result', xml1.pop[1].child.@name.toString() == 'George');
            
            /*Greg: I think the above *should* output as:
            
            flexunit.framework.Assert.assertTrue('unexpected child result', xml1.child('pop')[0].child('child').attribute('name').toString() == 'Sam');
              flexunit.framework.Assert.assertTrue('unexpected child result', xml1.child('pop')[1].child('child').attribute('name').toString() == 'George');
            
            but the "child('child')." part is currently outputting as "child."
            
            */
        }
        
        [Test]
        public function testXMLMethods2():void
        {
            var xml1:XML = <foo baz="true"/>;
            var child:XML = <pop>
                <child name="Sam"/>
            </pop>;
            xml1.appendChild(child);
            child = <pop>
                <child name="George"/>
            </pop>;
            xml1.appendChild(child);
            
            //trace(xml1.pop[0].toString());
            //trace(xml1.pop[1].toString());
            var pop:XMLList = xml1.pop;
            pop[pop.length()] = <pop>
                <child name="Fred"/>
            </pop>;
            trace(pop.toString());
            trace(xml1.toString());
            pop[0] = <pop>
                <child name="Fred"/>
            </pop>;
            trace(pop.toString());
            trace(xml1.toString());
            
            var parent:XML = <parent/>;
            var childXML:XML = <child/>;
            parent.appendChild(childXML);
            trace(childXML.toXMLString() + " is child of" + parent.toXMLString() + "? " + (childXML.parent() == parent));
            var newParent:XML = <newparent/>;
            newParent.appendChild(childXML);
            trace("moving to <newparent/>");
            trace(childXML.toXMLString() + " is child of" + parent.toXMLString() + "? " + (childXML.parent() == parent));
            trace(childXML.toXMLString() + " is child of" + newParent.toXMLString() + "? " + (childXML.parent() == newParent));
            childXML = <Content>• <?ACE 7?>Some amazing content</Content>;
            var childXMLStr:String = childXML.text();
            trace(childXMLStr + " (should be) •Some amazing content? " + (childXMLStr == "•Some amazing content"));
        }
        
        
        [Test]
        public function testSVG():void
        {
            var svg:XML = <svg>
                <group>
                    <rect id="1"/>
                    <rect id="2"/>
                </group>
                <group>
                    <rect id="3"/>
                    <rect id="4"/>
                </group>
            </svg>;
            
            var rects:XMLList = svg..rect;
            rects[1].@width = "100px";
            rects.(@id == 3).@height = "100px";
            
            var expected:String =
                    '<rect id="1"/>' + '\n'
                    + '<rect id="2" width="100px"/>' + '\n'
                    + '<rect id="3" height="100px"/>' + '\n'
                    + '<rect id="4"/>';
            
            //trace(rects.toXMLString());
            Assert.assertTrue('string output was unexpected', rects.toXMLString() == expected);
        }
    }
}
