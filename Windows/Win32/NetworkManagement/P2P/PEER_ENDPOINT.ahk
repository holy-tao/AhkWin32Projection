#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Networking\WinSock\IN6_ADDR.ahk" { IN6_ADDR }
#Import ".\PEER_ADDRESS.ahk" { PEER_ADDRESS }
#Import "..\..\Networking\WinSock\SOCKADDR_IN6.ahk" { SOCKADDR_IN6 }
#Import "..\..\Networking\WinSock\SCOPE_ID.ahk" { SCOPE_ID }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * The PEER_ENDPOINT structure contains the address and friendly name of a peer endpoint.
 * @remarks
 * A peer "endpoint" describes a contact's presence location — the unique network address configuration that describes the currently available instance of the contact within the peer collaboration network. A single contact can be available at multiple endpoints within the peer collaboration network.
 * 
 * A peer watching a contact can query any of the endpoints associated with that contact for specific peer presence, application, or object updates.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_endpoint
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_ENDPOINT {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structure that contains the IPv6 network address of the endpoint.
     * @deprecated
     */
    address : PEER_ADDRESS

    /**
     * Zero-terminated Unicode string that contains the specific displayable name of the endpoint.
     */
    pwzEndpointName : PWSTR

}
