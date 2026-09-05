#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The THREAD_INFORMATION_CLASS enumeration (processthreadsapi.h) specifies the collection of supported thread types.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-thread_information_class
 * @namespace Windows.Win32.System.Threading
 */
class THREAD_INFORMATION_CLASS extends Win32Enum {

    /**
     * Lower the memory priority of threads that perform background operations or access files and data that are not expected to be accessed frequently.
     * Native name: ThreadMemoryPriority
     * @type {Integer (Int32)}
     */
    static MemoryPriority => 0

    /**
     * CPU priority.
     * Native name: ThreadAbsoluteCpuPriority
     * @type {Integer (Int32)}
     */
    static AbsoluteCpuPriority => 1

    /**
     * Generate dynamic code or modify executable code.
     * Native name: ThreadDynamicCodePolicy
     * @type {Integer (Int32)}
     */
    static DynamicCodePolicy => 2

    /**
     * Throttle the target process activity for power management.
     * Native name: ThreadPowerThrottling
     * @type {Integer (Int32)}
     */
    static PowerThrottling => 3

    /**
     * Native name: ThreadInformationClassMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
