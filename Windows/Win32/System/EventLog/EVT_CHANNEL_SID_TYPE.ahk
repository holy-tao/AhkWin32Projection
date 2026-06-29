#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the values that determine whether the event includes the security identifier (SID) of the principal that logged the event.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_channel_sid_type
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_CHANNEL_SID_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Do not include with the event the SID of the principal that logged the event.
     * @type {Integer (Int32)}
     */
    static EvtChannelSidTypeNone => 0

    /**
     * Include with the event the SID of the principal that logged the event.
     * @type {Integer (Int32)}
     */
    static EvtChannelSidTypePublishing => 1
}
