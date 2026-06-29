#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The THREAD_INFORMATION_CLASS enumeration (processthreadsapi.h) specifies the collection of supported thread types.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-thread_information_class
 * @namespace Windows.Win32.System.Threading
 */
export default struct THREAD_INFORMATION_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static ThreadInformationClassMax => 4
}
