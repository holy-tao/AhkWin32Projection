#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only dynamic information for extended TCP statistics on data transfer for a TCP connection.
 * @remarks
 * 
 * The <b>TCP_ESTATS_DATA_ROD_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
 * 
 * The <b>TCP_ESTATS_DATA_ROD_v0</b> is defined as version 0 of the structure for  read-only dynamic information for extended TCP statistics on data transfer for a TCP connection.  This information is available after the connection has been established.
 * 
 * The <b>TCP_ESTATS_DATA_ROD_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsData</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics need to be enabled to retrieve this structure.
 * 
 * The members of this structure are defined in the IETF RFC on the TCP Extended Statistics MIB. For more information, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
 * 
 * 
 * 
 * 
 * The following is the mapping of the members in the <b>TCP_ESTATS_DATA_ROD_v0</b> structure to the entries defined in RFC 4898 for extended TCP statistics:
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
 * <a id="DataBytesOut"></a><a id="databytesout"></a><a id="DATABYTESOUT"></a><b>DataBytesOut</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsPerfDataOctetsOut
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="DataSegsOut"></a><a id="datasegsout"></a><a id="DATASEGSOUT"></a><b>DataSegsOut</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsPerfDataSegsOut
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="DataBytesIn"></a><a id="databytesin"></a><a id="DATABYTESIN"></a><b>DataBytesIn</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsPerfDataOctetsIn
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="DataSegsIn"></a><a id="datasegsin"></a><a id="DATASEGSIN"></a><b>DataSegsIn</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsPerfDataSegsIn
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="SegsOut"></a><a id="segsout"></a><a id="SEGSOUT"></a><b>SegsOut</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsPerfSegsOut
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="SegsIn"></a><a id="segsin"></a><a id="SEGSIN"></a><b>SegsIn</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsPerfSegsIn
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="SoftErrors"></a><a id="softerrors"></a><a id="SOFTERRORS"></a><b>SoftErrors</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsStackSoftErrors
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="SoftErrorReason"></a><a id="softerrorreason"></a><a id="SOFTERRORREASON"></a><b>SoftErrorReason</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsStackSoftErrorReason
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="SndUna"></a><a id="snduna"></a><a id="SNDUNA"></a><b>SndUna</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsAppSndUna
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="SndNxt"></a><a id="sndnxt"></a><a id="SNDNXT"></a><b>SndNxt</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsAppSndNxt
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="SndMax"></a><a id="sndmax"></a><a id="SNDMAX"></a><b>SndMax</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsAppSndMax
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="ThruBytesAcked"></a><a id="thrubytesacked"></a><a id="THRUBYTESACKED"></a><b>ThruBytesAcked</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsAppThruOctetsAcked
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="RcvNxt"></a><a id="rcvnxt"></a><a id="RCVNXT"></a><b>RcvNxt</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsAppRcvNxt
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <a id="ThruBytesReceived"></a><a id="thrubytesreceived"></a><a id="THRUBYTESRECEIVED"></a><b>ThruBytesReceived</b>
 * 
 * </td>
 * <td width="60%">
 * tcpEStatsAppThruOctetsReceived
 * 
 * </td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpestats/ns-tcpestats-tcp_estats_data_rod_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_DATA_ROD_v0 extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets of data contained in transmitted
     *            segments, including retransmitted data.  Note that this does
     *            not include TCP headers.
     * @type {Integer}
     */
    DataBytesOut {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of segments sent containing a positive length
     *            data segment.
     * @type {Integer}
     */
    DataSegsOut {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets contained in received data segments,
     *            including retransmitted data.  Note that this does not
     *            include TCP headers.
     * @type {Integer}
     */
    DataBytesIn {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of segments received containing a positive
     *  length data segment.
     * @type {Integer}
     */
    DataSegsIn {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The total number of segments sent.
     * @type {Integer}
     */
    SegsOut {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b></b>
     * 
     * The total number of segments received.
     * @type {Integer}
     */
    SegsIn {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of segments that fail various consistency tests
     *            during TCP input processing.  Soft errors might cause the
     *            segment to be discarded but some do not.  Some of these soft
     *            errors cause the generation of a TCP acknowledgment, while
     *            others are silently discarded.
     * @type {Integer}
     */
    SoftErrors {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * A value that identifies which consistency test most recently
     *            failed during TCP input processing.  This object is set every time the <b>SoftErrors</b> member is incremented.
     * @type {Integer}
     */
    SoftErrorReason {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The value of the oldest unacknowledged sequence
     *            number. Note that this member is a TCP state variable.
     * @type {Integer}
     */
    SndUna {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The next sequence number to be sent.
     *            Note that this member is not monotonic (and thus not
     *            a counter), because TCP sometimes retransmits lost data by
     *            pulling the member back to the missing data.
     * @type {Integer}
     */
    SndNxt {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The farthest forward (right most or largest) sequence number to be sent.
     *            Note that this will be equal to the <b>SndNxt</b> member except
     *            when the <b>SndNxt</b> member is pulled back during recovery.
     * @type {Integer}
     */
    SndMax {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets for which cumulative acknowledgments
     *            have been received.  Note that this will be the sum of
     *            changes to the <b>SndNxt</b> member.
     * @type {Integer}
     */
    ThruBytesAcked {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The next sequence number to be received.
     *            Note that this member is not monotonic (and thus not
     *            a counter), because TCP sometimes retransmits lost data by
     *            pulling the member back to the missing data.
     * @type {Integer}
     */
    RcvNxt {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b>ULONG64</b>
     * 
     * The number of octets for which cumulative acknowledgments
     *            have been sent.  Note that this will be the sum of changes
     *            to the <b>RcvNxt</b>member.
     * @type {Integer}
     */
    ThruBytesReceived {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}
