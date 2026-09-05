#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_NOTIFICATION_SECURITY extends Win32Enum {

    /**
     * Native name: wlan_notification_security_start
     * @type {Integer (Int32)}
     */
    static start => 0

    /**
     * Native name: wlan_notification_security_end
     * @type {Integer (Int32)}
     */
    static end => 1
}
