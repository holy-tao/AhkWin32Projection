#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk
#Include .\WS_XML_TEXT_TYPE.ahk
#Include .\WS_DATETIME.ahk
#Include .\WS_DATETIME_FORMAT.ahk

/**
 * Represents a datetime formatted as an xsd:dateTime.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_datetime_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_XML_DATETIME_TEXT extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     * @type {WS_XML_TEXT}
     */
    text {
        get {
            if(!this.HasProp("__text"))
                this.__text := WS_XML_TEXT(0, this)
            return this.__text
        }
    }

    /**
     * @type {WS_DATETIME}
     */
    value {
        get {
            if(!this.HasProp("__value"))
                this.__value := WS_DATETIME(8, this)
            return this.__value
        }
    }
}
