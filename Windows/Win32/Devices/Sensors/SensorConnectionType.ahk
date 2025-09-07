#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines types of sensor device connections.
 * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-sensorconnectiontype
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class SensorConnectionType{

    /**
     * The sensor device is built into the computer.
     * @type {Integer (Int32)}
     */
    static SENSOR_CONNECTION_TYPE_PC_INTEGRATED => 0

    /**
     * The sensor device is attached to the computer, such as through a peripheral device.
     * @type {Integer (Int32)}
     */
    static SENSOR_CONNECTION_TYPE_PC_ATTACHED => 1

    /**
     * The sensor device is connected by external means, such as through a network connection.
     * @type {Integer (Int32)}
     */
    static SENSOR_CONNECTION_TYPE_PC_EXTERNAL => 2
}
