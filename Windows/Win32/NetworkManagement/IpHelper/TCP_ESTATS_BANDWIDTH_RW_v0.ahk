#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read/write configuration information for extended TCP statistics on bandwidth estimation for a TCP connection.
 * @remarks
 * The <b>TCP_ESTATS_BANDWIDTH_RW_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
 * 
 * The <b>TCP_ESTATS_BANDWIDTH_RW_v0</b> is defined as version 0 of the structure for  read/write configuration information on bandwidth estimation for a TCP connection.  
 * 
 * Extended TCP statistics on bandwidth estimation for a TCP connection are enabled and disabled using this structure and the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcp6connectionestats">SetPerTcp6ConnectionEStats</a> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcpconnectionestats">SetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsBandwidth</b> is passed in the <i>EstatsType</i> parameter.
 * 
 * The <i>Offset</i> parameter passed to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcp6connectionestats">SetPerTcp6ConnectionEStats</a> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcpconnectionestats">SetPerTcpConnectionEStats</a> functions is currently unused and must be set to 0. Consequently, the <b>TCP_ESTATS_BANDWIDTH_RW_v0</b> structure pointed to by the <i>Rw</i> parameter when the <i>EstatsType</i> parameter is set to <b>TcpConnectionEstatsBandwidth</b> must have both the <b>EnableCollectionOutbound</b> and <b>EnableCollectionInbound</b> structure members set to the preferred values in a single call to the  <b>SetPerTcp6ConnectionEStats</b> and <b>SetPerTcpConnectionEStats</b> functions.
 * 
 * The <b>TCP_ESTATS_BANDWIDTH_RW_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsBandwidth</b> is passed in the <i>EstatsType</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rw_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_BANDWIDTH_RW_v0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A value that indicates if extended statistics on a TCP connection should be collected for outbound bandwidth estimation. 
     * 
     * If this member is set to <b>TcpBoolOptEnabled</b>, extended statistics on the TCP connection for outbound bandwidth estimation are enabled. If this member is set to <b>TcpBoolOptDisabled</b>, extended statistics on the TCP connection for outbound bandwidth estimation are disabled. If this member is set to <b>TcpBoolOptUnchanged</b>, extended statistics on the TCP connection for outbound bandwidth estimation are left unchanged. 
     * 
     * The default state for this member when not set is disabled.
     * @type {Integer}
     */
    EnableCollectionOutbound {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value that indicates if extended statistics on a TCP connection should be collected for inbound bandwidth estimation. 
     * 
     * If this member is set to <b>TcpBoolOptEnabled</b>, extended statistics on the TCP connection for inbound bandwidth estimation are enabled. If this member is set to <b>TcpBoolOptDisabled</b>, extended statistics on the TCP connection for inbound bandwidth estimation are disabled. If this member is set to <b>TcpBoolOptUnchanged</b>, extended statistics on the TCP connection for inbound bandwidth estimation are unchanged. 
     * 
     * The default state for this member when not set is disabled.
     * @type {Integer}
     */
    EnableCollectionInbound {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
