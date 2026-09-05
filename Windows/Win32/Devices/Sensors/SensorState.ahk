#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines possible operational states for sensors.
 * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-sensorstate
 * @namespace Windows.Win32.Devices.Sensors
 */
class SensorState extends Win32Enum {

    /**
     * Minimum enumerated sensor state. Use <b>SENSOR_STATE_READY</b> instead.
     * Native name: SENSOR_STATE_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 0

    /**
     * Ready to send sensor data.
     * Native name: SENSOR_STATE_READY
     * @type {Integer (Int32)}
     */
    static READY => 0

    /**
     * The sensor is not available for use.
     * Native name: SENSOR_STATE_NOT_AVAILABLE
     * @type {Integer (Int32)}
     */
    static NOT_AVAILABLE => 1

    /**
     * The sensor is available but does not have data.
     * Native name: SENSOR_STATE_NO_DATA
     * @type {Integer (Int32)}
     */
    static NO_DATA => 2

    /**
     * The sensor is available, but performing initialization. Try again later.
     * Native name: SENSOR_STATE_INITIALIZING
     * @type {Integer (Int32)}
     */
    static INITIALIZING => 3

    /**
     * The sensor is available, but the user account does not have permission to access the sensor data. For more information about permissions, see <a href="https://docs.microsoft.com/windows/desktop/SensorsAPI/managing-user-permissions">Managing User Permissions</a>.
     * Native name: SENSOR_STATE_ACCESS_DENIED
     * @type {Integer (Int32)}
     */
    static ACCESS_DENIED => 4

    /**
     * The sensor has raised an error.
     * Native name: SENSOR_STATE_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 5

    /**
     * Maximum enumerated sensor state. Not a valid value.
     * Native name: SENSOR_STATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 5
}
