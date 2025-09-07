#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the Transmission Control Protocol (TCP) statistics that were collected for a socket.
 * @remarks
 * To get an instance of this structure,  call the 
  *    <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a> or <a href="https://docs.microsoft.com/previous-versions/windows/hardware/network/ff566296(v=vs.85)">LPWSPIoctl</a> function with the <a href="https://docs.microsoft.com/windows/win32/winsock/sio-tcp-info">SIO_TCP_INFO</a> 
  *    control code. Specify 0 for the *lpvInBuffer* field to retrieve the v0 version of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ns-mstcpip-tcp_info_v0
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TCP_INFO_v0 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-tcpstate">TCPSTATE</a> enumeration that indicates the  state of the TCP connection.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The current maximum segment size (MSS) for the connection, in bytes.
     * @type {Integer}
     */
    Mss {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The lifetime of the connection, in milliseconds.
     * @type {Integer}
     */
    ConnectionTimeMs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <b>TRUE</b> if TCP time stamps are turned on for the connection; otherwise <b>FALSE</b>.
     * @type {Integer}
     */
    TimestampsEnabled {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * The current estimated round-trip time for the connection, in microseconds.
     * @type {Integer}
     */
    RttUs {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The minimum sampled round trip time, in microseconds.
     * @type {Integer}
     */
    MinRttUs {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The current number of sent bytes that are unacknowledged.
     * @type {Integer}
     */
    BytesInFlight {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The size of the current congestion window, in bytes.
     * @type {Integer}
     */
    Cwnd {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The size of the send window (SND.WND in <a href="https://tools.ietf.org/html/rfc793">RFC 793</a>),  in bytes.
     * @type {Integer}
     */
    SndWnd {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The size of the receive window (RCV.WND in <a href="https://tools.ietf.org/html/rfc793">RFC 793</a>), in bytes.
     * @type {Integer}
     */
    RcvWnd {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The size of the current receive buffer, in bytes.   The size of the receive buffer  changes dynamically when autotuning is turned on for the receive window.
     * @type {Integer}
     */
    RcvBuf {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The total number of bytes sent.
     * @type {Integer}
     */
    BytesOut {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The total number of bytes received.
     * @type {Integer}
     */
    BytesIn {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The total number of bytes reordered.
     * @type {Integer}
     */
    BytesReordered {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The total number of bytes retransmitted.
     * @type {Integer}
     */
    BytesRetrans {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The number of calls of the Fast Retransmit algorithm.
     * @type {Integer}
     */
    FastRetrans {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The total number of duplicate acknowledgments received.
     * @type {Integer}
     */
    DupAcksIn {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The total number of retransmission timeout episodes. Each episode can consist of multiple timeouts.
     * @type {Integer}
     */
    TimeoutEpisodes {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The total number of retransmitted synchronize control flags (SYNs).
     * @type {Integer}
     */
    SynRetrans {
        get => NumGet(this, 84, "char")
        set => NumPut("char", value, this, 84)
    }
}
