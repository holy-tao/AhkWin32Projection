#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCI_RECOVERY_STATUS {
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
    static WheaPciREcoveryStatusUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusNoError => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusLinkDisableTimeout => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusLinkEnableTimeout => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusRpBusyTimeout => 4

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusComplexTree => 5

    /**
     * @type {Integer (Int32)}
     */
    static WheaPciRecoveryStatusBusNotFound => 6
}
