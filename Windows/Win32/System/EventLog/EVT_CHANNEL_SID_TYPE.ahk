#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that determine whether the event includes the security identifier (SID) of the principal that logged the event.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_channel_sid_type
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_CHANNEL_SID_TYPE extends Win32Enum {

    /**
     * Do not include with the event the SID of the principal that logged the event.
     * Native name: EvtChannelSidTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Include with the event the SID of the principal that logged the event.
     * Native name: EvtChannelSidTypePublishing
     * @type {Integer (Int32)}
     */
    static Publishing => 1
}
