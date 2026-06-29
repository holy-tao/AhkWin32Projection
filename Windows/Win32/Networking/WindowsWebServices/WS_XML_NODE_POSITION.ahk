#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_BUFFER.ahk" { WS_XML_BUFFER }

/**
 * Represents a position within an XML buffer.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_node_position
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_NODE_POSITION {
    #StructPack 8

    /**
     * The xml buffer to which the position refers.
     */
    buffer : WS_XML_BUFFER.Ptr

    /**
     * An internal handle to the node.
     */
    node : IntPtr

}
