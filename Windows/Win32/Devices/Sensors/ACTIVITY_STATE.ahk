#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class ACTIVITY_STATE extends Win32Enum {

    /**
     * Native name: ActivityState_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Native name: ActivityState_Stationary
     * @type {Integer (Int32)}
     */
    static Stationary => 2

    /**
     * Native name: ActivityState_Fidgeting
     * @type {Integer (Int32)}
     */
    static Fidgeting => 4

    /**
     * Native name: ActivityState_Walking
     * @type {Integer (Int32)}
     */
    static Walking => 8

    /**
     * Native name: ActivityState_Running
     * @type {Integer (Int32)}
     */
    static Running => 16

    /**
     * Native name: ActivityState_InVehicle
     * @type {Integer (Int32)}
     */
    static InVehicle => 32

    /**
     * Native name: ActivityState_Biking
     * @type {Integer (Int32)}
     */
    static Biking => 64

    /**
     * Native name: ActivityState_Idle
     * @type {Integer (Int32)}
     */
    static Idle => 128

    /**
     * Native name: ActivityState_Max
     * @type {Integer (Int32)}
     */
    static Max => 256

    /**
     * Native name: ActivityState_Force_Dword
     * @type {Integer (Int32)}
     */
    static Force_Dword => -1
}
