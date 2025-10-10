#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk

/**
 * Represents a signed 64 bit integer.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_int64_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_INT64_TEXT extends Win32Struct
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
     * The integer value.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
