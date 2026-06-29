#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_NOTIFICATION_SOURCES {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
