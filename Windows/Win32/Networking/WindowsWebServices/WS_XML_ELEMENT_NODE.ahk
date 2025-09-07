#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_NODE.ahk

/**
 * Represents a start element in xml (e.g.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_element_node
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_ELEMENT_NODE extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node">WS_XML_NODE</a>.
     * @type {WS_XML_NODE}
     */
    node{
        get {
            if(!this.HasProp("__node"))
                this.__node := WS_XML_NODE(this.ptr + 0)
            return this.__node
        }
    }

    /**
     * The prefix of the element.  In the example, it refers to "a".  Empty prefixes are represented by a zero length <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_string">WS_XML_STRING</a>.
     * @type {Pointer<WS_XML_STRING>}
     */
    prefix {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The localName of the element.  In the example, it refers to "purchaseOrder".
     * @type {Pointer<WS_XML_STRING>}
     */
    localName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The resolved namespace of the prefix.  In the example, it refers to "http://tempuri.org".
     * @type {Pointer<WS_XML_STRING>}
     */
    ns {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The number of attributes on the element.  In the example, it would be 2.
     * @type {Integer}
     */
    attributeCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The array of attributes for the element.
     * @type {Pointer<WS_XML_ATTRIBUTE>}
     */
    attributes {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Whether the element is an empty element or not.  In the example, it would be <b>FALSE</b>.
     * @type {Integer}
     */
    isEmpty {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
