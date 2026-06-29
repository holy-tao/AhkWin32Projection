#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * The PEER_ADDRESS structure specifies the information about the IP address.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_address
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_ADDRESS {
    #StructPack 4

    /**
     * Specifies the size of this structure.
     */
    dwSize : UInt32

    /**
     * Specifies the IP address of the node in the Peer Infrastructure.
     */
    sin6 : SOCKADDR_IN6

}
