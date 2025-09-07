#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class ENCRYPTED_DATA_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    StartingFileOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    OutputBufferOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BytesWithinFileSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    BytesWithinValidDataLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    CompressionFormat {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DataUnitShift {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    ChunkShift {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }

    /**
     * @type {Integer}
     */
    ClusterShift {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    EncryptionFormat {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * @type {Integer}
     */
    NumberOfDataBlocks {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * @type {Array<UInt32>}
     */
    DataBlockSize{
        get {
            if(!this.HasProp("__DataBlockSizeProxyArray"))
                this.__DataBlockSizeProxyArray := Win32FixedArray(this.ptr + 28, 4, Primitive, "uint")
            return this.__DataBlockSizeProxyArray
        }
    }
}
