#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_NI_NOTIFICATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_NI_NoNotifyNoVerify => 1

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_NI_NotifyOnly => 2

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_NI_NotifyVerifyDefaultAllow => 3

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_NI_NotifyVerifyDefaultNotAllow => 4

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_NI_PrivacyOverride => 5
}
