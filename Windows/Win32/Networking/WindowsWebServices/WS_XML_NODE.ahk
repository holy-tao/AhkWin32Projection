#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_NODE_TYPE.ahk

/**
 * The base type for all the different kinds of XML nodes. An XML node is unit of data in XML.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_node
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_XML_NODE extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * Indicates the type of node this structure refers to.
     * @type {WS_XML_NODE_TYPE}
     */
    nodeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
