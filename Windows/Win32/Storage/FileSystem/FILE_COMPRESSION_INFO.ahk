#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Receives file compression information.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_compression_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_COMPRESSION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The file size of the compressed file.
     * @type {Integer}
     */
    CompressedFileSize {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The compression format that is used to compress the file.
     * @type {Integer}
     */
    CompressionFormat {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The factor that the compression uses.
     * @type {Integer}
     */
    CompressionUnitShift {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * The number of chunks that are shifted by compression.
     * @type {Integer}
     */
    ChunkShift {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * The number of clusters that are shifted by compression.
     * @type {Integer}
     */
    ClusterShift {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * Reserved.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 13, 3, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
