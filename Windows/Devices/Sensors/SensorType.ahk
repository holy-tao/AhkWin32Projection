#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the type of sensor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensortype
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class SensorType extends Win32Enum{

    /**
     * An [Accelerometer](accelerometer.md).
     * @type {Integer (Int32)}
     */
    static Accelerometer => 0

    /**
     * An [ActivitySensor](activitysensor.md).
     * @type {Integer (Int32)}
     */
    static ActivitySensor => 1

    /**
     * A [Barometer](barometer.md).
     * @type {Integer (Int32)}
     */
    static Barometer => 2

    /**
     * A [Compass](compass.md).
     * @type {Integer (Int32)}
     */
    static Compass => 3

    /**
     * A custom sensor.
     * @type {Integer (Int32)}
     */
    static CustomSensor => 4

    /**
     * A [Gyrometer](gyrometer.md).
     * @type {Integer (Int32)}
     */
    static Gyroscope => 5

    /**
     * A [ProximitySensor](proximitysensor.md).
     * @type {Integer (Int32)}
     */
    static ProximitySensor => 6

    /**
     * An [Inclinometer](inclinometer.md).
     * @type {Integer (Int32)}
     */
    static Inclinometer => 7

    /**
     * A [LightSensor](lightsensor.md).
     * @type {Integer (Int32)}
     */
    static LightSensor => 8

    /**
     * An [OrientationSensor](orientationsensor.md).
     * @type {Integer (Int32)}
     */
    static OrientationSensor => 9

    /**
     * A [Pedometer](pedometer.md).
     * @type {Integer (Int32)}
     */
    static Pedometer => 10

    /**
     * A relative [Inclinometer](inclinometer.md).
     * @type {Integer (Int32)}
     */
    static RelativeInclinometer => 11

    /**
     * A relative [OrientationSensor](orientationsensor.md).
     * @type {Integer (Int32)}
     */
    static RelativeOrientationSensor => 12

    /**
     * A [SimpleOrientationSensor](simpleorientationsensor.md).
     * @type {Integer (Int32)}
     */
    static SimpleOrientationSensor => 13
}
