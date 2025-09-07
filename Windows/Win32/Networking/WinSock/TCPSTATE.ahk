#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the possible states of a Transmission Control Protocol (TCP) connection.
 * @remarks
 * A TCP connection progresses from one state to another in response to
  *   events.  The events are the user calls OPEN, SEND, RECEIVE, CLOSE,
  *   ABORT, and STATUS; the incoming segments, particularly those
  *   containing the SYN, ACK, RST and FIN flags; and timeouts.
  * 
  * For more information about TCP connection states, see <a href="https://tools.ietf.org/html/rfc793">RFC 793</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mstcpip/ne-mstcpip-tcpstate
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TCPSTATE{

    /**
     * The TCP connection has no connection state at all. This state represents the state when there is no Transmission Control Block (TCB), and therefore,
 *   no connection.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_CLOSED => 0

    /**
     * The TCP connection is waiting for a connection request from any remote
 *     TCP and port.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_LISTEN => 1

    /**
     * -The TCP connection is waiting for a matching connection request
 *     after sending a connection request.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_SYN_SENT => 2

    /**
     * The TCP connection is waiting for an acknowledgment that confirms the connection
 *     request after both receiving and sending a
 *     connection request.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_SYN_RCVD => 3

    /**
     * The TCP connection is an open connection, so the data received can be
 *     delivered to the user.  This state is normal state for the data transfer phase
 *     of the connection.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_ESTABLISHED => 4

    /**
     * The TCP connection is waiting for a request to end the connection 
 *     from the remote TCP, or an acknowledgment of the previously sent request to end the connection.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_FIN_WAIT_1 => 5

    /**
     * The TCP connection is  waiting for a request to end the connection
 *     from the remote TCP.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_FIN_WAIT_2 => 6

    /**
     * The TCP connection is waiting for a request to end the connection
 *     from the local user.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_CLOSE_WAIT => 7

    /**
     * The TCP connection is waiting for an acknowledgment of the  request to end the connection from the remote TCP.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_CLOSING => 8

    /**
     * The TCP connection is waiting for an acknowledgment of the request to end the connection that was previously sent to the remote TCP, which includes an acknowledgment of its request to end the connection.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_LAST_ACK => 9

    /**
     * The TCP connection is waiting for enough time to pass to be sure
 *     the remote TCP received the acknowledgment of its request to end the connection.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_TIME_WAIT => 10

    /**
     * The maximum value of the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-tcpstate">TCPSTATE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static TCPSTATE_MAX => 11
}
