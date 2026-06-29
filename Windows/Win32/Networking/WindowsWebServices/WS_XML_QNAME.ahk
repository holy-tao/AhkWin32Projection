#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_XML_DICTIONARY.ahk" { WS_XML_DICTIONARY }

/**
 * A structure used to specify an XML name (of an element or an attribute) as a local name, namespace pair.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_qname
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_QNAME {
    #StructPack 8

    /**
     * The local name.
     */
    localName : WS_XML_STRING

    /**
     * The namespace URI.
     */
    ns : WS_XML_STRING

}
