#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class SENSOR_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static SensorState_Initializing => 0

    /**
     * @type {Integer (Int32)}
     */
    static SensorState_Idle => 1

    /**
     * @type {Integer (Int32)}
     */
    static SensorState_Active => 2

    /**
     * @type {Integer (Int32)}
     */
    static SensorState_Error => 3
}
