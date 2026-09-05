#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class ELEVATION_CHANGE_MODE extends Win32Enum {

    /**
     * Native name: ElevationChangeMode_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: ElevationChangeMode_Elevator
     * @type {Integer (Int32)}
     */
    static Elevator => 1

    /**
     * Native name: ElevationChangeMode_Stepping
     * @type {Integer (Int32)}
     */
    static Stepping => 2

    /**
     * Native name: ElevationChangeMode_Max
     * @type {Integer (Int32)}
     */
    static Max => 3

    /**
     * Native name: ElevationChangeMode_Force_Dword
     * @type {Integer (Int32)}
     */
    static Force_Dword => -1
}
