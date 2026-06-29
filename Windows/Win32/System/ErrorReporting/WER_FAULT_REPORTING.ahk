#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_FAULT_REPORTING {
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
