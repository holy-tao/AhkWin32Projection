#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include ..\..\Networking\WinSock\SCOPE_ID.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_IN6.ahk
#Include .\PEER_ADDRESS.ahk

/**
 * The PEER_CONNECTION_INFO structure contains information about a connection. This structure is returned when you are enumerating peer graphing or grouping connections.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_connection_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_CONNECTION_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Specifies the size a structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the type of connection to a remote node. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_connection_flags">PEER_CONNECTION_FLAGS</a>.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the  unique ID of a connection.
     * @type {Integer}
     */
    ullConnectionId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the  unique ID of a node.
     * @type {Integer}
     */
    ullNodeId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Points to a string that identifies the node on the other end of a connection.
     * @type {PWSTR}
     */
    pwzPeerId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the address of a remote node. The address is contained in a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structure.
     * @deprecated 
     * @type {PEER_ADDRESS}
     */
    address{
        get {
            if(!this.HasProp("__address"))
                this.__address := PEER_ADDRESS(32, this)
            return this.__address
        }
    }
}
