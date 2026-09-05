#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_FAULT_REPORTING extends Win32BitflagEnum {

    /**
     * Native name: WER_FAULT_REPORTING_FLAG_DISABLE_THREAD_SUSPENSION
     * @type {Integer (UInt32)}
     */
    static FLAG_DISABLE_THREAD_SUSPENSION => 4

    /**
     * Native name: WER_FAULT_REPORTING_FLAG_NOHEAP
     * @type {Integer (UInt32)}
     */
    static FLAG_NOHEAP => 1

    /**
     * Native name: WER_FAULT_REPORTING_FLAG_QUEUE
     * @type {Integer (UInt32)}
     */
    static FLAG_QUEUE => 2

    /**
     * Native name: WER_FAULT_REPORTING_FLAG_QUEUE_UPLOAD
     * @type {Integer (UInt32)}
     */
    static FLAG_QUEUE_UPLOAD => 8

    /**
     * Native name: WER_FAULT_REPORTING_ALWAYS_SHOW_UI
     * @type {Integer (UInt32)}
     */
    static ALWAYS_SHOW_UI => 16
}
