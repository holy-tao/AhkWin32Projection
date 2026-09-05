#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class PROFILER_EVENT_MASK extends Win32BitflagEnum {

    /**
     * Native name: PROFILER_EVENT_MASK_TRACE_SCRIPT_FUNCTION_CALL
     * @type {Integer (Int32)}
     */
    static TRACE_SCRIPT_FUNCTION_CALL => 1

    /**
     * Native name: PROFILER_EVENT_MASK_TRACE_NATIVE_FUNCTION_CALL
     * @type {Integer (Int32)}
     */
    static TRACE_NATIVE_FUNCTION_CALL => 2

    /**
     * Native name: PROFILER_EVENT_MASK_TRACE_DOM_FUNCTION_CALL
     * @type {Integer (Int32)}
     */
    static TRACE_DOM_FUNCTION_CALL => 4

    /**
     * Native name: PROFILER_EVENT_MASK_TRACE_ALL
     * @type {Integer (Int32)}
     */
    static TRACE_ALL => 3

    /**
     * Native name: PROFILER_EVENT_MASK_TRACE_ALL_WITH_DOM
     * @type {Integer (Int32)}
     */
    static TRACE_ALL_WITH_DOM => 7
}
