#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.EventLog
 */
export default struct READ_EVENT_LOG_READ_FLAGS {
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
    static EVENTLOG_SEEK_READ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_SEQUENTIAL_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_FORWARDS_READ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_BACKWARDS_READ => 8
}
