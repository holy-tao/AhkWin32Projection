#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_OPERATIONAL_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static wlan_operational_state_unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static wlan_operational_state_off => 1

    /**
     * @type {Integer (Int32)}
     */
    static wlan_operational_state_on => 2

    /**
     * @type {Integer (Int32)}
     */
    static wlan_operational_state_going_off => 3

    /**
     * @type {Integer (Int32)}
     */
    static wlan_operational_state_going_on => 4
}
