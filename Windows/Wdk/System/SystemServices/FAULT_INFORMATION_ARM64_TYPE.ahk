#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FAULT_INFORMATION_ARM64_TYPE {
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
    static UnsupportedUpstreamTransaction => 0

    /**
     * @type {Integer (Int32)}
     */
    static AddressSizeFault => 1

    /**
     * @type {Integer (Int32)}
     */
    static TlbMatchConflict => 2

    /**
     * @type {Integer (Int32)}
     */
    static ExternalFault => 3

    /**
     * @type {Integer (Int32)}
     */
    static PermissionFault => 4

    /**
     * @type {Integer (Int32)}
     */
    static AccessFlagFault => 5

    /**
     * @type {Integer (Int32)}
     */
    static TranslationFault => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaxFaultType => 7
}
