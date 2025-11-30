#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_CONNECTION_NOTIFICATION_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_CONNECTION_NOTIFICATION_ADHOC_NETWORK_FORMED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_CONNECTION_NOTIFICATION_CONSOLE_USER_PROFILE => 4
}
