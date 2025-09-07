#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the values that determine whether the event includes the security identifier (SID) of the principal that logged the event.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_channel_sid_type
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_CHANNEL_SID_TYPE{

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
