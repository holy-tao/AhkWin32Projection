#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Internet protocol.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_ip_protocol
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NET_FW_IP_PROTOCOL extends Win32Enum {

    /**
     * Transmission Control Protocol.
     * Native name: NET_FW_IP_PROTOCOL_TCP
     * @type {Integer (Int32)}
     */
    static TCP => 6

    /**
     * User Datagram Protocol.
     * Native name: NET_FW_IP_PROTOCOL_UDP
     * @type {Integer (Int32)}
     */
    static UDP => 17

    /**
     * Native name: NET_FW_IP_PROTOCOL_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 256
}
