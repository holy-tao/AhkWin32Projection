#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_CONNECTION_NOTIFICATION_FLAGS extends Win32Enum {

    /**
     * Native name: WLAN_CONNECTION_NOTIFICATION_ADHOC_NETWORK_FORMED
     * @type {Integer (UInt32)}
     */
    static ADHOC_NETWORK_FORMED => 1

    /**
     * Native name: WLAN_CONNECTION_NOTIFICATION_CONSOLE_USER_PROFILE
     * @type {Integer (UInt32)}
     */
    static CONSOLE_USER_PROFILE => 4
}
