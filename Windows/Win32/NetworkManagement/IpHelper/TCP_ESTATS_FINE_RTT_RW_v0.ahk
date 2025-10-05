#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read/write configuration information for extended TCP statistics on fine-grained round-trip time (RTT) estimation statistics for a TCP connection.
 * @remarks
 * The <b>TCP_ESTATS_FINE_RTT_RW_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
  * 
  * The <b>TCP_ESTATS_FINE_RTT_RW_v0</b> is defined as version 0 of the structure for  read/write configuration information on fine-grained round-trip time estimation statistics for a TCP connection.
  * 
  * Extended TCP statistics on extended path measurement information for a TCP connection are enabled and disabled using this structure and the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcp6connectionestats">SetPerTcp6ConnectionEStats</a> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcpconnectionestats">SetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsFineRtt</b> is passed in the <i>EstatsType</i> parameter.
  * 
  * The <b>TCP_ESTATS_FINE_RTT_RW_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsFineRtt</b> is passed in the <i>EstatsType</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_fine_rtt_rw_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_FINE_RTT_RW_v0 extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * A value that indicates if extended statistics on a TCP connection should be collected for fine-grained RTT estimation statistics. 
     * 
     * If this member is set to <b>TRUE</b>, extended statistics on the TCP connection are enabled. If this member is set to <b>FALSE</b>, extended statistics on the TCP connection are disabled. 
     * 
     * The default state for this member when not set is disabled.
     * @type {Integer}
     */
    EnableCollection {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
