#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * 
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/evntcons/ns-evntcons-event_extended_item_process_start_key
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_EXTENDED_ITEM_PROCESS_START_KEY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The trace flag.
     * @type {Integer}
     */
    ProcessStartKey {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
