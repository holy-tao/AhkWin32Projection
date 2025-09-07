#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KSEC_LIST_ENTRY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    List{
        get {
            if(!this.HasProp("__List"))
                this.__List := LIST_ENTRY(this.ptr + 0)
            return this.__List
        }
    }

    /**
     * @type {Integer}
     */
    RefCount {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<Void>}
     */
    OwningList {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    Reserved {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
