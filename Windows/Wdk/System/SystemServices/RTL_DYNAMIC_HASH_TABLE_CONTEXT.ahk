#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class RTL_DYNAMIC_HASH_TABLE_CONTEXT extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<LIST_ENTRY>}
     */
    ChainHead {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<LIST_ENTRY>}
     */
    PrevLinkage {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Signature {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
