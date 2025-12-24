#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class RTL_DYNAMIC_HASH_TABLE_ENTRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    Linkage{
        get {
            if(!this.HasProp("__Linkage"))
                this.__Linkage := LIST_ENTRY(0, this)
            return this.__Linkage
        }
    }

    /**
     * @type {Pointer}
     */
    Signature {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
