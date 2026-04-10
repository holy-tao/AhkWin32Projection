#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class PHYSICAL_EXTENTS_DESCRIPTOR extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfRuns {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberOfValidRuns {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Pointer>}
     */
    Run {
        get {
            if(!this.HasProp("__RunProxyArray"))
                this.__RunProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__RunProxyArray
        }
    }
}
