#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an XML node.
 * @remarks
 * 
  * <b>WSDXML_NODE</b> represents an arbitrary node within the DOM tree. Nodes are weakly typed; the <b>Type</b> member must be inspected to determine the actual type of the node, and the node pointer must then be cast to the structure of the appropriate type (see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_text">WSDXML_TEXT</a>) to obtain the node contents. <b>Parent</b> points to the containing element for the current node, and <b>Next</b> points to any nodes at the same level as the current node.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdxmldom/ns-wsdxmldom-wsdxml_node
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDXML_NODE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Reference to the parent node in a linked list of <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structures.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Parent {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reference to the next node in the linked list of <b>WSDXML_NODE</b> structures.
     * @type {Pointer<WSDXML_NODE>}
     */
    Next {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ElementType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    TextType {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
