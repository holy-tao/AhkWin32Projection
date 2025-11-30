#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class DTC_STATUS_ extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DTC_STATUS_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static DTC_STATUS_STARTING => 1

    /**
     * @type {Integer (Int32)}
     */
    static DTC_STATUS_STARTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DTC_STATUS_PAUSING => 3

    /**
     * @type {Integer (Int32)}
     */
    static DTC_STATUS_PAUSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DTC_STATUS_CONTINUING => 5

    /**
     * @type {Integer (Int32)}
     */
    static DTC_STATUS_STOPPING => 6

    /**
     * @type {Integer (Int32)}
     */
    static DTC_STATUS_STOPPED => 7

    /**
     * @type {Integer (Int32)}
     */
    static DTC_STATUS_E_CANTCONTROL => 8

    /**
     * @type {Integer (Int32)}
     */
    static DTC_STATUS_FAILED => 9
}
