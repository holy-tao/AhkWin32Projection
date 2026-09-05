#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_NI_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: GNSS_NI_Request_SingleShot
     * @type {Integer (Int32)}
     */
    static SingleShot => 1

    /**
     * Native name: GNSS_NI_Request_AreaTrigger
     * @type {Integer (Int32)}
     */
    static AreaTrigger => 2
}
