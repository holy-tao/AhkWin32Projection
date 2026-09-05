#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_NI_NOTIFICATION_TYPE extends Win32Enum {

    /**
     * Native name: GNSS_NI_NoNotifyNoVerify
     * @type {Integer (Int32)}
     */
    static NoNotifyNoVerify => 1

    /**
     * Native name: GNSS_NI_NotifyOnly
     * @type {Integer (Int32)}
     */
    static NotifyOnly => 2

    /**
     * Native name: GNSS_NI_NotifyVerifyDefaultAllow
     * @type {Integer (Int32)}
     */
    static NotifyVerifyDefaultAllow => 3

    /**
     * Native name: GNSS_NI_NotifyVerifyDefaultNotAllow
     * @type {Integer (Int32)}
     */
    static NotifyVerifyDefaultNotAllow => 4

    /**
     * Native name: GNSS_NI_PrivacyOverride
     * @type {Integer (Int32)}
     */
    static PrivacyOverride => 5
}
