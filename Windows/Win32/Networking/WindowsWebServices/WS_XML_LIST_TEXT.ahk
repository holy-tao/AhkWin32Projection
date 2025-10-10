#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk

/**
 * Represents a list of text values separated by a single whitespace character.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_list_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_LIST_TEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     * @type {WS_XML_TEXT}
     */
    text{
        get {
            if(!this.HasProp("__text"))
                this.__text := WS_XML_TEXT(this.ptr + 0)
            return this.__text
        }
    }

    /**
     * The number of items in the list.
     * @type {Integer}
     */
    itemCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The list of items.
     * @type {Pointer<WS_XML_TEXT>}
     */
    items {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
