#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_NI_USER_RESPONSE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Ni_UserResponseAccept => 1

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Ni_UserResponseDeny => 2

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_Ni_UserResponseTimeout => 3
}
