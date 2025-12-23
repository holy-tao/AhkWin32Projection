#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class GNSS_NI_REQUEST_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_NI_Request_SingleShot => 1

    /**
     * @type {Integer (Int32)}
     */
    static GNSS_NI_Request_AreaTrigger => 2
}
