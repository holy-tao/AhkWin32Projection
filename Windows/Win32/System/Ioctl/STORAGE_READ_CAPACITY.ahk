#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the size of a device. This is returned from the IOCTL\_STORAGE\_READ\_CAPACITY control code.
 * @remarks
 * The header file Ntddstor.h is available in the Windows Driver Kit (WDK).
 * @see https://learn.microsoft.com/windows/win32/DevIO/storage-read-capacity
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_READ_CAPACITY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The version of this structure. The caller must set this member to `sizeof(STORAGE_READ_CAPACITY)`.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the data returned.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of bytes per block.
     * @type {Integer}
     */
    BlockLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The total number of blocks on the disk.
     * @type {Integer}
     */
    NumberOfBlocks {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The disk size in bytes.
     * @type {Integer}
     */
    DiskLength {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }
}
