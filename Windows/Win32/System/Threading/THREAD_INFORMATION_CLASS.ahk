#Requires AutoHotkey v2.0.0 64-bit

/**
 * The THREAD_INFORMATION_CLASS enumeration (processthreadsapi.h) specifies the collection of supported thread types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-thread_information_class
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class THREAD_INFORMATION_CLASS{

    /**
     * Lower the memory priority of threads that perform background operations or access files and data that are not expected to be accessed frequently.
     * @type {Integer (Int32)}
     */
    static ThreadMemoryPriority => 0

    /**
     * CPU priority.
     * @type {Integer (Int32)}
     */
    static ThreadAbsoluteCpuPriority => 1

    /**
     * Generate dynamic code or modify executable code.
     * @type {Integer (Int32)}
     */
    static ThreadDynamicCodePolicy => 2

    /**
     * Throttle the target process activity for power management.
     * @type {Integer (Int32)}
     */
    static ThreadPowerThrottling => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ThreadInformationClassMax => 4
}
