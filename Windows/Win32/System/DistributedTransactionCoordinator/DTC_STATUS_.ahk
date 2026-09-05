#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTC_STATUS_ extends Win32Enum {

    /**
     * Native name: DTC_STATUS_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: DTC_STATUS_STARTING
     * @type {Integer (Int32)}
     */
    static STARTING => 1

    /**
     * Native name: DTC_STATUS_STARTED
     * @type {Integer (Int32)}
     */
    static STARTED => 2

    /**
     * Native name: DTC_STATUS_PAUSING
     * @type {Integer (Int32)}
     */
    static PAUSING => 3

    /**
     * Native name: DTC_STATUS_PAUSED
     * @type {Integer (Int32)}
     */
    static PAUSED => 4

    /**
     * Native name: DTC_STATUS_CONTINUING
     * @type {Integer (Int32)}
     */
    static CONTINUING => 5

    /**
     * Native name: DTC_STATUS_STOPPING
     * @type {Integer (Int32)}
     */
    static STOPPING => 6

    /**
     * Native name: DTC_STATUS_STOPPED
     * @type {Integer (Int32)}
     */
    static STOPPED => 7

    /**
     * Native name: DTC_STATUS_E_CANTCONTROL
     * @type {Integer (Int32)}
     */
    static E_CANTCONTROL => 8

    /**
     * Native name: DTC_STATUS_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 9
}
