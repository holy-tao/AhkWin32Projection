#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_event_key
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class EVENT_EXTENDED_ITEM_EVENT_KEY extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * The event key.
     * @type {Integer}
     */
    Key {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
