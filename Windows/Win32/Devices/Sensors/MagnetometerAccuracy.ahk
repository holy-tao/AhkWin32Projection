#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the accuracy of the magnetometer.
 * @remarks
 * 
 * Apps that need calibration may periodically ask the user to calibrate the device. We suggest doing this no more than once every 10 minutes.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/ne-sensorsapi-magnetometeraccuracy
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class MagnetometerAccuracy extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MAGNETOMETER_ACCURACY_UNKNOWN => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MAGNETOMETER_ACCURACY_UNRELIABLE => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MAGNETOMETER_ACCURACY_APPROXIMATE => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MAGNETOMETER_ACCURACY_HIGH => 3
}
