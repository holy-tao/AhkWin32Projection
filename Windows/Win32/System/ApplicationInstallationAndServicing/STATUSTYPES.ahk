#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct STATUSTYPES {
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
    static ieStatusGetCUB => 0

    /**
     * @type {Integer (Int32)}
     */
    static ieStatusICECount => 1

    /**
     * @type {Integer (Int32)}
     */
    static ieStatusMerge => 2

    /**
     * @type {Integer (Int32)}
     */
    static ieStatusSummaryInfo => 3

    /**
     * @type {Integer (Int32)}
     */
    static ieStatusCreateEngine => 4

    /**
     * @type {Integer (Int32)}
     */
    static ieStatusStarting => 5

    /**
     * @type {Integer (Int32)}
     */
    static ieStatusRunICE => 6

    /**
     * @type {Integer (Int32)}
     */
    static ieStatusShutdown => 7

    /**
     * @type {Integer (Int32)}
     */
    static ieStatusSuccess => 8

    /**
     * @type {Integer (Int32)}
     */
    static ieStatusFail => 9

    /**
     * @type {Integer (Int32)}
     */
    static ieStatusCancel => 10
}
