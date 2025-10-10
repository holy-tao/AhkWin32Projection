#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only dynamic information for extended TCP statistics on network path measurement for a TCP connection.
 * @remarks
 * 
  * The <b>TCP_ESTATS_PATH_ROD_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
  * 
  * The <b>TCP_ESTATS_PATH_ROD_v0</b> is defined as version 0 of the structure for  read-only dynamic information on network path measurementfor a TCP connection.  This information is available after the connection has been established.
  * 
  * The <b>TCP_ESTATS_PATH_ROD_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsPath</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics need to be enabled to retrieve this structure.
  * 
  * The path MTU discovery and maximum segment size are discussed in detail in the IETF RFC 1191 on Path MTU discovery. For more information, see <a href="http://tools.ietf.org/html/rfc1191">http://www.ietf.org/rfc/rfc1191.txt</a>.
  * 
  * TCP congestion control and congestion control algorithms are discussed in detail in the IETF RFC 2581 on TCP Congestion Control. For more information, see <a href="http://tools.ietf.org/html/rfc2581">http://www.ietf.org/rfc/rfc2581.txt</a>.
  * 
  * SACK and an extension to the SACK option are discussed in detail in the IETF RFC 2883 on An Extension to the Selective Acknowledgement
  *            (SACK) Option for TCP. For more information, see <a href="http://tools.ietf.org/html/rfc2883">http://www.ietf.org/rfc/rfc2883.txt</a>.
  * 
  * The TCP retransmission timer (RTO) and the smoothed round-trip-time (RTT) are discussed in detail in the IETF RFC 2988 on Computing TCP's Retransmission Timer. For more information, see <a href="http://tools.ietf.org/html/rfc2988">http://www.ietf.org/rfc/rfc2988.txt</a>.
  * 
  * Explicit Congestion Notification in IP is discussed in detail in the IETF RFC 2581 on The Addition of Explicit Congestion Notification
  *            (ECN) to IP. For more information, see <a href="http://tools.ietf.org/html/rfc3168">http://www.ietf.org/rfc/rfc3168.txt</a>.
  * 
  * The members of this structure are defined in the IETF RFC on the TCP Extended Statistics MIB. For more information, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
  * 
  * 
  * 
  * 
  * The following is the mapping of the members in the <b>TCP_ESTATS_PATH_ROD_v0</b> structure to the entries defined in RFC 4898 for extended TCP statistics:
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
  * <a id="FastRetran"></a><a id="fastretran"></a><a id="FASTRETRAN"></a><b>FastRetran</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackFastRetran
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="Timeouts"></a><a id="timeouts"></a><a id="TIMEOUTS"></a><b>Timeouts</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfTimeouts
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SubsequentTimeouts"></a><a id="subsequenttimeouts"></a><a id="SUBSEQUENTTIMEOUTS"></a><b>SubsequentTimeouts</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackSubsequentTimeouts
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CurTimeoutCount"></a><a id="curtimeoutcount"></a><a id="CURTIMEOUTCOUNT"></a><b>CurTimeoutCount</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackCurTimeoutCount
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="AbruptTimeouts"></a><a id="abrupttimeouts"></a><a id="ABRUPTTIMEOUTS"></a><b>AbruptTimeouts</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackAbruptTimeouts
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="PktsRetrans"></a><a id="pktsretrans"></a><a id="PKTSRETRANS"></a><b>PktsRetrans</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfSegsRetrans
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="BytesRetrans"></a><a id="bytesretrans"></a><a id="BYTESRETRANS"></a><b>BytesRetrans</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfOctetsRetrans
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="DupAcksIn"></a><a id="dupacksin"></a><a id="DUPACKSIN"></a><b>DupAcksIn</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackDupAcksIn
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SacksRcvd"></a><a id="sacksrcvd"></a><a id="SACKSRCVD"></a><b>SacksRcvd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackSACKsRcvd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SackBlocksRcvd"></a><a id="sackblocksrcvd"></a><a id="SACKBLOCKSRCVD"></a><b>SackBlocksRcvd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackSACKBlocksRcvd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CongSignals"></a><a id="congsignals"></a><a id="CONGSIGNALS"></a><b>CongSignals</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfCongSignals
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="PreCongSumCwnd"></a><a id="precongsumcwnd"></a><a id="PRECONGSUMCWND"></a><b>PreCongSumCwnd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathPreCongSumCwnd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="PreCongSumRtt"></a><a id="precongsumrtt"></a><a id="PRECONGSUMRTT"></a><b>PreCongSumRtt</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathPreCongSumRTT
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="PostCongSumRtt"></a><a id="postcongsumrtt"></a><a id="POSTCONGSUMRTT"></a><b>PostCongSumRtt</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathPostCongSumRTT
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="PostCongCountRtt"></a><a id="postcongcountrtt"></a><a id="POSTCONGCOUNTRTT"></a><b>PostCongCountRtt</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathPostCongCountRTT
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="EcnSignals"></a><a id="ecnsignals"></a><a id="ECNSIGNALS"></a><b>EcnSignals</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathECNsignals
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="EceRcvd"></a><a id="ecercvd"></a><a id="ECERCVD"></a><b>EceRcvd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathCERcvd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SendStall"></a><a id="sendstall"></a><a id="SENDSTALL"></a><b>SendStall</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackSendStall
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="QuenchRcvd"></a><a id="quenchrcvd"></a><a id="QUENCHRCVD"></a><b>QuenchRcvd</b>
  * 
  * </td>
  * <td width="60%">
  * No mapping to this member.
  * 
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="RetranThresh"></a><a id="retranthresh"></a><a id="RETRANTHRESH"></a><b>RetranThresh</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathRetranThresh
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SndDupAckEpisodes"></a><a id="snddupackepisodes"></a><a id="SNDDUPACKEPISODES"></a><b>SndDupAckEpisodes</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathDupAckEpisodes
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SumBytesReordered"></a><a id="sumbytesreordered"></a><a id="SUMBYTESREORDERED"></a><b>SumBytesReordered</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathSumOctetsReordered
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="NonRecovDa"></a><a id="nonrecovda"></a><a id="NONRECOVDA"></a><b>NonRecovDa</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathNonRecovDA
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="NonRecovDaEpisodes"></a><a id="nonrecovdaepisodes"></a><a id="NONRECOVDAEPISODES"></a><b>NonRecovDaEpisodes</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathNonRecovDAEpisodes
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="AckAfterFr"></a><a id="ackafterfr"></a><a id="ACKAFTERFR"></a><b>AckAfterFr</b>
  * 
  * </td>
  * <td width="60%">
  * No mapping to this member.
  * 
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="DsackDups"></a><a id="dsackdups"></a><a id="DSACKDUPS"></a><b>DsackDups</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackDSACKDups
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SampleRtt"></a><a id="samplertt"></a><a id="SAMPLERTT"></a><b>SampleRtt</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathSampleRTT
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SmoothedRtt"></a><a id="smoothedrtt"></a><a id="SMOOTHEDRTT"></a><b>SmoothedRtt</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfSmoothedRTT
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="RttVar"></a><a id="rttvar"></a><a id="RTTVAR"></a><b>RttVar</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathRTTVar
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MaxRtt"></a><a id="maxrtt"></a><a id="MAXRTT"></a><b>MaxRtt</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathMaxRTT
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MinRtt"></a><a id="minrtt"></a><a id="MINRTT"></a><b>MinRtt</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathMinRTT
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SumRtt"></a><a id="sumrtt"></a><a id="SUMRTT"></a><b>SumRtt</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathSumRTT
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CountRtt"></a><a id="countrtt"></a><a id="COUNTRTT"></a><b>CountRtt</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathCountRTT
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CurRto"></a><a id="currto"></a><a id="CURRTO"></a><b>CurRto</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfCurRTO
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MaxRto"></a><a id="maxrto"></a><a id="MAXRTO"></a><b>MaxRto</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathMaxRTO
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MinRto"></a><a id="minrto"></a><a id="MINRTO"></a><b>MinRto</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPathMinRTO
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CurMss"></a><a id="curmss"></a><a id="CURMSS"></a><b>CurMss</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfCurMSS
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MaxMss"></a><a id="maxmss"></a><a id="MAXMSS"></a><b>MaxMss</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackMaxMSS
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MinMss"></a><a id="minmss"></a><a id="MINMSS"></a><b>MinMss</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackMinMSS
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SpuriousRtoDetections"></a><a id="spuriousrtodetections"></a><a id="SPURIOUSRTODETECTIONS"></a><b>SpuriousRtoDetections</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackSpuriousRtoDetected
  * 
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_fine_rtt_rod_v0">TCP_ESTATS_FINE_RTT_ROD_v0</a> structure has members that provide similar data to the <b>RttVar</b>, <b>MaxRtt</b>, <b>MinRtt</b>, and <b>SumRtt</b> members of the <b>TCP_ESTATS_PATH_ROD_v0</b> structure. However, the time is reported in microseconds for the similar members of the <b>TCP_ESTATS_FINE_RTT_ROD_v0</b> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpestats/ns-tcpestats-tcp_estats_path_rod_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_PATH_ROD_v0 extends Win32Struct
{
    static sizeof => 160

    static packingSize => 4

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of invocations of the Fast Retransmit algorithm.
     * @type {Integer}
     */
    FastRetran {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of times the retransmit timeout has expired when
     *            the retransmission timer backoff multiplier is equal to one.
     * @type {Integer}
     */
    Timeouts {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of times the retransmit timeout has expired after
     *            the retransmission timer has been doubled. 
     * 
     * For more information, see section 5.5 of RFC 2988 discussed in the Remarks below.
     * @type {Integer}
     */
    SubsequentTimeouts {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The current number of times the retransmit timeout has
     *            expired without receiving an acknowledgment for new data.
     *            
     * 
     * The <b>CurTimeoutCount</b> member is reset to zero when new
     *            data is acknowledged and incremented for each invocation of
     *            Section 5.5 of RFC 2988.
     * @type {Integer}
     */
    CurTimeoutCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of timeouts that occurred without any
     *            immediately preceding duplicate acknowledgments or other
     *            indications of congestion.  Abrupt timeouts indicate that
     *            the path lost an entire window of data or acknowledgments.
     * 
     * Timeouts that are preceded by duplicate acknowledgments or
     *            other congestion signals (Explicit Congestion Notification, for example) are not counted as
     *            abrupt, and might have been avoided by a more sophisticated
     *            Fast Retransmit algorithm.
     * @type {Integer}
     */
    AbruptTimeouts {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of segments transmitted containing at least some
     *            retransmitted data.
     * @type {Integer}
     */
    PktsRetrans {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of bytes retransmitted.
     * @type {Integer}
     */
    BytesRetrans {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of duplicate ACKs received.
     * @type {Integer}
     */
    DupAcksIn {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of Selective Acknowledgement (SACK)  options received.
     * @type {Integer}
     */
    SacksRcvd {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of SACK blocks received (within SACK options).
     * @type {Integer}
     */
    SackBlocksRcvd {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of multiplicative downward congestion window
     *            adjustments due to all forms of congestion signals,
     *            including Fast Retransmit, Explicit Congestion Notification
     *            (ECN), and timeouts.  This member summarizes all events that
     *            invoke the Multiplicative Decrease (MD)  portion of Additive Increase Multiplicative
     *            Decrease (AIMD) congestion control, and as such is the best
     *            indicator of how a congestion windows is being affected by congestion.
     * 
     *            
     * 
     * Note that retransmission timeouts multiplicatively reduce
     *            the window implicitly by setting the slow start threshold size, and are
     *            included in the value stored in the  <b>CongSignals</b> member.  In order to minimize
     *            spurious congestion indications due to out-of-order
     *            segments, the <b>CongSignals</b> member is incremented in
     *            association with the Fast Retransmit algorithm.
     * @type {Integer}
     */
    CongSignals {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The sum of the values of the congestion window, in bytes,
     *            captured each time a congestion signal is received.  
     * 
     * This
     *            member is updated each time the <b>CongSignals</b> member is
     *            incremented, such that the change in
     *            the <b>PreCongSumCwnd</b> member divided by the change in
     *            the <b>CongSignals</b> member is the average window (over some
     *            interval) just prior to a congestion signal.
     * @type {Integer}
     */
    PreCongSumCwnd {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The sum, in milliseconds, of the last sample of the network round-trip-time (RTT) prior to the received congestion signals.  The last sample of the RTT is stored in the <b>SampleRtt</b> member.
     * 
     * The <b>PreCongSumRtt</b> member
     *            is updated each time the <b>CongSignals</b> member is incremented,
     *            such that the change in the <b>PreCongSumRtt</b>  divided by
     *            the change in the <b>CongSignals</b> member is the average RTT
     *            (over some interval) just prior to a congestion signal.
     * @type {Integer}
     */
    PreCongSumRtt {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The sum, in milliseconds, of the first sample of the network RTT (stored in the <b>SampleRtt</b> member)
     *            following each congestion signal.  
     * 
     * The change in
     *            the <b>PostCongSumRtt</b> member divided by the change in
     *            the <b>PostCongCountRtt</b> member is the average RTT (over some
     *            interval) just after a congestion signal.
     * @type {Integer}
     */
    PostCongSumRtt {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of RTT samples, in bytes, included in
     *            the <b>PostCongSumRtt</b> member.
     * 
     * The change in
     *            the <b>PostCongSumRtt</b> member divided by the change in
     *            the <b>PostCongCountRtt</b> member is the average RTT (over some
     *            interval) just after a congestion signal.
     * @type {Integer}
     */
    PostCongCountRtt {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of congestion signals delivered to the TCP
     *            sender via ECN.  
     * 
     * This is
     *            typically the number of segments bearing Echo Congestion
     * 
     * 
     * 
     * Experienced (ECE) bits, but
     *            also includes segments failing the ECN nonce check or
     *            other explicit congestion signals.
     * @type {Integer}
     */
    EcnSignals {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of segments received with IP headers bearing
     *            Congestion Experienced (CE) markings.
     * @type {Integer}
     */
    EceRcvd {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of interface stalls or other sender local
     *            resource limitations that are treated as congestion
     *            signals.
     * @type {Integer}
     */
    SendStall {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved for future use. This member is always set to zero.
     * @type {Integer}
     */
    QuenchRcvd {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of duplicate acknowledgments required to trigger
     *            Fast Retransmit.  
     * 
     * Note that although this is constant in
     *            traditional Reno TCP implementations, it is adaptive in
     *            many newer TCP implementations.
     * @type {Integer}
     */
    RetranThresh {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of Duplicate Acks Sent when prior Ack was not
     *            duplicate.  This is the number of times that a contiguous
     *            series of duplicate acknowledgments have been sent.
     * 
     * This is an indication of the number of data segments lost
     *            or reordered on the path from the remote TCP endpoint to
     *            the near TCP endpoint.
     * @type {Integer}
     */
    SndDupAckEpisodes {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The sum of the amounts SND.UNA advances on the
     *            acknowledgment which ends a dup-ack episode without a
     *            retransmission.
     * 
     * Note the change in the <b>SumBytesReordered</b> member divided
     *            by the change in the <b>NonRecovDaEpisodes</b> member is an
     *            estimate of the average reordering distance, over some
     *            interval.
     * @type {Integer}
     */
    SumBytesReordered {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of duplicate acks (or SACKS) that did not trigger a Fast
     *            Retransmit because ACK advanced prior to the number of
     *            duplicate acknowledgments reaching the <b>RetranThresh</b>.
     * 
     *            
     * 
     * Note that the change in the <b>NonRecovDa</b> member divided by
     *            the change in the <b>NonRecovDaEpisodes</b> member is an
     *            estimate of the average reordering distance in segments
     *            over some interval.
     * @type {Integer}
     */
    NonRecovDa {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of duplicate acknowledgment episodes that did
     *            not trigger a Fast Retransmit because ACK advanced prior to
     *            the number of duplicate acknowledgments reaching
     *            the <b>RetranThresh</b>.
     * @type {Integer}
     */
    NonRecovDaEpisodes {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved for future use. This member is always set to zero.
     * @type {Integer}
     */
    AckAfterFr {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of duplicate segments reported to the local host
     *            by D-SACK blocks.
     * @type {Integer}
     */
    DsackDups {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The most recent raw network round trip time measurement, in milliseconds, used in
     *            calculation of the retransmission timer (RTO).
     * @type {Integer}
     */
    SampleRtt {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The smoothed round trip time, in milliseconds, used in calculation of the
     *            RTO.
     * @type {Integer}
     */
    SmoothedRtt {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The round trip time variation, in milliseconds, used in calculation of the
     *            RTO.
     * @type {Integer}
     */
    RttVar {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum sampled round trip time in milliseconds.
     * @type {Integer}
     */
    MaxRtt {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The minimum sampled round trip time in milliseconds.
     * @type {Integer}
     */
    MinRtt {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The sum of all sampled round trip times in milliseconds.
     * 
     * Note that the change in the <b>SumRtt</b> member divided by the
     *            change in the <b>CountRtt</b> member is the mean RTT, uniformly
     *            averaged over an enter interval.
     * @type {Integer}
     */
    SumRtt {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of round trip time samples included in
     *            the <b>SumRtt</b> member.
     * @type {Integer}
     */
    CountRtt {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The current value, in milliseconds, of the retransmit timer.
     * @type {Integer}
     */
    CurRto {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum value, in milliseconds, of the retransmit timer.
     * @type {Integer}
     */
    MaxRto {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The minimum value, in milliseconds, of the retransmit timer.
     * @type {Integer}
     */
    MinRto {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The current maximum segment size (MSS), in bytes.
     * @type {Integer}
     */
    CurMss {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum MSS, in bytes.
     * @type {Integer}
     */
    MaxMss {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The minimum MSS, in bytes.
     * @type {Integer}
     */
    MinMss {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of acknowledgments reporting segments that have
     *            already been retransmitted due to a Retransmission Timeout.
     * @type {Integer}
     */
    SpuriousRtoDetections {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }
}
