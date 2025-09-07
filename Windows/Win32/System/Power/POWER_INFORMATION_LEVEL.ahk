#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_INFORMATION_LEVEL{

    /**
     * @type {Integer (Int32)}
     */
    static SystemPowerPolicyAc => 0

    /**
     * @type {Integer (Int32)}
     */
    static SystemPowerPolicyDc => 1

    /**
     * @type {Integer (Int32)}
     */
    static VerifySystemPolicyAc => 2

    /**
     * @type {Integer (Int32)}
     */
    static VerifySystemPolicyDc => 3

    /**
     * @type {Integer (Int32)}
     */
    static SystemPowerCapabilities => 4

    /**
     * @type {Integer (Int32)}
     */
    static SystemBatteryState => 5

    /**
     * @type {Integer (Int32)}
     */
    static SystemPowerStateHandler => 6

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorStateHandler => 7

    /**
     * @type {Integer (Int32)}
     */
    static SystemPowerPolicyCurrent => 8

    /**
     * @type {Integer (Int32)}
     */
    static AdministratorPowerPolicy => 9

    /**
     * @type {Integer (Int32)}
     */
    static SystemReserveHiberFile => 10

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorInformation => 11

    /**
     * @type {Integer (Int32)}
     */
    static SystemPowerInformation => 12

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorStateHandler2 => 13

    /**
     * @type {Integer (Int32)}
     */
    static LastWakeTime => 14

    /**
     * @type {Integer (Int32)}
     */
    static LastSleepTime => 15

    /**
     * @type {Integer (Int32)}
     */
    static SystemExecutionState => 16

    /**
     * @type {Integer (Int32)}
     */
    static SystemPowerStateNotifyHandler => 17

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorPowerPolicyAc => 18

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorPowerPolicyDc => 19

    /**
     * @type {Integer (Int32)}
     */
    static VerifyProcessorPowerPolicyAc => 20

    /**
     * @type {Integer (Int32)}
     */
    static VerifyProcessorPowerPolicyDc => 21

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorPowerPolicyCurrent => 22

    /**
     * @type {Integer (Int32)}
     */
    static SystemPowerStateLogging => 23

    /**
     * @type {Integer (Int32)}
     */
    static SystemPowerLoggingEntry => 24

    /**
     * @type {Integer (Int32)}
     */
    static SetPowerSettingValue => 25

    /**
     * @type {Integer (Int32)}
     */
    static NotifyUserPowerSetting => 26

    /**
     * @type {Integer (Int32)}
     */
    static PowerInformationLevelUnused0 => 27

    /**
     * @type {Integer (Int32)}
     */
    static SystemMonitorHiberBootPowerOff => 28

    /**
     * @type {Integer (Int32)}
     */
    static SystemVideoState => 29

    /**
     * @type {Integer (Int32)}
     */
    static TraceApplicationPowerMessage => 30

    /**
     * @type {Integer (Int32)}
     */
    static TraceApplicationPowerMessageEnd => 31

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorPerfStates => 32

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorIdleStates => 33

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorCap => 34

    /**
     * @type {Integer (Int32)}
     */
    static SystemWakeSource => 35

    /**
     * @type {Integer (Int32)}
     */
    static SystemHiberFileInformation => 36

    /**
     * @type {Integer (Int32)}
     */
    static TraceServicePowerMessage => 37

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorLoad => 38

    /**
     * @type {Integer (Int32)}
     */
    static PowerShutdownNotification => 39

    /**
     * @type {Integer (Int32)}
     */
    static MonitorCapabilities => 40

    /**
     * @type {Integer (Int32)}
     */
    static SessionPowerInit => 41

    /**
     * @type {Integer (Int32)}
     */
    static SessionDisplayState => 42

    /**
     * @type {Integer (Int32)}
     */
    static PowerRequestCreate => 43

    /**
     * @type {Integer (Int32)}
     */
    static PowerRequestAction => 44

    /**
     * @type {Integer (Int32)}
     */
    static GetPowerRequestList => 45

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorInformationEx => 46

    /**
     * @type {Integer (Int32)}
     */
    static NotifyUserModeLegacyPowerEvent => 47

    /**
     * @type {Integer (Int32)}
     */
    static GroupPark => 48

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorIdleDomains => 49

    /**
     * @type {Integer (Int32)}
     */
    static WakeTimerList => 50

    /**
     * @type {Integer (Int32)}
     */
    static SystemHiberFileSize => 51

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorIdleStatesHv => 52

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorPerfStatesHv => 53

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorPerfCapHv => 54

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorSetIdle => 55

    /**
     * @type {Integer (Int32)}
     */
    static LogicalProcessorIdling => 56

    /**
     * @type {Integer (Int32)}
     */
    static UserPresence => 57

    /**
     * @type {Integer (Int32)}
     */
    static PowerSettingNotificationName => 58

    /**
     * @type {Integer (Int32)}
     */
    static GetPowerSettingValue => 59

    /**
     * @type {Integer (Int32)}
     */
    static IdleResiliency => 60

    /**
     * @type {Integer (Int32)}
     */
    static SessionRITState => 61

    /**
     * @type {Integer (Int32)}
     */
    static SessionConnectNotification => 62

    /**
     * @type {Integer (Int32)}
     */
    static SessionPowerCleanup => 63

    /**
     * @type {Integer (Int32)}
     */
    static SessionLockState => 64

    /**
     * @type {Integer (Int32)}
     */
    static SystemHiberbootState => 65

    /**
     * @type {Integer (Int32)}
     */
    static PlatformInformation => 66

    /**
     * @type {Integer (Int32)}
     */
    static PdcInvocation => 67

    /**
     * @type {Integer (Int32)}
     */
    static MonitorInvocation => 68

    /**
     * @type {Integer (Int32)}
     */
    static FirmwareTableInformationRegistered => 69

    /**
     * @type {Integer (Int32)}
     */
    static SetShutdownSelectedTime => 70

    /**
     * @type {Integer (Int32)}
     */
    static SuspendResumeInvocation => 71

    /**
     * @type {Integer (Int32)}
     */
    static PlmPowerRequestCreate => 72

    /**
     * @type {Integer (Int32)}
     */
    static ScreenOff => 73

    /**
     * @type {Integer (Int32)}
     */
    static CsDeviceNotification => 74

    /**
     * @type {Integer (Int32)}
     */
    static PlatformRole => 75

    /**
     * @type {Integer (Int32)}
     */
    static LastResumePerformance => 76

    /**
     * @type {Integer (Int32)}
     */
    static DisplayBurst => 77

    /**
     * @type {Integer (Int32)}
     */
    static ExitLatencySamplingPercentage => 78

    /**
     * @type {Integer (Int32)}
     */
    static RegisterSpmPowerSettings => 79

    /**
     * @type {Integer (Int32)}
     */
    static PlatformIdleStates => 80

    /**
     * @type {Integer (Int32)}
     */
    static ProcessorIdleVeto => 81

    /**
     * @type {Integer (Int32)}
     */
    static PlatformIdleVeto => 82

    /**
     * @type {Integer (Int32)}
     */
    static SystemBatteryStatePrecise => 83

    /**
     * @type {Integer (Int32)}
     */
    static ThermalEvent => 84

    /**
     * @type {Integer (Int32)}
     */
    static PowerRequestActionInternal => 85

    /**
     * @type {Integer (Int32)}
     */
    static BatteryDeviceState => 86

    /**
     * @type {Integer (Int32)}
     */
    static PowerInformationInternal => 87

    /**
     * @type {Integer (Int32)}
     */
    static ThermalStandby => 88

    /**
     * @type {Integer (Int32)}
     */
    static SystemHiberFileType => 89

    /**
     * @type {Integer (Int32)}
     */
    static PhysicalPowerButtonPress => 90

    /**
     * @type {Integer (Int32)}
     */
    static QueryPotentialDripsConstraint => 91

    /**
     * @type {Integer (Int32)}
     */
    static EnergyTrackerCreate => 92

    /**
     * @type {Integer (Int32)}
     */
    static EnergyTrackerQuery => 93

    /**
     * @type {Integer (Int32)}
     */
    static UpdateBlackBoxRecorder => 94

    /**
     * @type {Integer (Int32)}
     */
    static SessionAllowExternalDmaDevices => 95

    /**
     * @type {Integer (Int32)}
     */
    static SendSuspendResumeNotification => 96

    /**
     * @type {Integer (Int32)}
     */
    static BlackBoxRecorderDirectAccessBuffer => 97

    /**
     * @type {Integer (Int32)}
     */
    static PowerInformationLevelMaximum => 98
}
