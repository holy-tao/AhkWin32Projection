#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class BATTERY_CHARGING_SOURCE_TYPE extends Win32Enum {

    /**
     * Native name: BatteryChargingSourceType_AC
     * @type {Integer (Int32)}
     */
    static AC => 1

    /**
     * Native name: BatteryChargingSourceType_USB
     * @type {Integer (Int32)}
     */
    static USB => 2

    /**
     * Native name: BatteryChargingSourceType_Wireless
     * @type {Integer (Int32)}
     */
    static Wireless => 3

    /**
     * Native name: BatteryChargingSourceType_Max
     * @type {Integer (Int32)}
     */
    static Max => 4
}
