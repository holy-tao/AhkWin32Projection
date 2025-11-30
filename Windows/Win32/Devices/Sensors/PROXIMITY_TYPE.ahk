#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class PROXIMITY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ProximityType_ObjectProximity => 0

    /**
     * @type {Integer (Int32)}
     */
    static ProximityType_HumanProximity => 1

    /**
     * @type {Integer (Int32)}
     */
    static ProximityType_Force_Dword => -1
}
