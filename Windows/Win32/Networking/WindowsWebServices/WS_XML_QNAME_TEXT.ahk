#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_XML_TEXT_TYPE.ahk" { WS_XML_TEXT_TYPE }
#Import ".\WS_XML_TEXT.ahk" { WS_XML_TEXT }

/**
 * Represents a qname formatted as the text &quot;prefix:localName&quot;
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_qname_text
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_QNAME_TEXT {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_text">WS_XML_TEXT</a>.
     */
    text : WS_XML_TEXT

    /**
     * The prefix.
     */
    prefix : WS_XML_STRING.Ptr

    /**
     * The local name.
     */
    localName : WS_XML_STRING.Ptr

    ns : WS_XML_STRING.Ptr

}
