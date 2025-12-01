#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only dynamic information for extended TCP statistics observed on the remote receiver for a TCP connection.
 * @remarks
 * The <b>TCP_ESTATS_OBS_REC_ROD_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
 * 
 * The <b>TCP_ESTATS_OBS_REC_ROD_v0</b> is defined as version 0 of the structure for  read-only dynamic information for extended TCP statistics on the local receiver for a TCP connection.  This information is available after the connection has been established.
 * 
 * The <b>TCP_ESTATS_OBS_REC_ROD_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsObsRec</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics need to be enabled to retrieve this structure.
 * 
 * The members of this structure are defined in the IETF RFC on the TCP Extended Statistics MIB. For more information, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
 * 
 * 
 * 
 * 
 * The following is the mapping of the members in the <b>TCP_ESTATS_OBS_REC_ROD_v0</b> structure to the entries defined in RFC 4898 for extended TCP statistics:
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
 * <a id="CurRwinRcvd"></a><a id="currwinrcvd"></a><a id="CURRWINRCVD"></a><b>CurRwinRcvd</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsPerfCurRwinRcvd
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MaxRwinRcvd"></a><a id="maxrwinrcvd"></a><a id="MAXRWINRCVD"></a><b>MaxRwinRcvd</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsPerfMaxRwinRcvd
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MinRwinRcvd"></a><a id="minrwinrcvd"></a><a id="MINRWINRCVD"></a><b>MinRwinRcvd</b>
 * 
 * </td>
 * <td width="60%">
 * No mapping to this member.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="WinScaleRcvd"></a><a id="winscalercvd"></a><a id="WINSCALERCVD"></a><b>WinScaleRcvd</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsStackWinScaleRcvd
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_obs_rec_rod_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_OBS_REC_ROD_v0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>ULONG</b>
     * 
     * The most recent window advertisement, in bytes, received from the remote receiver.
     * @type {Integer}
     */
    CurRwinRcvd {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum window advertisement, in bytes, received from the remote receiver.
     * @type {Integer}
     */
    MaxRwinRcvd {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The minimum window advertisement, in bytes, received from the remote receiver.
     * @type {Integer}
     */
    MinRwinRcvd {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The value of the received window scale option if one was
     *            received from the remote receiver; otherwise, a value of -1.
     * 
     * Note that if both the <b>WinScaleSent</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_rec_rod_v0">TCP_ESTATS_REC_ROD_v0</a> structure  and
     *            the <b>WinScaleRcvd</b> member are not -1, then Snd.Wind.Scale
     *            will be the same as this value and used to scale receiver
     *            window announcements from the remote host to the local
     *            host.
     * @type {Integer}
     */
    WinScaleRcvd {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }
}
