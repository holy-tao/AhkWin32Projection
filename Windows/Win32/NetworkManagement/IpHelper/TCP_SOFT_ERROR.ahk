#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the reason for non-fatal or soft errors recorded on a TCP connection.
 * @remarks
 * The <b>TCP_SOFT_ERROR</b> enumeration is defined on Windows Vista and later. 
 * 
 * The values in this enumeration are defined in the IETF draft RFC on the TCP Extended Statistics MIB. For more information, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
 * @see https://learn.microsoft.com/windows/win32/api/tcpestats/ne-tcpestats-tcp_soft_error
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class TCP_SOFT_ERROR extends Win32Enum {

    /**
     * No soft errors have occurred.
     * Native name: TcpErrorNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * All data in the segment is below
     *            the send unacknowledged (SND.UNA) sequence number. This soft error is normal for keep-alives and zero window probes.
     * Native name: TcpErrorBelowDataWindow
     * @type {Integer (Int32)}
     */
    static BelowDataWindow => 1

    /**
     * Some data in the segment is above
     *            send window (SND.WND) size. This soft error indicates an implementation bug or possible
     *            attack.
     * Native name: TcpErrorAboveDataWindow
     * @type {Integer (Int32)}
     */
    static AboveDataWindow => 2

    /**
     * An ACK was received below the SND.UNA sequence number. This soft error indicates that the
     *            return path is reordering ACKs.
     * Native name: TcpErrorBelowAckWindow
     * @type {Integer (Int32)}
     */
    static BelowAckWindow => 3

    /**
     * An ACK was received for data that we have not sent.
     *            This soft error indicates an implementation bug or possible attack.
     * Native name: TcpErrorAboveAckWindow
     * @type {Integer (Int32)}
     */
    static AboveAckWindow => 4

    /**
     * The Timestamp Echo Reply (TSecr) on the segment is older than the
     *            current TS.Recent (a timestamp to be echoed in TSecr whenever a
     *            segment is sent).  This error is applicable to TCP connections that use the TCP Timestamps option (TSopt) defined by the IETF in RFC 1323. For more information, see <a href="https://www.ietf.org/rfc/rfc1323.txt">http://www.ietf.org/rfc/rfc1323.txt</a>. This soft error is normal for the rare case where the Protect Against Wrapped
     *    Sequences numbers (PAWS)
     *            mechanism detects data reordered by the network.
     * Native name: TcpErrorBelowTsWindow
     * @type {Integer (Int32)}
     */
    static BelowTsWindow => 5

    /**
     * The TSecr on the segment is newer than the
     *            current TS.Recent. This soft error indicates an implementation bug or
     *            possible attack.
     * Native name: TcpErrorAboveTsWindow
     * @type {Integer (Int32)}
     */
    static AboveTsWindow => 6

    /**
     * An incorrect TCP checksum was received. Note that this value
     *            is intrinsically fragile, because the header fields used to
     *            identify the connection may have been corrupted.
     * Native name: TcpErrorDataChecksumError
     * @type {Integer (Int32)}
     */
    static DataChecksumError => 7

    /**
     * A data length error occurred. 
     * 
     * This value is not defined in the IETF draft RFC on the TCP Extended Statistics MIB.
     * Native name: TcpErrorDataLengthError
     * @type {Integer (Int32)}
     */
    static DataLengthError => 8

    /**
     * The maximum possible value for the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_soft_error">TCP_SOFT_ERROR</a>_STATE enumeration type. This is not a legal value for the reason for a soft error for a TCP connection.
     * Native name: TcpErrorMaxSoftError
     * @type {Integer (Int32)}
     */
    static MaxSoftError => 9
}
