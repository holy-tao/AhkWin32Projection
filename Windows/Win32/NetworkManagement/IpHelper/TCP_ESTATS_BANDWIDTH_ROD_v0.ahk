#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains read-only dynamic information for extended TCP statistics on bandwidth estimation for a TCP connection.
 * @remarks
 * The <b>TCP_ESTATS_BANDWIDTH_ROD_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
 * 
 * The <b>TCP_ESTATS_BANDWIDTH_ROD_v0</b> is defined as version 0 of the structure for  read-only dynamic information for extended TCP statistics on bandwidth estimation for a TCP connection.  This information is available after the connection has been established.
 * 
 * The <b>TCP_ESTATS_BANDWIDTH_ROD_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsBandwidth</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics need to be enabled to retrieve this structure.
 * 
 * The members of this structure are not defined in the IETF RFC on the TCP Extended Statistics MIB. For more information on this RFC, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
 * @see https://learn.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rod_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct TCP_ESTATS_BANDWIDTH_ROD_v0 {
    #StructPack 8

    /**
     * Type: <b>ULONG64</b>
     * 
     * The computed outbound bandwidth estimate, in bits per second, for the network path for the TCP connection.
     */
    OutboundBandwidth : Int64

    /**
     * Type: <b>ULONG64</b>
     * 
     * The computed inbound bandwidth estimate, in bits per second, for the network path for the TCP connection.
     */
    InboundBandwidth : Int64

    /**
     * Type: <b>ULONG64</b>
     * 
     * A measure, in bits per second, of the instability of the outbound bandwidth estimate for the network path for the TCP connection.
     */
    OutboundInstability : Int64

    /**
     * Type: <b>ULONG64</b>
     * 
     * A measure, in bits per second, of the instability of the inbound bandwidth estimate for the network path for the TCP connection.
     */
    InboundInstability : Int64

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * A boolean value that indicates if the computed outbound bandwidth estimate for the network path for the TCP connection has reached its peak value.
     */
    OutboundBandwidthPeaked : BOOLEAN

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * A boolean value that indicates if the computed inbound bandwidth estimate for the network path for the TCP connection has reached its peak value.
     */
    InboundBandwidthPeaked : BOOLEAN

}
