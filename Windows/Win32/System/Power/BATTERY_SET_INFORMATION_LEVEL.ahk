#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class BATTERY_SET_INFORMATION_LEVEL extends Win32Enum {

    /**
     * Native name: BatteryCriticalBias
     * @type {Integer (Int32)}
     */
    static CriticalBias => 0

    /**
     * Native name: BatteryCharge
     * @type {Integer (Int32)}
     */
    static Charge => 1

    /**
     * Native name: BatteryDischarge
     * @type {Integer (Int32)}
     */
    static Discharge => 2

    /**
     * Native name: BatteryChargingSource
     * @type {Integer (Int32)}
     */
    static ChargingSource => 3

    /**
     * Native name: BatteryChargerId
     * @type {Integer (Int32)}
     */
    static ChargerId => 4

    /**
     * Native name: BatteryChargerStatus
     * @type {Integer (Int32)}
     */
    static ChargerStatus => 5
}
