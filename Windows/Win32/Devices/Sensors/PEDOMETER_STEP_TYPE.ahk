#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class PEDOMETER_STEP_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PedometerStepType_Unknown => 1

    /**
     * @type {Integer (Int32)}
     */
    static PedometerStepType_Walking => 2

    /**
     * @type {Integer (Int32)}
     */
    static PedometerStepType_Running => 4

    /**
     * @type {Integer (Int32)}
     */
    static PedometerStepType_Max => 8

    /**
     * @type {Integer (Int32)}
     */
    static PedometerStepType_Force_Dword => -1
}
