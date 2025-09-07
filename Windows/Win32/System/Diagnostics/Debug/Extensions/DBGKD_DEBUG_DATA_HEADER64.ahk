#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Kernel\LIST_ENTRY64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DBGKD_DEBUG_DATA_HEADER64 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {LIST_ENTRY64}
     */
    List{
        get {
            if(!this.HasProp("__List"))
                this.__List := LIST_ENTRY64(this.ptr + 0)
            return this.__List
        }
    }

    /**
     * @type {Integer}
     */
    OwnerTag {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
