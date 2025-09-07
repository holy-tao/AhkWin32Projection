#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class BATTERY_QUERY_INFORMATION_LEVEL{

    /**
     * @type {Integer (Int32)}
     */
    static BatteryInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static BatteryGranularityInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static BatteryTemperature => 2

    /**
     * @type {Integer (Int32)}
     */
    static BatteryEstimatedTime => 3

    /**
     * @type {Integer (Int32)}
     */
    static BatteryDeviceName => 4

    /**
     * @type {Integer (Int32)}
     */
    static BatteryManufactureDate => 5

    /**
     * @type {Integer (Int32)}
     */
    static BatteryManufactureName => 6

    /**
     * @type {Integer (Int32)}
     */
    static BatteryUniqueID => 7

    /**
     * @type {Integer (Int32)}
     */
    static BatterySerialNumber => 8
}
