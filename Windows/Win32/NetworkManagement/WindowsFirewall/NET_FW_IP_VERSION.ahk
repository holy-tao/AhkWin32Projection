#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the IP version for a port.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_ip_version
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NET_FW_IP_VERSION extends Win32Enum{

    /**
     * The port supports IPv4.
     * @type {Integer (Int32)}
     */
    static NET_FW_IP_VERSION_V4 => 0

    /**
     * The port supports IPv6.
     * @type {Integer (Int32)}
     */
    static NET_FW_IP_VERSION_V6 => 1

    /**
     * The port supports either version of IP.
     * @type {Integer (Int32)}
     */
    static NET_FW_IP_VERSION_ANY => 2

    /**
     * This value is used for boundary checking only and is not valid for application programming.
     * @type {Integer (Int32)}
     */
    static NET_FW_IP_VERSION_MAX => 3
}
