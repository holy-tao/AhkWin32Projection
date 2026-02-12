#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the sensor reading type.
 * @remarks
 * To understand the difference between an **Absolute** and a **Relative** sensor, consider the [OrientationSensor](orientationsensor.md). In order to provide an absolute reading, an Absolute [OrientationSensor](orientationsensor.md) will use an accelerometer, a gyrometer, and a magnetometer to determine its orientation with respect to magnetic North. In contrast, a relative [OrientationSensor](orientationsensor.md) will only use an accelerometer and gyrometer (no magnetometer), measuring its orientation relative to where the sensor is first instantiated.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorreadingtype
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class SensorReadingType extends Win32Enum{

    /**
     * The sensor reading type is absolute. **Absolute** sensors provide a reading that uses all of the sensors available.
     * @type {Integer (Int32)}
     */
    static Absolute => 0

    /**
     * The sensor reading type is relative. **Relative** sensors provide a reading that is accurate under most conditions, but might not be as accurate as it attempts to not use all sensors available. See the Remarks for more information.
     * @type {Integer (Int32)}
     */
    static Relative => 1
}
