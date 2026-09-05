#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class SENSOR_CONNECTION_TYPES extends Win32Enum {

    /**
     * Native name: SensorConnectionType_Integrated
     * @type {Integer (Int32)}
     */
    static Type_Integrated => 0

    /**
     * Native name: SensorConnectionType_Attached
     * @type {Integer (Int32)}
     */
    static Type_Attached => 1

    /**
     * Native name: SensorConnectionType_External
     * @type {Integer (Int32)}
     */
    static Type_External => 2
}
