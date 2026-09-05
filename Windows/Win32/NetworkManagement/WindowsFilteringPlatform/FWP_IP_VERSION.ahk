#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the IP version. (FWP_IP_VERSION)
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_ip_version
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWP_IP_VERSION extends Win32Enum {

    /**
     * Specifies IPv4.
     * Native name: FWP_IP_VERSION_V4
     * @type {Integer (Int32)}
     */
    static V4 => 0

    /**
     * Specifies IPv6.
     * Native name: FWP_IP_VERSION_V6
     * @type {Integer (Int32)}
     */
    static V6 => 1

    /**
     * Reserved.
     * Native name: FWP_IP_VERSION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 2

    /**
     * Maximum value for testing purposes.
     * Native name: FWP_IP_VERSION_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
