#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_NODE_TYPE.ahk" { WS_XML_NODE_TYPE }
#Import ".\WS_XML_NODE.ahk" { WS_XML_NODE }
#Import ".\WS_XML_TEXT.ahk" { WS_XML_TEXT }

/**
 * Represents an element, attribute, or CDATA content.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_text_node
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_TEXT_NODE {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node">WS_XML_NODE</a>.
     */
    node : WS_XML_NODE

    /**
     * The text content.
     */
    text : WS_XML_TEXT.Ptr

}
