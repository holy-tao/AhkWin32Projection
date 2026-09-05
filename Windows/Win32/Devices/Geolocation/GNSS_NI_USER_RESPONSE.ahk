#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_NI_USER_RESPONSE extends Win32Enum {

    /**
     * Native name: GNSS_Ni_UserResponseAccept
     * @type {Integer (Int32)}
     */
    static Accept => 1

    /**
     * Native name: GNSS_Ni_UserResponseDeny
     * @type {Integer (Int32)}
     */
    static Deny => 2

    /**
     * Native name: GNSS_Ni_UserResponseTimeout
     * @type {Integer (Int32)}
     */
    static Timeout => 3
}
