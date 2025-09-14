#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKADDR_STORAGE.ahk

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
 * @version v4.0.30319
 */
class SOCKET_SECURITY_QUERY_TEMPLATE extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-socket_security_protocol">SOCKET_SECURITY_PROTOCOL</a> value that identifies the protocol used to secure the traffic.
     * @type {Integer}
     */
    SecurityProtocol {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The IP address of the peer for which security information is being queried.  For connection-oriented sockets (protocol of <b>IPPROTO_TCP</b>), the connected socket uniquely identifies a peer.  In this case, this parameter is ignored.
     * @type {SOCKADDR_STORAGE}
     */
    PeerAddress{
        get {
            if(!this.HasProp("__PeerAddress"))
                this.__PeerAddress := SOCKADDR_STORAGE(this.ptr + 8)
            return this.__PeerAddress
        }
    }

    /**
     * The access mask used for opening the peer user application and computer token handles that are returned as part of the query information.
     * @type {Integer}
     */
    PeerTokenAccessMask {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }
}
