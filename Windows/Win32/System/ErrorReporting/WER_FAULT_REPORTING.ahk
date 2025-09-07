#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_FAULT_REPORTING{

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_FLAG_DISABLE_THREAD_SUSPENSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_FLAG_NOHEAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_FLAG_QUEUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_FLAG_QUEUE_UPLOAD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WER_FAULT_REPORTING_ALWAYS_SHOW_UI => 16
}
