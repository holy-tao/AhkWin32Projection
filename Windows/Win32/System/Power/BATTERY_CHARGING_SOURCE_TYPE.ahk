#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct BATTERY_CHARGING_SOURCE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
