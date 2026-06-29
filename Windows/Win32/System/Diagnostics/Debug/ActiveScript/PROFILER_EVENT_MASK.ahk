#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_EVENT_MASK {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
