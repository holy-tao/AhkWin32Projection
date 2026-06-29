#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_TRACE_CONTROL {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_CONTROL_FLUSH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_CONTROL_QUERY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_CONTROL_STOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_TRACE_CONTROL_UPDATE => 2
}
