#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_SUSPEND_REASON extends Win32Enum {

    /**
     * Native name: COR_PRF_SUSPEND_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 0

    /**
     * Native name: COR_PRF_SUSPEND_FOR_GC
     * @type {Integer (Int32)}
     */
    static FOR_GC => 1

    /**
     * Native name: COR_PRF_SUSPEND_FOR_APPDOMAIN_SHUTDOWN
     * @type {Integer (Int32)}
     */
    static FOR_APPDOMAIN_SHUTDOWN => 2

    /**
     * Native name: COR_PRF_SUSPEND_FOR_CODE_PITCHING
     * @type {Integer (Int32)}
     */
    static FOR_CODE_PITCHING => 3

    /**
     * Native name: COR_PRF_SUSPEND_FOR_SHUTDOWN
     * @type {Integer (Int32)}
     */
    static FOR_SHUTDOWN => 4

    /**
     * Native name: COR_PRF_SUSPEND_FOR_INPROC_DEBUGGER
     * @type {Integer (Int32)}
     */
    static FOR_INPROC_DEBUGGER => 6

    /**
     * Native name: COR_PRF_SUSPEND_FOR_GC_PREP
     * @type {Integer (Int32)}
     */
    static FOR_GC_PREP => 7

    /**
     * Native name: COR_PRF_SUSPEND_FOR_REJIT
     * @type {Integer (Int32)}
     */
    static FOR_REJIT => 8

    /**
     * Native name: COR_PRF_SUSPEND_FOR_PROFILER
     * @type {Integer (Int32)}
     */
    static FOR_PROFILER => 9
}
