#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_TEXT_TYPE.ahk" { WS_XML_TEXT_TYPE }
#Import ".\WS_DATETIME.ahk" { WS_DATETIME }
#Import ".\WS_XML_TEXT.ahk" { WS_XML_TEXT }
#Import ".\WS_DATETIME_FORMAT.ahk" { WS_DATETIME_FORMAT }

/**
 * Represents a datetime formatted as an xsd:dateTime.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_datetime_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_DATETIME_TEXT {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     */
    text : WS_XML_TEXT

    value : WS_DATETIME

}
