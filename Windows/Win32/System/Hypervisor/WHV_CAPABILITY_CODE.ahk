#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_CAPABILITY_CODE {
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
    static WHvCapabilityCodeHypervisorPresent => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeFeatures => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeExtendedVmExits => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeExceptionExitBitmap => 3

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeX64MsrExitBitmap => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeGpaRangePopulateFlags => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeSchedulerFeatures => 6

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeProcessorVendor => 4096

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeProcessorFeatures => 4097

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeProcessorClFlushSize => 4098

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeProcessorXsaveFeatures => 4099

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeProcessorClockFrequency => 4100

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeInterruptClockFrequency => 4101

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeProcessorFeaturesBanks => 4102

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeProcessorFrequencyCap => 4103

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeSyntheticProcessorFeaturesBanks => 4104

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeProcessorPerfmonFeatures => 4105
}
