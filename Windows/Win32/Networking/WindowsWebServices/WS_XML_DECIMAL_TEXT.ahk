#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk
#Include ..\..\Foundation\DECIMAL.ahk

/**
 * Represents a 12 byte fixed point value.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_decimal_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_DECIMAL_TEXT extends Win32Struct
{
    static sizeof => 24

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
     * The value.
     * @type {DECIMAL}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := DECIMAL(this.ptr + 8)
            return this.__value
        }
    }
}
