#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemInformation
 */
export default struct SYSTEM_INFORMATION_CLASS {
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
    static SystemBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static SystemPerformanceInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static SystemTimeOfDayInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static SystemProcessInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static SystemProcessorPerformanceInformation => 8

    /**
     * @type {Integer (Int32)}
     */
    static SystemInterruptInformation => 23

    /**
     * @type {Integer (Int32)}
     */
    static SystemExceptionInformation => 33

    /**
     * @type {Integer (Int32)}
     */
    static SystemRegistryQuotaInformation => 37

    /**
     * @type {Integer (Int32)}
     */
    static SystemLookasideInformation => 45

    /**
     * @type {Integer (Int32)}
     */
    static SystemCodeIntegrityInformation => 103

    /**
     * @type {Integer (Int32)}
     */
    static SystemPolicyInformation => 134
}
