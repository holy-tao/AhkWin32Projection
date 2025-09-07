#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSDXML_NODE.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Describes the text in an XML node.
 * @remarks
 * <b>WSDXML_TEXT</b> is used to represent the contents of an element. Since no type information exists for elements in DOM, the <b>Text</b> member is the exact representation of the element contents from the XML document.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxmldom/ns-wsdxmldom-wsdxml_text
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDXML_TEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The current node in a linked list of <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_node">WSDXML_NODE</a> structures.
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
     * The text contained in the XML node. The maximum length of this string is WSD_MAX_TEXT_LENGTH (8192). The text must consist of UTF-16 encoded characters. The text cannot contain raw XML, as special characters are rendered using the equivalent entity reference. For example,  <c>&lt;</code> is rendered as <code>&amp;lt;</c>.
     * @type {PWSTR}
     */
    Text{
        get {
            if(!this.HasProp("__Text"))
                this.__Text := PWSTR(this.ptr + 32)
            return this.__Text
        }
    }
}
