#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 */
class PEDOMETER_STEP_TYPE extends Win32Enum {

    /**
     * Native name: PedometerStepType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Native name: PedometerStepType_Walking
     * @type {Integer (Int32)}
     */
    static Walking => 2

    /**
     * Native name: PedometerStepType_Running
     * @type {Integer (Int32)}
     */
    static Running => 4

    /**
     * Native name: PedometerStepType_Max
     * @type {Integer (Int32)}
     */
    static Max => 8

    /**
     * Native name: PedometerStepType_Force_Dword
     * @type {Integer (Int32)}
     */
    static Force_Dword => -1
}
