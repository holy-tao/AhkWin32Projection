#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the IP version.
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ne-fwptypes-fwp_ip_version
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_IP_VERSION{

    /**
     * Specifies IPv4.
     * @type {Integer (Int32)}
     */
    static FWP_IP_VERSION_V4 => 0

    /**
     * Specifies IPv6.
     * @type {Integer (Int32)}
     */
    static FWP_IP_VERSION_V6 => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static FWP_IP_VERSION_NONE => 2

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWP_IP_VERSION_MAX => 3
}
