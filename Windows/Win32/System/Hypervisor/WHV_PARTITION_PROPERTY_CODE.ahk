#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_PARTITION_PROPERTY_CODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeExtendedVmExits => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeExceptionExitBitmap => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeSeparateSecurityDomain => 3

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeNestedVirtualization => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeX64MsrExitBitmap => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodePrimaryNumaNode => 6

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeCpuReserve => 7

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeCpuCap => 8

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeCpuWeight => 9

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeCpuGroupId => 10

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeProcessorFrequencyCap => 11

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeAllowDeviceAssignment => 12

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeDisableSmt => 13

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeProcessorFeatures => 4097

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeProcessorClFlushSize => 4098

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeCpuidExitList => 4099

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeCpuidResultList => 4100

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeLocalApicEmulationMode => 4101

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeProcessorXsaveFeatures => 4102

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeProcessorClockFrequency => 4103

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeInterruptClockFrequency => 4104

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeApicRemoteReadSupport => 4105

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeProcessorFeaturesBanks => 4106

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeReferenceTime => 4107

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeSyntheticProcessorFeaturesBanks => 4108

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeCpuidResultList2 => 4109

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeProcessorPerfmonFeatures => 4110

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeMsrActionList => 4111

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeUnimplementedMsrAction => 4112

    /**
     * @type {Integer (Int32)}
     */
    static WHvPartitionPropertyCodeProcessorCount => 8191
}
