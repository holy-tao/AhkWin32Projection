#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

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
 */
class TCPSTATE extends Win32Enum {

    /**
     * The TCP connection has no connection state at all. This state represents the state when there is no Transmission Control Block (TCB), and therefore,
     *   no connection.
     * Native name: TCPSTATE_CLOSED
     * @type {Integer (Int32)}
     */
    static CLOSED => 0

    /**
     * The TCP connection is waiting for a connection request from any remote
     *     TCP and port.
     * Native name: TCPSTATE_LISTEN
     * @type {Integer (Int32)}
     */
    static LISTEN => 1

    /**
     * -The TCP connection is waiting for a matching connection request
     *     after sending a connection request.
     * Native name: TCPSTATE_SYN_SENT
     * @type {Integer (Int32)}
     */
    static SYN_SENT => 2

    /**
     * The TCP connection is waiting for an acknowledgment that confirms the connection
     *     request after both receiving and sending a
     *     connection request.
     * Native name: TCPSTATE_SYN_RCVD
     * @type {Integer (Int32)}
     */
    static SYN_RCVD => 3

    /**
     * The TCP connection is an open connection, so the data received can be
     *     delivered to the user.  This state is normal state for the data transfer phase
     *     of the connection.
     * Native name: TCPSTATE_ESTABLISHED
     * @type {Integer (Int32)}
     */
    static ESTABLISHED => 4

    /**
     * The TCP connection is waiting for a request to end the connection 
     *     from the remote TCP, or an acknowledgment of the previously sent request to end the connection.
     * Native name: TCPSTATE_FIN_WAIT_1
     * @type {Integer (Int32)}
     */
    static FIN_WAIT_1 => 5

    /**
     * The TCP connection is  waiting for a request to end the connection
     *     from the remote TCP.
     * Native name: TCPSTATE_FIN_WAIT_2
     * @type {Integer (Int32)}
     */
    static FIN_WAIT_2 => 6

    /**
     * The TCP connection is waiting for a request to end the connection
     *     from the local user.
     * Native name: TCPSTATE_CLOSE_WAIT
     * @type {Integer (Int32)}
     */
    static CLOSE_WAIT => 7

    /**
     * The TCP connection is waiting for an acknowledgment of the  request to end the connection from the remote TCP.
     * Native name: TCPSTATE_CLOSING
     * @type {Integer (Int32)}
     */
    static CLOSING => 8

    /**
     * The TCP connection is waiting for an acknowledgment of the request to end the connection that was previously sent to the remote TCP, which includes an acknowledgment of its request to end the connection.
     * Native name: TCPSTATE_LAST_ACK
     * @type {Integer (Int32)}
     */
    static LAST_ACK => 9

    /**
     * The TCP connection is waiting for enough time to pass to be sure
     *     the remote TCP received the acknowledgment of its request to end the connection.
     * Native name: TCPSTATE_TIME_WAIT
     * @type {Integer (Int32)}
     */
    static TIME_WAIT => 10

    /**
     * The maximum value of the <a href="https://docs.microsoft.com/windows/desktop/api/mstcpip/ne-mstcpip-tcpstate">TCPSTATE</a> enumeration.
     * Native name: TCPSTATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 11
}
