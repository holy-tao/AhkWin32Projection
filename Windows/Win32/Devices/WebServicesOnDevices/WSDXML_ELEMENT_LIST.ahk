#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a node in a linked list of XML elements.
 * @see https://docs.microsoft.com/windows/win32/api//wsdxmldom/ns-wsdxmldom-wsdxml_element_list
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDXML_ELEMENT_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reference to the next node in the linked list of <b>WSDXML_ELEMENT_LIST</b> structures.
     * @type {Pointer<WSDXML_ELEMENT_LIST>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure referenced by this node.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    Element {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
