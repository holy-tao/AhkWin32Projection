#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RTL_SEGMENT_HEAP_VA_CALLBACKS.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class RTL_SEGMENT_HEAP_MEMORY_SOURCE extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MemoryTypeMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NumaNode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {HANDLE}
     */
    PartitionHandle {
        get {
            if(!this.HasProp("__PartitionHandle"))
                this.__PartitionHandle := HANDLE(16, this)
            return this.__PartitionHandle
        }
    }

    /**
     * @type {Pointer<RTL_SEGMENT_HEAP_VA_CALLBACKS>}
     */
    Callbacks {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Array<Pointer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 24, 2, Primitive, "ptr")
            return this.__ReservedProxyArray
        }
    }
}
