#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class HAL_QUERY_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: HalInstalledBusInformation
     * @type {Integer (Int32)}
     */
    static InstalledBusInformation => 0

    /**
     * Native name: HalProfileSourceInformation
     * @type {Integer (Int32)}
     */
    static ProfileSourceInformation => 1

    /**
     * Native name: HalInformationClassUnused1
     * @type {Integer (Int32)}
     */
    static Unused1 => 2

    /**
     * Native name: HalPowerInformation
     * @type {Integer (Int32)}
     */
    static PowerInformation => 3

    /**
     * Native name: HalProcessorSpeedInformation
     * @type {Integer (Int32)}
     */
    static ProcessorSpeedInformation => 4

    /**
     * Native name: HalCallbackInformation
     * @type {Integer (Int32)}
     */
    static CallbackInformation => 5

    /**
     * Native name: HalMapRegisterInformation
     * @type {Integer (Int32)}
     */
    static MapRegisterInformation => 6

    /**
     * Native name: HalMcaLogInformation
     * @type {Integer (Int32)}
     */
    static McaLogInformation => 7

    /**
     * Native name: HalFrameBufferCachingInformation
     * @type {Integer (Int32)}
     */
    static FrameBufferCachingInformation => 8

    /**
     * Native name: HalDisplayBiosInformation
     * @type {Integer (Int32)}
     */
    static DisplayBiosInformation => 9

    /**
     * Native name: HalProcessorFeatureInformation
     * @type {Integer (Int32)}
     */
    static ProcessorFeatureInformation => 10

    /**
     * Native name: HalNumaTopologyInterface
     * @type {Integer (Int32)}
     */
    static NumaTopologyInterface => 11

    /**
     * Native name: HalErrorInformation
     * @type {Integer (Int32)}
     */
    static ErrorInformation => 12

    /**
     * Native name: HalCmcLogInformation
     * @type {Integer (Int32)}
     */
    static CmcLogInformation => 13

    /**
     * Native name: HalCpeLogInformation
     * @type {Integer (Int32)}
     */
    static CpeLogInformation => 14

    /**
     * Native name: HalQueryMcaInterface
     * @type {Integer (Int32)}
     */
    static McaInterface => 15

    /**
     * Native name: HalQueryAMLIIllegalIOPortAddresses
     * @type {Integer (Int32)}
     */
    static QueryAMLIIllegalIOPortAddresses => 16

    /**
     * Native name: HalQueryMaxHotPlugMemoryAddress
     * @type {Integer (Int32)}
     */
    static MaxHotPlugMemoryAddress => 17

    /**
     * Native name: HalPartitionIpiInterface
     * @type {Integer (Int32)}
     */
    static PartitionIpiInterface => 18

    /**
     * Native name: HalPlatformInformation
     * @type {Integer (Int32)}
     */
    static PlatformInformation => 19

    /**
     * Native name: HalQueryProfileSourceList
     * @type {Integer (Int32)}
     */
    static ProfileSourceList => 20

    /**
     * Native name: HalInitLogInformation
     * @type {Integer (Int32)}
     */
    static InitLogInformation => 21

    /**
     * Native name: HalFrequencyInformation
     * @type {Integer (Int32)}
     */
    static FrequencyInformation => 22

    /**
     * Native name: HalProcessorBrandString
     * @type {Integer (Int32)}
     */
    static ProcessorBrandString => 23

    /**
     * Native name: HalHypervisorInformation
     * @type {Integer (Int32)}
     */
    static HypervisorInformation => 24

    /**
     * Native name: HalPlatformTimerInformation
     * @type {Integer (Int32)}
     */
    static PlatformTimerInformation => 25

    /**
     * Native name: HalAcpiAuditInformation
     * @type {Integer (Int32)}
     */
    static AcpiAuditInformation => 26

    /**
     * Native name: HalIrtInformation
     * @type {Integer (Int32)}
     */
    static IrtInformation => 27

    /**
     * Native name: HalSecondaryInterruptInformation
     * @type {Integer (Int32)}
     */
    static SecondaryInterruptInformation => 28

    /**
     * Native name: HalParkingPageInformation
     * @type {Integer (Int32)}
     */
    static ParkingPageInformation => 29

    /**
     * Native name: HalNumaRangeTableInformation
     * @type {Integer (Int32)}
     */
    static NumaRangeTableInformation => 30

    /**
     * Native name: HalChannelTopologyInformation
     * @type {Integer (Int32)}
     */
    static ChannelTopologyInformation => 31

    /**
     * Native name: HalExternalCacheInformation
     * @type {Integer (Int32)}
     */
    static ExternalCacheInformation => 32

    /**
     * Native name: HalQueryDebuggerInformation
     * @type {Integer (Int32)}
     */
    static DebuggerInformation => 33

    /**
     * Native name: HalFwBootPerformanceInformation
     * @type {Integer (Int32)}
     */
    static FwBootPerformanceInformation => 34

    /**
     * Native name: HalFwS3PerformanceInformation
     * @type {Integer (Int32)}
     */
    static FwS3PerformanceInformation => 35

    /**
     * Native name: HalGetChannelPowerInformation
     * @type {Integer (Int32)}
     */
    static GetChannelPowerInformation => 36

    /**
     * Native name: HalQueryStateElementInformation
     * @type {Integer (Int32)}
     */
    static StateElementInformation => 37

    /**
     * Native name: HalPsciInformation
     * @type {Integer (Int32)}
     */
    static PsciInformation => 38

    /**
     * Native name: HalInterruptControllerInformation
     * @type {Integer (Int32)}
     */
    static InterruptControllerInformation => 39

    /**
     * Native name: HalQueryIommuReservedRegionInformation
     * @type {Integer (Int32)}
     */
    static IommuReservedRegionInformation => 40

    /**
     * Native name: HalQueryArmErrataInformation
     * @type {Integer (Int32)}
     */
    static ArmErrataInformation => 41

    /**
     * Native name: HalQueryProcessorEfficiencyInformation
     * @type {Integer (Int32)}
     */
    static ProcessorEfficiencyInformation => 42

    /**
     * Native name: HalQueryAcpiWakeAlarmSystemPowerStateInformation
     * @type {Integer (Int32)}
     */
    static AcpiWakeAlarmSystemPowerStateInformation => 43

    /**
     * Native name: HalQueryProfileNumberOfCounters
     * @type {Integer (Int32)}
     */
    static ProfileNumberOfCounters => 44

    /**
     * Native name: HalQueryHyperlaunchEntrypoint
     * @type {Integer (Int32)}
     */
    static HyperlaunchEntrypoint => 45

    /**
     * Native name: HalHardwareWatchdogInformation
     * @type {Integer (Int32)}
     */
    static HardwareWatchdogInformation => 46

    /**
     * Native name: HalDmaRemappingInformation
     * @type {Integer (Int32)}
     */
    static DmaRemappingInformation => 47

    /**
     * Native name: HalQueryUnused0001
     * @type {Integer (Int32)}
     */
    static Unused0001 => 48

    /**
     * Native name: HalHeterogeneousMemoryAttributesInterface
     * @type {Integer (Int32)}
     */
    static HeterogeneousMemoryAttributesInterface => 49

    /**
     * Native name: HalQueryPerDeviceMsiLimitInformation
     * @type {Integer (Int32)}
     */
    static PerDeviceMsiLimitInformation => 50

    /**
     * Native name: HalQueryProfileCorruptionStatus
     * @type {Integer (Int32)}
     */
    static ProfileCorruptionStatus => 51

    /**
     * Native name: HalQueryProfileCounterOwnership
     * @type {Integer (Int32)}
     */
    static ProfileCounterOwnership => 52
}
