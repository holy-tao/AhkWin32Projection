#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Kernel\LIST_ENTRY32.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DBGKD_DEBUG_DATA_HEADER32 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {LIST_ENTRY32}
     */
    List{
        get {
            if(!this.HasProp("__List"))
                this.__List := LIST_ENTRY32(this.ptr + 0)
            return this.__List
        }
    }

    /**
     * @type {Integer}
     */
    OwnerTag {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
