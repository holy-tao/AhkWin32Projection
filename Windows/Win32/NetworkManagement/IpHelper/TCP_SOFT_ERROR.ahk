#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the reason for non-fatal or soft errors recorded on a TCP connection.
 * @remarks
 * 
 * The <b>TCP_SOFT_ERROR</b> enumeration is defined on Windows Vista and later. 
 * 
 * The values in this enumeration are defined in the IETF draft RFC on the TCP Extended Statistics MIB. For more information, see <a href="http://tools.ietf.org/html/rfc4898">http://www.ietf.org/rfc/rfc4898.txt</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpestats/ne-tcpestats-tcp_soft_error
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_SOFT_ERROR extends Win32Enum{

    /**
     * No soft errors have occurred.
     * @type {Integer (Int32)}
     */
    static TcpErrorNone => 0

    /**
     * All data in the segment is below
     *            the send unacknowledged (SND.UNA) sequence number. This soft error is normal for keep-alives and zero window probes.
     * @type {Integer (Int32)}
     */
    static TcpErrorBelowDataWindow => 1

    /**
     * Some data in the segment is above
     *            send window (SND.WND) size. This soft error indicates an implementation bug or possible
     *            attack.
     * @type {Integer (Int32)}
     */
    static TcpErrorAboveDataWindow => 2

    /**
     * An ACK was received below the SND.UNA sequence number. This soft error indicates that the
     *            return path is reordering ACKs.
     * @type {Integer (Int32)}
     */
    static TcpErrorBelowAckWindow => 3

    /**
     * An ACK was received for data that we have not sent.
     *            This soft error indicates an implementation bug or possible attack.
     * @type {Integer (Int32)}
     */
    static TcpErrorAboveAckWindow => 4

    /**
     * The Timestamp Echo Reply (TSecr) on the segment is older than the
     *            current TS.Recent (a timestamp to be echoed in TSecr whenever a
     *            segment is sent).  This error is applicable to TCP connections that use the TCP Timestamps option (TSopt) defined by the IETF in RFC 1323. For more information, see <a href="https://www.ietf.org/rfc/rfc1323.txt">http://www.ietf.org/rfc/rfc1323.txt</a>. This soft error is normal for the rare case where the Protect Against Wrapped
     *    Sequences numbers (PAWS)
     *            mechanism detects data reordered by the network.
     * @type {Integer (Int32)}
     */
    static TcpErrorBelowTsWindow => 5

    /**
     * The TSecr on the segment is newer than the
     *            current TS.Recent. This soft error indicates an implementation bug or
     *            possible attack.
     * @type {Integer (Int32)}
     */
    static TcpErrorAboveTsWindow => 6

    /**
     * An incorrect TCP checksum was received. Note that this value
     *            is intrinsically fragile, because the header fields used to
     *            identify the connection may have been corrupted.
     * @type {Integer (Int32)}
     */
    static TcpErrorDataChecksumError => 7

    /**
     * A data length error occurred. 
     * 
     * This value is not defined in the IETF draft RFC on the TCP Extended Statistics MIB.
     * @type {Integer (Int32)}
     */
    static TcpErrorDataLengthError => 8

    /**
     * The maximum possible value for the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_soft_error">TCP_SOFT_ERROR</a>_STATE enumeration type. This is not a legal value for the reason for a soft error for a TCP connection.
     * @type {Integer (Int32)}
     */
    static TcpErrorMaxSoftError => 9
}
