#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class PROFILER_SCRIPT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_SCRIPT_TYPE_USER => 0

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_SCRIPT_TYPE_DYNAMIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_SCRIPT_TYPE_NATIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_SCRIPT_TYPE_DOM => 3
}
