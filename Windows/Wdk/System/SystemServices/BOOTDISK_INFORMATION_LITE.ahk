#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class BOOTDISK_INFORMATION_LITE extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Pointer>}
     */
    Entries {
        get {
            if(!this.HasProp("__EntriesProxyArray"))
                this.__EntriesProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__EntriesProxyArray
        }
    }
}
