#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\REFS_COMPRESSION_FORMATS.ahk
#Include .\REFS_SET_VOLUME_COMPRESSION_INFO_FLAGS.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class REFS_SET_VOLUME_COMPRESSION_INFO_INPUT_BUFFER extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {REFS_COMPRESSION_FORMATS}
     */
    CompressionFormat {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CompressionLevel {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    CompressionChunkSizeBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {REFS_SET_VOLUME_COMPRESSION_INFO_FLAGS}
     */
    Flags {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 16, 8, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
