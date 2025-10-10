#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistical information from the FAT file system.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-fat_statistics
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FAT_STATISTICS extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * The number of create operations.
     * @type {Integer}
     */
    CreateHits {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of successful create operations.
     * @type {Integer}
     */
    SuccessfulCreates {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of failed create operations.
     * @type {Integer}
     */
    FailedCreates {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of read operations that were not cached.
     * @type {Integer}
     */
    NonCachedReads {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of bytes read from a file that were not cached.
     * @type {Integer}
     */
    NonCachedReadBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of write operations that were not cached.
     * @type {Integer}
     */
    NonCachedWrites {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of bytes written to a file that were not cached.
     * @type {Integer}
     */
    NonCachedWriteBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of read operations that were not cached. This value includes sub-read operations.
     * @type {Integer}
     */
    NonCachedDiskReads {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of write operations that were not cached. This value includes sub-write operations.
     * @type {Integer}
     */
    NonCachedDiskWrites {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
