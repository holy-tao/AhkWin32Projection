#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class BATTERY_QUERY_INFORMATION_LEVEL extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static BatteryInformation => 0

    /**
     * Native name: BatteryGranularityInformation
     * @type {Integer (Int32)}
     */
    static GranularityInformation => 1

    /**
     * Native name: BatteryTemperature
     * @type {Integer (Int32)}
     */
    static Temperature => 2

    /**
     * Native name: BatteryEstimatedTime
     * @type {Integer (Int32)}
     */
    static EstimatedTime => 3

    /**
     * Native name: BatteryDeviceName
     * @type {Integer (Int32)}
     */
    static DeviceName => 4

    /**
     * Native name: BatteryManufactureDate
     * @type {Integer (Int32)}
     */
    static ManufactureDate => 5

    /**
     * Native name: BatteryManufactureName
     * @type {Integer (Int32)}
     */
    static ManufactureName => 6

    /**
     * Native name: BatteryUniqueID
     * @type {Integer (Int32)}
     */
    static UniqueID => 7

    /**
     * Native name: BatterySerialNumber
     * @type {Integer (Int32)}
     */
    static SerialNumber => 8
}
