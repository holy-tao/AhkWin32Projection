#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The INTERNET_DIAGNOSTIC_SOCKET_INFO structure is returned by the InternetQueryOption function when the INTERNET_OPTION_DIAGNOSTIC_SOCKET_INFO flag is passed to it together with a handle to an HTTP Request.
 * @remarks
 * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wininet/ns-wininet-internet_diagnostic_socket_info
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_DIAGNOSTIC_SOCKET_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Descriptor that identifies the socket associated with the specified HTTP Request.
     * @type {Pointer}
     */
    Socket {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The address of the port at which the HTTP Request and response was received.
     * @type {Integer}
     */
    SourcePort {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The address of the port at which the response was sent.
     * @type {Integer}
     */
    DestPort {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IDSI_FLAG_KEEP_ALIVE"></a><a id="idsi_flag_keep_alive"></a><dl>
     * <dt><b>IDSI_FLAG_KEEP_ALIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 	Set if the connection is from the "keep-alive" pool.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IDSI_FLAG_SECURE"></a><a id="idsi_flag_secure"></a><dl>
     * <dt><b>IDSI_FLAG_SECURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if the HTTP Request is using a secure socket.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IDSI_FLAG_PROXY"></a><a id="idsi_flag_proxy"></a><dl>
     * <dt><b>IDSI_FLAG_PROXY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if a proxy is being used to reach the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IDSI_FLAG_TUNNEL"></a><a id="idsi_flag_tunnel"></a><dl>
     * <dt><b>IDSI_FLAG_TUNNEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set if a proxy is being used to create a tunnel.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
