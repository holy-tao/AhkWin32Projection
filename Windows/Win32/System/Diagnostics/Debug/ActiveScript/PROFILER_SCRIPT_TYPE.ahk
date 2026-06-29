#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_SCRIPT_TYPE {
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
