#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WLAN_NOTIFICATION_SOURCES extends Win32BitflagEnum {

    /**
     * Native name: WLAN_NOTIFICATION_SOURCE_NONE
     * @type {Integer (UInt32)}
     */
    static SOURCE_NONE => 0

    /**
     * Native name: WLAN_NOTIFICATION_SOURCE_ALL
     * @type {Integer (UInt32)}
     */
    static SOURCE_ALL => 65535

    /**
     * Native name: WLAN_NOTIFICATION_SOURCE_ACM
     * @type {Integer (UInt32)}
     */
    static SOURCE_ACM => 8

    /**
     * Native name: WLAN_NOTIFICATION_SOURCE_MSM
     * @type {Integer (UInt32)}
     */
    static SOURCE_MSM => 16

    /**
     * Native name: WLAN_NOTIFICATION_SOURCE_SECURITY
     * @type {Integer (UInt32)}
     */
    static SOURCE_SECURITY => 32

    /**
     * Native name: WLAN_NOTIFICATION_SOURCE_IHV
     * @type {Integer (UInt32)}
     */
    static SOURCE_IHV => 64

    /**
     * Native name: WLAN_NOTIFICATION_SOURCE_HNWK
     * @type {Integer (UInt32)}
     */
    static SOURCE_HNWK => 128

    /**
     * Native name: WLAN_NOTIFICATION_SOURCE_ONEX
     * @type {Integer (UInt32)}
     */
    static SOURCE_ONEX => 4

    /**
     * Native name: WLAN_NOTIFICATION_SOURCE_DEVICE_SERVICE
     * @type {Integer (UInt32)}
     */
    static SOURCE_DEVICE_SERVICE => 2048
}
