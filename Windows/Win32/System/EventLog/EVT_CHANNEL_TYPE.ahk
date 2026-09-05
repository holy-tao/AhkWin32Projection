#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of a channel.
 * @remarks
 * For a description of each channel type, see the <b>type</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-channeltype-complextype">ChannelType</a> complex type.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_channel_type
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_CHANNEL_TYPE extends Win32Enum {

    /**
     * The channel's type is Admin.
     * Native name: EvtChannelTypeAdmin
     * @type {Integer (Int32)}
     */
    static Admin => 0

    /**
     * The channel's type is Operational.
     * Native name: EvtChannelTypeOperational
     * @type {Integer (Int32)}
     */
    static Operational => 1

    /**
     * The channel's type is Analytic.
     * Native name: EvtChannelTypeAnalytic
     * @type {Integer (Int32)}
     */
    static Analytic => 2

    /**
     * The channel's type is Debug.
     * Native name: EvtChannelTypeDebug
     * @type {Integer (Int32)}
     */
    static Debug => 3
}
