#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines possible operational states for sensors.
 * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/ne-sensorsapi-sensorstate
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class SensorState extends Win32Enum{

    /**
     * Minimum enumerated sensor state. Use <b>SENSOR_STATE_READY</b> instead.
     * @type {Integer (Int32)}
     */
    static SENSOR_STATE_MIN => 0

    /**
     * Ready to send sensor data.
     * @type {Integer (Int32)}
     */
    static SENSOR_STATE_READY => 0

    /**
     * The sensor is not available for use.
     * @type {Integer (Int32)}
     */
    static SENSOR_STATE_NOT_AVAILABLE => 1

    /**
     * The sensor is available but does not have data.
     * @type {Integer (Int32)}
     */
    static SENSOR_STATE_NO_DATA => 2

    /**
     * The sensor is available, but performing initialization. Try again later.
     * @type {Integer (Int32)}
     */
    static SENSOR_STATE_INITIALIZING => 3

    /**
     * The sensor is available, but the user account does not have permission to access the sensor data. For more information about permissions, see <a href="https://docs.microsoft.com/windows/desktop/SensorsAPI/managing-user-permissions">Managing User Permissions</a>.
     * @type {Integer (Int32)}
     */
    static SENSOR_STATE_ACCESS_DENIED => 4

    /**
     * The sensor has raised an error.
     * @type {Integer (Int32)}
     */
    static SENSOR_STATE_ERROR => 5

    /**
     * Maximum enumerated sensor state. Not a valid value.
     * @type {Integer (Int32)}
     */
    static SENSOR_STATE_MAX => 5
}
