#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_TEXT_TYPE.ahk" { WS_XML_TEXT_TYPE }
#Import ".\WS_TIMESPAN.ahk" { WS_TIMESPAN }
#Import ".\WS_XML_TEXT.ahk" { WS_XML_TEXT }

/**
 * Represents a time span formatted as the text &quot;[+|-][d?.]HH:mm:ss[.fffffff]&quot; d is a series of digits representing the day.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_timespan_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_TIMESPAN_TEXT {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     */
    text : WS_XML_TEXT

    /**
     * The timespan.
     */
    value : WS_TIMESPAN

}
