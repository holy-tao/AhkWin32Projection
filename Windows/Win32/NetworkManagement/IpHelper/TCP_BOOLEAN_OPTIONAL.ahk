#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the states that a caller can specify when updating a member in the read/write information for a TCP connection.
 * @remarks
 * 
 * The <b>TCP_BOOLEAN_OPTIONAL</b> enumeration is defined on Windows Vista and later. 
 * 
 * The collection of extended statistics on a TCP connection are enabled and disabled using calls to the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcp6connectionestats">SetPerTcp6ConnectionEStats</a> and <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-setpertcpconnectionestats">SetPerTcpConnectionEStats</a> functions where the type of extended statistics specified is one of values from the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ne-tcpestats-tcp_estats_type">TCP_ESTATS_TYPE</a> enumeration type. A value from the <b>TCP_BOOLEAN_OPTIONAL</b> enumeration is used to specify how a member in the <a href="https://docs.microsoft.com/windows/desktop/api/tcpestats/ns-tcpestats-tcp_estats_bandwidth_rw_v0">TCP_ESTATS_BANDWIDTH_RW_v0</a> structure should be updated to enable or disable extended statistics on a TCP connection for bandwidth estimation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tcpestats/ne-tcpestats-tcp_boolean_optional
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class TCP_BOOLEAN_OPTIONAL extends Win32Enum{

    /**
     * The option should be disabled.
     * @type {Integer (Int32)}
     */
    static TcpBoolOptDisabled => 0

    /**
     * The option should be enabled.
     * @type {Integer (Int32)}
     */
    static TcpBoolOptEnabled => 1

    /**
     * The option should be unchanged.
     * @type {Integer (Int32)}
     */
    static TcpBoolOptUnchanged => -1
}
