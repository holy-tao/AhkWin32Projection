#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_NI_NOTIFICATION_TYPE extends Win32Enum{

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
