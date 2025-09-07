#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class UDATE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {SYSTEMTIME}
     */
    st{
        get {
            if(!this.HasProp("__st"))
                this.__st := SYSTEMTIME(this.ptr + 0)
            return this.__st
        }
    }

    /**
     * @type {Integer}
     */
    wDayOfYear {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
