#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PDH_FMT_COUNTERVALUE.ahk

/**
 * The PDH_FMT_COUNTERVALUE_ITEM structure contains the instance name and formatted value of a counter. (ANSI)
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_fmt_countervalue_item_a
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 * @charset ANSI
 */
class PDH_FMT_COUNTERVALUE_ITEM_A extends Win32Struct
{
    static sizeof => 24

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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/pdh/ns-pdh-pdh_fmt_countervalue">PDH_FMT_COUNTERVALUE</a> structure that contains the counter value of the instance.
     * @type {PDH_FMT_COUNTERVALUE}
     */
    FmtValue{
        get {
            if(!this.HasProp("__FmtValue"))
                this.__FmtValue := PDH_FMT_COUNTERVALUE(8, this)
            return this.__FmtValue
        }
    }
}
