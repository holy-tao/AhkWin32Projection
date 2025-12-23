#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_DISCOVER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_discover_type_scan_only => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_discover_type_find_only => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_discover_type_auto => 3

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_discover_type_scan_social_channels => 4

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_discover_type_forced => -2147483648
}
