#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.EventLog
 */
export default struct REPORT_EVENT_TYPE {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_SUCCESS => 0

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_AUDIT_FAILURE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_AUDIT_SUCCESS => 8

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_ERROR_TYPE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_INFORMATION_TYPE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_WARNING_TYPE => 2
}
