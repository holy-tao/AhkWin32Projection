#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WS_XML_TEXT_TYPE.ahk

/**
 * Represents a GUID formatted as the text &quot;xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx&quot;.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_guid_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_XML_GUID_TEXT extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

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
     * The GUID value
     * @type {Guid}
     */
    value {
        get {
            if(!this.HasProp("__value"))
                this.__value := Guid(4, this)
            return this.__value
        }
    }
}
