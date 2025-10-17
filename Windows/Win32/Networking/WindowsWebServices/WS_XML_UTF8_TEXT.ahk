#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk
#Include .\WS_XML_STRING.ahk

/**
 * Represents text encoded as UTF-8 bytes.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_utf8_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_UTF8_TEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     * @type {WS_XML_TEXT}
     */
    text{
        get {
            if(!this.HasProp("__text"))
                this.__text := WS_XML_TEXT(0, this)
            return this.__text
        }
    }

    /**
     * The text value.
     * @type {WS_XML_STRING}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := WS_XML_STRING(8, this)
            return this.__value
        }
    }
}
