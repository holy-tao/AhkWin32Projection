#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only static information for extended TCP statistics on the maximum congestion window for a TCP connection.
 * @remarks
 * 
 * The <b>TCP_ESTATS_SND_CONG_ROS_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
 * 
 * The <b>TCP_ESTATS_SND_CONG_ROS_v0</b> is defined as version 0 of the structure for  read-only dynamic information on basic sender congestion data for a TCP connection.  This information is available after the connection has been established.
 * 
 * The <b>TCP_ESTATS_SND_CONG_ROS_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsSndCong</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics need to be enabled to retrieve this structure.
 * 
 * TCP congestion control and congestion control algorithms are discussed in detail in the IETF RFC on TCP Congestion Control. For more information, see <a href="http://tools.ietf.org/html/rfc2581">http://www.ietf.org/rfc/rfc2581.txt</a>.
 * 
 * The members of this structure are defined in the IETF RFC on the TCP Extended Statistics MIB. For more information, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
 * 
 * 
 * 
 * 
 * The following is the mapping of the members in the <b>TCP_ESTATS_SND_CONG_ROS_v0</b> structure to the entries defined in RFC 4898 for extended TCP statistics:
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
 * <a id="LimCwnd"></a><a id="limcwnd"></a><a id="LIMCWND"></a><b>LimCwnd</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsTuneLimCwnd
 * 
 * </td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpestats/ns-tcpestats-tcp_estats_snd_cong_ros_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_SND_CONG_ROS_v0 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The maximum size, in bytes, of the congestion window that may be
     *            used.
     * @type {Integer}
     */
    LimCwnd {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
