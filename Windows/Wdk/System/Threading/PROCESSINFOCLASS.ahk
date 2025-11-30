#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.Threading
 * @version v4.0.30319
 */
class PROCESSINFOCLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ProcessBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static ProcessQuotaLimits => 1

    /**
     * @type {Integer (Int32)}
     */
    static ProcessIoCounters => 2

    /**
     * @type {Integer (Int32)}
     */
    static ProcessVmCounters => 3

    /**
     * @type {Integer (Int32)}
     */
    static ProcessTimes => 4

    /**
     * @type {Integer (Int32)}
     */
    static ProcessBasePriority => 5

    /**
     * @type {Integer (Int32)}
     */
    static ProcessRaisePriority => 6

    /**
     * @type {Integer (Int32)}
     */
    static ProcessDebugPort => 7

    /**
     * @type {Integer (Int32)}
     */
    static ProcessExceptionPort => 8

    /**
     * @type {Integer (Int32)}
     */
    static ProcessAccessToken => 9

    /**
     * @type {Integer (Int32)}
     */
    static ProcessLdtInformation => 10

    /**
     * @type {Integer (Int32)}
     */
    static ProcessLdtSize => 11

    /**
     * @type {Integer (Int32)}
     */
    static ProcessDefaultHardErrorMode => 12

    /**
     * @type {Integer (Int32)}
     */
    static ProcessIoPortHandlers => 13

    /**
     * @type {Integer (Int32)}
     */
    static ProcessPooledUsageAndLimits => 14

    /**
     * @type {Integer (Int32)}
     */
    static ProcessWorkingSetWatch => 15

    /**
     * @type {Integer (Int32)}
     */
    static ProcessUserModeIOPL => 16

    /**
     * @type {Integer (Int32)}
     */
    static ProcessEnableAlignmentFaultFixup => 17

    /**
     * @type {Integer (Int32)}
     */
    static ProcessPriorityClass => 18

    /**
     * @type {Integer (Int32)}
     */
    static ProcessWx86Information => 19

    /**
     * @type {Integer (Int32)}
     */
    static ProcessHandleCount => 20

    /**
     * @type {Integer (Int32)}
     */
    static ProcessAffinityMask => 21

    /**
     * @type {Integer (Int32)}
     */
    static ProcessPriorityBoost => 22

    /**
     * @type {Integer (Int32)}
     */
    static ProcessDeviceMap => 23

    /**
     * @type {Integer (Int32)}
     */
    static ProcessSessionInformation => 24

    /**
     * @type {Integer (Int32)}
     */
    static ProcessForegroundInformation => 25

    /**
     * @type {Integer (Int32)}
     */
    static ProcessWow64Information => 26

    /**
     * @type {Integer (Int32)}
     */
    static ProcessImageFileName => 27

    /**
     * @type {Integer (Int32)}
     */
    static ProcessLUIDDeviceMapsEnabled => 28

    /**
     * @type {Integer (Int32)}
     */
    static ProcessBreakOnTermination => 29

    /**
     * @type {Integer (Int32)}
     */
    static ProcessDebugObjectHandle => 30

    /**
     * @type {Integer (Int32)}
     */
    static ProcessDebugFlags => 31

    /**
     * @type {Integer (Int32)}
     */
    static ProcessHandleTracing => 32

    /**
     * @type {Integer (Int32)}
     */
    static ProcessIoPriority => 33

    /**
     * @type {Integer (Int32)}
     */
    static ProcessExecuteFlags => 34

    /**
     * @type {Integer (Int32)}
     */
    static ProcessTlsInformation => 35

    /**
     * @type {Integer (Int32)}
     */
    static ProcessCookie => 36

    /**
     * @type {Integer (Int32)}
     */
    static ProcessImageInformation => 37

    /**
     * @type {Integer (Int32)}
     */
    static ProcessCycleTime => 38

    /**
     * @type {Integer (Int32)}
     */
    static ProcessPagePriority => 39

    /**
     * @type {Integer (Int32)}
     */
    static ProcessInstrumentationCallback => 40

    /**
     * @type {Integer (Int32)}
     */
    static ProcessThreadStackAllocation => 41

    /**
     * @type {Integer (Int32)}
     */
    static ProcessWorkingSetWatchEx => 42

    /**
     * @type {Integer (Int32)}
     */
    static ProcessImageFileNameWin32 => 43

    /**
     * @type {Integer (Int32)}
     */
    static ProcessImageFileMapping => 44

    /**
     * @type {Integer (Int32)}
     */
    static ProcessAffinityUpdateMode => 45

    /**
     * @type {Integer (Int32)}
     */
    static ProcessMemoryAllocationMode => 46

    /**
     * @type {Integer (Int32)}
     */
    static ProcessGroupInformation => 47

    /**
     * @type {Integer (Int32)}
     */
    static ProcessTokenVirtualizationEnabled => 48

    /**
     * @type {Integer (Int32)}
     */
    static ProcessOwnerInformation => 49

    /**
     * @type {Integer (Int32)}
     */
    static ProcessWindowInformation => 50

    /**
     * @type {Integer (Int32)}
     */
    static ProcessHandleInformation => 51

    /**
     * @type {Integer (Int32)}
     */
    static ProcessMitigationPolicy => 52

    /**
     * @type {Integer (Int32)}
     */
    static ProcessDynamicFunctionTableInformation => 53

    /**
     * @type {Integer (Int32)}
     */
    static ProcessHandleCheckingMode => 54

    /**
     * @type {Integer (Int32)}
     */
    static ProcessKeepAliveCount => 55

    /**
     * @type {Integer (Int32)}
     */
    static ProcessRevokeFileHandles => 56

    /**
     * @type {Integer (Int32)}
     */
    static ProcessWorkingSetControl => 57

    /**
     * @type {Integer (Int32)}
     */
    static ProcessHandleTable => 58

    /**
     * @type {Integer (Int32)}
     */
    static ProcessCheckStackExtentsMode => 59

    /**
     * @type {Integer (Int32)}
     */
    static ProcessCommandLineInformation => 60

    /**
     * @type {Integer (Int32)}
     */
    static ProcessProtectionInformation => 61

    /**
     * @type {Integer (Int32)}
     */
    static ProcessMemoryExhaustion => 62

    /**
     * @type {Integer (Int32)}
     */
    static ProcessFaultInformation => 63

    /**
     * @type {Integer (Int32)}
     */
    static ProcessTelemetryIdInformation => 64

    /**
     * @type {Integer (Int32)}
     */
    static ProcessCommitReleaseInformation => 65

    /**
     * @type {Integer (Int32)}
     */
    static ProcessReserved1Information => 66

    /**
     * @type {Integer (Int32)}
     */
    static ProcessReserved2Information => 67

    /**
     * @type {Integer (Int32)}
     */
    static ProcessSubsystemProcess => 68

    /**
     * @type {Integer (Int32)}
     */
    static ProcessInPrivate => 70

    /**
     * @type {Integer (Int32)}
     */
    static ProcessRaiseUMExceptionOnInvalidHandleClose => 71

    /**
     * @type {Integer (Int32)}
     */
    static ProcessSubsystemInformation => 75

    /**
     * @type {Integer (Int32)}
     */
    static ProcessWin32kSyscallFilterInformation => 79

    /**
     * @type {Integer (Int32)}
     */
    static ProcessEnergyTrackingState => 82

    /**
     * @type {Integer (Int32)}
     */
    static MaxProcessInfoClass => 83
}
