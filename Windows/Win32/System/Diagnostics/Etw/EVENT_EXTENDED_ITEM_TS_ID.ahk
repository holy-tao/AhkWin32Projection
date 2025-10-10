#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the terminal session that logged the event.
 * @see https://docs.microsoft.com/windows/win32/api//evntcons/ns-evntcons-event_extended_item_ts_id
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_EXTENDED_ITEM_TS_ID extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Identifies the terminal session that logged the event.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
