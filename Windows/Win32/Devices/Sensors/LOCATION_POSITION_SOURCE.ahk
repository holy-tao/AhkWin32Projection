#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class LOCATION_POSITION_SOURCE extends Win32Enum {

    /**
     * Native name: LOCATION_POSITION_SOURCE_CELLULAR
     * @type {Integer (Int32)}
     */
    static CELLULAR => 0

    /**
     * Native name: LOCATION_POSITION_SOURCE_SATELLITE
     * @type {Integer (Int32)}
     */
    static SATELLITE => 1

    /**
     * Native name: LOCATION_POSITION_SOURCE_WIFI
     * @type {Integer (Int32)}
     */
    static WIFI => 2

    /**
     * Native name: LOCATION_POSITION_SOURCE_IPADDRESS
     * @type {Integer (Int32)}
     */
    static IPADDRESS => 3

    /**
     * Native name: LOCATION_POSITION_SOURCE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 4
}
