#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the values that specify how a channel is referenced.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_channel_reference_flags
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_CHANNEL_REFERENCE_FLAGS{

    /**
     * Specifies that the channel is imported.
     * @type {Integer (UInt32)}
     */
    static EvtChannelReferenceImported => 1
}
