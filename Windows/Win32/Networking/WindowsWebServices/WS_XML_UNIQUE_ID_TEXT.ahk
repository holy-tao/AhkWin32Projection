#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_TEXT_TYPE.ahk" { WS_XML_TEXT_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WS_XML_TEXT.ahk" { WS_XML_TEXT }

/**
 * Represents a GUID formatted as the text &quot;urn:uuid:xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx&quot;.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_unique_id_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_UNIQUE_ID_TEXT {
    #StructPack 4

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     */
    text : WS_XML_TEXT

    /**
     * The GUID value.
     */
    value : Guid

}
