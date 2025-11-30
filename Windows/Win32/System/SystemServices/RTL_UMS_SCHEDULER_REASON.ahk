#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class RTL_UMS_SCHEDULER_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UmsSchedulerStartup => 0

    /**
     * @type {Integer (Int32)}
     */
    static UmsSchedulerThreadBlocked => 1

    /**
     * @type {Integer (Int32)}
     */
    static UmsSchedulerThreadYield => 2
}
