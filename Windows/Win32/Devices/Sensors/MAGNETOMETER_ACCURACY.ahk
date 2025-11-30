#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class MAGNETOMETER_ACCURACY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MagnetometerAccuracy_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static MagnetometerAccuracy_Unreliable => 1

    /**
     * @type {Integer (Int32)}
     */
    static MagnetometerAccuracy_Approximate => 2

    /**
     * @type {Integer (Int32)}
     */
    static MagnetometerAccuracy_High => 3
}
