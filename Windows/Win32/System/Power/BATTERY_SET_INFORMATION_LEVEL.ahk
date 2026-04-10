#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class BATTERY_SET_INFORMATION_LEVEL extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static BatteryCriticalBias => 0

    /**
     * @type {Integer (Int32)}
     */
    static BatteryCharge => 1

    /**
     * @type {Integer (Int32)}
     */
    static BatteryDischarge => 2

    /**
     * @type {Integer (Int32)}
     */
    static BatteryChargingSource => 3

    /**
     * @type {Integer (Int32)}
     */
    static BatteryChargerId => 4

    /**
     * @type {Integer (Int32)}
     */
    static BatteryChargerStatus => 5
}
