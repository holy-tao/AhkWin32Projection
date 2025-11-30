#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class RESOURCE_HASH_ENTRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    ListEntry{
        get {
            if(!this.HasProp("__ListEntry"))
                this.__ListEntry := LIST_ENTRY(0, this)
            return this.__ListEntry
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    Address {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ContentionCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Number {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
