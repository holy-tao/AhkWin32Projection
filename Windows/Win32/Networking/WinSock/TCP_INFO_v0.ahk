#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TCPSTATE.ahk" { TCPSTATE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains the Transmission Control Protocol (TCP) statistics that were collected for a socket.
 * @remarks
 * To get an instance of this structure,  call the 
 *    <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a> or <a href="https://docs.microsoft.com/previous-versions/windows/hardware/network/ff566296(v=vs.85)">LPWSPIoctl</a> function with the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-tcp-info">SIO_TCP_INFO</a> 
 *    control code. Specify 0 for the *lpvInBuffer* field to retrieve the v0 version of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-tcp_info_v0
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct TCP_INFO_v0 {
    #StructPack 8

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-tcpstate">TCPSTATE</a> enumeration that indicates the  state of the TCP connection.
     */
    State : TCPSTATE

    /**
     * The current maximum segment size (MSS) for the connection, in bytes.
     */
    Mss : UInt32

    /**
     * The lifetime of the connection, in milliseconds.
     */
    ConnectionTimeMs : Int64

    /**
     * <b>TRUE</b> if TCP time stamps are turned on for the connection; otherwise <b>FALSE</b>.
     */
    TimestampsEnabled : BOOLEAN

    /**
     * The current estimated round-trip time for the connection, in microseconds.
     */
    RttUs : UInt32

    /**
     * The minimum sampled round trip time, in microseconds.
     */
    MinRttUs : UInt32

    /**
     * The current number of sent bytes that are unacknowledged.
     */
    BytesInFlight : UInt32

    /**
     * The size of the current congestion window, in bytes.
     */
    Cwnd : UInt32

    /**
     * The size of the send window (SND.WND in <a href="https://tools.ietf.org/html/rfc793">RFC 793</a>),  in bytes.
     */
    SndWnd : UInt32

    /**
     * The size of the receive window (RCV.WND in <a href="https://tools.ietf.org/html/rfc793">RFC 793</a>), in bytes.
     */
    RcvWnd : UInt32

    /**
     * The size of the current receive buffer, in bytes.   The size of the receive buffer  changes dynamically when autotuning is turned on for the receive window.
     */
    RcvBuf : UInt32

    /**
     * The total number of bytes sent.
     */
    BytesOut : Int64

    /**
     * The total number of bytes received.
     */
    BytesIn : Int64

    /**
     * The total number of bytes reordered.
     */
    BytesReordered : UInt32

    /**
     * The total number of bytes retransmitted.
     */
    BytesRetrans : UInt32

    /**
     * The number of calls of the Fast Retransmit algorithm.
     */
    FastRetrans : UInt32

    /**
     * The total number of duplicate acknowledgments received.
     */
    DupAcksIn : UInt32

    /**
     * The total number of retransmission timeout episodes. Each episode can consist of multiple timeouts.
     */
    TimeoutEpisodes : UInt32

    /**
     * The total number of retransmitted synchronize control flags (SYNs).
     */
    SynRetrans : Int8

}
