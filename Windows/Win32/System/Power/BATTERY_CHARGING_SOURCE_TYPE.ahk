#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class BATTERY_CHARGING_SOURCE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BatteryChargingSourceType_AC => 1

    /**
     * @type {Integer (Int32)}
     */
    static BatteryChargingSourceType_USB => 2

    /**
     * @type {Integer (Int32)}
     */
    static BatteryChargingSourceType_Wireless => 3

    /**
     * @type {Integer (Int32)}
     */
    static BatteryChargingSourceType_Max => 4
}
