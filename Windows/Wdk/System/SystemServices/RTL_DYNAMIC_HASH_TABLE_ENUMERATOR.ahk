#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class RTL_DYNAMIC_HASH_TABLE_ENUMERATOR extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    HashEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<LIST_ENTRY>}
     */
    CurEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<LIST_ENTRY>}
     */
    ChainHead {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BucketIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
