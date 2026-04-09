#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\REFS_DEALLOCATE_RANGES_ALLOCATOR.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class REFS_DEALLOCATE_RANGES_INPUT_BUFFER_EX extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    RangeCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {REFS_DEALLOCATE_RANGES_ALLOCATOR}
     */
    Allocator {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    StreamReserveUpdateCount {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    OffsetToRanges {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    OffsetToLeakCounts {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 24, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
