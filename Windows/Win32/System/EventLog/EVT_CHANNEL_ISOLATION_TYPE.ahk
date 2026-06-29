#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the default access permissions to apply to the channel.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_channel_isolation_type
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_CHANNEL_ISOLATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Provides open access to the channel.
     * @type {Integer (Int32)}
     */
    static EvtChannelIsolationTypeApplication => 0

    /**
     * Provides restricted access to the channel and is used by applications running under system service accounts, drivers, or an application that logs events that relate to the health of the computer.
     * @type {Integer (Int32)}
     */
    static EvtChannelIsolationTypeSystem => 1

    /**
     * Provides custom access to the channel.
     * @type {Integer (Int32)}
     */
    static EvtChannelIsolationTypeCustom => 2
}
