#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines where the trace events are delivered.
 * @see https://learn.microsoft.com/windows/win32/api/pla/ne-pla-streammode
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class StreamMode{

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
