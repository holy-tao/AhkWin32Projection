#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class HAL_QUERY_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HalInstalledBusInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static HalProfileSourceInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static HalInformationClassUnused1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static HalPowerInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static HalProcessorSpeedInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static HalCallbackInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static HalMapRegisterInformation => 6

    /**
     * @type {Integer (Int32)}
     */
    static HalMcaLogInformation => 7

    /**
     * @type {Integer (Int32)}
     */
    static HalFrameBufferCachingInformation => 8

    /**
     * @type {Integer (Int32)}
     */
    static HalDisplayBiosInformation => 9

    /**
     * @type {Integer (Int32)}
     */
    static HalProcessorFeatureInformation => 10

    /**
     * @type {Integer (Int32)}
     */
    static HalNumaTopologyInterface => 11

    /**
     * @type {Integer (Int32)}
     */
    static HalErrorInformation => 12

    /**
     * @type {Integer (Int32)}
     */
    static HalCmcLogInformation => 13

    /**
     * @type {Integer (Int32)}
     */
    static HalCpeLogInformation => 14

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryMcaInterface => 15

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryAMLIIllegalIOPortAddresses => 16

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryMaxHotPlugMemoryAddress => 17

    /**
     * @type {Integer (Int32)}
     */
    static HalPartitionIpiInterface => 18

    /**
     * @type {Integer (Int32)}
     */
    static HalPlatformInformation => 19

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryProfileSourceList => 20

    /**
     * @type {Integer (Int32)}
     */
    static HalInitLogInformation => 21

    /**
     * @type {Integer (Int32)}
     */
    static HalFrequencyInformation => 22

    /**
     * @type {Integer (Int32)}
     */
    static HalProcessorBrandString => 23

    /**
     * @type {Integer (Int32)}
     */
    static HalHypervisorInformation => 24

    /**
     * @type {Integer (Int32)}
     */
    static HalPlatformTimerInformation => 25

    /**
     * @type {Integer (Int32)}
     */
    static HalAcpiAuditInformation => 26

    /**
     * @type {Integer (Int32)}
     */
    static HalIrtInformation => 27

    /**
     * @type {Integer (Int32)}
     */
    static HalSecondaryInterruptInformation => 28

    /**
     * @type {Integer (Int32)}
     */
    static HalParkingPageInformation => 29

    /**
     * @type {Integer (Int32)}
     */
    static HalNumaRangeTableInformation => 30

    /**
     * @type {Integer (Int32)}
     */
    static HalChannelTopologyInformation => 31

    /**
     * @type {Integer (Int32)}
     */
    static HalExternalCacheInformation => 32

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryDebuggerInformation => 33

    /**
     * @type {Integer (Int32)}
     */
    static HalFwBootPerformanceInformation => 34

    /**
     * @type {Integer (Int32)}
     */
    static HalFwS3PerformanceInformation => 35

    /**
     * @type {Integer (Int32)}
     */
    static HalGetChannelPowerInformation => 36

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryStateElementInformation => 37

    /**
     * @type {Integer (Int32)}
     */
    static HalPsciInformation => 38

    /**
     * @type {Integer (Int32)}
     */
    static HalInterruptControllerInformation => 39

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryIommuReservedRegionInformation => 40

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryArmErrataInformation => 41

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryProcessorEfficiencyInformation => 42

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryAcpiWakeAlarmSystemPowerStateInformation => 43

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryProfileNumberOfCounters => 44

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryHyperlaunchEntrypoint => 45

    /**
     * @type {Integer (Int32)}
     */
    static HalHardwareWatchdogInformation => 46

    /**
     * @type {Integer (Int32)}
     */
    static HalDmaRemappingInformation => 47

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryUnused0001 => 48

    /**
     * @type {Integer (Int32)}
     */
    static HalHeterogeneousMemoryAttributesInterface => 49

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryPerDeviceMsiLimitInformation => 50

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryProfileCorruptionStatus => 51

    /**
     * @type {Integer (Int32)}
     */
    static HalQueryProfileCounterOwnership => 52
}
