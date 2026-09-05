#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class PROXIMITY_TYPE extends Win32Enum {

    /**
     * Native name: ProximityType_ObjectProximity
     * @type {Integer (Int32)}
     */
    static ObjectProximity => 0

    /**
     * Native name: ProximityType_HumanProximity
     * @type {Integer (Int32)}
     */
    static HumanProximity => 1

    /**
     * Native name: ProximityType_Force_Dword
     * @type {Integer (Int32)}
     */
    static Force_Dword => -1
}
