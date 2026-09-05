#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_OPERATIONAL_STATE extends Win32Enum {

    /**
     * Native name: wlan_operational_state_unknown
     * @type {Integer (Int32)}
     */
    static unknown => 0

    /**
     * Native name: wlan_operational_state_off
     * @type {Integer (Int32)}
     */
    static off => 1

    /**
     * Native name: wlan_operational_state_on
     * @type {Integer (Int32)}
     */
    static on => 2

    /**
     * Native name: wlan_operational_state_going_off
     * @type {Integer (Int32)}
     */
    static going_off => 3

    /**
     * Native name: wlan_operational_state_going_on
     * @type {Integer (Int32)}
     */
    static going_on => 4
}
