#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the confidence of a sensor reading.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.activitysensorreadingconfidence
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ActivitySensorReadingConfidence extends Win32Enum{

    /**
     * There is high confidence in the reading of the sensor.
     * @type {Integer (Int32)}
     */
    static High => 0

    /**
     * There is low confidence in the reading of the sensor.
     * @type {Integer (Int32)}
     */
    static Low => 1
}
