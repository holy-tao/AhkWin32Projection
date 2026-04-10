#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\REFS_STREAM_SNAPSHOT_OPERATION.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class REFS_STREAM_SNAPSHOT_MANAGEMENT_INPUT_BUFFER extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {REFS_STREAM_SNAPSHOT_OPERATION}
     */
    Operation {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SnapshotNameLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    OperationInputBufferLength {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    NameAndInputBuffer {
        get {
            if(!this.HasProp("__NameAndInputBufferProxyArray"))
                this.__NameAndInputBufferProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "ushort")
            return this.__NameAndInputBufferProxyArray
        }
    }
}
