#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-thread_information_class
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class THREAD_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ThreadMemoryPriority => 0

    /**
     * @type {Integer (Int32)}
     */
    static ThreadAbsoluteCpuPriority => 1

    /**
     * @type {Integer (Int32)}
     */
    static ThreadDynamicCodePolicy => 2

    /**
     * @type {Integer (Int32)}
     */
    static ThreadPowerThrottling => 3

    /**
     * @type {Integer (Int32)}
     */
    static ThreadInformationClassMax => 4
}
