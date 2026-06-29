#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import ".\SOCKET_SECURITY_PROTOCOL.ahk" { SOCKET_SECURITY_PROTOCOL }
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains the security template used by the WSAQuerySocketSecurity function.
 * @remarks
 * The <b>SOCKET_SECURITY_QUERY_TEMPLATE</b> structure  is supported on Windows Vista and later.
 * 
 * The <b>SOCKET_SECURITY_QUERY_TEMPLATE</b> structure  is used by the <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsaquerysocketsecurity">WSAQuerySocketSecurity</a> function to specify the type of query information to return for a socket. The <b>SOCKET_SECURITY_QUERY_TEMPLATE</b> structure passed to the <b>WSAQuerySocketSecurity</b> function may contain zeros for all members to request default security information. 
 * 
 * If the <b>SOCKET_SECURITY_QUERY_TEMPLATE</b> structure  is specified with the <b>PeerTokenAccessMask</b> member not specified (set to zero), then the <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsaquerysocketsecurity">WSAQuerySocketSecurity</a> function will not return the <b>PeerApplicationAccessTokenHandle</b> and <b>PeerMachineAccessTokenHandle</b> members in the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-socket_security_query_info">SOCKET_SECURITY_QUERY_INFO</a> structure.
 * 
 * Currently, the only type of security protocol that is supported is IPsec. So specifying an enumeration value  of <b>SOCKET_SECURITY_PROTOCOL_DEFAULT</b> for the <b>SecurityProtocol</b> member has the same effect as specifying <b>SOCKET_SECURITY_PROTOCOL_IPSEC</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-socket_security_query_template
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKET_SECURITY_QUERY_TEMPLATE {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-socket_security_protocol">SOCKET_SECURITY_PROTOCOL</a> value that identifies the protocol used to secure the traffic.
     */
    SecurityProtocol : SOCKET_SECURITY_PROTOCOL

    /**
     * The IP address of the peer for which security information is being queried.  For connection-oriented sockets (protocol of <b>IPPROTO_TCP</b>), the connected socket uniquely identifies a peer.  In this case, this parameter is ignored.
     */
    PeerAddress : SOCKADDR_STORAGE

    /**
     * The access mask used for opening the peer user application and computer token handles that are returned as part of the query information.
     */
    PeerTokenAccessMask : UInt32

}
