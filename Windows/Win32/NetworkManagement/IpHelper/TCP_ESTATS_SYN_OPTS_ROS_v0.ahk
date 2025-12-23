#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only static information for extended TCP statistics on SYN exchange for a TCP connection.
 * @remarks
 * The <b>TCP_ESTATS_SYN_OPTS_ROS_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
 * 
 * The <b>TCP_ESTATS_SYN_OPTS_ROS_v0</b> is defined as version 0 of the structure for  read-only static information on SYN exchange for a TCP connection.  The TCP protocol does not permit the members of this structure to change after the SYN exchange. This information is available after the SYN exchange has completed.
 * 
 * The <b>TCP_ESTATS_SYN_OPTS_ROS_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsSynOpts</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics do not need to be enabled to retrieve this structure.
 * 
 * The MSS in the <b>MssRcvd</b> and <b>MssSent</b> members is the maximum data in a single TCP datagram. The MSS can be a very large value. 
 * 
 * The members of this structure are defined in the IETF RFC on the TCP Extended Statistics MIB. For more information, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
 * 
 * 
 * 
 * 
 * The following is the mapping of the members in the <b>TCP_ESTATS_SYN_OPTS_ROS_v0</b> structure to the entries defined in RFC 4898 for extended TCP statistics:
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Term</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="ActiveOpen"></a><a id="activeopen"></a><a id="ACTIVEOPEN"></a><b>ActiveOpen</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsStackActiveOpen
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MssRcvd"></a><a id="mssrcvd"></a><a id="MSSRCVD"></a><b>MssRcvd</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsStackMSSRcvd
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MssSent"></a><a id="msssent"></a><a id="MSSSENT"></a><b>MssSent</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsStackMSSSent
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_syn_opts_ros_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_SYN_OPTS_ROS_v0 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>BOOLEAN</b>
     * 
     * A value that indicates if the TCP connection was an active open. 
     * 
     * If the local connection traversed the SYN-SENT
     *            state, then this member is set to <b>TRUE</b>. Otherwise, this member is set to <b>FALSE</b>.
     * @type {BOOLEAN}
     */
    ActiveOpen {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The value received in an Maximum Segment Size (MSS) option during the SYN exchange, or zero if no MSS option was received. 
     * 
     * This value is the maximum data in a single TCP datagram that the remote host  can receive.
     * @type {Integer}
     */
    MssRcvd {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The value sent in an MSS option during the SYN exchange, or zero if no MSS option was sent.
     * @type {Integer}
     */
    MssSent {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
