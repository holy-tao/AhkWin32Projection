#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class ACTIVITY_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Unknown => 1

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Stationary => 2

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Fidgeting => 4

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Walking => 8

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Running => 16

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_InVehicle => 32

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Biking => 64

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Idle => 128

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Max => 256

    /**
     * @type {Integer (Int32)}
     */
    static ActivityState_Force_Dword => -1
}
