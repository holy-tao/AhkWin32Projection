#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the type of accelerometer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.accelerometerreadingtype
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class AccelerometerReadingType extends Win32Enum{

    /**
     * A standard accelerometer takes into account all of the forces impacting the sensor.
     * @type {Integer (Int32)}
     */
    static Standard => 0

    /**
     * A linear accelerometer does not take into account the influence of gravity.
     * @type {Integer (Int32)}
     */
    static Linear => 1

    /**
     * A gravity accelerometer is only interested in the influence of gravity on a sensor.
     * @type {Integer (Int32)}
     */
    static Gravity => 2
}
