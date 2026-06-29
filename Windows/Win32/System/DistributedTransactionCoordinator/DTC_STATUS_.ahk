#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct DTC_STATUS_ {
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
