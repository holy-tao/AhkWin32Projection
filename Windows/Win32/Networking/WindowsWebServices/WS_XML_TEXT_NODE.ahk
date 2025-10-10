#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_NODE.ahk

/**
 * Represents an element, attribute, or CDATA content.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_text_node
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_TEXT_NODE extends Win32Struct
{
    static sizeof => 16

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
     * The text content.
     * @type {Pointer<WS_XML_TEXT>}
     */
    text {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
