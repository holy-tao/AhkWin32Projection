#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class RTL_UMS_SCHEDULER_REASON extends Win32Enum {

    /**
     * Native name: UmsSchedulerStartup
     * @type {Integer (Int32)}
     */
    static Startup => 0

    /**
     * Native name: UmsSchedulerThreadBlocked
     * @type {Integer (Int32)}
     */
    static ThreadBlocked => 1

    /**
     * Native name: UmsSchedulerThreadYield
     * @type {Integer (Int32)}
     */
    static ThreadYield => 2
}
