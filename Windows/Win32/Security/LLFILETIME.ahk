#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class LLFILETIME extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ll {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {FILETIME}
     */
    ft{
        get {
            if(!this.HasProp("__ft"))
                this.__ft := FILETIME(this.ptr + 0)
            return this.__ft
        }
    }
}
