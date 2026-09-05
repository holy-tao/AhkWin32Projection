#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class SENSOR_STATE extends Win32Enum {

    /**
     * Native name: SensorState_Initializing
     * @type {Integer (Int32)}
     */
    static Initializing => 0

    /**
     * Native name: SensorState_Idle
     * @type {Integer (Int32)}
     */
    static Idle => 1

    /**
     * Native name: SensorState_Active
     * @type {Integer (Int32)}
     */
    static Active => 2

    /**
     * Native name: SensorState_Error
     * @type {Integer (Int32)}
     */
    static Error => 3
}
