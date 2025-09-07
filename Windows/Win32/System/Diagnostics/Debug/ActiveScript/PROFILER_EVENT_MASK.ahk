#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class PROFILER_EVENT_MASK{

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_EVENT_MASK_TRACE_SCRIPT_FUNCTION_CALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_EVENT_MASK_TRACE_NATIVE_FUNCTION_CALL => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_EVENT_MASK_TRACE_DOM_FUNCTION_CALL => 4

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_EVENT_MASK_TRACE_ALL => 3

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_EVENT_MASK_TRACE_ALL_WITH_DOM => 7
}
