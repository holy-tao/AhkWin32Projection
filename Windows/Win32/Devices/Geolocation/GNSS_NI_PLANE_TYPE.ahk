#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
class GNSS_NI_PLANE_TYPE extends Win32Enum {

    /**
     * Native name: GNSS_NI_SUPL
     * @type {Integer (Int32)}
     */
    static SUPL => 1

    /**
     * Native name: GNSS_NI_CP
     * @type {Integer (Int32)}
     */
    static CP => 2

    /**
     * Native name: GNSS_NI_V2UPL
     * @type {Integer (Int32)}
     */
    static V2UPL => 3
}
