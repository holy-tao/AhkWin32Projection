#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class FSCTL_GHOST_FILE_EXTENTS_INPUT_BUFFER extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FileOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ByteCount {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    RecallOwnerGuid {
        get {
            if(!this.HasProp("__RecallOwnerGuid"))
                this.__RecallOwnerGuid := Guid(16, this)
            return this.__RecallOwnerGuid
        }
    }

    /**
     * @type {Integer}
     */
    RecallMetadataBufferSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<Integer>}
     */
    RecallMetadataBuffer {
        get {
            if(!this.HasProp("__RecallMetadataBufferProxyArray"))
                this.__RecallMetadataBufferProxyArray := Win32FixedArray(this.ptr + 36, 1, Primitive, "char")
            return this.__RecallMetadataBufferProxyArray
        }
    }
}
