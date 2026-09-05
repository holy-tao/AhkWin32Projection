#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the IP version for a port.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_ip_version
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NET_FW_IP_VERSION extends Win32Enum {

    /**
     * The port supports IPv4.
     * Native name: NET_FW_IP_VERSION_V4
     * @type {Integer (Int32)}
     */
    static V4 => 0

    /**
     * The port supports IPv6.
     * Native name: NET_FW_IP_VERSION_V6
     * @type {Integer (Int32)}
     */
    static V6 => 1

    /**
     * The port supports either version of IP.
     * Native name: NET_FW_IP_VERSION_ANY
     * @type {Integer (Int32)}
     */
    static ANY => 2

    /**
     * This value is used for boundary checking only and is not valid for application programming.
     * Native name: NET_FW_IP_VERSION_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
