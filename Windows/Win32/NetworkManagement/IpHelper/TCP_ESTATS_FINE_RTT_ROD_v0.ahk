#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only dynamic information for extended TCP statistics on fine-grained round-trip time (RTT) estimation for a TCP connection.
 * @remarks
 * 
  * The <b>TCP_ESTATS_FINE_RTT_ROD_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
  * 
  * The <b>TCP_ESTATS_FINE_RTT_ROD_v0</b> is defined as version 0 of the structure for  read-only dynamic information for extended TCP statistics on fine-grained round-trip time estimation for a TCP connection.  This information is available after the connection has been established.
  * 
  * The <b>TCP_ESTATS_FINE_RTT_ROD_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsFineRtt</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics need to be enabled to retrieve this structure.
  * 
  * The TCP retransmission timer is discussed in detail in the IETF RFC 2988 on Computing TCP's Retransmission Timer For more information, see <a href="http://tools.ietf.org/html/rfc2988">http://www.ietf.org/rfc/rfc2988.txt</a>.
  * 
  * The members of this structure are not defined in the IETF RFC on the TCP Extended Statistics MIB. However, there are members in the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_path_rod_v0">TCP_ESTATS_PATH_ROD_v0</a> structure that provide similar time measurements in milliseconds. For more information, see the <b>TCP_ESTATS_PATH_ROD_v0</b> structure and <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpestats/ns-tcpestats-tcp_estats_fine_rtt_rod_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_FINE_RTT_ROD_v0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>ULONG</b>
     * 
     * The round trip time variation, in microseconds, used in receive window auto-tuning when the TCP extended statistics feature is enabled.
     * @type {Integer}
     */
    RttVar {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum sampled round trip time, in microseconds.
     * @type {Integer}
     */
    MaxRtt {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The minimum sampled round trip time, in microseconds.
     * @type {Integer}
     */
    MinRtt {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * A smoothed value round trip time, in microseconds,  computed from all sampled round trip times. The smoothing is a weighted additive function that uses the <b>RttVar</b> member.
     * @type {Integer}
     */
    SumRtt {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
