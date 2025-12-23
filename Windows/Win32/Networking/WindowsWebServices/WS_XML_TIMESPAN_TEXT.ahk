#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_TEXT.ahk
#Include .\WS_TIMESPAN.ahk

/**
 * Represents a time span formatted as the text &quot;[+|-][d?.]HH:mm:ss[.fffffff]&quot; d is a series of digits representing the day.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_timespan_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_TIMESPAN_TEXT extends Win32Struct
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
                this.__text := WS_XML_TEXT(0, this)
            return this.__text
        }
    }

    /**
     * The timespan.
     * @type {WS_TIMESPAN}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := WS_TIMESPAN(8, this)
            return this.__value
        }
    }
}
