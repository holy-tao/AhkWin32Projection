#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_CAPABILITY_CODE{

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
