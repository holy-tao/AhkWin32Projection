#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of security protocol to be used on a socket to secure network traffic.
 * @remarks
 * This enumeration is supported on Windows Vista and later.
  * 
  * Currently, the only type of security protocol that is supported is IPsec. So specifying an enumeration value  of <b>SOCKET_SECURITY_PROTOCOL_DEFAULT</b> has the same effect as specifying <b>SOCKET_SECURITY_PROTOCOL_IPSEC</b>. 
  * 
  * The <b>SOCKET_SECURITY_PROTOCOL</b> enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-socket_peer_target_name">SOCKET_PEER_TARGET_NAME</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-socket_security_query_info">SOCKET_SECURITY_QUERY_INFO</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-socket_security_query_template">SOCKET_SECURITY_QUERY_TEMPLATE</a>, <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-socket_security_settings">SOCKET_SECURITY_SETTINGS</a>,  and <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ns-mstcpip-socket_security_settings_ipsec">SOCKET_SECURITY_SETTINGS_IPSEC</a> structures to indicate the type of security protocol to be used on a socket in the <b>SecurityProtocol</b> member. These structures are used by the  <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsaquerysocketsecurity">WSAQuerySocketSecurity</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsasetsocketpeertargetname">WSASetSocketPeerTargetName</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsasetsocketsecurity">WSASetSocketSecurity</a> functions.
  * 
  * In addition to identifying the security protocol, this type is also used to decide how to interpret a pointer passed to some of the secure socket functions. This is analogous to how the <b>sa_family</b> member of the <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> type is used to interpret a pointer as either <b>sockaddr_in</b> or <b>sockaddr_in6</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ne-mstcpip-socket_security_protocol
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKET_SECURITY_PROTOCOL{

    /**
     * The default system security will be used.
     * @type {Integer (Int32)}
     */
    static SOCKET_SECURITY_PROTOCOL_DEFAULT => 0

    /**
     * IPsec will be used.
     * @type {Integer (Int32)}
     */
    static SOCKET_SECURITY_PROTOCOL_IPSEC => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SOCKET_SECURITY_PROTOCOL_IPSEC2 => 2

    /**
     * The maximum possible value for the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-socket_security_protocol">SOCKET_SECURITY_PROTOCOL</a> enumeration type. This is not a legal value.
     * @type {Integer (Int32)}
     */
    static SOCKET_SECURITY_PROTOCOL_INVALID => 3
}
