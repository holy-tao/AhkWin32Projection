#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_MISC extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PARENT_UNKNOWN => -3

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_GLOBAL_CLASS => -2

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_GLOBAL_MODULE => -1
}
