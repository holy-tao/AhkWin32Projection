#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the values that specify how a channel is referenced.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_channel_reference_flags
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_CHANNEL_REFERENCE_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies that the channel is imported.
     * @type {Integer (UInt32)}
     */
    static EvtChannelReferenceImported => 1
}
