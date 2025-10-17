#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\PDH_RAW_COUNTER.ahk

/**
 * The PDH_RAW_COUNTER_ITEM structure contains the instance name and raw value of a counter.
 * @see https://docs.microsoft.com/windows/win32/api//pdh/ns-pdh-pdh_raw_counter_item_a
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 * @charset ANSI
 */
class PDH_RAW_COUNTER_ITEM_A extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the instance name of the counter. The string is appended to the end of this structure.
     * @type {PSTR}
     */
    szName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_raw_counter">PDH_RAW_COUNTER</a> structure that contains the raw counter value of the instance.
     * @type {PDH_RAW_COUNTER}
     */
    RawValue{
        get {
            if(!this.HasProp("__RawValue"))
                this.__RawValue := PDH_RAW_COUNTER(8, this)
            return this.__RawValue
        }
    }
}
