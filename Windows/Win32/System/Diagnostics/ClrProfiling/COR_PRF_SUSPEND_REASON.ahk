#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_SUSPEND_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SUSPEND_OTHER => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SUSPEND_FOR_GC => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SUSPEND_FOR_APPDOMAIN_SHUTDOWN => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SUSPEND_FOR_CODE_PITCHING => 3

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SUSPEND_FOR_SHUTDOWN => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SUSPEND_FOR_INPROC_DEBUGGER => 6

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SUSPEND_FOR_GC_PREP => 7

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SUSPEND_FOR_REJIT => 8

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SUSPEND_FOR_PROFILER => 9
}
