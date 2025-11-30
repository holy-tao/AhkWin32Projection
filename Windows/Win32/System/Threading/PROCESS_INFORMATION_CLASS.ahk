#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates a specific class of process information.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/ne-processthreadsapi-process_information_class
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_INFORMATION_CLASS extends Win32Enum{

    /**
     * The process information is represented by a <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-memory_priority_information">MEMORY_PRIORITY_INFORMATION</a> structure. Allows applications to lower the default memory priority of threads that perform background operations or access files and data that are not expected to be accessed again soon.
     * @type {Integer (Int32)}
     */
    static ProcessMemoryPriority => 0

    /**
     * The process information is represented by a <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_memory_exhaustion_info">PROCESS_MEMORY_EXHAUSTION_INFO</a> structure. Allows applications to configure a process to terminate if an allocation fails to commit memory.
     * @type {Integer (Int32)}
     */
    static ProcessMemoryExhaustionInfo => 1

    /**
     * The process information is represented by a <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-app_memory_information">APP_MEMORY_INFORMATION</a> structure. Allows applications to query the commit usage and the additional commit available to this process. Does not allow the caller to actually get a commit limit.
     * @type {Integer (Int32)}
     */
    static ProcessAppMemoryInfo => 2

    /**
     * If a process is set to **ProcessInPrivate** mode, and a trace session has set the [EVENT_ENABLE_PROPERTY_EXCLUDE_INPRIVATE](../evntrace/ns-evntrace-enable_trace_parameters.md) flag, then the trace session will drop all events from that process.
     * @type {Integer (Int32)}
     */
    static ProcessInPrivateInfo => 3

    /**
     * The process information is represented by a <a href="https://docs.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_power_throttling_state">PROCESS_POWER_THROTTLING_STATE</a> structure. Allows applications to configure how the system should throttle the target process’s activity when managing power.
     * @type {Integer (Int32)}
     */
    static ProcessPowerThrottling => 4

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static ProcessReservedValue1 => 5

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static ProcessTelemetryCoverageInfo => 6

    /**
     * The process information is represented by a <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-process_protection_level_information">PROCESS_PROTECTION_LEVEL_INFORMATION</a> structure.
     * @type {Integer (Int32)}
     */
    static ProcessProtectionLevelInfo => 7

    /**
     * The process information is represented by a <a href="../processthreadsapi/ns-processthreadsapi-process_leap_second_info.md">PROCESS_LEAP_SECOND_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static ProcessLeapSecondInfo => 8

    /**
     * @type {Integer (Int32)}
     */
    static ProcessMachineTypeInfo => 9

    /**
     * @type {Integer (Int32)}
     */
    static ProcessOverrideSubsequentPrefetchParameter => 10

    /**
     * @type {Integer (Int32)}
     */
    static ProcessMaxOverridePrefetchParameter => 11

    /**
     * The maximum value for this enumeration. This value may change in a future version.
     * @type {Integer (Int32)}
     */
    static ProcessInformationClassMax => 12
}
