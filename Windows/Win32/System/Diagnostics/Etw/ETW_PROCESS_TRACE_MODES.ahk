#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_PROCESS_TRACE_MODES {
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
    static ETW_PROCESS_TRACE_MODE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ETW_PROCESS_TRACE_MODE_RAW_TIMESTAMP => 1
}
