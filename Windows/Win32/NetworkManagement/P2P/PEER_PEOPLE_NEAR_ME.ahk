#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PEER_ENDPOINT.ahk" { PEER_ENDPOINT }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\PEER_ADDRESS.ahk" { PEER_ADDRESS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * Contains information about a peer in the same logical or virtual subnet.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_people_near_me
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_PEOPLE_NEAR_ME {
    #StructPack 8

    /**
     * Zero-terminated Unicode string that contains the nickname of the contact.
     */
    pwzNickName : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_endpoint">PEER_ENDPOINT</a> structure that contains the IPv6 network address of the peer whose endpoint shares the same subnet.
     * @deprecated
     */
    endpoint : PEER_ENDPOINT

    /**
     * GUID value that contains the unique ID value for this peer.  Since this value uniquely identifies a peer endpoint, the display name and even the associated IPv6 address can be changed with deleting the rest of the peer information.
     */
    id : Guid

}
