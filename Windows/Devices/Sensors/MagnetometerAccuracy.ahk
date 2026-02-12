#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The sensor's accuracy.
  * 
  * See [One Dev Minute - Sensor calibration](https://learn.microsoft.com/shows/one-dev-minute/sensor-calibration) for a short video overview on how to calibrate the magnetometer.
 * @remarks
 * Apps that need calibration should periodically ask the user to calibrate the device. We suggest doing this no more than every 10 minutes.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometeraccuracy
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class MagnetometerAccuracy extends Win32Enum{

    /**
     * The accuracy is currently not available, typically because the driver can't report it.
     * 
     * You should determine, based on your app's needs, whether your app will want to ask users to calibrate the device whenever this value is returned.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The actual and reported values have a high degree of inaccuracy.
     * 
     * Apps should always ask the user to calibrate the device whenever this value is returned.
     * @type {Integer (Int32)}
     */
    static Unreliable => 1

    /**
     * The actual and reported values differ but may be accurate enough for some application.
     * 
     * Apps that only need a relative value, like a virtual reality app, can continue without additional calibration.
     * @type {Integer (Int32)}
     */
    static Approximate => 2

    /**
     * The actual and reported values are accurate.
     * 
     * No additional calibration is needed.
     * @type {Integer (Int32)}
     */
    static High => 3
}
