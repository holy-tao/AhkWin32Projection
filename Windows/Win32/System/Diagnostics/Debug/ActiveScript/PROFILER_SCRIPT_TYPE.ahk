#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class PROFILER_SCRIPT_TYPE extends Win32Enum {

    /**
     * Native name: PROFILER_SCRIPT_TYPE_USER
     * @type {Integer (Int32)}
     */
    static USER => 0

    /**
     * Native name: PROFILER_SCRIPT_TYPE_DYNAMIC
     * @type {Integer (Int32)}
     */
    static DYNAMIC => 1

    /**
     * Native name: PROFILER_SCRIPT_TYPE_NATIVE
     * @type {Integer (Int32)}
     */
    static NATIVE => 2

    /**
     * Native name: PROFILER_SCRIPT_TYPE_DOM
     * @type {Integer (Int32)}
     */
    static DOM => 3
}
