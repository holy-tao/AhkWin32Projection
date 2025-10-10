#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only dynamic information for extended TCP statistics on the local receiver for a TCP connection.
 * @remarks
 * 
  * The <b>TCP_ESTATS_REC_ROD_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
  * 
  * The <b>TCP_ESTATS_REC_ROD_v0</b> is defined as version 0 of the structure for  read-only dynamic information for extended TCP statistics on the local receiver for a TCP connection.  This information is available after the connection has been established.
  * 
  * The <b>TCP_ESTATS_REC_ROD_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsRec</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics need to be enabled to retrieve this structure.
  * 
  * TCP congestion control and congestion control algorithms are discussed in detail in the IETF RFC 2581 on TCP Congestion Control. For more information, see <a href="http://tools.ietf.org/html/rfc2581">http://www.ietf.org/rfc/rfc2581.txt</a>.
  * 
  * Explicit Congestion Notification in IP is discussed in detail in the IETF RFC 2581 on The Addition of Explicit Congestion Notification
  *            (ECN) to IP. For more information, see <a href="http://tools.ietf.org/html/rfc3168">http://www.ietf.org/rfc/rfc3168.txt</a>.
  * 
  * The members of this structure are defined in the IETF RFC on the TCP Extended Statistics MIB. For more information, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
  * 
  * 
  * 
  * 
  * The following is the mapping of the members in the <b>TCP_ESTATS_REC_ROD_v0</b> structure to the entries defined in RFC 4898 for extended TCP statistics:
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
  * <a id="CurRwinSent"></a><a id="currwinsent"></a><a id="CURRWINSENT"></a><b>CurRwinSent</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfCurRwinSent
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MaxRwinSent"></a><a id="maxrwinsent"></a><a id="MAXRWINSENT"></a><b>MaxRwinSent</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfMaxRwinSent
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MinRwinSent"></a><a id="minrwinsent"></a><a id="MINRWINSENT"></a><b>MinRwinSent</b>
  * 
  * </td>
  * <td width="60%">
  * No mapping to this member.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="LimRwin"></a><a id="limrwin"></a><a id="LIMRWIN"></a><b>LimRwin</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsTuneLimRwin
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="DupAckEpisodes"></a><a id="dupackepisodes"></a><a id="DUPACKEPISODES"></a><b>DupAckEpisodes</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathDupAckEpisodes
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="DupAcksOut"></a><a id="dupacksout"></a><a id="DUPACKSOUT"></a><b>DupAcksOut</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathDupAcksOut
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CeRcvd"></a><a id="cercvd"></a><a id="CERCVD"></a><b>CeRcvd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathCERcvd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="EcnSent"></a><a id="ecnsent"></a><a id="ECNSENT"></a><b>EcnSent</b>
  * 
  * </td>
  * <td width="60%">
  * No mapping to this member.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="EcnNoncesRcvd"></a><a id="ecnnoncesrcvd"></a><a id="ECNNONCESRCVD"></a><b>EcnNoncesRcvd</b>
  * 
  * </td>
  * <td width="60%">
  * No mapping to this member.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CurReasmQueue"></a><a id="curreasmqueue"></a><a id="CURREASMQUEUE"></a><b>CurReasmQueue</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackCurReasmQueue
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MaxReasmQueue"></a><a id="maxreasmqueue"></a><a id="MAXREASMQUEUE"></a><b>MaxReasmQueue</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackMaxReasmQueue
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CurAppRQueue"></a><a id="curapprqueue"></a><a id="CURAPPRQUEUE"></a><b>CurAppRQueue</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsAppCurAppRQueue
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MaxAppRQueue"></a><a id="maxapprqueue"></a><a id="MAXAPPRQUEUE"></a><b>MaxAppRQueue</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsAppMaxAppRQueue
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="WinScaleSent"></a><a id="winscalesent"></a><a id="WINSCALESENT"></a><b>WinScaleSent</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackWinScaleSent
  * 
  * </td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpestats/ns-tcpestats-tcp_estats_rec_rod_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_REC_ROD_v0 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * The most recent window advertisement, in bytes, that has been sent.
     * @type {Integer}
     */
    CurRwinSent {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum window advertisement, in bytes, that has been sent.
     * @type {Integer}
     */
    MaxRwinSent {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The minimum window advertisement, in bytes, that has been sent.
     * @type {Integer}
     */
    MinRwinSent {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum window advertisement, in bytes, that may
     *            be sent.
     * @type {Integer}
     */
    LimRwin {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of Duplicate Acks Sent when prior Ack was not
     *            duplicate.  This is the number of times that a contiguous
     *            series of duplicate acknowledgments have been sent.
     * 
     *            
     * 
     * This is an indication of the number of data segments lost
     *            or reordered on the path from the remote TCP endpoint to
     *            the near TCP endpoint.
     * @type {Integer}
     */
    DupAckEpisodes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of duplicate ACKs sent.  
     * 
     * The ratio of the change
     *            in the <b>DupAcksOut</b> member to the change in
     *            the <b>DupAckEpisodes</b> member  is an indication of reorder or
     *            recovery distance over some interval.
     * @type {Integer}
     */
    DupAcksOut {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of segments received with IP headers bearing
     *            Congestion Experienced (CE) markings.
     * @type {Integer}
     */
    CeRcvd {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved for future use. This member is always set to zero.
     * @type {Integer}
     */
    EcnSent {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved for future use. This member is always set to zero.
     * @type {Integer}
     */
    EcnNoncesRcvd {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The current number of bytes of sequence space spanned by
     *            the reassembly queue.
     * 
     * This is generally the difference
     *            between rcv.nxt and the sequence number of the right most
     *            edge of the reassembly queue.
     * @type {Integer}
     */
    CurReasmQueue {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum number of bytes of sequence space spanned by
     *            the reassembly queue. 
     * 
     * This is the maximum value of the <b>CurReasmQueue</b> member.
     * @type {Integer}
     */
    MaxReasmQueue {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>SIZE_T</b>
     * 
     * The current number of bytes of application data that has
     *            been acknowledged by TCP but not yet delivered to the
     *            application.
     * @type {Pointer}
     */
    CurAppRQueue {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>SIZE_T</b>
     * 
     * The maximum number of bytes of application data that has
     *            been acknowledged by TCP but not yet delivered to the
     *            application.
     * @type {Pointer}
     */
    MaxAppRQueue {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>UCHAR</b>
     * 
     * The value of the transmitted window scale option if one was
     *            sent; otherwise, a value of -1.
     * 
     * Note that if both the <b>WinScaleSent</b> member and
     *            the <b>WinScaleRcvd</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_obs_rec_rod_v0">TCP_ESTATS_OBS_REC_ROD_v0</a> structure are not -1, then Rcv.Wind.Scale
     *            will be the same as this value and used to scale receiver
     *            window announcements from the local host to the remote
     *            host.
     * @type {Integer}
     */
    WinScaleSent {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }
}
