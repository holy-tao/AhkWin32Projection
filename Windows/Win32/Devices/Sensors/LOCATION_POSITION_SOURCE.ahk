#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class LOCATION_POSITION_SOURCE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LOCATION_POSITION_SOURCE_CELLULAR => 0

    /**
     * @type {Integer (Int32)}
     */
    static LOCATION_POSITION_SOURCE_SATELLITE => 1

    /**
     * @type {Integer (Int32)}
     */
    static LOCATION_POSITION_SOURCE_WIFI => 2

    /**
     * @type {Integer (Int32)}
     */
    static LOCATION_POSITION_SOURCE_IPADDRESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static LOCATION_POSITION_SOURCE_UNKNOWN => 4
}
