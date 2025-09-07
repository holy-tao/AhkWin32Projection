#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_NOTIFICATION_SOURCES{

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_NOTIFICATION_SOURCE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_NOTIFICATION_SOURCE_ALL => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_NOTIFICATION_SOURCE_ACM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_NOTIFICATION_SOURCE_MSM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_NOTIFICATION_SOURCE_SECURITY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_NOTIFICATION_SOURCE_IHV => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_NOTIFICATION_SOURCE_HNWK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_NOTIFICATION_SOURCE_ONEX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE => 2048
}
