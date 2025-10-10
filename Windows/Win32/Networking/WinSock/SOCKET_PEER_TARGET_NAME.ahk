#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKADDR_STORAGE.ahk

/**
 * Contains the IP address and name for a peer target and the type of security protocol to be used on a socket.
 * @remarks
 * 
  * The <b>SOCKET_PEER_TARGET_NAME</b> structure  is supported on Windows Vista and later.
  * 
  * The <b>SOCKET_PEER_TARGET_NAME</b> structure  is used by the <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsasetsocketpeertargetname">WSASetSocketPeerTargetName</a> function to specify the peer target name that corresponds to a peer IP address.  This target name is meant to be specified by client applications to securely identify the peer that should be authenticated.
  * 
  * Currently, the only type of security protocol that is supported is IPsec. So specifying an enumeration value  of <b>SOCKET_SECURITY_PROTOCOL_DEFAULT</b> has the same effect as specifying <b>SOCKET_SECURITY_PROTOCOL_IPSEC</b> in the <b>SecurityProtocol</b> member. 
  * 
  * The implementation of IPsec on Windows Vista and Windows Server 2008 only supports computer-to-computer and user-to-computer authentication. As a result, the peer target name specified in the <b>AllStrings</b> member of the <b>SOCKET_PEER_TARGET_NAME</b> structure  should refer to the peer computer principal.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mstcpip/ns-mstcpip-socket_peer_target_name
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKET_PEER_TARGET_NAME extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-socket_security_protocol">SOCKET_SECURITY_PROTOCOL</a> value that identifies the type of protocol used to secure the traffic on the socket.
     * @type {Integer}
     */
    SecurityProtocol {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The IP address of the peer for the socket.
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
     * The length, in bytes, of the peer target name in the <b>AllStrings</b> member.
     * @type {Integer}
     */
    PeerTargetNameStringLen {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }

    /**
     * The peer target name for the socket.
     * @type {String}
     */
    AllStrings {
        get => StrGet(this.ptr + 260, 0, "UTF-16")
        set => StrPut(value, this.ptr + 260, 0, "UTF-16")
    }
}
