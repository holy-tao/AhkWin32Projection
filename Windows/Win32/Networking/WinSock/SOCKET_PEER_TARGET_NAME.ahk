#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import ".\SOCKET_SECURITY_PROTOCOL.ahk" { SOCKET_SECURITY_PROTOCOL }
#Import ".\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains the IP address and name for a peer target and the type of security protocol to be used on a socket.
 * @remarks
 * The <b>SOCKET_PEER_TARGET_NAME</b> structure  is supported on Windows Vista and later.
 * 
 * The <b>SOCKET_PEER_TARGET_NAME</b> structure  is used by the <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsasetsocketpeertargetname">WSASetSocketPeerTargetName</a> function to specify the peer target name that corresponds to a peer IP address.  This target name is meant to be specified by client applications to securely identify the peer that should be authenticated.
 * 
 * Currently, the only type of security protocol that is supported is IPsec. So specifying an enumeration value  of <b>SOCKET_SECURITY_PROTOCOL_DEFAULT</b> has the same effect as specifying <b>SOCKET_SECURITY_PROTOCOL_IPSEC</b> in the <b>SecurityProtocol</b> member. 
 * 
 * The implementation of IPsec on Windows Vista and Windows Server 2008 only supports computer-to-computer and user-to-computer authentication. As a result, the peer target name specified in the <b>AllStrings</b> member of the <b>SOCKET_PEER_TARGET_NAME</b> structure  should refer to the peer computer principal.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-socket_peer_target_name
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKET_PEER_TARGET_NAME {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-socket_security_protocol">SOCKET_SECURITY_PROTOCOL</a> value that identifies the type of protocol used to secure the traffic on the socket.
     */
    SecurityProtocol : SOCKET_SECURITY_PROTOCOL

    /**
     * The IP address of the peer for the socket.
     */
    PeerAddress : SOCKADDR_STORAGE

    /**
     * The length, in bytes, of the peer target name in the <b>AllStrings</b> member.
     */
    PeerTargetNameStringLen : UInt32

    /**
     * The peer target name for the socket.
     */
    AllStrings : WCHAR[1]

}
