#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of a channel.
 * @remarks
 * 
 * For a description of each channel type, see the <b>type</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-channeltype-complextype">ChannelType</a> complex type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_channel_type
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_CHANNEL_TYPE extends Win32Enum{

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
