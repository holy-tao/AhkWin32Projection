#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_NODE_TYPE.ahk" { WS_XML_NODE_TYPE }

/**
 * The base type for all the different kinds of XML nodes. An XML node is unit of data in XML.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_node
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_NODE {
    #StructPack 4

    /**
     * Indicates the type of node this structure refers to.
     */
    nodeType : WS_XML_NODE_TYPE

}
