#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines where the trace events are delivered.
 * @see https://learn.microsoft.com/windows/win32/api/pla/ne-pla-streammode
 * @namespace Windows.Win32.System.Performance
 */
export default struct StreamMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Write the trace events to a log file.
     * @type {Integer (Int32)}
     */
    static plaFile => 1

    /**
     * Deliver the trace events to a real time consumer.
     * @type {Integer (Int32)}
     */
    static plaRealTime => 2

    /**
     * Write the trace events to a log file and deliver them to a real-time consumer.
     * @type {Integer (Int32)}
     */
    static plaBoth => 3

    /**
     * For details, see the <a href="https://docs.microsoft.com/windows/desktop/ETW/logging-mode-constants">EVENT_TRACE_BUFFERING_MODE</a> logging mode in Event Tracing for Windows.
     * @type {Integer (Int32)}
     */
    static plaBuffering => 4
}
