#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies generic security requirements for a socket.
 * @remarks
 * 
  * The <b>SOCKET_SECURITY_SETTINGS</b> structure is supported on Windows Vista and later.
  * 
  * The <b>SOCKET_SECURITY_SETTINGS</b> structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsasetsocketsecurity">WSASetSocketSecurity</a> function to enable and apply security on  a socket.
  * 
  * Security settings not addressed in this structure are derived from the system default policy or the administratively configured policy. It is recommended that most applications specify a value of  <b>SOCKET_SECURITY_PROTOCOL_DEFAULT</b> for the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-socket_security_protocol">SOCKET_SECURITY_PROTOCOL</a> enumeration in the <b>SecurityProtocol</b> member.  This makes the application neutral to security protocols and allows easier deployments among different systems.
  * 
  * Advanced applications can specify a security protocol and associated settings by casting them to the <b>SOCKET_SECURITY_SETTINGS</b> type.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mstcpip/ns-mstcpip-socket_security_settings
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKET_SECURITY_SETTINGS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-socket_security_protocol">SOCKET_SECURITY_PROTOCOL</a> value that identifies the type of security protocol to be used on the socket.
     * @type {Integer}
     */
    SecurityProtocol {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A set of flags that allow applications to set specific security requirements on a socket. The possible values are defined in the <i>Mstcpip.h</i> header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCKET_SETTINGS_GUARANTEE_ENCRYPTION"></a><a id="socket_settings_guarantee_encryption"></a><dl>
     * <dt><b>SOCKET_SETTINGS_GUARANTEE_ENCRYPTION</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that guaranteed encryption of traffic is required.  This flag should be set if the default policy prefers methods of protection that do not use encryption. If this flag is set and encryption is not possible for any reason, no packets will be sent and a connection will not be established.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCKET_SETTINGS_ALLOW_INSECURE"></a><a id="socket_settings_allow_insecure"></a><dl>
     * <dt><b>SOCKET_SETTINGS_ALLOW_INSECURE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that clear text connections are allowed.  If this flag is set, some or all of the sent packets will be sent in clear text, especially if security with the peer could not be negotiated.
     * 
     * <div class="alert"><b>Note</b>  If this flag is not set, it is guaranteed that packets will never be sent in clear text, even if security negotiation fails.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    SecurityFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
