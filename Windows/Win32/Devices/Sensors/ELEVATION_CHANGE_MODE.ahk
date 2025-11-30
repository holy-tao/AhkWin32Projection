#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class ELEVATION_CHANGE_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ElevationChangeMode_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ElevationChangeMode_Elevator => 1

    /**
     * @type {Integer (Int32)}
     */
    static ElevationChangeMode_Stepping => 2

    /**
     * @type {Integer (Int32)}
     */
    static ElevationChangeMode_Max => 3

    /**
     * @type {Integer (Int32)}
     */
    static ElevationChangeMode_Force_Dword => -1
}
