#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64
 */
class WHV_CAPABILITY_CODE extends Win32Enum {

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

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodePhysicalAddressWidth => 4106

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxBasic => 8192

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxPinbasedCtls => 8193

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxProcbasedCtls => 8194

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxExitCtls => 8195

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxEntryCtls => 8196

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxMisc => 8197

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxCr0Fixed0 => 8198

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxCr0Fixed1 => 8199

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxCr4Fixed0 => 8200

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxCr4Fixed1 => 8201

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxVmcsEnum => 8202

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxProcbasedCtls2 => 8203

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxEptVpidCap => 8204

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxTruePinbasedCtls => 8205

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxTrueProcbasedCtls => 8206

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxTrueExitCtls => 8207

    /**
     * @type {Integer (Int32)}
     */
    static WHvCapabilityCodeVmxTrueEntryCtls => 8208
}
