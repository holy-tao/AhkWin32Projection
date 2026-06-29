#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the type of a channel.
 * @remarks
 * For a description of each channel type, see the <b>type</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-channeltype-complextype">ChannelType</a> complex type.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_channel_type
 * @namespace Windows.Win32.System.EventLog
 */
export default struct EVT_CHANNEL_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The channel's type is Admin.
     * @type {Integer (Int32)}
     */
    static EvtChannelTypeAdmin => 0

    /**
     * The channel's type is Operational.
     * @type {Integer (Int32)}
     */
    static EvtChannelTypeOperational => 1

    /**
     * The channel's type is Analytic.
     * @type {Integer (Int32)}
     */
    static EvtChannelTypeAnalytic => 2

    /**
     * The channel's type is Debug.
     * @type {Integer (Int32)}
     */
    static EvtChannelTypeDebug => 3
}
