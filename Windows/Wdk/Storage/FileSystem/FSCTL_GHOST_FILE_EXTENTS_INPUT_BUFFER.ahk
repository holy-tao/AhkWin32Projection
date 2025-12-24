#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FSCTL_GHOST_FILE_EXTENTS_INPUT_BUFFER extends Win32Struct
{
    static sizeof => 32

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
     * @type {Pointer<Guid>}
     */
    RecallOwnerGuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    RecallMetadataBufferSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    RecallMetadataBuffer{
        get {
            if(!this.HasProp("__RecallMetadataBufferProxyArray"))
                this.__RecallMetadataBufferProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__RecallMetadataBufferProxyArray
        }
    }
}
