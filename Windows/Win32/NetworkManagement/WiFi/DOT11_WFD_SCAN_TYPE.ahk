#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_SCAN_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_scan_type_active => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_scan_type_passive => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_wfd_scan_type_auto => 3
}
