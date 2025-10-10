#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PPP_IPCP_INFO2 structure contains the result of a PPP Internet Protocol (IP) negotiation.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ppp_ipcp_info2
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_IPCP_INFO2 extends Win32Struct
{
    static sizeof => 76

    static packingSize => 4

    /**
     * Specifies the result of the PPP control protocol negotiation. A value of zero indicates success. A nonzero value indicates failure, and is the actual fatal error that occurred during the control protocol negotiation.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a Unicode string that holds the local computer's IP address for the connection. This string has the form <i>a</i><b>.</b><i>b</i><b>.</b><i>c</i><b>.</b><i>d</i>; for example, "10.102.235.84". 
     * 
     * 
     * 
     * 
     * The 
     * <b>PPP_IPCP_INFO2</b> structures provides address information from the perspective of the server. For example, if a remote access client is connecting to a RAS server, this member holds the IP address of the server.
     * @type {String}
     */
    wszAddress {
        get => StrGet(this.ptr + 4, 15, "UTF-16")
        set => StrPut(value, this.ptr + 4, 15, "UTF-16")
    }

    /**
     * Specifies a Unicode string that holds the IP address of the remote computer. This string has the form <i>a</i><b>.</b><i>b</i><b>.</b><i>c</i><b>.</b><i>d</i>. If the address is not available, this member specifies an empty string. 
     * 
     * 
     * 
     * 
     * The 
     * <b>PPP_IPCP_INFO2</b> structures provides address information from the perspective of the server. For example, if a remote access client is connecting to a RAS server, this member holds the IP address of the client.
     * @type {String}
     */
    wszRemoteAddress {
        get => StrGet(this.ptr + 36, 15, "UTF-16")
        set => StrPut(value, this.ptr + 36, 15, "UTF-16")
    }

    /**
     * Specifies IPCP options for the local computer. Currently, the only option is PPP_IPCP_VJ. This option indicates that IP datagrams sent by the local computer are compressed using Van Jacobson compression.
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Specifies IPCP options for the remote peer. Currently, the only option is PPP_IPCP_VJ. This option indicates that IP datagrams sent by the remote peer (that is, received by the local computer) are compressed using Van Jacobson compression.
     * @type {Integer}
     */
    dwRemoteOptions {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
