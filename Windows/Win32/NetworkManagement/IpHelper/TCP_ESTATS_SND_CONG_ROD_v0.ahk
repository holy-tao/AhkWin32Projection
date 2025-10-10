#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only dynamic information for extended TCP statistics on sender congestion related data for a TCP connection.
 * @remarks
 * 
  * The <b>TCP_ESTATS_SND_CONG_ROD_v0</b> structure is used as part of the TCP extended statistics feature available on Windows Vista and later. 
  * 
  * The <b>TCP_ESTATS_SND_CONG_ROD_v0</b> is defined as version 0 of the structure for  read-only dynamic information on sender congestion related data for a TCP connection.  This information is available after the connection has been established.
  * 
  * The <b>TCP_ESTATS_SND_CONG_ROD_v0</b> structure is retrieved by calls to  the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcpconnectionestats">GetPerTcpConnectionEStats</a> functions when <b>TcpConnectionEstatsSndCong</b> is passed in the <i>EstatsType</i> parameter. Extended TCP statistics need to be enabled to retrieve this structure.
  * 
  * TCP congestion control and congestion control algorithms are discussed in detail in the IETF RFC on TCP Congestion Control. For more information, see <a href="http://tools.ietf.org/html/rfc2581">http://www.ietf.org/rfc/rfc2581.txt</a>.
  * 
  * The members of this structure are defined in the IETF RFC on the TCP Extended Statistics MIB. For more information, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
  * 
  * 
  * 
  * 
  * The following is the mapping of the members in the <b>TCP_ESTATS_SND_CONG_ROD_v0</b> structure to the entries defined in RFC 4898 for extended TCP statistics:
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
  * <a id="SndLimTransRwin"></a><a id="sndlimtransrwin"></a><a id="SNDLIMTRANSRWIN"></a><b>SndLimTransRwin</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfSndLimTransRwin
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SndLimTimeRwin"></a><a id="sndlimtimerwin"></a><a id="SNDLIMTIMERWIN"></a><b>SndLimTimeRwin</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfSndLimTimeRwin
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SndLimBytesRwin"></a><a id="sndlimbytesrwin"></a><a id="SNDLIMBYTESRWIN"></a><b>SndLimBytesRwin</b>
  * 
  * </td>
  * <td width="60%">
  * No mapping to this member.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SndLimTransCwnd"></a><a id="sndlimtranscwnd"></a><a id="SNDLIMTRANSCWND"></a><b>SndLimTransCwnd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfSndLimTransCwnd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SndLimTimeCwnd"></a><a id="sndlimtimecwnd"></a><a id="SNDLIMTIMECWND"></a><b>SndLimTimeCwnd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfSndLimTimeCwnd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SndLimBytesCwnd"></a><a id="sndlimbytescwnd"></a><a id="SNDLIMBYTESCWND"></a><b>SndLimBytesCwnd</b>
  * 
  * </td>
  * <td width="60%">
  * No mapping to this member.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SndLimTransSnd"></a><a id="sndlimtranssnd"></a><a id="SNDLIMTRANSSND"></a><b>SndLimTransSnd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfSndLimTransSnd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SndLimTimeSnd"></a><a id="sndlimtimesnd"></a><a id="SNDLIMTIMESND"></a><b>SndLimTimeSnd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfSndLimTimeSnd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SndLimBytesSnd"></a><a id="sndlimbytessnd"></a><a id="SNDLIMBYTESSND"></a><b>SndLimBytesSnd</b>
  * 
  * </td>
  * <td width="60%">
  * No mapping to this member.
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="SlowStart"></a><a id="slowstart"></a><a id="SLOWSTART"></a><b>SlowStart</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackSlowStart
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CongAvoid"></a><a id="congavoid"></a><a id="CONGAVOID"></a><b>CongAvoid</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackCongAvoid
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="OtherReductions"></a><a id="otherreductions"></a><a id="OTHERREDUCTIONS"></a><b>OtherReductions</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackOtherReductions
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CurCwnd"></a><a id="curcwnd"></a><a id="CURCWND"></a><b>CurCwnd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfCurCwnd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MaxSsCwnd"></a><a id="maxsscwnd"></a><a id="MAXSSCWND"></a><b>MaxSsCwnd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackMaxSsCwnd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MaxCaCwnd"></a><a id="maxcacwnd"></a><a id="MAXCACWND"></a><b>MaxCaCwnd</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackMaxCaCwnd
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="CurSsthresh"></a><a id="curssthresh"></a><a id="CURSSTHRESH"></a><b>CurSsthresh</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsPerfCurSsthresh
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MaxSsthresh"></a><a id="maxssthresh"></a><a id="MAXSSTHRESH"></a><b>MaxSsthresh</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackMaxSsthresh
  * 
  * </td>
  * </tr>
  * <tr>
  * <td width="40%">
  * <a id="MinSsthresh"></a><a id="minssthresh"></a><a id="MINSSTHRESH"></a><b>MinSsthresh</b>
  * 
  * </td>
  * <td width="60%">
  * tcpEStatsStackMinSsthresh
  * 
  * </td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpestats/ns-tcpestats-tcp_estats_snd_cong_rod_v0
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_ESTATS_SND_CONG_ROD_v0 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of transitions into the "Receiver Limited" state
     *            from either the "Congestion Limited" or "Sender Limited"
     *            states.  This state is entered whenever TCP transmission
     *            stops because the sender has filled the announced receiver
     *            window.
     * @type {Integer}
     */
    SndLimTransRwin {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The cumulative time, in milliseconds, spent in the "Receiver Limited" state where TCP transmission
     *            stops because the sender has filled the announced receiver
     *            window.
     * @type {Integer}
     */
    SndLimTimeRwin {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>SIZE_T</b>
     * 
     * The total number of bytes sent in the "Receiver Limited" state.
     * @type {Pointer}
     */
    SndLimBytesRwin {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of transitions into the "Congestion Limited"
     *            state from either the "Receiver Limited" or "Sender
     *            Limited" states.  This state is entered whenever TCP
     *            transmission stops because the sender has reached some
     *            limit defined by TCP congestion control (the congestion window, for example) or other
     *            algorithms (retransmission timeouts) designed to control
     *            network traffic.
     * @type {Integer}
     */
    SndLimTransCwnd {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The cumulative time, in milliseconds, spent in the "Congestion Limited"
     *            state.  When there is a
     *            retransmission timeout, it is counted in
     *            this member and not the cumulative time
     *            for some other state.
     * @type {Integer}
     */
    SndLimTimeCwnd {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>SIZE_T</b>
     * 
     * The total number of bytes sent in the "Congestion Limited" state.
     * @type {Pointer}
     */
    SndLimBytesCwnd {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of transitions into the "Sender Limited" state
     *            from either the "Receiver Limited" or "Congestion Limited"
     *            states.  This state is entered whenever TCP transmission
     *            stops due to some sender limit such as running out of
     *            application data or other resources and the Karn algorithm.
     *            When TCP stops sending data for any reason, which cannot be
     *            classified as "Receiver Limited" or "Congestion Limited", it
     *            is treated as "Sender Limited".
     * @type {Integer}
     */
    SndLimTransSnd {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The cumulative time, in milliseconds, spent in the "Sender Limited" state.
     * @type {Integer}
     */
    SndLimTimeSnd {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>SIZE_T</b>
     * 
     * The total number of bytes sent in the "Sender Limited" state.
     * @type {Pointer}
     */
    SndLimBytesSnd {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of times the congestion window has been
     *            increased by the "Slow Start" algorithm.
     * @type {Integer}
     */
    SlowStart {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of times the congestion window has been
     *            increased by the "Congestion Avoidance" algorithm.
     * @type {Integer}
     */
    CongAvoid {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The number of congestion window reductions made as a result
     *            of anything other than congestion control algorithms other than "Slow Start" and "Congestion Avoidance" algorithms.
     * @type {Integer}
     */
    OtherReductions {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The size, in bytes, of the current congestion window.
     * @type {Integer}
     */
    CurCwnd {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum size, in bytes, of the congestion window size used during "Slow Start."
     * @type {Integer}
     */
    MaxSsCwnd {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum size, in bytes, of the congestion window used during "Congestion
     *            Avoidance."
     * @type {Integer}
     */
    MaxCaCwnd {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The current size, in bytes, of the slow start threshold.
     * @type {Integer}
     */
    CurSsthresh {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The maximum size, in bytes, of the slow start threshold, excluding the initial
     *            value.
     * @type {Integer}
     */
    MaxSsthresh {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * The minimum size, in bytes, of the slow start threshold.
     * @type {Integer}
     */
    MinSsthresh {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
