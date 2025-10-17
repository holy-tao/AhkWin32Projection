#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only dynamic information for extended TCP statistics on bandwidth estimation for a TCP connection.
 * @remarks
 * 
  * The <b>TCP_ESTATS_BANDWIDTH_ROD_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
  * 
  * The <b>TCP_ESTATS_BANDWIDTH_ROD_v0</b> is defined as version 0 of the structure for  read-only dynamic information for extended TCP statistics on bandwidth estimation for a TCP connection.  This information is available after the connection has been established.
  * 
  * The <b>TCP_ESTATS_BANDWIDTH_ROD_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsBandwidth</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics need to be enabled to retrieve this structure.
  * 
  * The members of this structure are not defined in the IETF RFC on the TCP Extended Statistics MIB. For more information on this RFC, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpestats/ns-tcpestats-tcp_estats_bandwidth_rod_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_BANDWIDTH_ROD_v0 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>ULONG64</b>
     * 
     * The computed outbound bandwidth estimate, in bits per second, for the network path for the TCP connection.
     * @type {Integer}
     */
    OutboundBandwidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The computed inbound bandwidth estimate, in bits per second, for the network path for the TCP connection.
     * @type {Integer}
     */
    InboundBandwidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * A measure, in bits per second, of the instability of the outbound bandwidth estimate for the network path for the TCP connection.
     * @type {Integer}
     */
    OutboundInstability {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * A measure, in bits per second, of the instability of the inbound bandwidth estimate for the network path for the TCP connection.
     * @type {Integer}
     */
    InboundInstability {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * A boolean value that indicates if the computed outbound bandwidth estimate for the network path for the TCP connection has reached its peak value.
     * @type {BOOLEAN}
     */
    OutboundBandwidthPeaked {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * A boolean value that indicates if the computed inbound bandwidth estimate for the network path for the TCP connection has reached its peak value.
     * @type {BOOLEAN}
     */
    InboundBandwidthPeaked {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }
}
