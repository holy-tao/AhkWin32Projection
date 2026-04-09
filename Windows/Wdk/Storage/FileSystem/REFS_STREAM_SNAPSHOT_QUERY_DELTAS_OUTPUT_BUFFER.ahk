#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class REFS_STREAM_SNAPSHOT_QUERY_DELTAS_OUTPUT_BUFFER extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ExtentCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 4, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Pointer>}
     */
    Extents {
        get {
            if(!this.HasProp("__ExtentsProxyArray"))
                this.__ExtentsProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "ptr")
            return this.__ExtentsProxyArray
        }
    }
}
