#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSDXML_NODE.ahk

/**
 * Describes an XML element.
 * @remarks
 * <b>WSDXML_ELEMENT</b> represents an XML element in the DOM tree. The <b>Name</b> member can be used to determine the name and namespace of this element. <b>FirstAttribute</b> points to any attributes, and <b>FirstChild</b> points to anything contained within the element.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_element
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDXML_ELEMENT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_node">WSDXML_NODE</a> structure that specifies the parent element, next sibling and type of the node.
     * @type {WSDXML_NODE}
     */
    Node{
        get {
            if(!this.HasProp("__Node"))
                this.__Node := WSDXML_NODE(this.ptr + 0)
            return this.__Node
        }
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that specifies name.
     * @type {Pointer<WSDXML_NAME>}
     */
    Name {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_attribute">WSDXML_ATTRIBUTE</a> structure that specifies the first attribute.
     * @type {Pointer<WSDXML_ATTRIBUTE>}
     */
    FirstAttribute {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_node">WSDXML_NODE</a> structure that specifies the first child.
     * @type {Pointer<WSDXML_NODE>}
     */
    FirstChild {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_prefix_mapping">WSDXML_PREFIX_MAPPING</a> structure that specifies the prefix mappings.
     * @type {Pointer<WSDXML_PREFIX_MAPPING>}
     */
    PrefixMappings {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
