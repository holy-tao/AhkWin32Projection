#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a position within an XML buffer.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_node_position
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_NODE_POSITION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The xml buffer to which the position refers.
     * @type {Pointer<WS_XML_BUFFER>}
     */
    buffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * An internal handle to the node.
     * @type {Pointer<Void>}
     */
    node {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
