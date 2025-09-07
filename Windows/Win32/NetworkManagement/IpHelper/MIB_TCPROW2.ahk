#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes an IPv4 TCP connection.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-gettcptable2">GetTcpTable2</a> function retrieves the IPv4 TCP connection table on the local computer and returns this information in a <a href="https://docs.microsoft.com/windows/desktop/api/tcpmib/ns-tcpmib-mib_tcptable2">MIB_TCPTABLE2</a> structure. 
  * 
  * An array of <b>MIB_TCPROW2</b> structures are contained in the <b>MIB_TCPTABLE2</b> structure. 
  * 
  *   The <b>dwState</b> member indicates the state of the TCP entry in a TCP state diagram. A TCP connection progresses through a series of states during its
  *   lifetime.  The states are:  LISTEN, SYN-SENT, SYN-RECEIVED,
  *   ESTABLISHED, FIN-WAIT-1, FIN-WAIT-2, CLOSE-WAIT, CLOSING, LAST-ACK,
  *   TIME-WAIT, and the fictional state CLOSED.  The CLOSED state is fictional
  *   because it represents the state when there is no Transmission Control Block, and therefore,
  *   no connection.  The TCP protocol is described in RFC 793. For more information, see 
  * <a href="https://www.ietf.org/rfc/rfc793.txt">http://www.ietf.org/rfc/rfc793.txt</a>. 
  * 
  * The <b>dwLocalPort</b>, and <b>dwRemotePort</b> members are in network byte order. In order to use the <b>dwLocalPort</b> or <b>dwRemotePort</b> members, the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-ntohs">ntohs</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-inet_ntoa">inet_ntoa</a> functions in Windows Sockets or similar functions may be needed. The <b>dwLocalAddr</b> and <b>dwRemoteAddr</b> members are stored as a <b>DWORD</b> in the same format as the  <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-in_addr">in_addr</a> structure. In order to use the <b>dwLocalAddr</b> or <b>dwRemoteAddr</b> members, the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-ntohl">ntohl</a> or <b>inet_ntoa</b> functions in Windows Sockets or similar functions may be needed. On Windows Vista and later, the <a href="https://docs.microsoft.com/windows/desktop/api/ip2string/nf-ip2string-rtlipv4addresstostringa">RtlIpv4AddressToString</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ip2string/nf-ip2string-rtlipv4addresstostringexw">RtlIpv4AddressToStringEx</a> functions may be used to convert the IPv4 address in the <b>dwLocalAddr</b> or <b>dwRemoteAddr</b> members to a string without loading the Windows Sockets DLL.
 * @see https://learn.microsoft.com/windows/win32/api/tcpmib/ns-tcpmib-mib_tcprow2
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_TCPROW2 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The state of the TCP connection. This member can be one of the values defined in the <i>Iprtrmib.h</i> header file.
     * 					
     * 
     * On the Windows SDK released for Windows Vista and later, the organization of header files has changed. This member can be one of the values from the <b>MIB_TCP_STATE</b> enumeration defined in the <i>Tcpmib.h</i> header file, not in the <i>Iprtrmib.h</i> header file. Note that the <i>Tcpmib.h</i> header file is automatically included in <i>Iprtrmib.h</i>, which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Tcpmib.h</i> and <i>Iprtrmib.h</i> header files should never be used directly.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_CLOSED"></a><a id="mib_tcp_state_closed"></a><dl>
     * <dt><b>MIB_TCP_STATE_CLOSED</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is in the CLOSED state that represents no connection state at all.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_LISTEN"></a><a id="mib_tcp_state_listen"></a><dl>
     * <dt><b>MIB_TCP_STATE_LISTEN</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is in the LISTEN state waiting for a connection request from any remote
     *     TCP and port.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_SYN_SENT"></a><a id="mib_tcp_state_syn_sent"></a><dl>
     * <dt><b>MIB_TCP_STATE_SYN_SENT</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is in the SYN-SENT state waiting for a matching connection request
     *     after having sent a connection request (SYN packet).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_SYN_RCVD"></a><a id="mib_tcp_state_syn_rcvd"></a><dl>
     * <dt><b>MIB_TCP_STATE_SYN_RCVD</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is in the SYN-RECEIVED state waiting for a confirming connection
     *     request acknowledgment after having both received and sent a
     *     connection request (SYN packet).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_ESTAB"></a><a id="mib_tcp_state_estab"></a><dl>
     * <dt><b>MIB_TCP_STATE_ESTAB</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is in the ESTABLISHED state that represents an open connection, data received can be
     *     delivered to the user.  This is the normal state for the data transfer phase
     *     of the TCP connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_FIN_WAIT1"></a><a id="mib_tcp_state_fin_wait1"></a><dl>
     * <dt><b>MIB_TCP_STATE_FIN_WAIT1</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is FIN-WAIT-1 state waiting for a connection termination request
     *     from the remote TCP, or an acknowledgment of the connection
     *     termination request previously sent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_FIN_WAIT2"></a><a id="mib_tcp_state_fin_wait2"></a><dl>
     * <dt><b>MIB_TCP_STATE_FIN_WAIT2</b></dt>
     * <dt>7</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is FIN-WAIT-1 state waiting for a connection termination request
     *     from the remote TCP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_CLOSE_WAIT"></a><a id="mib_tcp_state_close_wait"></a><dl>
     * <dt><b>MIB_TCP_STATE_CLOSE_WAIT</b></dt>
     * <dt>8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is in the CLOSE-WAIT state waiting for a connection termination request
     *     from the local user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_CLOSING"></a><a id="mib_tcp_state_closing"></a><dl>
     * <dt><b>MIB_TCP_STATE_CLOSING</b></dt>
     * <dt>9</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is in the CLOSING state waiting for a connection termination request
     *     acknowledgment from the remote TCP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_LAST_ACK"></a><a id="mib_tcp_state_last_ack"></a><dl>
     * <dt><b>MIB_TCP_STATE_LAST_ACK</b></dt>
     * <dt>10</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is in the LAST-ACK state waiting for an acknowledgment of the
     *     connection termination request previously sent to the remote TCP
     *     (which includes an acknowledgment of its connection termination
     *     request). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_TIME_WAIT"></a><a id="mib_tcp_state_time_wait"></a><dl>
     * <dt><b>MIB_TCP_STATE_TIME_WAIT</b></dt>
     * <dt>11</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is in the TIME-WAIT state waiting for enough time to pass to be sure
     *     the remote TCP received the acknowledgment of its connection
     *     termination request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MIB_TCP_STATE_DELETE_TCB"></a><a id="mib_tcp_state_delete_tcb"></a><dl>
     * <dt><b>MIB_TCP_STATE_DELETE_TCB</b></dt>
     * <dt>12</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TCP connection is in the delete TCB state that represents the deletion of the Transmission Control Block (TCB), a data structure used to maintain information on each TCP entry.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The local IPv4 address for the TCP connection on the local computer. A value of zero indicates the listener  can accept a connection on any interface.
     * @type {Integer}
     */
    dwLocalAddr {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The local port number in network byte order for the TCP connection on the local computer.
     * 
     *  The maximum size of an IP port number is 16 bits, so only the lower 16 bits should be used. The upper 16 bits may contain uninitialized data.
     * @type {Integer}
     */
    dwLocalPort {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The IPv4 address for the TCP connection on the remote computer. When the <b>dwState</b> member is <b>MIB_TCP_STATE_LISTEN</b>, this value has no meaning.
     * @type {Integer}
     */
    dwRemoteAddr {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The remote port number in network byte order for the TCP connection on the remote computer. When the <b>dwState</b> member is <b>MIB_TCP_STATE_LISTEN</b>, this member has no meaning.
     * 
     *  The maximum size of an IP port number is 16 bits, so only the lower 16 bits should be used. The upper 16 bits may contain uninitialized data.
     * @type {Integer}
     */
    dwRemotePort {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The PID of the process that issued a context bind for this TCP connection.
     * @type {Integer}
     */
    dwOwningPid {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>TCP_CONNECTION_OFFLOAD_STATE</b>
     * 
     * The offload state for this TCP connection. This parameter can be one of the enumeration values for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tcpmib/ne-tcpmib-tcp_connection_offload_state">TCP_CONNECTION_OFFLOAD_STATE</a> defined in the <i>Tcpmib.h</i> header.
     * @type {Integer}
     */
    dwOffloadState {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
