#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the accuracy of the magnetometer.
 * @remarks
 * Apps that need calibration may periodically ask the user to calibrate the device. We suggest doing this no more than once every 10 minutes.
 * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-magnetometeraccuracy
 * @namespace Windows.Win32.Devices.Sensors
 */
class MagnetometerAccuracy extends Win32Enum {

    /**
     * Native name: MAGNETOMETER_ACCURACY_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: MAGNETOMETER_ACCURACY_UNRELIABLE
     * @type {Integer (Int32)}
     */
    static UNRELIABLE => 1

    /**
     * Native name: MAGNETOMETER_ACCURACY_APPROXIMATE
     * @type {Integer (Int32)}
     */
    static APPROXIMATE => 2

    /**
     * Native name: MAGNETOMETER_ACCURACY_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 3
}
