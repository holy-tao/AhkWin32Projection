#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the terminal session that logged the event.
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_ts_id
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_EXTENDED_ITEM_TS_ID {
    #StructPack 4

    /**
     * Identifies the terminal session that logged the event.
     */
    SessionId : UInt32

}
