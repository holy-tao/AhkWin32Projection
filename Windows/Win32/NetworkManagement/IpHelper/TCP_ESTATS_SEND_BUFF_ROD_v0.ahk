#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only dynamic information for extended TCP statistics on output queuing for a TCP connection.
 * @remarks
 * The <b>TCP_ESTATS_SEND_BUFF_ROD_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
 * 
 * The <b>TCP_ESTATS_SEND_BUFF_ROD_v0</b> is defined as version 0 of the structure for  read-only dynamic information for extended TCP statistics on output queuing for a TCP connection.  This information is available after the connection has been established.
 * 
 * The <b>TCP_ESTATS_SEND_BUFF_ROD_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsSendBuff</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics need to be enabled to retrieve this structure.
 * 
 * The members of this structure are defined in the IETF RFC on the TCP Extended Statistics MIB. For more information, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
 * 
 * 
 * 
 * 
 * The following is the mapping of the members in the <b>TCP_ESTATS_SEND_BUFF_ROD_v0</b> structure to the entries defined in RFC 4898 for extended TCP statistics:
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
 * <a id="CurRetxQueue"></a><a id="curretxqueue"></a><a id="CURRETXQUEUE"></a><b>CurRetxQueue</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsStackCurRetxQueue
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MaxRetxQueue"></a><a id="maxretxqueue"></a><a id="MAXRETXQUEUE"></a><b>MaxRetxQueue</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsStackMaxRetxQueue
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="CurAppWQueue"></a><a id="curappwqueue"></a><a id="CURAPPWQUEUE"></a><b>CurAppWQueue</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsAppCurAppWQueue
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="MaxAppWQueue"></a><a id="maxappwqueue"></a><a id="MAXAPPWQUEUE"></a><b>MaxAppWQueue</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsAppMaxAppWQueue
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/tcpestats/ns-tcpestats-tcp_estats_send_buff_rod_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_SEND_BUFF_ROD_v0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>SIZE_T</b>
     * 
     * The current number of bytes of data occupying the
     *            retransmit queue.
     * @type {Pointer}
     */
    CurRetxQueue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>SIZE_T</b>
     * 
     * The maximum number of bytes of data occupying the
     *            retransmit queue.
     * @type {Pointer}
     */
    MaxRetxQueue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>SIZE_T</b>
     * 
     * The current number of bytes of application data buffered
     *            by TCP, pending the first transmission (to the left of
     *            SND.NXT or SndMax).  
     * 
     * This data will generally be transmitted
     *            (and SND.NXT advanced to the left) as soon as there is an
     *            available congestion window or receiver window.  This is the amount of data readily available for
     *            transmission, without scheduling the application.  TCP
     *            performance may suffer if there is insufficient queued
     *            write data.
     * @type {Pointer}
     */
    CurAppWQueue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>SIZE_T</b>
     * 
     * The maximum number of bytes of application data buffered
     *            by TCP, pending the first transmission.  
     * 
     * This is the maximum
     *            value of the <b>CurAppWQueue</b> member.  The <b>MaxAppWQueue</b> and  <b>CurAppWQueue</b> members can
     *            be used to determine if insufficient queued data is steady
     *            state (suggesting insufficient queue space) or transient
     *            (suggesting insufficient application performance or
     *            excessive CPU load or scheduler latency).
     * @type {Pointer}
     */
    MaxAppWQueue {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
