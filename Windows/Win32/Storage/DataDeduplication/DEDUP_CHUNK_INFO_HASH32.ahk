#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DEDUP_CHUNK_INFO_HASH32 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ChunkFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ChunkOffsetInStream {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ChunkSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    HashVal{
        get {
            if(!this.HasProp("__HashValProxyArray"))
                this.__HashValProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__HashValProxyArray
        }
    }
}
