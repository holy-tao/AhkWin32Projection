#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_XML_NODE_TYPE.ahk" { WS_XML_NODE_TYPE }
#Import ".\WS_XML_NODE.ahk" { WS_XML_NODE }
#Import ".\WS_XML_DICTIONARY.ahk" { WS_XML_DICTIONARY }

/**
 * Represents a comment.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_comment_node
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_COMMENT_NODE {
    #StructPack 8

    /**
     * The base type for all types that derive from <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_xml_node">WS_XML_NODE</a>.
     */
    node : WS_XML_NODE

    /**
     * The textual content of the comment.  In the example, it is the string "The message follows".
     */
    value : WS_XML_STRING

}
