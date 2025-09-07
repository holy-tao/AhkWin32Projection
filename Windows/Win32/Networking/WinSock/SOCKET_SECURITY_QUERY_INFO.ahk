#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains security information returned by the WSAQuerySocketSecurity function.
 * @remarks
 * The <b>SOCKET_SECURITY_QUERY_INFO</b> structure  is supported on Windows Vista and later.
  * 
  * The <b>SOCKET_SECURITY_QUERY_INFO</b> structure  is used by the <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsaquerysocketsecurity">WSAQuerySocketSecurity</a> function to return information about the security applied to a connection on a socket.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-socket_security_query_info
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKET_SECURITY_QUERY_INFO extends Win32Struct
{
    static sizeof => 24

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
     * The  set of possible security flags for the connection defined in the <i>Mstcpip.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCKET_INFO_CONNECTION_SECURED"></a><a id="socket_info_connection_secured"></a><dl>
     * <dt><b>SOCKET_INFO_CONNECTION_SECURED</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If present, traffic is being secured by a security protocol.  If absent, the traffic is flowing in the clear.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCKET_INFO_CONNECTION_ENCRYPTED"></a><a id="socket_info_connection_encrypted"></a><dl>
     * <dt><b>SOCKET_INFO_CONNECTION_ENCRYPTED</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If present, the connection traffic is being encrypted.  The          <b>SOCKET_INFO_CONNECTION_SECURED</b> flag is always set when this flag is present.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A handle to the access token that represents the account under which the peer application is running.  After using the token for access checks, the application should close the handle using the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @type {Integer}
     */
    PeerApplicationAccessTokenHandle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A handle to the access token for the peer computer's account during the course of the application.  After using the token for access checks, the application should close the handle using the <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function.
     * @type {Integer}
     */
    PeerMachineAccessTokenHandle {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
