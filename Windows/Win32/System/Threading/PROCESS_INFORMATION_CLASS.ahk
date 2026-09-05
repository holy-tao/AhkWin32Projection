#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates a specific class of process information.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-process_information_class
 * @namespace Windows.Win32.System.Threading
 */
class PROCESS_INFORMATION_CLASS extends Win32Enum {

    /**
     * The process information is represented by a <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-memory_priority_information">MEMORY_PRIORITY_INFORMATION</a> structure. Allows applications to lower the default memory priority of threads that perform background operations or access files and data that are not expected to be accessed again soon.
     * Native name: ProcessMemoryPriority
     * @type {Integer (Int32)}
     */
    static MemoryPriority => 0

    /**
     * The process information is represented by a <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_memory_exhaustion_info">PROCESS_MEMORY_EXHAUSTION_INFO</a> structure. Allows applications to configure a process to terminate if an allocation fails to commit memory.
     * Native name: ProcessMemoryExhaustionInfo
     * @type {Integer (Int32)}
     */
    static MemoryExhaustionInfo => 1

    /**
     * The process information is represented by a <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-app_memory_information">APP_MEMORY_INFORMATION</a> structure. Allows applications to query the commit usage and the additional commit available to this process. Does not allow the caller to actually get a commit limit.
     * Native name: ProcessAppMemoryInfo
     * @type {Integer (Int32)}
     */
    static AppMemoryInfo => 2

    /**
     * If a process is set to **ProcessInPrivate** mode, and a trace session has set the [EVENT_ENABLE_PROPERTY_EXCLUDE_INPRIVATE](../evntrace/ns-evntrace-enable_trace_parameters.md) flag, then the trace session will drop all events from that process.
     * Native name: ProcessInPrivateInfo
     * @type {Integer (Int32)}
     */
    static InPrivateInfo => 3

    /**
     * The process information is represented by a <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_power_throttling_state">PROCESS_POWER_THROTTLING_STATE</a> structure. Allows applications to configure how the system should throttle the target process’s activity when managing power.
     * Native name: ProcessPowerThrottling
     * @type {Integer (Int32)}
     */
    static PowerThrottling => 4

    /**
     * Reserved.
     * Native name: ProcessReservedValue1
     * @type {Integer (Int32)}
     */
    static ReservedValue1 => 5

    /**
     * Reserved.
     * Native name: ProcessTelemetryCoverageInfo
     * @type {Integer (Int32)}
     */
    static TelemetryCoverageInfo => 6

    /**
     * The process information is represented by a <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-process_protection_level_information">PROCESS_PROTECTION_LEVEL_INFORMATION</a> structure.
     * Native name: ProcessProtectionLevelInfo
     * @type {Integer (Int32)}
     */
    static ProtectionLevelInfo => 7

    /**
     * The process information is represented by a <a href="../processthreadsapi/ns-processthreadsapi-process_leap_second_info.md">PROCESS_LEAP_SECOND_INFO</a> structure.
     * Native name: ProcessLeapSecondInfo
     * @type {Integer (Int32)}
     */
    static LeapSecondInfo => 8

    /**
     * The process is represented by a [PROCESS_MACHINE_INFORMATION](ns-processthreadsapi-process_machine_information.md) structure.
     * Native name: ProcessMachineTypeInfo
     * @type {Integer (Int32)}
     */
    static MachineTypeInfo => 9

    /**
     * Native name: ProcessOverrideSubsequentPrefetchParameter
     * @type {Integer (Int32)}
     */
    static OverrideSubsequentPrefetchParameter => 10

    /**
     * Native name: ProcessMaxOverridePrefetchParameter
     * @type {Integer (Int32)}
     */
    static MaxOverridePrefetchParameter => 11

    /**
     * The maximum value for this enumeration. This value may change in a future version.
     * Native name: ProcessInformationClassMax
     * @type {Integer (Int32)}
     */
    static Max => 12
}
