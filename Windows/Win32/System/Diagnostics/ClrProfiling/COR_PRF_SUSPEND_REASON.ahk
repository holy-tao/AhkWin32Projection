#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_SUSPEND_REASON {
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
