#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class MAGNETOMETER_ACCURACY extends Win32Enum {

    /**
     * Native name: MagnetometerAccuracy_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: MagnetometerAccuracy_Unreliable
     * @type {Integer (Int32)}
     */
    static Unreliable => 1

    /**
     * Native name: MagnetometerAccuracy_Approximate
     * @type {Integer (Int32)}
     */
    static Approximate => 2

    /**
     * Native name: MagnetometerAccuracy_High
     * @type {Integer (Int32)}
     */
    static High => 3
}
