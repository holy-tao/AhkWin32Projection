#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of extended statistics for a TCP connection that is requested or being set.
 * @remarks
 * The <b>TCP_ESTATS_TYPE</b> enumeration is defined on Windows Vista and later. 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> and <b>GetPerTcp6ConnectionEStats</b> functions are designed to use TCP to diagnose performance
 *    problems in both the network and the application.  If a network based
 *    application is performing poorly, TCP can determine if the bottleneck
 *    is in the sender, the receiver or the network itself.  If the
 *    bottleneck is in the network, TCP can provide specific information
 *    about its nature.
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getpertcp6connectionestats">GetPerTcp6ConnectionEStats</a> and <b>GetPerTcp6ConnectionEStats</b> functions  are used to retrieve extended statistics for a TCP connection based on the type of extended statistics specified using one of values from the <b>TCP_ESTATS_TYPE</b> enumeration type. The collection of extended statistics on a TCP connection are enabled and disabled using calls to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcp6connectionestats">SetPerTcp6ConnectionEStats</a> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcpconnectionestats">SetPerTcpConnectionEStats</a> functions where the type of extended statistics specified is one of values from the <b>TCP_ESTATS_TYPE</b> enumeration type.
 * @see https://learn.microsoft.com/windows/win32/api/tcpestats/ne-tcpestats-tcp_estats_type
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class TCP_ESTATS_TYPE extends Win32Enum {

    /**
     * This value specifies SYN exchange information for a TCP connection.
     * 
     * Only read-only static information is available for this enumeration value.
     * Native name: TcpConnectionEstatsSynOpts
     * @type {Integer (Int32)}
     */
    static ConnectionEstatsSynOpts => 0

    /**
     * This value specifies extended data transfer information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * Native name: TcpConnectionEstatsData
     * @type {Integer (Int32)}
     */
    static ConnectionEstatsData => 1

    /**
     * This value specifies sender congestion for a TCP connection.
     * 
     * All three types of information (read-only static, read-only dynamic,  and read/write information) are available for this enumeration value.
     * Native name: TcpConnectionEstatsSndCong
     * @type {Integer (Int32)}
     */
    static ConnectionEstatsSndCong => 2

    /**
     * This value specifies extended path measurement information for a TCP connection. This information is  used to infer segment
     *    reordering on the path from the local sender to the remote
     *    receiver.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * Native name: TcpConnectionEstatsPath
     * @type {Integer (Int32)}
     */
    static ConnectionEstatsPath => 3

    /**
     * This value specifies extended output-queuing information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * Native name: TcpConnectionEstatsSendBuff
     * @type {Integer (Int32)}
     */
    static ConnectionEstatsSendBuff => 4

    /**
     * This value specifies extended local-receiver information for a TCP connection. 
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * Native name: TcpConnectionEstatsRec
     * @type {Integer (Int32)}
     */
    static ConnectionEstatsRec => 5

    /**
     * This value specifies extended remote-receiver information for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * Native name: TcpConnectionEstatsObsRec
     * @type {Integer (Int32)}
     */
    static ConnectionEstatsObsRec => 6

    /**
     * This value specifies bandwidth estimation statistics for a TCP connection on bandwidth.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * Native name: TcpConnectionEstatsBandwidth
     * @type {Integer (Int32)}
     */
    static ConnectionEstatsBandwidth => 7

    /**
     * This value specifies fine-grained round-trip time (RTT) estimation statistics for a TCP connection.
     * 
     * Only read-only dynamic information and read/write information are available for this enumeration value.
     * Native name: TcpConnectionEstatsFineRtt
     * @type {Integer (Int32)}
     */
    static ConnectionEstatsFineRtt => 8

    /**
     * The maximum possible value for the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_estats_type">TCP_ESTATS_TYPE</a>_STATE enumeration type. This is not a legal value for the possible type of extended statistics for a TCP connection.
     * Native name: TcpConnectionEstatsMaximum
     * @type {Integer (Int32)}
     */
    static ConnectionEstatsMaximum => 9
}
