#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the Internet protocol.
 * @see https://docs.microsoft.com/windows/win32/api//icftypes/ne-icftypes-net_fw_ip_protocol
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NET_FW_IP_PROTOCOL{

    /**
     * Transmission Control Protocol.
     * @type {Integer (Int32)}
     */
    static NET_FW_IP_PROTOCOL_TCP => 6

    /**
     * User Datagram Protocol.
     * @type {Integer (Int32)}
     */
    static NET_FW_IP_PROTOCOL_UDP => 17

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NET_FW_IP_PROTOCOL_ANY => 256
}
