#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the values that specify whether to open a channel or exported log file.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_open_log_flags
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_OPEN_LOG_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Open a channel.
     * @type {Integer (UInt32)}
     */
    static EvtOpenChannelPath => 1

    /**
     * Open an exported log file.
     * @type {Integer (UInt32)}
     */
    static EvtOpenFilePath => 2
}
