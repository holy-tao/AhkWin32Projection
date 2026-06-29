#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\PEER_ADDRESS.ahk" { PEER_ADDRESS }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * The PEER_CONNECTION_INFO structure contains information about a connection. This structure is returned when you are enumerating peer graphing or grouping connections.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_connection_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_CONNECTION_INFO {
    #StructPack 8

    /**
     * Specifies the size a structure.
     */
    dwSize : UInt32

    /**
     * Specifies the type of connection to a remote node. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_connection_flags">PEER_CONNECTION_FLAGS</a>.
     */
    dwFlags : UInt32

    /**
     * Specifies the  unique ID of a connection.
     */
    ullConnectionId : Int64

    /**
     * Specifies the  unique ID of a node.
     */
    ullNodeId : Int64

    /**
     * Points to a string that identifies the node on the other end of a connection.
     */
    pwzPeerId : PWSTR

    /**
     * Specifies the address of a remote node. The address is contained in a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structure.
     * @deprecated
     */
    address : PEER_ADDRESS

}
